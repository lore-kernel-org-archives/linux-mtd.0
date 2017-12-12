Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eOkUR-0002JH-Mv
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 13:20:57 +0000
Date: Tue, 12 Dec 2017 14:20:33 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Greg Cook <greg@morpheus.ws>
Cc: ezequiel.garcia@free-electrons.com, linux-mtd@lists.infradead.org,
 sean.nyekjaer@prevas.dk, miquel.raynal@free-electrons.com
Subject: Re: [PATCH] Fix OOB_READ bug where hardware FIFO is not drained
 completely. Fix potential bug for non-ECC operations.
Message-ID: <20171212142033.5b19efec@bbrezillon>
In-Reply-To: <20171212083826.5000-1-greg@morpheus.ws>
References: <20171212083826.5000-1-greg@morpheus.ws>
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

Hi Greg,

Could you at least Cc the NAND maintainer when you submit something
related to NAND!

On Tue, 12 Dec 2017 16:38:26 +0800
Greg Cook <greg@morpheus.ws> wrote:

Please add a commit message explaining what your fixing.

> Signed-off-by: Greg Cook <greg@morpheus.ws>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 021374f..cfa8c71 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -677,7 +677,7 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
>  
>  static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
>  {
> -	if (info->ecc_bch) {
> +	if (info->use_ecc && info->ecc_bch) {
>  		u32 val;
>  		int ret;
>  
> @@ -1023,7 +1023,12 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
>  
>  		if (info->cur_chunk < info->nfullchunks) {
>  			info->step_chunk_size = info->chunk_size;
> -			info->step_spare_size = info->spare_size;
> +			if (info->use_ecc) {
> +				info->step_spare_size = info->spare_size;
> +			} else {
> +				info->step_spare_size = info->spare_size
> +							+ info->ecc_size;
> +			}

Curly braces are unneeded, and I'd prefer to have the + operator at the
end of the line. Or it could be written like that:

			info->step_spare_size = info->spare_size;
			if (!info->use_ecc)
				info->step_spare_size += info->ecc_size;

Anyway, I'm still not convince this is the appropriate fix. As
mentioned in my previous, I wonder why we're not activating ECC when
reading OOB bytes. There's a good reason for having 2 different hooks
to read/write OOBs: one is doing it in raw mode (with the ECC engine
disabled), the other one is doing it with the ECC engine enabled.
This driver not only omit raw accessors (which is already a bad news
for everyone that needs to debug the driver) but it also do things
differently for OOB and page access: OOB bytes are read in raw mode
while pages are always accessed with the ECC engine enabled.

OOB accesses are broken and should be fixed, I think we all agree on
that, but we should fix it correctly, don't you think?
And by correctly, I mean we should try to make things consistent at
least (read OOB bytes with the ECC engine enabled).

>  		} else {
>  			info->step_chunk_size = info->last_chunk_size;
>  			info->step_spare_size = info->last_spare_size;

Can you try with the below patch and see if it fixes the timeout issue?

--->8---
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 021374fe59dc..d1979c7dbe7e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -961,6 +961,7 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 
        switch (command) {
        case NAND_CMD_READ0:
+       case NAND_CMD_READOOB:
        case NAND_CMD_PAGEPROG:
                info->use_ecc = 1;
                break;
