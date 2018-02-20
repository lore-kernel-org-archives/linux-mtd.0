Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eoH8E-0006WV-7o
 for linux-mtd@lists.infradead.org; Tue, 20 Feb 2018 23:15:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Wed, 21 Feb 2018 00:15:18 +0100
From: Stefan Agner <stefan@agner.ch>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v3 2/3] mtd: nand: vf610_nfc: make use of ->exec_op()
In-Reply-To: <20180211115452.29cee45e@bbrezillon>
References: <20180208235921.31840-1-stefan@agner.ch>
 <20180208235921.31840-3-stefan@agner.ch>
 <20180211115452.29cee45e@bbrezillon>
Message-ID: <8898b2bd6b9b904f24b862d6df55ac40@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11.02.2018 11:54, Boris Brezillon wrote:
> On Fri,  9 Feb 2018 00:59:20 +0100
> Stefan Agner <stefan@agner.ch> wrote:
> 
>> This reworks the driver to make use of ->exec_op() callback. The
>> command sequencer of the VF610 NFC aligns well with the new ops
>> interface.
>>
>> The ops are translated to a NFC command code while filling the
>> necessary registers. Instead of using the special status and
>> read id command codes (which require the status/id form special
>> registers) the driver now uses the main data buffer for all
>> commands. This simplifies the driver as no special casing is
>> needed.
>>
>> For control data (status byte, id bytes and parameter page) the
>> driver needs to reverse byte order for little endian CPUs since
>> the controller seems to store the bytes in big endian order in
>> the data buffer.
>>
>> The current state seems to pass MTD tests on a Colibri VF61.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  drivers/mtd/nand/vf610_nfc.c | 279 +++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 267 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
>> index 2fa61cbdbaf7..eae95877422d 100644
>> --- a/drivers/mtd/nand/vf610_nfc.c
>> +++ b/drivers/mtd/nand/vf610_nfc.c
>> @@ -74,6 +74,21 @@
>>  #define RESET_CMD_CODE			0x4040
>>  #define STATUS_READ_CMD_CODE		0x4068
>>
>> +/* NFC_CMD2[CODE] controller cycle bit masks */
>> +#define COMMAND_CMD_BYTE1		BIT(14)
>> +#define COMMAND_CAR_BYTE1		BIT(13)
>> +#define COMMAND_CAR_BYTE2		BIT(12)
>> +#define COMMAND_RAR_BYTE1		BIT(11)
>> +#define COMMAND_RAR_BYTE2		BIT(10)
>> +#define COMMAND_RAR_BYTE3		BIT(9)
>> +#define COMMAND_WRITE_DATA		BIT(8)
>> +#define COMMAND_CMD_BYTE2		BIT(7)
>> +#define COMMAND_RB_HANDSHAKE		BIT(6)
>> +#define COMMAND_READ_DATA		BIT(5)
>> +#define COMMAND_CMD_BYTE3		BIT(4)
>> +#define COMMAND_READ_STATUS		BIT(3)
>> +#define COMMAND_READ_ID			BIT(2)
>> +
>>  /* NFC ECC mode define */
>>  #define ECC_BYPASS			0
>>  #define ECC_45_BYTE			6
>> @@ -97,10 +112,14 @@
>>  /* NFC_COL_ADDR Field */
>>  #define COL_ADDR_MASK				0x0000FFFF
>>  #define COL_ADDR_SHIFT				0
>> +#define COL_ADDR(pos, val)			((val & 0xFF) << (8 * (pos)))
>> +
>>
>>  /* NFC_ROW_ADDR Field */
>>  #define ROW_ADDR_MASK				0x00FFFFFF
>>  #define ROW_ADDR_SHIFT				0
>> +#define ROW_ADDR(pos, val)			((val & 0xFF) << (8 * (pos)))
>> +
>>  #define ROW_ADDR_CHIP_SEL_RB_MASK		0xF0000000
>>  #define ROW_ADDR_CHIP_SEL_RB_SHIFT		28
>>  #define ROW_ADDR_CHIP_SEL_MASK			0x0F000000
>> @@ -173,6 +192,11 @@ static inline struct vf610_nfc *mtd_to_nfc(struct mtd_info *mtd)
>>  	return container_of(mtd_to_nand(mtd), struct vf610_nfc, chip);
>>  }
>>
>> +static inline struct vf610_nfc *chip_to_nfc(struct nand_chip *chip)
>> +{
>> +	return container_of(chip, struct vf610_nfc, chip);
>> +}
>> +
>>  static inline u32 vf610_nfc_read(struct vf610_nfc *nfc, uint reg)
>>  {
>>  	return readl(nfc->regs + reg);
>> @@ -489,6 +513,184 @@ static int vf610_nfc_dev_ready(struct mtd_info *mtd)
>>  	return 1;
>>  }
>>
>> +static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row, u32 cmd1, u32 cmd2, u32 trfr_sz)
> 
> Nitpick: please wrap the line to make checkpatch happy.
> 

Ok.

>> +{
>> +	vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
>> +			    COL_ADDR_SHIFT, col);
>> +
>> +	vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
>> +			    ROW_ADDR_SHIFT, row);
>> +
>> +	vf610_nfc_write(nfc, NFC_SECTOR_SIZE, trfr_sz);
>> +	vf610_nfc_write(nfc, NFC_FLASH_CMD1, cmd1);
>> +	vf610_nfc_write(nfc, NFC_FLASH_CMD2, cmd2);
>> +
>> +	dev_dbg(nfc->dev, "col 0x%08x, row 0x%08x, cmd1 0x%08x, cmd2 0x%08x, trfr_sz %d\n",
>> +		col, row, cmd1, cmd2, trfr_sz);
>> +
>> +	vf610_nfc_done(nfc);
>> +}
>> +
>> +static inline const struct nand_op_instr *vf610_get_next_instr(
>> +	const struct nand_subop *subop, int *op_id)
>> +{
>> +	if (*op_id + 1 >= subop->ninstrs)
>> +		return NULL;
>> +
>> +	(*op_id)++;
>> +
>> +	return &subop->instrs[*op_id];
>> +}
>> +
>> +static int vf610_nfc_cmd(struct nand_chip *chip,
>> +				const struct nand_subop *subop)
>> +{
>> +	const struct nand_op_instr *instr;
>> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	int op_id = -1, addr = 0, trfr_sz = 0;
>> +	u32 col = 0, row = 0, cmd1 = 0, cmd2 = 0, code = 0;
>> +
>> +	/* Some ops are optional, but they need to be in order */
>> +	instr = vf610_get_next_instr(subop, &op_id);
>> +	if (!instr)
>> +		return -EINVAL;
>> +
>> +	if (instr && instr->type == NAND_OP_CMD_INSTR) {
>> +		dev_dbg(nfc->dev, "OP_CMD: code 0x%02x\n", instr->ctx.cmd.opcode);
>> +		cmd2 |= instr->ctx.cmd.opcode << CMD_BYTE1_SHIFT;
>> +		code |= COMMAND_CMD_BYTE1;
>> +
>> +		instr = vf610_get_next_instr(subop, &op_id);
>> +	}
>> +
>> +	if (instr && instr->type == NAND_OP_ADDR_INSTR) {
>> +
> 
> Hm, you're still checking the sequencing consistency here. This should
> have been taken care by the core parser already, so really, this is not
> needed.
> 

Since those operations are optional, I have to check...

>> +		if (instr->ctx.addr.naddrs > 1) {
>> +			col = COL_ADDR(0, instr->ctx.addr.addrs[addr++]);
>> +			code |= COMMAND_CAR_BYTE1;
>> +
>> +			if (mtd->writesize > 512) {
>> +				col |= COL_ADDR(1, instr->ctx.addr.addrs[addr++]);
>> +				code |= COMMAND_CAR_BYTE2;
>> +			}
> 
> No, you shoudn't do that. Just put as many ADDR cycles as requested
> without trying to figure out if they fit in the column or row field. We
> really don't care here, as long as the ADDR cycles are issued on the
> bus.
> 

Ok, so on a bus level column/row really does not matter? I wonder why
the controller makes a difference then? I remember that the controller
has auto increment feature, might that be the reason? Afaik we cannot
use such a feature currently...?

>> +		}
>> +
>> +		row = ROW_ADDR(0, instr->ctx.addr.addrs[addr++]);
>> +		code |= COMMAND_RAR_BYTE1;
>> +		if (addr < instr->ctx.addr.naddrs) {
>> +			row |= ROW_ADDR(1, instr->ctx.addr.addrs[addr++]);
>> +			code |= COMMAND_RAR_BYTE2;
>> +		}
>> +		if (addr < instr->ctx.addr.naddrs) {
>> +			row |= ROW_ADDR(2, instr->ctx.addr.addrs[addr++]);
>> +			code |= COMMAND_RAR_BYTE3;
>> +		}
>> +
>> +		dev_dbg(nfc->dev, "OP_ADDR: col %d, row %d\n", col, row);
>> +
>> +		instr = vf610_get_next_instr(subop, &op_id);
>> +	}
>> +
>> +	if (instr && instr->type == NAND_OP_DATA_OUT_INSTR) {
>> +		int len = nand_subop_get_data_len(subop, op_id);
>> +		int offset = nand_subop_get_data_start_off(subop, op_id);
>> +
>> +		dev_dbg(nfc->dev, "OP_DATA_OUT: len %d, offset %d\n", len, offset);
>> +
>> +		vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + offset,
>> +				 instr->ctx.data.buf.in + offset,
>> +				 len);
> 
> I think you have the same endianness problem you have for the READ
> path. For example, I doubt SET_FEATURES will work properly if you're
> in LE. So I repeat my initial suggestion: always do the byte swapping
> when you're transfering data to/from the SRAM from vf610_nfc_cmd()
> and use vf610_nfc_memcpy() only in the ->read/write_page()
> implementations. 
> 

Hm, but doesn't that leads to wrong order of data when using e.g. raw
read/write page...?

>> +		code |= COMMAND_WRITE_DATA;
>> +		trfr_sz += len;
>> +
>> +		instr = vf610_get_next_instr(subop, &op_id);
>> +	}
>> +
>> +	if (instr && instr->type == NAND_OP_CMD_INSTR) {
>> +		cmd1 |= instr->ctx.cmd.opcode << CMD_BYTE2_SHIFT;
>> +		code |= COMMAND_CMD_BYTE2;
>> +
>> +		instr = vf610_get_next_instr(subop, &op_id);
>> +	}
>> +
>> +	if (instr && instr->type == NAND_OP_WAITRDY_INSTR) {
>> +		//dev_dbg(nfc->dev, "WAITRDY [max %d ms]\n",
>> +		//		  instr->ctx.waitrdy.timeout_ms);
> 
> I guess this should go away.
> 
>> +		code |= COMMAND_RB_HANDSHAKE;
>> +
>> +		instr = vf610_get_next_instr(subop, &op_id);
>> +	}
>> +
>> +	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
>> +		int len = nand_subop_get_data_len(subop, op_id);
>> +		code |= COMMAND_READ_DATA;
>> +		trfr_sz += len;
>> +	}
>> +
>> +	cmd2 |= code << CMD_CODE_SHIFT;
>> +
>> +	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
>> +	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
>> +
>> +	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
>> +		int len = nand_subop_get_data_len(subop, op_id);
>> +		int offset = nand_subop_get_data_start_off(subop, op_id);
>> +		bool fix_byte_order = false;
>> +
>> +#ifdef __LITTLE_ENDIAN
>> +		fix_byte_order = true;
>> +#endif
>> +		dev_dbg(nfc->dev, "OP_DATA_IN: 8-bit: %d, len %d, offset %d\n",
>> +			instr->ctx.data.force_8bit , len, offset);
>> +
>> +		/*
>> +		 * HACK: force_8bit indicates reading of the parameter, status
>> +		 * or id data. The controllers seems to store data in big endian
>> +		 * byte order to the buffers. Reverse on little endian machines.
>> +		 */
>> +		if (instr->ctx.data.force_8bit && fix_byte_order) {
> 
> I'm still convinced this is not the right solution to choose between
> swap vs don't swap bytes. See my explanation above.
> 
>> +			u8 *buf = instr->ctx.data.buf.in;
>> +
>> +			while (len--) {
>> +				int c = offset ^ 0x3;
>> +
>> +				*buf = *((u8 *)(nfc->regs + NFC_MAIN_AREA(0) + c));
>> +				buf++; offset++;
>> +			}
>> +		} else {
>> +			vf610_nfc_memcpy(instr->ctx.data.buf.in + offset,
>> +					 nfc->regs + NFC_MAIN_AREA(0) + offset,
>> +					 len);
>> +		}
> 
> I think the "copy to/from SRAM and swap bytes if needed" code should
> should be move in dedicated functions.
> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
>> +	NAND_OP_PARSER_PATTERN(
>> +		vf610_nfc_cmd,
>> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
>> +		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
>> +		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K + OOB_MAX),
>> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
>> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
>> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K + OOB_MAX)),
> 
> Are you sure you can do both a read and a write in a single pass? I
> doubt this is the case, because the logic seems to share the same SRAM
> for both operations, so I'd recommend splitting in 2 patterns:
> 

Hm, yes I currently use the same buffer, so in the current state this
would not work. But the controller actually has four buffers, so I
*could* use different ones for reading and writing. But is reading and
writing in a single go something we need often that such an optimization
would make worthwhile?

> 	NAND_OP_PARSER_PATTERN(
>                 vf610_nfc_cmd,
>                 NAND_OP_PARSER_PAT_CMD_ELEM(true), 
>                 NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5), 
>                 NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K +
> 	        OOB_MAX), NAND_OP_PARSER_PAT_CMD_ELEM(true),
>                 NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
>         NAND_OP_PARSER_PATTERN(
>                 vf610_nfc_cmd,
>                 NAND_OP_PARSER_PAT_CMD_ELEM(true),
>                 NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
>                 NAND_OP_PARSER_PAT_CMD_ELEM(true),
>                 NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
>                 NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K +
> 	        OOB_MAX)),
> 
>> +	);
> 
> To sum-up, here is a diff [1] that applies on top of your patch and
> illustrate what I have in mind.
> 
>> +
>> +static int vf610_nfc_exec_op(struct nand_chip *chip,
>> +			     const struct nand_operation *op,
>> +			     bool check_only)
>> +{
>> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
>> +
>> +	dev_dbg(nfc->dev, "exec_op, opcode 0x%02x\n", op->instrs[0].ctx.cmd.opcode);
>> +
>> +	return nand_op_parser_exec_op(chip, &vf610_nfc_op_parser, op, check_only);
>> +}
>> +
>> +
>>  /*
>>   * This function supports Vybrid only (MPC5125 would have full RB and four CS)
>>   */
>> @@ -527,8 +729,7 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
>>  		return ecc_count;
>>
>>  	/* Read OOB without ECC unit enabled */
>> -	vf610_nfc_command(mtd, NAND_CMD_READOOB, 0, page);
>> -	vf610_nfc_read_buf(mtd, oob, mtd->oobsize);
>> +	nand_read_oob_op(&nfc->chip, page, 0, oob, mtd->oobsize);
>>
>>  	/*
>>  	 * On an erased page, bit count (including OOB) should be zero or
>> @@ -542,12 +743,42 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
>>  static int vf610_nfc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>>  				uint8_t *buf, int oob_required, int page)
>>  {
>> -	int eccsize = chip->ecc.size;
>> +	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
>> +	int trfr_sz = mtd->writesize + mtd->oobsize;
>> +	u32 col = 0, row = 0, cmd1 = 0, cmd2 = 0, code = 0;
> 
> col is not needed here, just pass 0 to vf610_nfc_run() and you should
> be good.
> 

Ok.

>>  	int stat;
>>
>> -	nand_read_page_op(chip, page, 0, buf, eccsize);
>> +	cmd2 |= NAND_CMD_READ0 << CMD_BYTE1_SHIFT;
>> +	code |= COMMAND_CMD_BYTE1;
>> +
>> +	code |= COMMAND_CAR_BYTE1;
>> +	code |= COMMAND_CAR_BYTE2;
>> +
>> +	row = ROW_ADDR(0, page & 0xff);
>> +	code |= COMMAND_RAR_BYTE1;
>> +	row |= ROW_ADDR(1, page >> 8);
>> +	code |= COMMAND_RAR_BYTE2;
>> +
>> +	if (chip->options & NAND_ROW_ADDR_3) {
>> +		row |= ROW_ADDR(2, page >> 16);
>> +		code |= COMMAND_RAR_BYTE3;
>> +	}
> 
> The address setting could be simplified a bit:
> 
> 	row = page;
> 	code |= COMMAND_CAR_BYTE1 | COMMAND_CAR_BYTE2 |
> 		COMMAND_RAR_BYTE1| COMMAND_RAR_BYTE2;
> 	if (chip->options & NAND_ROW_ADDR_3)
> 		code |= COMMAND_RAR_BYTE3;
> 

Agreed, and I will move that in a shared function since it is the same
for read/write.

>> +
>> +	cmd1 |= NAND_CMD_READSTART << CMD_BYTE2_SHIFT;
>> +	code |= COMMAND_CMD_BYTE2;
>> +
>> +	code |= COMMAND_RB_HANDSHAKE;
>> +	code |= COMMAND_READ_DATA;
>> +	cmd2 |= code << CMD_CODE_SHIFT;
>> +
>> +	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
>> +	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
>> +
>> +	vf610_nfc_memcpy(buf, nfc->regs + NFC_MAIN_AREA(0), mtd->writesize);
>>  	if (oob_required)
>> -		vf610_nfc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +		vf610_nfc_memcpy(chip->oob_poi,
>> +				 nfc->regs + NFC_MAIN_AREA(0) + mtd->writesize,
>> +				 mtd->oobsize);
>>
>>  	stat = vf610_nfc_correct_data(mtd, buf, chip->oob_poi, page);
> 
> You should disable ECC here and not in vf610_nfc_cmd():
> 
> 	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
> 
> 

Hm, but then we would have to also clear it at initialization time since
boot loader could have left it in any state. I somewhat prefer the
current state....

>>
>> @@ -564,16 +795,39 @@ static int vf610_nfc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>>  				const uint8_t *buf, int oob_required, int page)
>>  {
>>  	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
>> +	int trfr_sz = mtd->writesize + mtd->oobsize;
>> +	u32 col = 0, row = 0, cmd1 = 0, cmd2 = 0, code = 0;
>> +	int ret = 0;
>> +
>> +	cmd2 |= NAND_CMD_SEQIN << CMD_BYTE1_SHIFT;
>> +	code |= COMMAND_CMD_BYTE1;
>> +
>> +	code |= COMMAND_CAR_BYTE1;
>> +	code |= COMMAND_CAR_BYTE2;
>> +
>> +	row = ROW_ADDR(0, page & 0xff);
>> +	code |= COMMAND_RAR_BYTE1;
>> +	row |= ROW_ADDR(1, page >> 8);
>> +	code |= COMMAND_RAR_BYTE2;
>> +	if (chip->options & NAND_ROW_ADDR_3) {
>> +		row |= ROW_ADDR(2, page >> 16);
>> +		code |= COMMAND_RAR_BYTE3;
>> +	}
> 
> See my comment in _read_page().
> 
>>
>> -	nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
>> -	if (oob_required)
>> -		vf610_nfc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +	cmd1 |= NAND_CMD_PAGEPROG << CMD_BYTE2_SHIFT;
>> +	code |= COMMAND_CMD_BYTE2;
>> +
>> +	code |= COMMAND_WRITE_DATA;
>> +
>> +	vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0), buf, mtd->writesize);
>> +
>> +	code |= COMMAND_RB_HANDSHAKE;
>> +	cmd2 |= code << CMD_CODE_SHIFT;
>>
>> -	/* Always write whole page including OOB due to HW ECC */
>> -	nfc->use_hw_ecc = true;
>> -	nfc->write_sz = mtd->writesize + mtd->oobsize;
>> +	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
>> +	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
>>
>> -	return nand_prog_page_end_op(chip);
>> +	return ret;
>>  }
>>
>>  static const struct of_device_id vf610_nfc_dt_ids[] = {
>> @@ -686,6 +940,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>>  	chip->read_word = vf610_nfc_read_word;
>>  	chip->read_buf = vf610_nfc_read_buf;
>>  	chip->write_buf = vf610_nfc_write_buf;
>> +	chip->exec_op = vf610_nfc_exec_op;
>>  	chip->select_chip = vf610_nfc_select_chip;
>>  	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
>>  	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
> 
> That's all I have for now.
> 
> Regards,
> 
> Boris
> 
> [1]http://code.bulix.org/90iikz-278094

Thanks, and thanks for reviewing!

--
Stefan
