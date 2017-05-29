Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFGuj-00057a-Ny
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 09:24:40 +0000
Date: Mon, 29 May 2017 11:23:55 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: Make sure drivers not supporting
 SET/GET_FEATURES return -ENOTSUPP
Message-ID: <20170529112355.73f55f89@bbrezillon>
In-Reply-To: <20170526151015.32673-1-boris.brezillon@free-electrons.com>
References: <20170526151015.32673-1-boris.brezillon@free-electrons.com>
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

Hi Chris,

On Fri, 26 May 2017 17:10:15 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> A lot of drivers are providing their own ->cmdfunc(), and most of the
> time this implementation does not support all possible NAND operations.
> But since ->cmdfunc() cannot return an error code, the core has no way
> to know that the operation it requested is not supported.
> 
> This is a problem we cannot address for all kind of operations with the
> current design, but we can prevent these silent failures for the
> GET/SET FEATURES operation by overloading the default
> ->onfi_{set,get}_features() methods with one returning -ENOTSUPP.  
> 
> Reported-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Can you test this patch and add your Tested-by if it works?

Thanks,

Boris

> ---
> 
> This bug has been discovered by Chris while testing linux-next on his
> marvell platform (which is using pxa3xx NAND controller driver).
> The bug was caused by commit b566d9c055de ("mtd: nand: add support for
> Micron on-die ECC") which is using ->set/get_features() to detect
> whether the NAND supports on-die ECC or not.
> 
> This reveals how fragile the current ->cmdfunc() interface is. Not only
> ->cmdfunc() cannot return an error code, but even if it could, most of  
> the time, learning that a specific operation is not supported when
> trying to execute it is already too late.
> 
> Anyway, this is not something we can address immediately (I'm working
> on a new ->exec_op()/->supports_op() interface that will hopefully
> address the aforementioned problems), but I guess this fix can serve as
> a reference to show that overloading ->cmdfunc() is a really bad idea
> and that ->cmd_ctrl() should be implemented instead, unless it's proven
> to be impossible.
> 
> Note that I didn't add a Fixes tag because I plan to rearrange my
> nand/next branch to put this commit before b566d9c055de to avoid
> breaking bisectability.
> ---
>  drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c  |  2 ++
>  drivers/mtd/nand/cafe_nand.c                  |  2 ++
>  drivers/mtd/nand/denali.c                     |  2 ++
>  drivers/mtd/nand/docg4.c                      |  2 ++
>  drivers/mtd/nand/fsl_elbc_nand.c              |  2 ++
>  drivers/mtd/nand/fsl_ifc_nand.c               |  2 ++
>  drivers/mtd/nand/hisi504_nand.c               |  2 ++
>  drivers/mtd/nand/mpc5121_nfc.c                |  2 ++
>  drivers/mtd/nand/nand_base.c                  | 19 +++++++++++++++++++
>  drivers/mtd/nand/pxa3xx_nand.c                |  2 ++
>  drivers/mtd/nand/qcom_nandc.c                 |  2 ++
>  drivers/mtd/nand/sh_flctl.c                   |  2 ++
>  drivers/mtd/nand/vf610_nfc.c                  |  2 ++
>  drivers/staging/mt29f_spinand/mt29f_spinand.c |  2 ++
>  include/linux/mtd/nand.h                      |  5 +++++
>  15 files changed, 50 insertions(+)
> 
> diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
> index f1da4ea88f2c..54bac5b73f0a 100644
> --- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
> +++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
> @@ -392,6 +392,8 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
>  	b47n->nand_chip.read_byte = bcm47xxnflash_ops_bcm4706_read_byte;
>  	b47n->nand_chip.read_buf = bcm47xxnflash_ops_bcm4706_read_buf;
>  	b47n->nand_chip.write_buf = bcm47xxnflash_ops_bcm4706_write_buf;
> +	b47n->nand_chip.onfi_set_features = nand_onfi_get_set_features_notsupp;
> +	b47n->nand_chip.onfi_get_features = nand_onfi_get_set_features_notsupp;
>  
>  	nand_chip->chip_delay = 50;
>  	b47n->nand_chip.bbt_options = NAND_BBT_USE_FLASH;
> diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
> index d40c32d311d8..2fd733eba0a3 100644
> --- a/drivers/mtd/nand/cafe_nand.c
> +++ b/drivers/mtd/nand/cafe_nand.c
> @@ -654,6 +654,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
>  	cafe->nand.read_buf = cafe_read_buf;
>  	cafe->nand.write_buf = cafe_write_buf;
>  	cafe->nand.select_chip = cafe_select_chip;
> +	cafe->nand.onfi_set_features = nand_onfi_get_set_features_notsupp;
> +	cafe->nand.onfi_get_features = nand_onfi_get_set_features_notsupp;
>  
>  	cafe->nand.chip_delay = 0;
>  
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 16634df2e39a..b3c99d98fdee 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1531,6 +1531,8 @@ int denali_init(struct denali_nand_info *denali)
>  	chip->cmdfunc = denali_cmdfunc;
>  	chip->read_byte = denali_read_byte;
>  	chip->waitfunc = denali_waitfunc;
> +	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
> +	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
>  
>  	/*
>  	 * scan for NAND devices attached to the controller
> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
> index 7af2a3cd949e..a27a84fbfb84 100644
> --- a/drivers/mtd/nand/docg4.c
> +++ b/drivers/mtd/nand/docg4.c
> @@ -1260,6 +1260,8 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
>  	nand->read_buf = docg4_read_buf;
>  	nand->write_buf = docg4_write_buf16;
>  	nand->erase = docg4_erase_block;
> +	nand->onfi_set_features = nand_onfi_get_set_features_notsupp;
> +	nand->onfi_get_features = nand_onfi_get_set_features_notsupp;
>  	nand->ecc.read_page = docg4_read_page;
>  	nand->ecc.write_page = docg4_write_page;
>  	nand->ecc.read_page_raw = docg4_read_page_raw;
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> index 113f76e59937..b9ac16f05057 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -775,6 +775,8 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
>  	chip->select_chip = fsl_elbc_select_chip;
>  	chip->cmdfunc = fsl_elbc_cmdfunc;
>  	chip->waitfunc = fsl_elbc_wait;
> +	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
> +	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
>  
>  	chip->bbt_td = &bbt_main_descr;
>  	chip->bbt_md = &bbt_mirror_descr;
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index d1570f512f0b..89e14daeaba6 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -831,6 +831,8 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
>  	chip->select_chip = fsl_ifc_select_chip;
>  	chip->cmdfunc = fsl_ifc_cmdfunc;
>  	chip->waitfunc = fsl_ifc_wait;
> +	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
> +	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
>  
>  	chip->bbt_td = &bbt_main_descr;
>  	chip->bbt_md = &bbt_mirror_descr;
> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
> index e40364eeb556..530caa80b1b6 100644
> --- a/drivers/mtd/nand/hisi504_nand.c
> +++ b/drivers/mtd/nand/hisi504_nand.c
> @@ -764,6 +764,8 @@ static int hisi_nfc_probe(struct platform_device *pdev)
>  	chip->write_buf		= hisi_nfc_write_buf;
>  	chip->read_buf		= hisi_nfc_read_buf;
>  	chip->chip_delay	= HINFC504_CHIP_DELAY;
> +	chip->onfi_set_features	= nand_onfi_get_set_features_notsupp;
> +	chip->onfi_get_features	= nand_onfi_get_set_features_notsupp;
>  
>  	hisi_nfc_host_init(host);
>  
> diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
> index 6d6eaed2d20c..0e86fb6277c3 100644
> --- a/drivers/mtd/nand/mpc5121_nfc.c
> +++ b/drivers/mtd/nand/mpc5121_nfc.c
> @@ -708,6 +708,8 @@ static int mpc5121_nfc_probe(struct platform_device *op)
>  	chip->read_buf = mpc5121_nfc_read_buf;
>  	chip->write_buf = mpc5121_nfc_write_buf;
>  	chip->select_chip = mpc5121_nfc_select_chip;
> +	chip->onfi_set_features	= nand_onfi_get_set_features_notsupp;
> +	chip->onfi_get_features	= nand_onfi_get_set_features_notsupp;
>  	chip->bbt_options = NAND_BBT_USE_FLASH;
>  	chip->ecc.mode = NAND_ECC_SOFT;
>  	chip->ecc.algo = NAND_ECC_HAMMING;
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 54a1dfa327ff..d6fb4a139387 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3424,6 +3424,25 @@ static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
>  }
>  
>  /**
> + * nand_onfi_get_set_features_notsupp - set/get features stub returning
> + *					-ENOTSUPP
> + * @mtd: MTD device structure
> + * @chip: nand chip info structure
> + * @addr: feature address.
> + * @subfeature_param: the subfeature parameters, a four bytes array.
> + *
> + * Should be used by NAND controller drivers that do not support the SET/GET
> + * FEATURES operations.
> + */
> +int nand_onfi_get_set_features_notsupp(struct mtd_info *mtd,
> +				       struct nand_chip *chip,
> +				       int feature_addr, u8 *subfeature_para)
> +{
> +	return -ENOTSUPP;
> +}
> +EXPORT_SYMBOL(nand_onfi_get_set_features_notsupp);
> +
> +/**
>   * nand_suspend - [MTD Interface] Suspend the NAND flash
>   * @mtd: MTD device structure
>   */
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 649ba8200832..74dae4bbdac8 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1812,6 +1812,8 @@ static int alloc_nand_resource(struct platform_device *pdev)
>  		chip->write_buf		= pxa3xx_nand_write_buf;
>  		chip->options		|= NAND_NO_SUBPAGE_WRITE;
>  		chip->cmdfunc		= nand_cmdfunc;
> +		chip->onfi_set_features	= nand_onfi_get_set_features_notsupp;
> +		chip->onfi_get_features	= nand_onfi_get_set_features_notsupp;
>  	}
>  
>  	nand_hw_control_init(chip->controller);
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 57d483ac5765..88af7145a51a 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -2008,6 +2008,8 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
>  	chip->read_byte		= qcom_nandc_read_byte;
>  	chip->read_buf		= qcom_nandc_read_buf;
>  	chip->write_buf		= qcom_nandc_write_buf;
> +	chip->onfi_set_features	= nand_onfi_get_set_features_notsupp;
> +	chip->onfi_get_features	= nand_onfi_get_set_features_notsupp;
>  
>  	/*
>  	 * the bad block marker is readable only when we read the last codeword
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index 442ce619b3b6..891ac7b99305 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -1183,6 +1183,8 @@ static int flctl_probe(struct platform_device *pdev)
>  	nand->read_buf = flctl_read_buf;
>  	nand->select_chip = flctl_select_chip;
>  	nand->cmdfunc = flctl_cmdfunc;
> +	nand->onfi_set_features = nand_onfi_get_set_features_notsupp;
> +	nand->onfi_get_features = nand_onfi_get_set_features_notsupp;
>  
>  	if (pdata->flcmncr_val & SEL_16BIT)
>  		nand->options |= NAND_BUSWIDTH_16;
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 3ea4bb19e12d..744ab10e8962 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -703,6 +703,8 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  	chip->read_buf = vf610_nfc_read_buf;
>  	chip->write_buf = vf610_nfc_write_buf;
>  	chip->select_chip = vf610_nfc_select_chip;
> +	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
> +	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
>  
>  	chip->options |= NAND_NO_SUBPAGE_WRITE;
>  
> diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> index e389009fca42..a4e3ae8f0c85 100644
> --- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
> +++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> @@ -915,6 +915,8 @@ static int spinand_probe(struct spi_device *spi_nand)
>  	chip->waitfunc	= spinand_wait;
>  	chip->options	|= NAND_CACHEPRG;
>  	chip->select_chip = spinand_select_chip;
> +	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
> +	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
>  
>  	mtd = nand_to_mtd(chip);
>  
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index f01991649118..5388c07836fd 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -1261,6 +1261,11 @@ int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
>  int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
>  			   int page);
>  
> +/* Stub used by drivers that do not support GET/SET FEATURES operations */
> +int nand_onfi_get_set_features_notsupp(struct mtd_info *mtd,
> +				       struct nand_chip *chip,
> +				       int feature_addr, u8 *subfeature_para);
> +
>  /* Default read_page_raw implementation */
>  int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  		       uint8_t *buf, int oob_required, int page);
