Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eobmY-0007IR-DH
 for linux-mtd@lists.infradead.org; Wed, 21 Feb 2018 21:18:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Wed, 21 Feb 2018 22:18:10 +0100
From: Stefan Agner <stefan@agner.ch>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v3 2/3] mtd: nand: vf610_nfc: make use of ->exec_op()
In-Reply-To: <20180221134659.511f2058@bbrezillon>
References: <20180208235921.31840-1-stefan@agner.ch>
 <20180208235921.31840-3-stefan@agner.ch>
 <20180211115452.29cee45e@bbrezillon>
 <8898b2bd6b9b904f24b862d6df55ac40@agner.ch>
 <20180221092821.42fa6b42@bbrezillon> <20180221093507.536f6917@bbrezillon>
 <426c92deb8fa26bfd7f14999804e335a@agner.ch>
 <20180221134659.511f2058@bbrezillon>
Message-ID: <d515783202437104a24a5218110a60ef@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21.02.2018 13:46, Boris Brezillon wrote:
> On Wed, 21 Feb 2018 13:24:14 +0100
> Stefan Agner <stefan@agner.ch> wrote:
> 
>> On 21.02.2018 09:35, Boris Brezillon wrote:
>> > On Wed, 21 Feb 2018 09:28:21 +0100
>> > Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>> >
>> >> On Wed, 21 Feb 2018 00:15:18 +0100
>> >> Stefan Agner <stefan@agner.ch> wrote:
>> >>
>> >> > >> +		}
>> >> > >> +
>> >> > >> +		row = ROW_ADDR(0, instr->ctx.addr.addrs[addr++]);
>> >> > >> +		code |= COMMAND_RAR_BYTE1;
>> >> > >> +		if (addr < instr->ctx.addr.naddrs) {
>> >> > >> +			row |= ROW_ADDR(1, instr->ctx.addr.addrs[addr++]);
>> >> > >> +			code |= COMMAND_RAR_BYTE2;
>> >> > >> +		}
>> >> > >> +		if (addr < instr->ctx.addr.naddrs) {
>> >> > >> +			row |= ROW_ADDR(2, instr->ctx.addr.addrs[addr++]);
>> >> > >> +			code |= COMMAND_RAR_BYTE3;
>> >> > >> +		}
>> >> > >> +
>> >> > >> +		dev_dbg(nfc->dev, "OP_ADDR: col %d, row %d\n", col, row);
>> >> > >> +
>> >> > >> +		instr = vf610_get_next_instr(subop, &op_id);
>> >> > >> +	}
>> >> > >> +
>> >> > >> +	if (instr && instr->type == NAND_OP_DATA_OUT_INSTR) {
>> >> > >> +		int len = nand_subop_get_data_len(subop, op_id);
>> >> > >> +		int offset = nand_subop_get_data_start_off(subop, op_id);
>> >> > >> +
>> >> > >> +		dev_dbg(nfc->dev, "OP_DATA_OUT: len %d, offset %d\n", len, offset);
>> >> > >> +
>> >> > >> +		vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + offset,
>> >> > >> +				 instr->ctx.data.buf.in + offset,
>> >> > >> +				 len);
>> >> > >
>> >> > > I think you have the same endianness problem you have for the READ
>> >> > > path. For example, I doubt SET_FEATURES will work properly if you're
>> >> > > in LE. So I repeat my initial suggestion: always do the byte swapping
>> >> > > when you're transfering data to/from the SRAM from vf610_nfc_cmd()
>> >> > > and use vf610_nfc_memcpy() only in the ->read/write_page()
>> >> > > implementations.
>> >> > >
>> >> >
>> >> > Hm, but doesn't that leads to wrong order of data when using e.g. raw
>> >> > read/write page...?
>> >>
>> >> Yep you'll have to implement ->{read,write}_{page,oob}[_raw](), but I
>> >> prefer that to having an ->exec_op() implementation that tries to guess
>> >> what the core is trying to do.
>> >>
>> >
>> > One more thing, in its current state the driver may fail to detect
>> > blocks marked bad by the manufacturer because of this endianness issue.
>> > That should work most of the time because manufacturers tend to fill
>> > the whole block with zeros when they want to mark it bad, but they're
>> > not required to do that.
>>
>> That sounds scary. I think bad block scan is done through oob reads
>> only. I guess if we only implement raw read/write and ecc read/write,
>> the stack will actually read OOB with proper ending when implemented as
>> you suggested.
> 
> Nope. Because BBM can be written by the NAND manufacturer (during
> production), and it's usually placed in the first byte (or first 2 bytes
> for 16-bit NANDs) of the OOB region. So let's assume you read the OOB
> region without taking care of endianness, on little-endian platforms
> you'll check the value of oob[4] (and oob[3] in case it's a 16-bit NAND)
> instead of oob[0] (and oob[1]).

Agreed.

But I think the stack normally uses scan_read_oob which subsequently
calls nand_read_oob_op. This will use regular exec_op and not the page
accessors, hence byte order should be fine...

> 
> Of course, this situation will not happen when Linux marks a block
> bad, because then, it's in control of what is written, and since
> endianness conversion is skipped in both read/write path we're good.
> 
> My intention was not to scare you, but this endianness issue is not
> something trivial to solve, and it would have been wiser to force
> all users of this controller (that includes bootrom, bootloaders, and
> and Linux) to do the cpu_to_be32() conversion when writing to/reading
> from the FIFO, 'cause know we're screwed.

Yes agreed... But too late for that now, at least not as a default
behavior.

--
Stefan
