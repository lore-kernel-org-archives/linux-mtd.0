Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zi4BX-00008t-LS
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2015 17:31:56 +0000
Received: by pablk4 with SMTP id lk4so111223190pab.3
 for <linux-mtd@lists.infradead.org>; Fri, 02 Oct 2015 10:31:34 -0700 (PDT)
Date: Fri, 2 Oct 2015 10:31:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, dehrenberg@google.com,
 cernekee@gmail.com, sboyd@codeaurora.org,
 linux-arm-msm@vger.kernel.org, agross@codeaurora.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] mtd: nand: Qualcomm NAND controller driver
Message-ID: <20151002173131.GF107187@google.com>
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-3-git-send-email-architt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1439959746-25498-3-git-send-email-architt@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

One more nit noticed by my build tests:

On Wed, Aug 19, 2015 at 10:19:03AM +0530, Archit Taneja wrote:

[...]

> +static int qcom_nandc_ecc_init(struct qcom_nandc_data *this)
> +{
> +	struct mtd_info *mtd = &this->mtd;
> +	struct nand_chip *chip = &this->chip;
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +	int cwperpage;

drivers/mtd/nand/qcom_nandc.c: In function ‘qcom_nandc_ecc_init’:
drivers/mtd/nand/qcom_nandc.c:1517:6: warning: variable ‘cwperpage’ set but not used [-Wunused-but-set-variable]

> +	bool wide_bus;
> +
> +	/* the nand controller fetches codewords/chunks of 512 bytes */
> +	cwperpage = mtd->writesize >> 9;
> +
> +	ecc->strength = this->ecc_strength;
> +
> +	wide_bus = chip->options & NAND_BUSWIDTH_16 ? true : false;
> +
> +	if (ecc->strength >= 8) {
> +		/* 8 bit ECC defaults to BCH ECC on all platforms */
> +		ecc->bytes = wide_bus ? 14 : 13;
> +	} else {
> +		/*
> +		 * if the controller supports BCH for 4 bit ECC, the controller
> +		 * uses lesser bytes for ECC. If RS is used, the ECC bytes is
> +		 * always 10 bytes
> +		 */
> +		if (this->ecc_modes & ECC_BCH_4BIT)
> +			ecc->bytes = wide_bus ? 8 : 7;
> +		else
> +			ecc->bytes = 10;
> +	}
> +
> +	/* each step consists of 512 bytes of data */
> +	ecc->size = NANDC_STEP_SIZE;
> +
> +	ecc->read_page		= qcom_nandc_read_page;
> +	ecc->read_oob		= qcom_nandc_read_oob;
> +	ecc->write_page		= qcom_nandc_write_page;
> +	ecc->write_oob		= qcom_nandc_write_oob;
> +
> +	/*
> +	 * the bad block marker is readable only when we read the page with ECC
> +	 * disabled. all the ops above run with ECC enabled. We need raw read
> +	 * and write function for oob in order to access bad block marker.
> +	 */
> +	ecc->read_oob_raw	= qcom_nandc_read_oob_raw;
> +	ecc->write_oob_raw	= qcom_nandc_write_oob_raw;
> +
> +	switch (mtd->oobsize) {
> +	case 64:
> +		ecc->layout = &layout_oob_64;
> +		break;
> +	case 128:
> +		ecc->layout = &layout_oob_128;
> +		break;
> +	case 224:
> +		if (wide_bus)
> +			ecc->layout = &layout_oob_224_x16;
> +		else
> +			ecc->layout = &layout_oob_224_x8;
> +		break;
> +	case 256:
> +		ecc->layout = &layout_oob_256;
> +		break;
> +	default:
> +		dev_err(this->dev, "unsupported NAND device, oobsize %d\n",
> +			mtd->oobsize);
> +		return -ENODEV;
> +	}
> +
> +	ecc->mode = NAND_ECC_HW;
> +
> +	/* enable ecc by default */
> +	this->use_ecc = true;
> +
> +	return 0;
> +}

[...]

Brian
