Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bK4JB-00019R-Ky
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 13:53:10 +0000
Date: Mon, 4 Jul 2016 15:52:37 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org, Richard Weinberger
 <richard@nod.at>
Subject: Re: [PATCH v2] UBI: only read necessary size when reading the VID
 header
Message-ID: <20160704155237.2c05e72f@bbrezillon>
In-Reply-To: <20160628174638.GB80724@google.com>
References: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
 <1467118829.2456.40.camel@gmail.com>
 <20160628140500.GN20657@pengutronix.de>
 <1467125648.2456.57.camel@gmail.com>
 <20160628174638.GB80724@google.com>
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

On Tue, 28 Jun 2016 10:46:38 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi,
> 
> On Tue, Jun 28, 2016 at 05:54:08PM +0300, Artem Bityutskiy wrote:
> > On Tue, 2016-06-28 at 16:05 +0200, Sascha Hauer wrote:  
> > > The gpmi NAND driver allows reading subpages (NAND_SUBPAGE_READ is
> > > set), but
> > > it does not allow writing subpages (NAND_NO_SUBPAGE_WRITE is also
> > > set).  
> > 
> > OK. In the generic code (nand_base.c) though you can find that if the
> > read request is for entire page or subpage, then the data is transfared
> > from the chip to the supplied buffer, ECC is verified, and the data are
> > returned. If the read request is for a fraction of a page or subpage,
> > then the data are transferred from the chip to an internal buffer, ECC
> > is verified, and then the required piece of data are copied from the
> > internal buffer to the supplied buffer. I.e., more memory copy
> > operations.
> > 
> > The code is very twisted, but I think the logic is in
> > 'nand_do_read_ops()', you'll notice that in the "not aligned" case the
> > special 'chip->buffers->databuf' is used, otherwise the buffer supplied
> > by UBI is used.  
> 
> Note that "not aligned" means "not aligned to mtd->writesize", and that
> writesize is NOT the subpage size. So if some controller+flash+driver
> actually supports subpage writes (there are few of these), then UBI
> might already be requesting sub-page reads, and those reads are still
> memcpy()'d in nand_do_read_ops(). This doesn't change the argument too
> much, I suppose; it just means we have a bug in nand_do_read_ops() I
> guess.

Is this really a bug, or just a sub-optimal implementation?
