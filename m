Received: from cmailg1.svr.pol.co.uk ([195.92.195.171])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tuLO-0001TB-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 19:23:34 +0100
Message-ID: <012801c263f7$784e6230$0100a8c0@p450>
From: "Nick Bane" <nick@cecomputing.co.uk>
To: "Marc Singer" <elf@buici.com>
Cc: <linux-mtd@lists.infradead.org>,
	<yaffs@toby-churchill.org>
References: <200209231220.12682.ayalon@tadlys.com> <20020924014556.6EC8B43F2@tiger.actrix.co.nz> <20020924034410.GA18915@buici.com> <20020924040150.A1499145FF@dragon.actrix.co.nz> <007801c2639b$3a4bc4c0$0100a8c0@p450> <20020924165521.GB2533@buici.com>
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
Date: Tue, 24 Sep 2002 19:23:24 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> On Tue, Sep 24, 2002 at 08:23:06AM +0100, Nick Bane wrote:
> > The modifications I made to bootldr (CRL bootloader as used in iPaq
> > handhelds) were trivial after mkysffsimage was fixed (ask for a copy as
the
> > CVS one is still badly broken).
> >
> > Bootldr copies the data 512+16 bytes at a time into non-broken NAND. The
> > kernel is then booted with prior knowledge as to where to find the YAFFS
> > data and all is ok.
>
> What is non-broken NAND?
>
NAND is not guarranteed 100% working. Individual pages may break. This
renders the whole erase block (a collection of pages) unusable. The
tradition is to mark the block as broken by clearing more than one bit in
certain bytes of the oob (spare) data on each page. Non-broken NAND is where
this oob data is marked as valid - typically 0xff.

> > How this works with DOC I am unclear as I had noticed a while back that
> > there was hardware assisted ECC. This might get in the way of YAFFS ECC
but
> > maybe this can be circumvented.
>
> As far as I can tell, the hardware ECC just makes the DOC faster.
Umm. It may use some of the oob data area for its own ECC in a YAFFS
incompatible way. I am not sure of my ground here, only that you need to
check it out.

> Also, I think that Microsys has released information about how to use
> the hardware ECC.
>
Ok.

Nick

>
