Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8q9-0003ZV-U6
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 16:25:30 +0000
Date: Tue, 20 Nov 2018 17:24:43 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: <miquel.raynal@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <michals@xilinx.com>, nagasuresh12@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20181120172443.5fb0bc14@bbrezillon>
In-Reply-To: <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

On Fri, 9 Nov 2018 10:30:41 +0530
Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:

> +static int anfc_setup_data_interface(struct nand_chip *chip, int csline,
> +				     const struct nand_data_interface *conf)
> +{
> +	struct anfc_nand_controller *nfc = to_anfc(chip->controller);
> +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> +	int err;
> +	const struct nand_sdr_timings *sdr;
> +	u32 inftimeval;
> +	bool change_sdr_clk = false;
> +
> +	if (csline == NAND_DATA_IFACE_CHECK_ONLY)
> +		return 0;
> +
> +	/*
> +	 * If the controller is already in the same mode as flash device
> +	 * then no need to change the timing mode again.
> +	 */
> +	sdr = nand_get_sdr_timings(conf);
> +	if (IS_ERR(sdr))
> +		return PTR_ERR(sdr);
> +
> +	if (sdr->mode < 0)
> +		return -ENOTSUPP;
> +
> +	inftimeval = sdr->mode & 7;
> +	if (sdr->mode >= 2 && sdr->mode <= 5)
> +		change_sdr_clk = true;
> +	/*
> +	 * SDR timing modes 2-5 will not work for the arasan nand when
> +	 * freq > 90 MHz, so reduce the freq in SDR modes 2-5 to < 90Mhz

What's the freq for mode 0 and 1?

> +	 */
> +	if (change_sdr_clk) {
> +		clk_disable_unprepare(nfc->clk_sys);
> +		err = clk_set_rate(nfc->clk_sys, SDR_MODE_DEFLT_FREQ);

You should not change the clk rate here. It should be done when the
chip is selected, so that, if you ever have 2 different chips connected
to the same controller, you can adapt the rate when they are accessed.

> +		if (err) {
> +			dev_err(nfc->dev, "Can't set the clock rate\n");
> +			return err;
> +		}
> +		err = clk_prepare_enable(nfc->clk_sys);
> +		if (err) {
> +			dev_err(nfc->dev, "Unable to enable sys clock.\n");
> +			clk_disable_unprepare(nfc->clk_sys);
> +			return err;
> +		}
> +	}
> +	achip->inftimeval = inftimeval;
> +
> +	return 0;
> +}
> +
> +static int anfc_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> +	u32 ret;
> +
> +	if (mtd->writesize <= SZ_512)
> +		achip->spare_caddr_cycles = 1;
> +	else
> +		achip->spare_caddr_cycles = 2;
> +
> +	chip->ecc.calc_buf = kmalloc(mtd->oobsize, GFP_KERNEL);
> +	chip->ecc.code_buf = kmalloc(mtd->oobsize, GFP_KERNEL);

Those bufs are allocated but never freed (memleak). Also, are you sure
you really need them.
