Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fB08L-0001Ts-Ux
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 15:46:00 +0000
Date: Tue, 24 Apr 2018 17:45:19 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] cfi_cmdset_0001: Do not allow read/write to suspend
 erase block.
Message-ID: <20180424174519.0c1bab0a@bbrezillon>
In-Reply-To: <20180301133941.19660-2-joakim.tjernlund@infinera.com>
References: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
 <20180301133941.19660-2-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu,  1 Mar 2018 14:39:39 +0100
Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote:

> From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
> 
> Currently it is possible to read and/or write to suspend EB's.
> Writing /dev/mtdX or /dev/mtdblockX from several processes may
> break the flash state machine.
> 
> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> Cc: <stable@vger.kernel.org>

Applied the patch series to mtd/master after changing the subject
prefix for "mtd: cfi: cmdset_xxx: ".

I'll send a fixes PR to Linus later this week.

Thanks,

Boris

> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c | 16 +++++++++++-----
>  include/linux/mtd/flashchip.h       |  1 +
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 60d5d19e347f..b59872304ae7 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -849,21 +849,25 @@ static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long
>  		     (mode == FL_WRITING && (cfip->SuspendCmdSupport & 1))))
>  			goto sleep;
>  
> +		/* Do not allow suspend iff read/write to EB address */
> +		if ((adr & chip->in_progress_block_mask) ==
> +		    chip->in_progress_block_addr)
> +			goto sleep;
>  
>  		/* Erase suspend */
> -		map_write(map, CMD(0xB0), adr);
> +		map_write(map, CMD(0xB0), chip->in_progress_block_addr);
>  
>  		/* If the flash has finished erasing, then 'erase suspend'
>  		 * appears to make some (28F320) flash devices switch to
>  		 * 'read' mode.  Make sure that we switch to 'read status'
>  		 * mode so we get the right data. --rmk
>  		 */
> -		map_write(map, CMD(0x70), adr);
> +		map_write(map, CMD(0x70), chip->in_progress_block_addr);
>  		chip->oldstate = FL_ERASING;
>  		chip->state = FL_ERASE_SUSPENDING;
>  		chip->erase_suspended = 1;
>  		for (;;) {
> -			status = map_read(map, adr);
> +			status = map_read(map, chip->in_progress_block_addr);
>  			if (map_word_andequal(map, status, status_OK, status_OK))
>  			        break;
>  
> @@ -1059,8 +1063,8 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
>  		   sending the 0x70 (Read Status) command to an erasing
>  		   chip and expecting it to be ignored, that's what we
>  		   do. */
> -		map_write(map, CMD(0xd0), adr);
> -		map_write(map, CMD(0x70), adr);
> +		map_write(map, CMD(0xd0), chip->in_progress_block_addr);
> +		map_write(map, CMD(0x70), chip->in_progress_block_addr);
>  		chip->oldstate = FL_READY;
>  		chip->state = FL_ERASING;
>  		break;
> @@ -1951,6 +1955,8 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
>  	map_write(map, CMD(0xD0), adr);
>  	chip->state = FL_ERASING;
>  	chip->erase_suspended = 0;
> +	chip->in_progress_block_addr = adr;
> +	chip->in_progress_block_mask = ~(len - 1);
>  
>  	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
>  				   adr, len,
> diff --git a/include/linux/mtd/flashchip.h b/include/linux/mtd/flashchip.h
> index b63fa457febd..3529683f691e 100644
> --- a/include/linux/mtd/flashchip.h
> +++ b/include/linux/mtd/flashchip.h
> @@ -85,6 +85,7 @@ struct flchip {
>  	unsigned int write_suspended:1;
>  	unsigned int erase_suspended:1;
>  	unsigned long in_progress_block_addr;
> +	unsigned long in_progress_block_mask;
>  
>  	struct mutex mutex;
>  	wait_queue_head_t wq; /* Wait on here when we're waiting for the chip
