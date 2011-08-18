Message-ID: <4E4CA940.3040106@freescale.com>
Date: Thu, 18 Aug 2011 13:55:12 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v9 1/3] MTD : add the common code for GPMI-NAND controller
	driver
References: <1313581828-16625-1-git-send-email-b32955@freescale.com>
	<1313581828-16625-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1313581828-16625-2-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Cc: shijie8@gmail.com, koen.beel.barco@gmail.com, linux-mtd@lists.infradead.org,
	w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem:
> +static int mil_pre_bbt_scan(struct gpmi_nand_data  *this)
> +{
> +	struct nand_chip *nand = &this->mil.nand;
> +	struct mtd_info *mtd = &this->mil.mtd;
> +	struct nand_ecclayout *layout = nand->ecc.layout;
> +	int error;
> +
> +	/*
> +	 *  fix the ECC layout before the scanning.
> +	 *  We will use all the (page + OOB).
> +	 */
> +	layout->eccbytes = 0;
> +	layout->oobavail = 0;
> +
> +	mtd->oobavail = mtd->oobsize;
Buggy?
It seems mtd->oobavail should be zero here.

thanks.


Huang Shijie
> +
> +	/* Set up swap block-mark, must be set before the mil_set_geometry() */
> +	if (GPMI_IS_MX23(this))
> +		this->swap_block_mark = false;
> +	else
> +		this->swap_block_mark = true;
> +
> +	/* Set up the medium geometry */
> +	error = mil_set_geometry(this);
> +	if (error)
> +		return error;
> +
> +	/* NAND boot init, depends on the mil_set_geometry(). */
> +	return nand_boot_init(this);
> +}
> +
> +static int gpmi_scan_bbt(struct mtd_info *mtd)
> +{
> +	struct nand_chip *nand = mtd->priv;
> +	struct gpmi_nand_data *this = nand->priv;
> +	int error;
> +
> +	/* Prepare for the BBT scan. */
> +	error = mil_pre_bbt_scan(this);
> +	if (error)
> +		return error;
> +
> +	/* use the default BBT implementation */
> +	return nand_default_bbt(mtd);
> +}
> +
