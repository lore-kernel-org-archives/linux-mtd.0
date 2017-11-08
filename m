Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCTGu-0004Cp-6P
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 16:32:20 +0000
Date: Wed, 8 Nov 2017 17:31:39 +0100
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
Subject: Re: [RFC PATCH v2 4/6] mtd: nand: add ->exec_op() implementation
Message-ID: <20171108173139.1cfd718a@bbrezillon>
In-Reply-To: <20171107145419.22717-5-miquel.raynal@free-electrons.com>
References: <20171107145419.22717-1-miquel.raynal@free-electrons.com>
 <20171107145419.22717-5-miquel.raynal@free-electrons.com>
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

On Tue,  7 Nov 2017 15:54:17 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Introduce a new interface to instruct NAND controllers to send specific
> NAND operations. The new interface takes the form of a single method
> called ->exec_op(). This method is designed to replace ->cmd_ctrl(),
> ->cmdfunc() and ->read/write_byte/word/buf() hooks.  
> 
> ->exec_op() is passed a set of instructions describing the operation  
> to execute. Each instruction has a type (ADDR, CMD, DATA, WAITRDY)
> and delay. The type is directly matching the description of NAND
> commands in various NAND datasheet and standards (ONFI, JEDEC), the

  ^ operations found ...

> delay is here to help simple controllers wait enough time between each
> instruction. Advanced controllers with integrated timings control can
> ignore these delays.
> 
> Advanced controllers (that are not limited to independent ADDR, CMD and
> DATA cycles) may use the parser added by this commit to get the best
> matching hook, if any. The instructions may be split by the parser in
> order to comply with the controller constraints filled in an array of
> supported patterns.
> 
> For instance, if a controller driver declares supporting up to 4 address
> cycles and writes up to 512 bytes within one pattern:
>         NAND_OP_PARSER_PAT_ADDR_ELEM(false, 4)
>         NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, 512)
> It means that if the matching operation is made of 5 address cycles
> followed by 1024 bytes to write, then the controller will be asked to:
>         - send 4 address cycles (the first four cycles),
>         - send 1 address cycle (the last one),
>         - write 512 bytes (the first half),
>         - write 512 bytes again (the second half).

Hm, not sure I understood this example correctly. Are you describing 2
independent patterns each containing only one element, or a pattern
containing the addr and dataout elems?
In the latter case, your example is wrong, the pattern
description should be:

	NAND_OP_PARSER_PAT_ADDR_ELEM(*true*, 4)
	NAND_OP_PARSER_PAT_DATA_OUT_ELEM(*true*, 512)

and the execution sequence:

	- send 4 address cycles (the first four cycles)
	- send 1 address cycle (the last one) +
	  write 512 bytes (the first half)
	- write 512 bytes again (the second half)

> 
> Various other helpers are also added to ease NAND controller drivers
> writing.
> 
> This new interface should really ease the support of new vendor specific
> instructions, and at least report whether the command is supported or not

  ^ operations

instruction in your nomenclature is only one element in an operation.

> by a given controller, which was not possible before.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c   | 894 ++++++++++++++++++++++++++++++++++++++++-
>  drivers/mtd/nand/nand_hynix.c  |  95 ++++-
>  drivers/mtd/nand/nand_micron.c |  33 +-
>  include/linux/mtd/rawnand.h    | 379 ++++++++++++++++-
>  4 files changed, 1365 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 13a1a378b126..d5c00b9ec1bc 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1236,6 +1236,124 @@ static int nand_init_data_interface(struct nand_chip *chip)
>  }
>  
>  /**
> + * nand_fill_column_cycles - fill the column fields on an address array
> + * @chip: The NAND chip
> + * @addrs: Array of address cycles to fill
> + * @offset_in_page: The offset in the page
> + *
> + * Fills the first or the two first bytes of the @addrs field depending
> + * on the NAND bus width and the page size.
> + */
> +int nand_fill_column_cycles(struct nand_chip *chip, u8 *addrs,
> +			    unsigned int offset_in_page)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +

we should probably check that offset_in_page is a valid offset:

	/* Make sure the offset is less than the actual page size. */
	if (offset_in_page > mtd->writesize + mtd->oobsize)
		return -EINVAL;

The column address is wrong for small page devices when
offset_in_page >= mtd->writesize.

You need something like:

	/*
	 * On small page NANDs, there's a dedicated command to access
	 * the OOB area, and the column address is relative to the start
	 * of the OOB area, not the start of the page. Asjust the
	 * address accordingly.
	 */
	if (mtd->writesize <= 512 && offset_in_page >= mtd->writesize)
		offset_in_page -= mtd->writesize;

> +	/*
> +	 * The offset in page is expressed in bytes, if the NAND bus is 16-bit
> +	 * wide, then it must be divided by 2.
> +	 */
> +	if (chip->options & NAND_BUSWIDTH_16) {
> +		if (offset_in_page % 2) {
> +			WARN_ON(true);
> +			return -EINVAL;
> +		}

Or just:

		if (WARN_ON(offset_in_page % 2))
 			return -EINVAL;


> +
> +		offset_in_page /= 2;
> +	}
> +
> +	addrs[0] = offset_in_page;
> +
> +	/* Small pages use 1 cycle for the columns, while large page need 2 */
> +	if (mtd->writesize <= 512)
> +		return 1;
> +
> +	addrs[1] = offset_in_page >> 8;
> +
> +	return 2;
> +}
> +EXPORT_SYMBOL_GPL(nand_fill_column_cycles);

AFAICT you don't need this function outside of nand_base.c. Please keep
it static until someone really needs it.

> +
> +static int nand_sp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
> +				     unsigned int offset_in_page, void *buf,
> +				     unsigned int len)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	const struct nand_sdr_timings *sdr =
> +		nand_get_sdr_timings(&chip->data_interface);
> +	u8 addrs[4];
> +	struct nand_op_instr instrs[] = {
> +		NAND_OP_CMD(NAND_CMD_READ0, 0),
> +		NAND_OP_ADDR(3, addrs, PSEC_TO_NSEC(sdr->tWB_max)),
> +		NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tR_max),
> +				 PSEC_TO_NSEC(sdr->tRR_min)),
> +		NAND_OP_DATA_IN(len, buf, 0),
> +	};
> +	struct nand_operation op = NAND_OPERATION(instrs);
> +	int ret;
> +
> +	/* Drop the DATA_OUT instruction if len is set to 0. */
> +	if (!len)
> +		op.ninstrs--;
> +
> +	if (offset_in_page >= mtd->writesize)
> +		instrs[0].cmd.opcode = NAND_CMD_READOOB;
> +	else if (offset_in_page >= 256)

NAND_CMD_READ1 is only used for small page devices exposing 512-byte
pages and an 8-bit data bus (this is needed to make the column address
fit in a single byte).

So the correct test is:

	else if (offset_in_page >= 256 &&
		 !(chip->options & NAND_BUSWIDTH_16))



> +		instrs[0].cmd.opcode = NAND_CMD_READ1;
> +
> +	ret = nand_fill_column_cycles(chip, addrs, offset_in_page);
> +	if (ret < 0)
> +		return ret;
> +
> +	addrs[1] = page;
> +	addrs[2] = page >> 8;
> +
> +	if (chip->options & NAND_ROW_ADDR_3) {
> +		addrs[3] = page >> 16;
> +		instrs[1].addr.naddrs++;
> +	}
> +
> +	return nand_exec_op(chip, &op);
> +}
> +
> +static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
> +				     unsigned int offset_in_page, void *buf,
> +				     unsigned int len)
> +{
> +	const struct nand_sdr_timings *sdr =
> +		nand_get_sdr_timings(&chip->data_interface);
> +	u8 addrs[5];
> +	struct nand_op_instr instrs[] = {
> +		NAND_OP_CMD(NAND_CMD_READ0, 0),
> +		NAND_OP_ADDR(4, addrs, 0),
> +		NAND_OP_CMD(NAND_CMD_READSTART, PSEC_TO_NSEC(sdr->tWB_max)),
> +		NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tR_max),
> +				 PSEC_TO_NSEC(sdr->tRR_min)),
> +		NAND_OP_DATA_IN(len, buf, 0),
> +	};
> +	struct nand_operation op = NAND_OPERATION(instrs);
> +	int ret;
> +
> +	/* Drop the DATA_IN instruction if len is set to 0. */
> +	if (!len)
> +		op.ninstrs--;
> +
> +	ret = nand_fill_column_cycles(chip, addrs, offset_in_page);
> +	if (ret < 0)
> +		return ret;
> +
> +	addrs[2] = page;
> +	addrs[3] = page >> 8;
> +
> +	if (chip->options & NAND_ROW_ADDR_3) {
> +		addrs[4] = page >> 16;
> +		instrs[1].addr.naddrs++;
> +	}
> +
> +	return nand_exec_op(chip, &op);
> +}
> +
> +/**
>   * nand_read_page_op - Do a READ PAGE operation
>   * @chip: The NAND chip
>   * @page: page to read
> @@ -1259,6 +1377,15 @@ int nand_read_page_op(struct nand_chip *chip, unsigned int page,
>  	if (offset_in_page + len > mtd->writesize + mtd->oobsize)
>  		return -EINVAL;
>  
> +	if (chip->exec_op) {
> +		if (mtd->writesize > 512)
> +			return nand_lp_exec_read_page_op(
> +				chip, page, offset_in_page, buf, len);

Still not properly aligned.

> +
> +		return nand_sp_exec_read_page_op(chip, page, offset_in_page,
> +						 buf, len);
> +	}
> +
>  	chip->cmdfunc(mtd, NAND_CMD_READ0, offset_in_page, page);
>  	if (len)
>  		chip->read_buf(mtd, buf, len);
> @@ -1289,6 +1416,26 @@ static int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
>  	if (len && !buf)
>  		return -EINVAL;
>  
> +	if (chip->exec_op) {
> +		const struct nand_sdr_timings *sdr =
> +			nand_get_sdr_timings(&chip->data_interface);
> +		struct nand_op_instr instrs[] = {
> +			NAND_OP_CMD(NAND_CMD_PARAM, 0),
> +			NAND_OP_ADDR(1, &page, PSEC_TO_NSEC(sdr->tWB_max)),
> +			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tR_max),
> +					 PSEC_TO_NSEC(sdr->tRR_min)),
> +			NAND_OP_8BIT_DATA_IN(len, buf, 0),
> +		};
> +		struct nand_operation op =
> +			NAND_OPERATION(instrs);

This one fits on a single line ;-).

> +
> +		/* Drop the DATA_IN instruction if len is set to 0. */
> +		if (!len)
> +			op.ninstrs--;
> +
> +		return nand_exec_op(chip, &op);
> +	}
> +
>  	chip->cmdfunc(mtd, NAND_CMD_PARAM, page, -1);
>  	for (i = 0; i < len; i++)
>  		p[i] = chip->read_byte(mtd);
> @@ -1321,6 +1468,36 @@ int nand_change_read_column_op(struct nand_chip *chip,
>  	if (offset_in_page + len > mtd->writesize + mtd->oobsize)
>  		return -EINVAL;
>  
> +	/* Small page NANDs do not support column change. */
> +	if (mtd->writesize <= 512)
> +		return -ENOTSUPP;
> +
> +	if (chip->exec_op) {
> +		const struct nand_sdr_timings *sdr =
> +			nand_get_sdr_timings(&chip->data_interface);
> +		u8 addrs[2] = {};
> +		struct nand_op_instr instrs[] = {
> +			NAND_OP_CMD(NAND_CMD_RNDOUT, 0),
> +			NAND_OP_ADDR(2, addrs, 0),
> +			NAND_OP_CMD(NAND_CMD_RNDOUTSTART,
> +				    PSEC_TO_NSEC(sdr->tCCS_min)),
> +			NAND_OP_DATA_IN(len, buf, 0),
> +		};
> +		struct nand_operation op =
> +			NAND_OPERATION(instrs);
> +
> +		if (nand_fill_column_cycles(chip, addrs, offset_in_page) < 0)
> +			return -EINVAL;

I thought you said you would return nand_fill_column_cycles() ret code
directly?

> +
> +		/* Drop the DATA_IN instruction if len is set to 0. */
> +		if (!len)
> +			op.ninstrs--;
> +
> +		instrs[3].data.force_8bit = force_8bit;
> +
> +		return nand_exec_op(chip, &op);
> +	}
> +
>  	chip->cmdfunc(mtd, NAND_CMD_RNDOUT, offset_in_page, -1);
>  	if (len)
>  		chip->read_buf(mtd, buf, len);
> @@ -1353,6 +1530,17 @@ int nand_read_oob_op(struct nand_chip *chip, unsigned int page,
>  	if (offset_in_page + len > mtd->oobsize)
>  		return -EINVAL;
>  
> +	if (chip->exec_op) {
> +		offset_in_page += mtd->writesize;
> +
> +		if (mtd->writesize > 512)
> +			return nand_lp_exec_read_page_op(
> +				chip, page, offset_in_page, buf, len);
> +
> +		return nand_sp_exec_read_page_op(chip, page, offset_in_page,
> +						 buf, len);
> +	}

How about

	if (chip->exec_op)
		return nand_read_page_op(chip, page,
					 offset_in_page +
					 mtd->writesize,
					 buf, len);

> +
>  	chip->cmdfunc(mtd, NAND_CMD_READOOB, offset_in_page, page);
>  	if (len)
>  		chip->read_buf(mtd, buf, len);
> @@ -1361,6 +1549,62 @@ int nand_read_oob_op(struct nand_chip *chip, unsigned int page,
>  }
>  EXPORT_SYMBOL_GPL(nand_read_oob_op);

That's all I have for now, but I didn't finish reviewing this patch.
Expect some more comments ;-).

Regards,

Boris
