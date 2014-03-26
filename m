Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSv8i-0003xS-Fv
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 21:13:37 +0000
Date: Wed, 26 Mar 2014 22:13:08 +0100
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH] mtd: nand: Add support for Micron on-die ECC controller.
Message-ID: <20140326211308.GO3998@book.gsilab.sittig.org>
References: <1395460989-21049-1-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395460989-21049-1-git-send-email-davidm@egauge.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-03-21 at 22:03 -0600, David Mosberger wrote:
> 
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> [ ... ]
> +
> +static int check_read_status_on_die(struct mtd_info *mtd,
> +				    struct nand_chip *chip, int page)
> +{
> +	int max_bitflips = 0;
> +	uint8_t status;
> +
> +	/* Check ECC status of page just transferred into NAND's page buffer: */
> +	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> +	status = chip->read_byte(mtd);
> +
> +	/* Switch back to data reading: */
> +	chip->cmd_ctrl(mtd, NAND_CMD_READ0,
> +		       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
> +	chip->cmd_ctrl(mtd, NAND_CMD_NONE,
> +		       NAND_NCE | NAND_CTRL_CHANGE);
> +
> +	if (status & NAND_STATUS_FAIL)
> +		/* Page has invalid ECC. */
> +		mtd->ecc_stats.failed++;
> +	else if (status & NAND_STATUS_REWRITE) {

coding style, there should be braces around all arms if one of
them has some

> +		/*
> +		 * The Micron chips turn on the REWRITE status bit for
> +		 * ANY bit flips.  Some pages have stuck bits, so we
> +		 * don't want to migrate a block just because of
> +		 * single bit errors because otherwise, that block
> +		 * would effectively become unusable.  So, work out in
> +		 * software what the max number of flipped bits is for
> +		 * all subpages in a page:
> +		 */
> +		max_bitflips = check_for_bitflips(mtd, chip, page);
> +	}
> +	return max_bitflips;
> +}

so the check_read_status_on_die() routine returns the number of
bit flips (if they could be corrected)

> +/**
> + * nand_read_subpage_on_die - [REPLACEABLE] raw sub-page read function
> + * @mtd: mtd info structure
> + * @chip: nand chip info structure
> + * @data_offs: offset of requested data within the page
> + * @readlen: data length
> + * @bufpoi: buffer to store read data
> + */
> +static int nand_read_subpage_on_die(struct mtd_info *mtd,
> +				    struct nand_chip *chip,
> +				    uint32_t data_offs, uint32_t readlen,
> +				    uint8_t *bufpoi, int page)
> +{
> +	int start_step, end_step, num_steps, ret;
> +	int data_col_addr;
> +	int datafrag_len;
> +	uint32_t failed;
> +	uint8_t *p;
> +
> +	/* Column address within the page aligned to ECC size */
> +	start_step = data_offs / chip->ecc.size;
> +	end_step = (data_offs + readlen - 1) / chip->ecc.size;
> +	num_steps = end_step - start_step + 1;
> +
> +	/* Data size aligned to ECC ecc.size */
> +	datafrag_len = num_steps * chip->ecc.size;
> +	data_col_addr = start_step * chip->ecc.size;
> +	p = bufpoi + data_col_addr;
> +
> +	failed = mtd->ecc_stats.failed;
> +
> +	ret = check_read_status_on_die(mtd, chip, page);
> +	if (ret < 0 || mtd->ecc_stats.failed != failed) {
> +		memset(p, 0, datafrag_len);
> +		return ret;
> +	}

are you certain about this non-zero return code from the
chip->ecc.read_subpage() callback?  IIUC this will lead to fatal
errors in nand_do_read_ops() -- am I missing something?

> +
> +	/* If we read not a page aligned data */
> +	if (data_col_addr != 0)
> +		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_col_addr, -1);
> +
> +	chip->read_buf(mtd, p, datafrag_len);
> +
> +	return ret;
> +}
> +
> +/**
> + * nand_read_page_on_die - [INTERN] read raw page data without ecc
> + * @mtd: mtd info structure
> + * @chip: nand chip info structure
> + * @buf: buffer to store read data
> + * @oob_required: caller requires OOB data read to chip->oob_poi
> + * @page: page number to read
> + */
> +static int nand_read_page_on_die(struct mtd_info *mtd, struct nand_chip *chip,
> +				 uint8_t *buf, int oob_required, int page)
> +{
> +	uint32_t failed;
> +	int ret;
> +
> +	failed = mtd->ecc_stats.failed;
> +
> +	ret = check_read_status_on_die(mtd, chip, page);
> +	if (ret < 0 || mtd->ecc_stats.failed != failed) {
> +		memset(buf, 0, mtd->writesize);
> +		if (oob_required)
> +			memset(chip->oob_poi, 0, mtd->oobsize);
> +		return ret;
> +	}

same here for the chip->ecc.read_page() callback

> +
> +	chip->read_buf(mtd, buf, mtd->writesize);
> +	if (oob_required)
> +		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +	return ret;
> +}

> @@ -3783,22 +3986,45 @@ EXPORT_SYMBOL(nand_scan_ident);
>  int nand_scan_tail(struct mtd_info *mtd)
>  {
>  	int i;
> +	u8 features[ONFI_SUBFEATURE_PARAM_LEN];
>  	struct nand_chip *chip = mtd->priv;
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
>  	struct nand_buffers *nbuf;
>  
> +	if ((*chip->onfi_get_features)(mtd, chip, 0x90, features) >= 0) {
> +		if (features[0] & 0x08) {

if .onfi_get_features already is a function pointer, you need not
dereference it before calling the routine (should apply elsewhere
in the patch as well)

want to replace those magic numbers with symbolic identifiers?
especially when they get referenced from multiple locations


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
