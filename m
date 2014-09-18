Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUUxl-0000PN-He
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 06:13:06 +0000
Received: by mail-pa0-f42.google.com with SMTP id lj1so770924pab.1
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 23:12:44 -0700 (PDT)
Date: Wed, 17 Sep 2014 23:12:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH 1/2] mtd: atmel_nand: remove pmecc_sector_number, use
 ecc.steps instead
Message-ID: <20140918061241.GF7362@norris-Latitude-E6410>
References: <1407489155-16545-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407489155-16545-1-git-send-email-josh.wu@atmel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 08, 2014 at 05:12:34PM +0800, Josh Wu wrote:
> For PMECC, the pmecc_sector_number has same meaning as ecc.steps.
> So use ecc.steps to replace the pmecc_sector_number.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed both to l2-mtd.git. Thanks!

One comment below.

> ---
>  drivers/mtd/nand/atmel_nand.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 9c5f717..1dc3988 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -129,7 +129,6 @@ struct atmel_nand_host {
>  	u32			pmecc_lookup_table_offset_1024;
>  
>  	int			pmecc_bytes_per_sector;
> -	int			pmecc_sector_number;
>  	int			pmecc_degree;	/* Degree of remainders */
>  	int			pmecc_cw_len;	/* Length of codeword */
>  
> @@ -874,7 +873,7 @@ static int pmecc_correction(struct mtd_info *mtd, u32 pmecc_stat, uint8_t *buf,
>  	return 0;
>  
>  normal_check:
> -	for (i = 0; i < host->pmecc_sector_number; i++) {
> +	for (i = 0; i < nand_chip->ecc.steps; i++) {
>  		err_nbr = 0;
>  		if (pmecc_stat & 0x1) {
>  			buf_pos = buf + i * host->pmecc_sector_size;
> @@ -984,7 +983,7 @@ static int atmel_nand_pmecc_write_page(struct mtd_info *mtd,
>  		cpu_relax();
>  	}
>  
> -	for (i = 0; i < host->pmecc_sector_number; i++) {
> +	for (i = 0; i < chip->ecc.steps; i++) {
>  		for (j = 0; j < host->pmecc_bytes_per_sector; j++) {
>  			int pos;
>  
> @@ -1031,7 +1030,7 @@ static void atmel_pmecc_core_init(struct mtd_info *mtd)
>  	else if (host->pmecc_sector_size == 1024)
>  		val |= PMECC_CFG_SECTOR1024;
>  
> -	switch (host->pmecc_sector_number) {
> +	switch (nand_chip->ecc.steps) {
>  	case 1:
>  		val |= PMECC_CFG_PAGE_1SECTOR;
>  		break;
> @@ -1184,18 +1183,17 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
>  		host->pmecc_degree = (sector_size == 512) ?
>  			PMECC_GF_DIMENSION_13 : PMECC_GF_DIMENSION_14;
>  		host->pmecc_cw_len = (1 << host->pmecc_degree) - 1;
> -		host->pmecc_sector_number = mtd->writesize / sector_size;
>  		host->pmecc_bytes_per_sector = pmecc_get_ecc_bytes(
>  			cap, sector_size);
>  		host->pmecc_alpha_to = pmecc_get_alpha_to(host);
>  		host->pmecc_index_of = host->pmecc_rom_base +
>  			host->pmecc_lookup_table_offset;
>  
> -		nand_chip->ecc.steps = host->pmecc_sector_number;
>  		nand_chip->ecc.strength = cap;
>  		nand_chip->ecc.bytes = host->pmecc_bytes_per_sector;
> -		nand_chip->ecc.total = host->pmecc_bytes_per_sector *
> -				       host->pmecc_sector_number;
> +		nand_chip->ecc.steps = mtd->writesize / sector_size;
> +		nand_chip->ecc.total = nand_chip->ecc.bytes *
> +			nand_chip->ecc.steps;

Do you really need to do all this initialization here? nand_scan_tail()
would do most of this for you.

>  		if (nand_chip->ecc.total > mtd->oobsize - 2) {
>  			dev_err(host->dev, "No room for ECC bytes\n");
>  			err_no = -EINVAL;

Brian
