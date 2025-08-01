export default function PageContainer({
    children,
}: Readonly<{
    children: React.ReactNode;
}>) {
    return (
        <div className="font-sans flex flex-col items-center min-h-screen p-2 md:p-8 pb-10 gap-2 md:gap-4 ">
            {children}
        </div>
    );
}