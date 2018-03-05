Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1essyE-0007an-NP
 for linux-mtd@lists.infradead.org; Mon, 05 Mar 2018 16:28:16 +0000
Date: Mon, 5 Mar 2018 17:28:02 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 1/3] mtd: rawnand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180305172802.5f69879a@bbrezillon>
In-Reply-To: <20180303222237.902-2-stefan@agner.ch>
References: <20180303222237.902-1-stefan@agner.ch>
 <20180303222237.902-2-stefan@agner.ch>
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

On Sat,  3 Mar 2018 23:22:35 +0100
Stefan Agner <stefan@agner.ch> wrote:

>  
> @@ -564,14 +868,95 @@ static int vf610_nfc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  				const uint8_t *buf, int oob_required, int page)
>  {
>  	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	int trfr_sz = mtd->writesize + mtd->oobsize;
> +	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
> +	int ret = 0;
>  
> -	nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
> -	if (oob_required)
> -		vf610_nfc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
> +	cmd2 |= NAND_CMD_SEQIN << CMD_BYTE1_SHIFT;
> +	code |= COMMAND_CMD_BYTE1 | COMMAND_CAR_BYTE1 | COMMAND_CAR_BYTE2;
> +
> +	vf610_nfc_fill_row(chip, page, &code, &row);
> +
> +	cmd1 |= NAND_CMD_PAGEPROG << CMD_BYTE2_SHIFT;
> +	code |= COMMAND_CMD_BYTE2 | COMMAND_WRITE_DATA;
> +
> +	/*
> +	 * Don't fix endianness on page access for historical reasons.
> +	 * See comment in vf610_nfc_wr_to_sram
> +	 */
> +	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0), buf,
> +			     mtd->writesize, false);
> +
> +	code |= COMMAND_RB_HANDSHAKE;
> +	cmd2 |= code << CMD_CODE_SHIFT;
> +
> +	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
> +	vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
> +	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);

I didn't notice that in my previous review, but you need to check the
status here:

	ret = nand_status_op(chip, &status);
	if (ret)
		return ret;

	if (status & NAND_STATUS_FAIL)
		return -EIO;

	return 0;
> +
> +	return ret;
> +}
> +


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
