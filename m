Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFbVt-0005NK-Iq
 for linux-mtd@lists.infradead.org; Mon, 07 May 2018 08:28:55 +0000
Date: Mon, 7 May 2018 10:28:40 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Archit Taneja <architt@codeaurora.org>, Richard Weinberger
 <richard@nod.at>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Andy Gross <andy.gross@linaro.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 04/14] mtd: rawnand: qcom: use the ecc strength from
 device parameter
Message-ID: <20180507102840.3624fe01@bbrezillon>
In-Reply-To: <1525350041-22995-5-git-send-email-absahu@codeaurora.org>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
 <1525350041-22995-5-git-send-email-absahu@codeaurora.org>
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

On Thu,  3 May 2018 17:50:31 +0530
Abhishek Sahu <absahu@codeaurora.org> wrote:

> Currently the driver uses the ECC strength specified in DT.
> The QPIC/EBI2 NAND supports 4 or 8-bit ECC correction. The same
> kind of board can have different NAND parts so use the ECC
> strength from device parameters if it is not specified in DT.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> * Changes from v1:
> 
>   1. Removed the custom logic and used the helper fuction.
> 
>  drivers/mtd/nand/raw/qcom_nandc.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index b554fb6..a8d71ce 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2315,13 +2315,21 @@ static int qcom_nand_ooblayout_free(struct mtd_info *mtd, int section,
>  	.free = qcom_nand_ooblayout_free,
>  };
>  
> +static int
> +qcom_nandc_calc_ecc_bytes(int step_size, int strength)
> +{
> +	return strength == 4 ? 12 : 16;
> +}
> +NAND_ECC_CAPS_SINGLE(qcom_nandc_ecc_caps, qcom_nandc_calc_ecc_bytes,
> +		     NANDC_STEP_SIZE, 4, 8);
> +
>  static int qcom_nand_host_setup(struct qcom_nand_host *host)
>  {
>  	struct nand_chip *chip = &host->chip;
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
>  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> -	int cwperpage, bad_block_byte;
> +	int cwperpage, bad_block_byte, ret;
>  	bool wide_bus;
>  	int ecc_mode = 1;
>  
> @@ -2334,8 +2342,20 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
>  		return -EINVAL;
>  	}
>  
> +	cwperpage = mtd->writesize / ecc->size;

Looks like you're still expecting nand-ecc-step-size to be defined in
the DT, which does not really make sense since you only support one
size: NANDC_STEP_SIZE.

You should remove the

	if (ecc->size != NANDC_STEP_SIZE) {
		dev_err(nandc->dev, "invalid ecc size\n");
		return -EINVAL;
	}

block, then do:

	cwperpage = mtd->writesize / NANDC_STEP_SIZE;

and finally let the nand_ecc_param_setup() function choose the best
config for you.

> +
> +	/*
> +	 * Each CW has 4 available OOB bytes which will be protected with ECC
> +	 * so remaining bytes can be used for ECC.
> +	 */
> +	ret = nand_ecc_param_setup(chip, &qcom_nandc_ecc_caps,
> +				   mtd->oobsize - (cwperpage << 2));

Please stop doing useless optimizations like. That brings nothing and
obfuscates the code a bit more. You say in the comment that each
codeword has 4 protected OOB bytes that can be used by the upper layer,
so just do (cwperpage * 4) and let gcc optimize that for you.

> +	if (ret) {
> +		dev_err(nandc->dev, "No valid ecc settings possible\n");
> +		return ret;
> +	}
> +
>  	wide_bus = chip->options & NAND_BUSWIDTH_16 ? true : false;
> -
>  	if (ecc->strength >= 8) {
>  		/* 8 bit ECC defaults to BCH ECC on all platforms */
>  		host->bch_enabled = true;
> @@ -2403,7 +2423,6 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
>  
>  	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
>  
> -	cwperpage = mtd->writesize / ecc->size;
>  	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
>  				     cwperpage);
>  
> @@ -2419,12 +2438,6 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
>  	 * for 8 bit ECC
>  	 */
>  	host->cw_size = host->cw_data + ecc->bytes;
> -
> -	if (ecc->bytes * (mtd->writesize / ecc->size) > mtd->oobsize) {
> -		dev_err(nandc->dev, "ecc data doesn't fit in OOB area\n");
> -		return -EINVAL;
> -	}
> -
>  	bad_block_byte = mtd->writesize - host->cw_size * (cwperpage - 1) + 1;
>  
>  	host->cfg0 = (cwperpage - 1) << CW_PER_PAGE
