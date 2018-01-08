Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYP3X-0006dv-VS
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 04:29:06 +0000
Date: Mon, 8 Jan 2018 06:28:48 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Bin Meng <bmeng.cn@gmail.com>, Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/3] spi-nor: intel-spi: Prefer WREN over other write
 enables
Message-ID: <20180108042848.GJ27654@lahna.fi.intel.com>
References: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
 <e5406b68-c283-cedc-74bf-80e8a1f4da1c@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5406b68-c283-cedc-74bf-80e8a1f4da1c@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 08, 2018 at 12:29:58AM +0100, Cyrille Pitchen wrote:
> Hi Mika,
> 
> Le 04/01/2018 à 10:07, Mika Westerberg a écrit :
> > On many older systems using SW sequencer the PREOP_OPTYPE register
> > contains two preopcodes as following:
> > 
> >   PREOP_OPTYPE=0xf2785006
> > 
> > The last two bytes are the opcodes decoded to:
> > 
> >   0x50 - Write enable for volatile status register
> >   0x06 - Write enable
> > 
> > The former is used to modify volatile bits in the status register. For
> > non-volatile bits the latter is needed. Preopcodes are used in SW
> > sequencer to send one command "atomically" without anything else
> > interfering the transfer. The sequence that gets executed is:
> > 
> >   - Send preopcode (write enable) from PREOP_OPTYPE register
> >   - Send the actual SPI command
> >   - Poll busy bit in the status register (0x05, RDSR)
> > 
> > Commit 8c473dd61bb5 ("spi-nor: intel-spi: Don't assume OPMENU0/1 to be
> > programmed by BIOS") enabled atomic sequence handling but because both
> > preopcodes are programmed, the following happens:
> > 
> >   if (preop >> 8)
> >   	val |= SSFSTS_CTL_SPOP;
> > 
> > Since on these systems preop >> 8 == 0x50 we end up picking volatile
> > write enable instead. Because of this the actual write command is pretty
> > much NOP unless there is a WREN latched in the chip already.
> >
> 
> I agree with you but doesn't it mean that the Sector/Block Erase command that should
> have been sent before the Page Program commands was discarded too?

Yes

> If so, the BIOS should not have been corrupted at all.

Correct and there was never any BIOS corruption.

> Honestly, I don't really understand what is the real root cause of the BIOS corruption
> reported by Ubuntu users. This is the issue your patch is trying to fix, isn't it?

No, this patch does not try to fix that issue because it has
already been fixed with 9d63f17661e2 ("spi-nor: intel-spi: Fix broken
software sequencing codes") in september.

The root cause is explained here:

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1734147/comments/330

To summarize. The BIOS programs all allowable opcodes to OPMENU0/1
registers and then locks them down. One of the opcodes was WRSR (Write
Status register) which is already against any recommendations
to have it there in the first place.

Nevertheless Linux clears the first status register when
SPI_NOR_HAS_LOCK is set for the serial flash. Because of the bug that
was fixed with 9d63f17661e2 we accidentally write an additional byte
from the FIFO (which is second byte of the JEDEC ID we just read) that
then goes to the second status register (because WRSR allows to write
all of them at once). If the second byte of the JEDEC ID happens to have
bit 6 set it means that now the serial flash CMP (complement) bit is
set. CMP=1 and BP0/1/2=0 means the whole flash is write protected.

The BIOS in question then cannot save settings anymore.

So the issue is actually not about any corruption but simply that the
chip is set to write protected from the status register.

Also note that it did not affect all the systems, mostly because of the
missing WREN handling. Normally the WRSR write would have been discarded
but if the BIOS before it handed of to the OS did WREN the write from
our WRSR took place and set the CMP bit to 1.

This is all fixable by software and in fact in the launcpad bug there
is another pre-built kernel image where we explictly clear both status
registers (it includes this patch) to make sure CMP is set back to 0.
That has recovered most of the affected systems AFAIK.

What this patch actually is about is to properly handle the WREN+WRSR
atomic sequence.

> Does the BIOS corruption occur just by probing the SPI controller and its SPI flash
> memory during the boot or does some userspace program is involved too?

See above.

> 
> > Fix this by preferring WREN over other write enable preopcodes.
> > 
> > Fixes: 8c473dd61bb5 ("spi-nor: intel-spi: Don't assume OPMENU0/1 to be programmed by BIOS")
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/mtd/spi-nor/intel-spi.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> > index ef034d898a23..bba762aa0c8d 100644
> > --- a/drivers/mtd/spi-nor/intel-spi.c
> > +++ b/drivers/mtd/spi-nor/intel-spi.c
> > @@ -498,9 +498,17 @@ static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, int len,
> >  	val |= SSFSTS_CTL_SCGO;
> >  	preop = readw(ispi->sregs + PREOP_OPTYPE);
> >  	if (preop) {
> > -		val |= SSFSTS_CTL_ACS;
> > -		if (preop >> 8)
> > -			val |= SSFSTS_CTL_SPOP;
> > +		switch (optype) {
> > +		case OPTYPE_WRITE_NO_ADDR:
> > +		case OPTYPE_WRITE_WITH_ADDR:
> > +			/*
> > +			 * For writes prefer WREN over other write enable
> > +			 * opcodes.
> > +			 */
> > +			val |= SSFSTS_CTL_ACS;
> > +			if ((preop >> 8) == SPINOR_OP_WREN)
> > +				val |= SSFSTS_CTL_SPOP;
> > +		}
> >  	}
> >  	writel(val, ispi->sregs + SSFSTS_CTL);
> >  
> > 
> 
> I guess I have figured out how the SPI controller works but just to be sure, what are
> SSFSTS_CTL_SPOP and SSFSTS_CTL_ACS used for?

_SPOP selects preopcode from two available (WREN and something else)

_ACS enables atomic sequence i.e execute preopcode + opcode + wait for
busy.

> Why before commit 8c473dd61bb5 ("spi-nor: intel-spi: Don't assume OPMENU0/1 to be
> programmed by BIOS") were they not used at all? Does it mean that before Bin's patch,
> when the controller was locked (by the BIOS?), the Linux driver never sent any Write Enable
> command as pre op code, hence the SPI flash memory was read-only?

Yes.

> Why is ispi->locked not tested inside intel_spi_sw_cycle() at the same time as the preop
> value? Do you try now to allow Page Program and Sector/Block Erase operations also when
> ispi->lock is true?

ispi->locked is never changed and it is not about write protection to
the serial flash but it means that certain controller registers (like
the OPMENU0/1) cannot be modified.
