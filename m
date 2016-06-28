Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHx6D-0008CY-HD
 for linux-mtd@lists.infradead.org; Tue, 28 Jun 2016 17:47:02 +0000
Received: by mail-pa0-x241.google.com with SMTP id av7so2200427pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2016 10:46:41 -0700 (PDT)
Date: Tue, 28 Jun 2016 10:46:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] UBI: only read necessary size when reading the VID
 header
Message-ID: <20160628174638.GB80724@google.com>
References: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
 <1467118829.2456.40.camel@gmail.com>
 <20160628140500.GN20657@pengutronix.de>
 <1467125648.2456.57.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467125648.2456.57.camel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Jun 28, 2016 at 05:54:08PM +0300, Artem Bityutskiy wrote:
> On Tue, 2016-06-28 at 16:05 +0200, Sascha Hauer wrote:
> > The gpmi NAND driver allows reading subpages (NAND_SUBPAGE_READ is
> > set), but
> > it does not allow writing subpages (NAND_NO_SUBPAGE_WRITE is also
> > set).
> 
> OK. In the generic code (nand_base.c) though you can find that if the
> read request is for entire page or subpage, then the data is transfared
> from the chip to the supplied buffer, ECC is verified, and the data are
> returned. If the read request is for a fraction of a page or subpage,
> then the data are transferred from the chip to an internal buffer, ECC
> is verified, and then the required piece of data are copied from the
> internal buffer to the supplied buffer. I.e., more memory copy
> operations.
> 
> The code is very twisted, but I think the logic is in
> 'nand_do_read_ops()', you'll notice that in the "not aligned" case the
> special 'chip->buffers->databuf' is used, otherwise the buffer supplied
> by UBI is used.

Note that "not aligned" means "not aligned to mtd->writesize", and that
writesize is NOT the subpage size. So if some controller+flash+driver
actually supports subpage writes (there are few of these), then UBI
might already be requesting sub-page reads, and those reads are still
memcpy()'d in nand_do_read_ops(). This doesn't change the argument too
much, I suppose; it just means we have a bug in nand_do_read_ops() I
guess.

That's also beside the point for Sascha's case, if he's looking at
gpmi-nand (which does not support subpage writes).

Brian
