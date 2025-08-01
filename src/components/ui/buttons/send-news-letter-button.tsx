'use client'
import { useSendNewsLetter } from "@/mutations/mutations";
import { Button } from "../button";

export default function SendNewsLetterButton() {
    const { mutate, isPending } = useSendNewsLetter()
    return (
        <Button formAction={mutate} disabled={isPending} variant={"outline"}>Send</Button>
    );
}