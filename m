Received: from mail.ch.keymile.com ([193.17.201.103])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmU9c-0001bn-UF
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 16:41:33 +0000
Message-ID: <4D5020B6.8010903@keymile.com>
Date: Mon, 07 Feb 2011 17:41:26 +0100
From: Stefan Bigler <stefan.bigler@keymile.com>
MIME-Version: 1.0
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Subject: Re: [PATCH] mtd: fix race in cfi_cmdset_0001 driver
References: <1297094831-10330-1-git-send-email-Joakim.Tjernlund@transmode.se>
In-Reply-To: <1297094831-10330-1-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain;
	charset=ISO-8859-15;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Michael Cashwell <mboards@prograde.net>
Reply-To: stefan.bigler@keymile.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02/07/2011 05:07 PM, schrieb Joakim Tjernlund:
> As inval_cache_and_wait_for_operation() drop and reclaim the lock
> to invalidate the cache, some other thread may suspend the operation
> before reaching the for(;;) loop. Therefore the loop must start with
> checking the chip->state before reading status from the chip.
>
> Signed-off-by: Joakim Tjernlund<Joakim.Tjernlund@transmode.se>
> ---
>
>   David, I think this should go to Linus asap.
>   Stefan and Michael, would be great if you could
>   reply with a Acked-By: too.
>
>   drivers/mtd/chips/cfi_cmdset_0001.c |   43 ++++++++++++++++++-----------------
>   1 files changed, 22 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index e89f2d0..9772a62 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -1245,10 +1245,32 @@ static int inval_cache_and_wait_for_operation(
>   	sleep_time = chip_op_time / 2;
>
>   	for (;;) {
> +		if (chip->state != chip_state) {
> +			/* Someone's suspended the operation: sleep */
> +			DECLARE_WAITQUEUE(wait, current);
> +			set_current_state(TASK_UNINTERRUPTIBLE);
> +			add_wait_queue(&chip->wq,&wait);
> +			mutex_unlock(&chip->mutex);
> +			schedule();
> +			remove_wait_queue(&chip->wq,&wait);
> +			mutex_lock(&chip->mutex);
> +			continue;
> +		}
> +
>   		status = map_read(map, cmd_adr);
>   		if (map_word_andequal(map, status, status_OK, status_OK))
>   			break;
>
> +		if (chip->erase_suspended&&  chip_state == FL_ERASING)  {
> +			/* Erase suspend occured while sleep: reset timeout */
> +			timeo = reset_timeo;
> +			chip->erase_suspended = 0;
> +		}
> +		if (chip->write_suspended&&  chip_state == FL_WRITING)  {
> +			/* Write suspend occured while sleep: reset timeout */
> +			timeo = reset_timeo;
> +			chip->write_suspended = 0;
> +		}
>   		if (!timeo) {
>   			map_write(map, CMD(0x70), cmd_adr);
>   			chip->state = FL_STATUS;
> @@ -1272,27 +1294,6 @@ static int inval_cache_and_wait_for_operation(
>   			timeo--;
>   		}
>   		mutex_lock(&chip->mutex);
> -
> -		while (chip->state != chip_state) {
> -			/* Someone's suspended the operation: sleep */
> -			DECLARE_WAITQUEUE(wait, current);
> -			set_current_state(TASK_UNINTERRUPTIBLE);
> -			add_wait_queue(&chip->wq,&wait);
> -			mutex_unlock(&chip->mutex);
> -			schedule();
> -			remove_wait_queue(&chip->wq,&wait);
> -			mutex_lock(&chip->mutex);
> -		}
> -		if (chip->erase_suspended&&  chip_state == FL_ERASING)  {
> -			/* Erase suspend occured while sleep: reset timeout */
> -			timeo = reset_timeo;
> -			chip->erase_suspended = 0;
> -		}
> -		if (chip->write_suspended&&  chip_state == FL_WRITING)  {
> -			/* Write suspend occured while sleep: reset timeout */
> -			timeo = reset_timeo;
> -			chip->write_suspended = 0;
> -		}
>   	}
>
>   	/* Done and happy. */

Acked-by: Stefan Bigler<stefan.bigler@keymile.com>

Thanks!

Stefan
