Date: Fri, 6 Feb 2015 00:33:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150206083345.GE4434@norris-Latitude-E6410>
References: <1422284164-16867-1-git-send-email-maxime.ripard@free-electrons.com>
 <1422284164-16867-2-git-send-email-maxime.ripard@free-electrons.com>
 <20150204111028.2f0bd376@bbrezillon>
 <20150206010835.GB30781@ld-irv-0074>
 <20150206091307.1162b123@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150206091307.1162b123@bbrezillon>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Rob Herring <robh@kernel.org>, Thomas Petazzoni <thomas@free-electrons.com>,
 Seif Mazareeb <seif@marvell.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Sudhakar Gundubogula <sudhakar@marvell.com>,
 Nadav Haklai <nadavh@marvell.com>, Boris Brezillon <boris@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 06, 2015 at 09:13:07AM +0100, Boris Brezillon wrote:
> Hi Brian,
> 
> On Thu, 5 Feb 2015 17:08:35 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> > On Wed, Feb 04, 2015 at 11:10:28AM +0100, Boris Brezillon wrote:
> > > On Mon, 26 Jan 2015 15:56:03 +0100
> > > Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
> > > > +			/*
> > > > +			 * According to the datasheet, when reading
> > > > +			 * from NDDB with BCH enabled, after each 32
> > > > +			 * bits reads, we have to make sure that the
> > > > +			 * NDSR.RDDREQ bit is set
> > > > +			 */
> > > 
> > > I know the datasheet says this bit should be checked after each
> > > transfer, but I wonder if we shouldn't check it before reading the data.
> > > What happens if you drain all the data available in the FIFO ? Is the
> > > controller still setting the RDDREQ bit ?
> > > 
> > > Moreover, the datasheet says this RDDREQ bit should be checked after
> > > each 32 bytes (not 32 bits) transfer.
> > > Testing it after each readl call shouldn't hurt though.
> > 
> > Seems like that could quite possibly kill performance unnecessarily,
> > couldn't it? But then, PIO is probably not that fast in the first
> > place...
> 
> Absolutety, my point was, it shouldn't hurt from a functional POV, but
> yes it will definitely impact performances.

OK.

> But that's not the first thing I would rework of if you're concerned
> about performances: when doing PIO read/write, the page read/write
> operations (I mean the part reading the internal fifo) are all done in
> interrupt context (called from pxa3xx_nand_irq), and doing this will
> prevent any other interrupt from taking place while you are
> draining/filling the FIFO :-(.

...which reminds me; the jiffies-based timeout in this patch isn't going
to work in interrupt context. So it needs to be replaced either with a
tight udelay() loop, or it needs to be moved out of the ISR.

> An alternative would be to move this part into the read/write_buf
> functions, but that's a lot of work...

Yeah, that probably would be preferable, but I suppose it's not urgent
either.

Brian
