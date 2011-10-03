Received: from bobafett.staff.proxad.net ([213.228.1.121])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RAewB-00032u-KH
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2011 09:35:52 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: restore useage of ONFI reported bus width
Date: Mon, 3 Oct 2011 11:35:19 +0200
References: <CD1B567EF015FE41B29FF476B8600DDD26BBF25958@vsrv-mail01.newtechgroup.local>
In-Reply-To: <CD1B567EF015FE41B29FF476B8600DDD26BBF25958@vsrv-mail01.newtechgroup.local>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201110031135.19340.ffainelli@freebox.fr>
Cc: Brian Norris <computersforpeace@gmail.com>, "Hitz,
	Christian" <christian.hitz@aizo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 03 October 2011 08:57:59 Hitz, Christian wrote:
> This patch changes the nand_flash_detect_onfi() function to pass
> the NAND bus width it discovered via ONFI back to the caller.
> 
> Signed-off-by: Christian Hitz <christian.hitz@aizo.com>

Acked-by: Florian Fainelli <ffainelli@freebox.fr>

> ---
>  drivers/mtd/nand/nand_base.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)

I though Brian had already submitted a fix for this.

> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index a46e9bb..6dae9a0 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2829,7 +2829,7 @@ static u16 onfi_crc16(u16 crc, u8 const *p, size_t
> len) * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0
> otherwise */
>  static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip
> *chip, -					int busw)
> +					int *busw)
>  {
>  	struct nand_onfi_params *p = &chip->onfi_params;
>  	int i;
> @@ -2884,9 +2884,9 @@ static int nand_flash_detect_onfi(struct mtd_info
> *mtd, struct nand_chip *chip, mtd->erasesize =
> le32_to_cpu(p->pages_per_block) * mtd->writesize; mtd->oobsize =
> le16_to_cpu(p->spare_bytes_per_page);
>  	chip->chipsize = (uint64_t)le32_to_cpu(p->blocks_per_lun) *
> mtd->erasesize; -	busw = 0;
> +	*busw = 0;
>  	if (le16_to_cpu(p->features) & 1)
> -		busw = NAND_BUSWIDTH_16;
> +		*busw = NAND_BUSWIDTH_16;
> 
>  	chip->options &= ~NAND_CHIPOPTIONS_MSK;
>  	chip->options |= (NAND_NO_READRDY |
> @@ -2952,7 +2952,7 @@ static struct nand_flash_dev
> *nand_get_flash_type(struct mtd_info *mtd, chip->onfi_version = 0;
>  	if (!type->name || !type->pagesize) {
>  		/* Check is chip is ONFI compliant */
> -		ret = nand_flash_detect_onfi(mtd, chip, busw);
> +		ret = nand_flash_detect_onfi(mtd, chip, &busw);
>  		if (ret)
>  			goto ident_done;
>  	}
