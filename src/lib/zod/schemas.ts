import z from 'zod'

export const schemaAddClient = z.object({
    full_name: z.string(),
    phone_number: z.number(),
    email_address: z.email(),
    address: z.string(),
})

export const schemaUpdatePricePerCut = z.object({
    clientId: z.number(),
    pricePerCut: z.number(),
})

export const schemaDeleteClient = z.object({
    client_id: z.number(),
})

export const schemaSendEmail = z.object({
    title: z.string(),
    message: z.string(),
    sender: z.email(),
    senderName: z.string(),
    replyTo: z.email().optional(),
})

export const schemaUpdateCuttingDay = z.object({
    clientId: z.number(),
    cuttingWeek: z.number(),
    updatedDay: z.string(),
})

export const schemaMarkYardCut = z.object({
    clientId: z.number(),
    date: z.date()
})