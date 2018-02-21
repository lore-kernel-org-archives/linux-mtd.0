Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eoTZb-0007mw-VR
 for linux-mtd@lists.infradead.org; Wed, 21 Feb 2018 12:32:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Wed, 21 Feb 2018 13:32:24 +0100
From: Stefan Agner <stefan@agner.ch>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 marcel.ziswiler@toradex.com, richard@nod.at, bpringlemeir@gmail.com,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [RFC PATCH v3 2/3] mtd: nand: vf610_nfc: make use of ->exec_op()
In-Reply-To: <20180221110911.4fe46b8c@xps13>
References: <20180208235921.31840-1-stefan@agner.ch>
 <20180208235921.31840-3-stefan@agner.ch>
 <20180211115452.29cee45e@bbrezillon>
 <8898b2bd6b9b904f24b862d6df55ac40@agner.ch>
 <8898b2bd6b9b904f24b862d6df55ac40@agner.ch>
 <20180221081812.79e912a5@bbrezillon>
 <e5d20aa9a17caaa79a3618367f22637f@agner.ch> <20180221110911.4fe46b8c@xps13>
Message-ID: <20dbaf1ff98f3c09e07cba10703b3106@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21.02.2018 11:09, Miquel Raynal wrote:
> Hi Stefan,
> 
> 
>> >> >> +{
>> >> >> +	vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
>> >> >> +			    COL_ADDR_SHIFT, col);
>> >> >> +
>> >> >> +	vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
>> >> >> +			    ROW_ADDR_SHIFT, row);
>> >> >> +
>> >> >> +	vf610_nfc_write(nfc, NFC_SECTOR_SIZE, trfr_sz);
>> >> >> +	vf610_nfc_write(nfc, NFC_FLASH_CMD1, cmd1);
>> >> >> +	vf610_nfc_write(nfc, NFC_FLASH_CMD2, cmd2);
>> >> >> +
>> >> >> +	dev_dbg(nfc->dev, "col 0x%08x, row 0x%08x, cmd1 0x%08x, cmd2 0x%08x, trfr_sz %d\n",
>> >> >> +		col, row, cmd1, cmd2, trfr_sz);
>> >> >> +
>> >> >> +	vf610_nfc_done(nfc);
>> >> >> +}
>> >> >> +
>> >> >> +static inline const struct nand_op_instr *vf610_get_next_instr(
>> >> >> +	const struct nand_subop *subop, int *op_id)
>> >> >> +{
>> >> >> +	if (*op_id + 1 >= subop->ninstrs)
>> >> >> +		return NULL;
>> >> >> +
>> >> >> +	(*op_id)++;
>> >> >> +
>> >> >> +	return &subop->instrs[*op_id];
>> >> >> +}
>> >> >> +
>> >> >> +static int vf610_nfc_cmd(struct nand_chip *chip,
>> >> >> +				const struct nand_subop *subop)
>> >> >> +{
>> >> >> +	const struct nand_op_instr *instr;
>> >> >> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
>> >> >> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> >> >> +	int op_id = -1, addr = 0, trfr_sz = 0;
>> >> >> +	u32 col = 0, row = 0, cmd1 = 0, cmd2 = 0, code = 0;
>> >> >> +
>> >> >> +	/* Some ops are optional, but they need to be in order */
>> >> >> +	instr = vf610_get_next_instr(subop, &op_id);
>> >> >> +	if (!instr)
>> >> >> +		return -EINVAL;
>> >> >> +
>> >> >> +	if (instr && instr->type == NAND_OP_CMD_INSTR) {
>> >> >> +		dev_dbg(nfc->dev, "OP_CMD: code 0x%02x\n", instr->ctx.cmd.opcode);
>> >> >> +		cmd2 |= instr->ctx.cmd.opcode << CMD_BYTE1_SHIFT;
>> >> >> +		code |= COMMAND_CMD_BYTE1;
>> >> >> +
>> >> >> +		instr = vf610_get_next_instr(subop, &op_id);
>> >> >> +	}
>> >> >> +
>> >> >> +	if (instr && instr->type == NAND_OP_ADDR_INSTR) {
>> >> >> +
>> >> >
>> >> > Hm, you're still checking the sequencing consistency here. This should
>> >> > have been taken care by the core parser already, so really, this is not
>> >> > needed.
>> >> >
>> >>
>> >> Since those operations are optional, I have to check...
>> >
>> > Looks like my previous pastebin was not containing all the changes I
>> > wanted to share with you, so here is the full version [1].
>> >
>> > Hm, what do these checks add to the checks done in the parser? Even if
>> > all instructions are optional in your pattern the core parser still
>> > check that when they appear in the proper order. So, you can for
>> > example never have CMD1+CMD2+ADDR*5 passed to vf610_nfc_cmd().
>>
>> Sure...
>>
>> >
>> > The only exception I can think of is when you have DATA_OUT+CMD. In
>> > this case, you probably want to skip CMD_BYTE1 and use CMD_BYTE2
>> > directly, but that can easily be taken care of in the alternative
>> > implementation I proposed:
>> >
>> > 		if (instr->type == NAND_OP_DATA_OUT_INSTR) {
>> > 			/*
>> > 			 * If there was no CMD instruction before the
>> > 			 * DATA_OUT one, we must skip CMD_BYTE1 and use
>> > 			 * CMD_BYTE2 directly so that the CMD cycle is
>> > 			 * really placed after the DATA_OUT one.
>> > 			 */
>> > 			if (!ncmds)
>> > 				ncmds++;
>> > 			....
>> > 		}
>> >
>> >
>>
>> I fully understand, I do not have to enforce order since I can rely on
>> the order passed by the stack.
>>
>> It is also not what I am after. I just check which operation is going to
>> be next. Like your switch statement.
>>
>> I just see don't see a real advantage in using a for loop. It makes it
>> harder to read, since the order of operations will no more be obvious.
>> It makes this ncmd work around necessary.
> 
> Well, the aim of ->exec_op() was initially to get rid of the controller
> specificities and be free to implement new NAND operations without
> having to check every controller driver in the world, so doing it this
> way freezes the possibilities to a reduced set of operations (ie. what
> we do today). This is wrong from my point of view and I would really
> welcome a for-loop approach instead.

We can write a driver however we want, the hardware is still strictly
sequentially...

The current implementation should not restrict possible operations in
any way other than it is enforced by hardware anyway...

So the discussion is only about readability/style.

I will make a cleaned up v4 still sequentially and then we can compare
that to a for loop again to make a final decision.

--
Stefan


> 
> Thanks,
> Miquèl
> 
>>
>> Using a for loop just because we can? I haven't seen a convincing
>> argument so far.
>>
>>
