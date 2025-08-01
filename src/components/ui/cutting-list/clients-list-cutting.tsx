import MapComponent from "../map-component/map-component";
import { Address, Client, PaginatedClients } from "@/types/types";
import { PaginationTabs } from "../pagination/pagination-tabs";
import { Suspense } from "react";
import ManyPointsMap from "../map-component/many-points-map";
import Link from "next/link";
import MarkYardCut from "../buttons/mark-yard-cut";
import { ClientEmailPopover } from "../popovers/client-email-popover";
import FormContainer from "../containers/form-container";
import FormHeader from "../header/form-header";

export default async function ClientListCutting({ clientsPromise, addressesPromise, clientListPage, cuttingDate, searchTermIsCut }:
    {
        clientsPromise: Promise<PaginatedClients | null>,
        addressesPromise: Promise<Address[] | null | Error>,
        clientListPage: number, cuttingDate: Date,
        searchTermIsCut: boolean
    }) {

    const result = await clientsPromise;

    if (!result) return <FormContainer> <p className="text-red-500">Error Loading clients</p> </FormContainer>
    const { clients, totalPages } = result;
    if (clients.length < 1) return <FormContainer> <FormHeader text={"No clients scheduled for today"} /> </FormContainer>

    const addresses = await addressesPromise;
    if (addresses instanceof Error) return <FormContainer> <FormHeader text={`${addresses.message}`} /></FormContainer >
    const flattenedAddresses = addresses?.map(address => address.address) ?? [];

    return (
        <>
            <ul className="flex flex-col gap-2 md:gap-4 rounded-sm w-full items-center">
                {addresses && addresses?.length > 0 &&
                    <FormContainer>
                        <div className="flex flex-col md:flex-row w-full justify-center items-center align-middle p-2 gap-4 ">
                            <FormHeader text={`Total Clients Left to Cut Today: ${flattenedAddresses.length}`} />
                            <ManyPointsMap addresses={flattenedAddresses} />
                        </div>
                    </FormContainer>}
                <PaginationTabs path="/cutting-list" clientListPage={clientListPage} totalPages={totalPages} />

                {clients.map((client: Client) => (
                    <FormContainer key={client.id}>
                        <li className="border p-4 rounded-sm relative bg-white/50">
                            <p>Name: {client.full_name}</p>
                            <p>
                                Phone Number:{" "}
                                <Link className="cursor-pointer text-blue-600 hover:underline" href={`tel:${client.phone_number}`}>
                                    {client.phone_number}
                                </Link>
                            </p>
                            <div>
                                Email:{" "}
                                <ClientEmailPopover client={client} />
                            </div>
                            <p>Address: {client.address}</p>
                            <Suspense fallback={<FormContainer><FormHeader text="Loading..." /></FormContainer>}>
                                <MapComponent address={client.address} />
                            </Suspense>
                        </li>
                        {!searchTermIsCut && <MarkYardCut clientId={client.id} cuttingDate={cuttingDate} />}
                    </FormContainer>
                ))}
            </ul >
            <PaginationTabs path="/cutting-list" clientListPage={clientListPage} totalPages={totalPages} />
        </>
    );
}
