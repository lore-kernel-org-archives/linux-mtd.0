Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1egTdZ-0001cq-HN
 for linux-mtd@lists.infradead.org; Tue, 30 Jan 2018 10:59:43 +0000
Date: Tue, 30 Jan 2018 11:59:14 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Marek Vasut <marek.vasut@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Anthony
 Wong <anthony.wong@canonical.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 1/3] spi-nor: intel-spi: Prefer WREN over other write
 enables
Message-ID: <20180130115914.6d75009a@bbrezillon>
In-Reply-To: <20180130105013.GH27654@lahna.fi.intel.com>
References: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
 <20180130105013.GH27654@lahna.fi.intel.com>
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

On Tue, 30 Jan 2018 12:50:13 +0200
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> On Thu, Jan 04, 2018 at 12:07:42PM +0300, Mika Westerberg wrote:
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
> > Fix this by preferring WREN over other write enable preopcodes.
> > 
> > Fixes: 8c473dd61bb5 ("spi-nor: intel-spi: Don't assume OPMENU0/1 to be programmed by BIOS")
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: stable@vger.kernel.org  
> 
> Hi,
> 
> Any change getting these merged for v4.16?

It's a fix, so yes, I can queue it for -rc2. I just need Cyrille's ack.
