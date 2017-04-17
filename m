Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d0Dqn-0005RF-98
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 21:06:23 +0000
Date: Mon, 17 Apr 2017 23:05:49 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v5 2/6] nand: spi: add basic operations support
Message-ID: <20170417230549.5d007001@bbrezillon>
In-Reply-To: <1491810713-27795-3-git-send-email-peterpandong@micron.com>
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
 <1491810713-27795-3-git-send-email-peterpandong@micron.com>
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

On Mon, 10 Apr 2017 15:51:49 +0800
Peter Pan <peterpandong@micron.com> wrote:

>  
>  /*
> + * spinand_get_ecc_status - get ecc correction information from status register
> + * @chip: SPI NAND device structure
> + * @status: status register value
> + * @corrected: corrected bit flip number
> + * @ecc_error: ecc correction error or not
> + */
> +static void spinand_get_ecc_status(struct spinand_device *chip,
> +				   unsigned int status,
> +				   unsigned int *corrected,
> +				   unsigned int *ecc_error)
> +{
> +	return chip->ecc.engine->ops->get_ecc_status(chip, status, corrected,
> +						     ecc_error);
> +}
> +
> +/*
> + * spinand_do_read_page - read page from device to buffer
> + * @mtd: MTD device structure
> + * @page_addr: page address/raw address
> + * @ecc_off: without ecc or not
> + * @corrected: how many bit flip corrected
> + * @oob_only: read OOB only or the whole page
> + */
> +static int spinand_do_read_page(struct mtd_info *mtd, u32 page_addr,
> +				bool ecc_off, int *corrected, bool oob_only)
> +{
> +	struct spinand_device *chip = mtd_to_spinand(mtd);
> +	struct nand_device *nand = mtd_to_nand(mtd);
> +	int ret, ecc_error = 0;
> +	u8 status;
> +
> +	spinand_read_page_to_cache(chip, page_addr);
> +	ret = spinand_wait(chip, &status);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "error %d waiting page 0x%x to cache\n",
> +			ret, page_addr);
> +		return ret;
> +	}
> +	if (!oob_only)
> +		spinand_read_from_cache(chip, page_addr, 0,
> +					nand_page_size(nand) +
> +					nand_per_page_oobsize(nand),
> +					chip->buf);
> +	else
> +		spinand_read_from_cache(chip, page_addr, nand_page_size(nand),
> +					nand_per_page_oobsize(nand),
> +					chip->oobbuf);
> +	if (!ecc_off) {

I see at least one problem for software ECC, or hardware ECC engine
that are not deeply integrated in the NAND controller pipeline (those
only generating ECC bytes without pushing them to the NAND).

You probably need a hook to let ECC engines correct the in-band and OOB
buffers (eccengine->correct() ?).

> +		spinand_get_ecc_status(chip, status, corrected, &ecc_error);
> +		/*
> +		 * If there's an ECC error, print a message and notify MTD
> +		 * about it. Then complete the read, to load actual data on
> +		 * the buffer (instead of the status result).
> +		 */
> +		if (ecc_error) {
> +			dev_err(chip->dev,
> +				"internal ECC error reading page 0x%x\n",
> +				page_addr);
> +			mtd->ecc_stats.failed++;
> +		} else if (*corrected) {
> +			mtd->ecc_stats.corrected += *corrected;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * spinand_do_write_page - write data from buffer to device
> + * @mtd: MTD device structure
> + * @page_addr: page address/raw address
> + * @oob_only: write OOB only or the whole page
> + */
> +static int spinand_do_write_page(struct mtd_info *mtd, u32 page_addr,
> +				 bool oob_only)
> +{
> +	struct spinand_device *chip = mtd_to_spinand(mtd);
> +	struct nand_device *nand = mtd_to_nand(mtd);
> +	u8 status;
> +	int ret = 0;
> +

Same as for the read path: you'll probably need and extra
eccgine->generate_ecc_bytes() hook to let the ECC generates ECC bytes
if required.

> +	spinand_write_enable(chip);
> +	if (!oob_only)
> +		spinand_write_to_cache(chip, page_addr, 0,
> +				       nand_page_size(nand) +
> +				       nand_per_page_oobsize(nand), chip->buf);
> +	else
> +		spinand_write_to_cache(chip, page_addr, nand_page_size(nand),
> +				       nand_per_page_oobsize(nand),
> +				       chip->oobbuf);
> +	spinand_program_execute(chip, page_addr);
> +	ret = spinand_wait(chip, &status);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "error %d reading page 0x%x from cache\n",
> +			ret, page_addr);
> +		return ret;
> +	}
> +	if ((status & STATUS_P_FAIL_MASK) == STATUS_P_FAIL) {
> +		dev_err(chip->dev, "program page 0x%x failed\n", page_addr);
> +		ret = -EIO;
> +	}
> +	return ret;
> +}
> +
