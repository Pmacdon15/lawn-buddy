'use client'
import { useState } from "react";
import ShowAddClientFormButton from "../buttons/show-add-client-form-button";
import FormContainer from "../containers/form-container";

export default function AddClientFormClientComponent({
    children,
}: Readonly<{
    children: React.ReactNode;
}>) {
    const [showForm, setShowForm] = useState(false)
    return (

        <FormContainer>
            <div className={`flex flex-col ${showForm ? 'px-3' : 'px-0'}`}>
                {showForm && children}
                <ShowAddClientFormButton showForm={showForm} setShowForm={setShowForm} />
            </div>
        </FormContainer>

    );
}