Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCRGH-0000WP-7Z
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 14:23:28 +0000
Date: Wed, 8 Nov 2017 15:23:02 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wenyou
 Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Kamal
 Dasu <kdasu.kdev@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Stefan Agner <stefan@agner.ch>
Subject: Re: [RFC PATCH v2 2/6] mtd: nand: force drivers to explicitly send
 READ/PROG commands
Message-ID: <20171108152302.465e1451@bbrezillon>
In-Reply-To: <20171107145419.22717-3-miquel.raynal@free-electrons.com>
References: <20171107145419.22717-1-miquel.raynal@free-electrons.com>
 <20171107145419.22717-3-miquel.raynal@free-electrons.com>
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

On Tue,  7 Nov 2017 15:54:15 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> The core currently send the READ0 and SEQIN+PAGEPROG commands in
> nand_do_read/write_ops(). This is inconsistent with
> ->read/write_oob[_raw]() hooks behavior which are expected to send  
> these commands.
> 
> There's already a flag (NAND_ECC_CUSTOM_PAGE_ACCESS) to inform the core
> that a specific controller wants to send the READ/SEQIN+PAGEPROG
> commands on its own, but it's an opt-in flag, and existing drivers are
> unlikely to be updated to pass it.
> 
> Moreover, some controllers cannot dissociate the READ/PAGEPROG commands
> from the associated data transfer and ECC engine activation, and
> developers have to hack things in their ->cmdfunc() implementation to
> handle such complex cases, or have to accept the perf penalty of sending
> twice the same command.
> To address this problem we are planning on adding a new interface which
> is passed all information about a NAND operation (including the amount
> of data to transfer) and replacing all calls to ->cmdfunc() to calls to
> this new ->exec_op() hook. But, in order to do that, we need to have all
> ->cmdfunc() calls placed near their associated ->read/write_buf/byte()  
> calls.
> 
> Modify the core and relevant drivers to make NAND_ECC_CUSTOM_PAGE_ACCESS
> the default case, and remove this flag.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> [miquel.raynal@free-electrons.com: rebased and fixed some conflicts]
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/atmel/nand-controller.c      |  7 ++-
>  drivers/mtd/nand/bf5xx_nand.c                 |  6 ++-
>  drivers/mtd/nand/brcmnand/brcmnand.c          | 13 +++--
>  drivers/mtd/nand/cafe_nand.c                  |  6 +--
>  drivers/mtd/nand/denali.c                     | 14 +++++-
>  drivers/mtd/nand/docg4.c                      | 12 +++--
>  drivers/mtd/nand/fsl_elbc_nand.c              |  6 +--
>  drivers/mtd/nand/fsl_ifc_nand.c               |  6 +--
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c        | 30 ++++++------
>  drivers/mtd/nand/hisi504_nand.c               |  6 +--
>  drivers/mtd/nand/lpc32xx_mlc.c                |  5 +-
>  drivers/mtd/nand/lpc32xx_slc.c                | 11 +++--
>  drivers/mtd/nand/mtk_nand.c                   | 10 ++--
>  drivers/mtd/nand/nand_base.c                  | 68 +++++++++------------------
>  drivers/mtd/nand/nand_micron.c                |  1 -
>  drivers/mtd/nand/sh_flctl.c                   |  6 +--
>  drivers/mtd/nand/sunxi_nand.c                 | 34 +++++++++-----
>  drivers/mtd/nand/tango_nand.c                 |  1 -
>  drivers/mtd/nand/vf610_nfc.c                  |  6 +--
>  drivers/staging/mt29f_spinand/mt29f_spinand.c |  7 ++-
>  include/linux/mtd/rawnand.h                   | 11 -----
>  21 files changed, 142 insertions(+), 124 deletions(-)
> 

[...]

> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index ca8d3414d252..a19f28678d87 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -550,11 +550,14 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
>  static int denali_pio_write(struct denali_nand_info *denali,
>  			    const void *buf, size_t size, int page, int raw)
>  {
> +	struct nand_chip *chip = &denali->nand;
>  	u32 addr = DENALI_MAP01 | DENALI_BANK(denali) | page;
>  	const uint32_t *buf32 = (uint32_t *)buf;
>  	uint32_t irq_status;
>  	int i;
>  
> +	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
> +
>  	denali_reset_irq(denali);
>  
>  	for (i = 0; i < size / 4; i++)
> @@ -580,6 +583,7 @@ static int denali_pio_xfer(struct denali_nand_info *denali, void *buf,
>  static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
>  			   size_t size, int page, int raw, int write)
>  {
> +	struct nand_chip *chip = &denali->nand;
>  	dma_addr_t dma_addr;
>  	uint32_t irq_mask, irq_status, ecc_err_mask;
>  	enum dma_data_direction dir = write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
> @@ -625,7 +629,10 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
>  	if (irq_status & INTR__ERASED_PAGE)
>  		memset(buf, 0xff, size);
>  
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	return nand_prog_page_end_op(chip);
>  }
>  
>  static int denali_data_xfer(struct denali_nand_info *denali, void *buf,
> @@ -792,6 +799,8 @@ static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
>  {
>  	struct denali_nand_info *denali = mtd_to_denali(mtd);
>  
> +	nand_read_page_op(chip, page, 0, NULL, 0);
> +
>  	denali_reset_irq(denali);
>  
>  	denali_oob_xfer(mtd, chip, page, 1);
> @@ -845,6 +854,8 @@ static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  	size_t size = writesize + oobsize;
>  	int i, pos, len;
>  
> +	nand_read_page_op(chip, page, 0, NULL, 0);
> +
>  	/*
>  	 * Fill the buffer with 0xff first except the full page transfer.
>  	 * This simplifies the logic.
> @@ -1358,7 +1369,6 @@ int denali_init(struct denali_nand_info *denali)
>  		chip->read_buf = denali_read_buf;
>  		chip->write_buf = denali_write_buf;
>  	}
> -	chip->ecc.options |= NAND_ECC_CUSTOM_PAGE_ACCESS;

Actually, the only thing we have to do for this driver is remove this
line, since all page accessors were already supposed to take of
everything.

>  	chip->ecc.read_page = denali_read_page;
>  	chip->ecc.read_page_raw = denali_read_page_raw;
>  	chip->ecc.write_page = denali_write_page;

[...]

> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 372cc7c5d7dd..a65b2ae645fc 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1915,7 +1915,7 @@ int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  {
>  	int ret;
>  
> -	ret = nand_read_data_op(chip, buf, mtd->writesize, false);
> +	ret = nand_read_page_op(chip, page, 0, buf, mtd->writesize);
>  	if (ret)
>  		return ret;
>  
> @@ -1949,6 +1949,10 @@ static int nand_read_page_raw_syndrome(struct mtd_info *mtd,
>  	uint8_t *oob = chip->oob_poi;
>  	int steps, size, ret;
>  
> +	ret = nand_read_page_op(chip, page, 0, NULL, 0);
> +	if (ret)
> +		return ret;
> +
>  	for (steps = chip->ecc.steps; steps > 0; steps--) {
>  		ret = nand_read_data_op(chip, buf, eccsize, false);
>  		if (ret)
> @@ -2071,11 +2075,10 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  	data_col_addr = start_step * chip->ecc.size;
>  	/* If we read not a page aligned data */
> -	if (data_col_addr != 0)
> -		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_col_addr, -1);
> -
>  	p = bufpoi + data_col_addr;
> -	nand_read_data_op(chip, p, datafrag_len, false);
> +	ret = nand_read_page_op(chip, page, data_col_addr, p, datafrag_len);
> +	if (ret)
> +		return ret;
>  
>  	/* Calculate ECC */
>  	for (i = 0; i < eccfrag_len ; i += chip->ecc.bytes, p += chip->ecc.size)
> @@ -2171,6 +2174,10 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
>  	uint8_t *ecc_code = chip->buffers->ecccode;
>  	unsigned int max_bitflips = 0;
>  
> +	ret = nand_read_page_op(chip, page, 0, NULL, 0);
> +	if (ret)
> +		return ret;
> +
>  	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
>  		chip->ecc.hwctl(mtd, NAND_ECC_READ);
>  
> @@ -2306,6 +2313,10 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
>  	uint8_t *oob = chip->oob_poi;
>  	unsigned int max_bitflips = 0;
>  
> +	ret = nand_read_page_op(chip, page, 0, NULL, 0);
> +	if (ret)
> +		return ret;
> +
>  	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
>  		int stat;
>  
> @@ -2488,9 +2499,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  						 __func__, buf);
>  
>  read_retry:
> -			if (nand_standard_page_accessors(&chip->ecc))
> -				nand_read_page_op(chip, page, 0, NULL, 0);
> -
>  			/*
>  			 * Now read the page into the buffer.  Absent an error,
>  			 * the read methods return max bitflips per ecc step.
> @@ -2938,7 +2946,7 @@ int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  {
>  	int ret;
>  
> -	ret = nand_write_data_op(chip, buf, mtd->writesize, false);
> +	ret = nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
>  	if (ret)
>  		return ret;
>  
> @@ -2949,7 +2957,7 @@ int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  			return ret;
>  	}
>  
> -	return 0;
> +	return nand_prog_page_end_op(chip);
>  }
>  EXPORT_SYMBOL(nand_write_page_raw);
>  
> @@ -2973,6 +2981,10 @@ static int nand_write_page_raw_syndrome(struct mtd_info *mtd,
>  	uint8_t *oob = chip->oob_poi;
>  	int steps, size, ret;
>  
> +	ret = nand_prog_page_begin_op(chip, page, 0, NULL, 0);
> +	if (ret)
> +		return ret;
> +
>  	for (steps = chip->ecc.steps; steps > 0; steps--) {
>  		ret = nand_write_data_op(chip, buf, eccsize, false);
>  		if (ret)
> @@ -3012,7 +3024,7 @@ static int nand_write_page_raw_syndrome(struct mtd_info *mtd,
>  			return ret;
>  	}
>  
> -	return 0;
> +	return nand_prog_page_end_op(chip);
>  }
>  /**
>   * nand_write_page_swecc - [REPLACEABLE] software ECC based page write function
> @@ -3243,12 +3255,6 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	else
>  		subpage = 0;
>  
> -	if (nand_standard_page_accessors(&chip->ecc)) {
> -		status = nand_prog_page_begin_op(chip, page, 0, NULL, 0);
> -		if (status)
> -			return status;
> -	}
> -
>  	if (unlikely(raw))
>  		status = chip->ecc.write_page_raw(mtd, chip, buf,
>  						  oob_required, page);
> @@ -3262,9 +3268,6 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	if (status < 0)
>  		return status;
>  
> -	if (nand_standard_page_accessors(&chip->ecc))
> -		return nand_prog_page_end_op(chip);
> -
>  	return 0;
>  }
>  
> @@ -5245,26 +5248,6 @@ static bool nand_ecc_strength_good(struct mtd_info *mtd)
>  	return corr >= ds_corr && ecc->strength >= chip->ecc_strength_ds;
>  }
>  
> -static bool invalid_ecc_page_accessors(struct nand_chip *chip)
> -{
> -	struct nand_ecc_ctrl *ecc = &chip->ecc;
> -
> -	if (nand_standard_page_accessors(ecc))
> -		return false;
> -
> -	/*
> -	 * NAND_ECC_CUSTOM_PAGE_ACCESS flag is set, make sure the NAND
> -	 * controller driver implements all the page accessors because
> -	 * default helpers are not suitable when the core does not
> -	 * send the READ0/PAGEPROG commands.
> -	 */
> -	return (!ecc->read_page || !ecc->write_page ||
> -		!ecc->read_page_raw || !ecc->write_page_raw ||
> -		(NAND_HAS_SUBPAGE_READ(chip) && !ecc->read_subpage) ||
> -		(NAND_HAS_SUBPAGE_WRITE(chip) && !ecc->write_subpage &&
> -		 ecc->hwctl && ecc->calculate));
> -}
> -
>  /**
>   * nand_scan_tail - [NAND Interface] Scan for the NAND device
>   * @mtd: MTD device structure
> @@ -5286,11 +5269,6 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		return -EINVAL;
>  	}
>  
> -	if (invalid_ecc_page_accessors(chip)) {
> -		pr_err("Invalid ECC page accessors setup\n");
> -		return -EINVAL;
> -	}
> -
>  	if (!(chip->options & NAND_OWN_BUFFERS)) {
>  		nbuf = kzalloc(sizeof(*nbuf), GFP_KERNEL);
>  		if (!nbuf)

Hm, there are a few things missing in nand_base.c (see [1]).

[...]

> diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> index 87595c594b12..e396075dd508 100644
> --- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
> +++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> @@ -636,9 +636,12 @@ static int spinand_write_page_hwecc(struct mtd_info *mtd,
>  	int eccsize = chip->ecc.size;
>  	int eccsteps = chip->ecc.steps;
>  
> +	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
> +
>  	enable_hw_ecc = 1;
>  	chip->write_buf(mtd, p, eccsize * eccsteps);
> -	return 0;
> +
> +	return nand_prog_page_end_op(chip);

Just had a closer look at the code and I think we can do:

	enable_hw_ecc = 1;
	return nand_prog_page_op(chip, page, 0, p, eccsize * eccsteps);

>  }
>  
>  static int spinand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
> @@ -653,7 +656,7 @@ static int spinand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  	enable_read_hw_ecc = 1;
>  
> -	chip->read_buf(mtd, p, eccsize * eccsteps);
> +	nand_read_page_op(chip, page, 0, p, eccsize * eccsteps);

This made me realize ECC support was broken before this change, because
enable_read_hw_ecc is tested when ->cmdfunc() is called, and before
this commit ->cmdfunc() was called by the core before this driver had a
chance to set it to 1.


[1]http://code.bulix.org/rerg29-224103
