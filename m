Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eomwo-00047f-Ge
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 09:13:52 +0000
Date: Thu, 22 Feb 2018 10:13:38 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v3 2/3] mtd: nand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180222101338.18fd50be@bbrezillon>
In-Reply-To: <79473f4eb2e73ff4b68265e5f0278697@agner.ch>
References: <20180208235921.31840-1-stefan@agner.ch>
 <20180208235921.31840-3-stefan@agner.ch>
 <20180211115452.29cee45e@bbrezillon>
 <8898b2bd6b9b904f24b862d6df55ac40@agner.ch>
 <20180221092821.42fa6b42@bbrezillon>
 <79473f4eb2e73ff4b68265e5f0278697@agner.ch>
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

On Thu, 22 Feb 2018 00:23:15 +0100
Stefan Agner <stefan@agner.ch> wrote:

> On 21.02.2018 09:28, Boris Brezillon wrote:
> > On Wed, 21 Feb 2018 00:15:18 +0100
> > Stefan Agner <stefan@agner.ch> wrote:
> >   
> >> >> +		}
> >> >> +
> >> >> +		row = ROW_ADDR(0, instr->ctx.addr.addrs[addr++]);
> >> >> +		code |= COMMAND_RAR_BYTE1;
> >> >> +		if (addr < instr->ctx.addr.naddrs) {
> >> >> +			row |= ROW_ADDR(1, instr->ctx.addr.addrs[addr++]);
> >> >> +			code |= COMMAND_RAR_BYTE2;
> >> >> +		}
> >> >> +		if (addr < instr->ctx.addr.naddrs) {
> >> >> +			row |= ROW_ADDR(2, instr->ctx.addr.addrs[addr++]);
> >> >> +			code |= COMMAND_RAR_BYTE3;
> >> >> +		}
> >> >> +
> >> >> +		dev_dbg(nfc->dev, "OP_ADDR: col %d, row %d\n", col, row);
> >> >> +
> >> >> +		instr = vf610_get_next_instr(subop, &op_id);
> >> >> +	}
> >> >> +
> >> >> +	if (instr && instr->type == NAND_OP_DATA_OUT_INSTR) {
> >> >> +		int len = nand_subop_get_data_len(subop, op_id);
> >> >> +		int offset = nand_subop_get_data_start_off(subop, op_id);
> >> >> +
> >> >> +		dev_dbg(nfc->dev, "OP_DATA_OUT: len %d, offset %d\n", len, offset);
> >> >> +
> >> >> +		vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + offset,
> >> >> +				 instr->ctx.data.buf.in + offset,
> >> >> +				 len);  
> >> >
> >> > I think you have the same endianness problem you have for the READ
> >> > path. For example, I doubt SET_FEATURES will work properly if you're
> >> > in LE. So I repeat my initial suggestion: always do the byte swapping
> >> > when you're transfering data to/from the SRAM from vf610_nfc_cmd()
> >> > and use vf610_nfc_memcpy() only in the ->read/write_page()
> >> > implementations.
> >> >  
> >>
> >> Hm, but doesn't that leads to wrong order of data when using e.g. raw
> >> read/write page...?  
> > 
> > Yep you'll have to implement ->{read,write}_{page,oob}[_raw](), but I
> > prefer that to having an ->exec_op() implementation that tries to guess
> > what the core is trying to do.  
> 
> Have implemented those callbacks and the driver mounts UBI just fine.
> However, when trying to use the NAND tests this currently fails:
> 
> [   27.458447] =================================================
> [   27.464427] mtd_oobtest: MTD device: 3
> [   27.481006] mtd_oobtest: MTD device size 16777216, eraseblock size
> 131072, page size 2048, count of eraseblocks 128, pages per eraseblock
> 64, OOB size 64
> [   27.495154] mtd_test: scanning for bad eraseblocks
> [   27.500002] mtd_test: block 12 is bad
> [   27.505482] mtd_test: scanned 128 eraseblocks, 1 are bad
> [   27.510940] mtd_oobtest: test 1 of 5
> [   27.587528] mtd_oobtest: writing OOBs of whole device
> [   27.593113] mtd_oobtest: error: writeoob failed at 0x0
> [   27.598274] mtd_oobtest: error: use_len 2, use_offset 0
> [   27.605190] mtd_oobtest: error -5 occurred
> [   27.609320] =================================================
> insmod: ERROR: could not insert module mtd_oobtest.ko: Input/output
> error
> root@colibri-vf:~# insmod mtd_nandbiterrs.ko dev=3
> [   30.075103]
> [   30.076653] ==================================================
> [   30.082770] mtd_nandbiterrs: MTD device: 3
> [   30.100602] mtd_nandbiterrs: MTD device size 16777216,
> eraseblock=131072, page=2048, oob=64
> [   30.109019] mtd_nandbiterrs: Device uses 1 subpages of 2048 bytes
> [   30.115260] mtd_nandbiterrs: Using page=0, offset=0, eraseblock=0
> [   30.123679] mtd_nandbiterrs: incremental biterrors test
> [   30.129080] mtd_nandbiterrs: write_page
> [   30.134474] mtd_nandbiterrs: rewrite page
> [   30.138702] mtd_nandbiterrs: error: write_oob failed (-5)
> 
> 
> I did overwrite ->{read,write}_{page,oob}[_raw]() and set ->page_access
> in all of those, but still...
> 
> Do you have an idea what that could be? Otherwise will have to look
> closer what might cause this.

Look like your ->write_oob() method is returning -EIO, but I can't help
you without the code. Can you push it on a public git repo?


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
