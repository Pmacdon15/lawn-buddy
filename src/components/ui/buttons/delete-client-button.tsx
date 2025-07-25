'use client'
import { Alert } from '@/components/ui/alerts/alert'
import { useDeleteClient } from '@/mutations/mutations';
export default function DeleteClientButton({ clientId }: { clientId: number }) {
  const { mutate } = useDeleteClient();
  return (
    <Alert text={"X"} functionAction={() => mutate(clientId)} />
  );
}


