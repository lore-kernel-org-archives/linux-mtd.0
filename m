Received: from cmailg1.svr.pol.co.uk ([195.92.195.171])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tk19-0000MA-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 08:21:59 +0100
Message-ID: <007801c2639b$3a4bc4c0$0100a8c0@p450>
From: "Nick Bane" <nick@cecomputing.co.uk>
To: "Marc Singer" <elf@buici.com>
Cc: <linux-mtd@lists.infradead.org>,
	<yaffs@toby-churchill.org>
References: <200209231220.12682.ayalon@tadlys.com> <20020924014556.6EC8B43F2@tiger.actrix.co.nz> <20020924034410.GA18915@buici.com> <20020924040150.A1499145FF@dragon.actrix.co.nz>
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
Date: Tue, 24 Sep 2002 08:23:06 +0100
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

The modifications I made to bootldr (CRL bootloader as used in iPaq
handhelds) were trivial after mkysffsimage was fixed (ask for a copy as the
CVS one is still badly broken).

Bootldr copies the data 512+16 bytes at a time into non-broken NAND. The
kernel is then booted with prior knowledge as to where to find the YAFFS
data and all is ok.

How this works with DOC I am unclear as I had noticed a while back that
there was hardware assisted ECC. This might get in the way of YAFFS ECC but
maybe this can be circumvented.

Nick Bane

----- Original Message -----
From: "Charles Manning" <manningc2@actrix.gen.nz>
To: "Marc Singer" <elf@buici.com>
Cc: <linux-mtd@lists.infradead.org>; <yaffs@toby-churchill.org>
Sent: Tuesday, September 24, 2002 4:58 AM
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading


> On Tue, 24 Sep 2002 15:44, Marc Singer wrote:
> > On Tue, Sep 24, 2002 at 12:03:45PM +1200, Charles Manning wrote:
> > > Hi
> > >
> > > I'm considering getting YAFFS working on DOC. I'm trying to gauge
> > > interest to prioritise vs other things.
> > >
> > > If you don't know what YAFFS is, it's a NAND-specific journalling
> > > file system. Ask Google for more info.
> > >
> > > Currently YAFFS works with raw NAND (using software ecc), though
> > > some people have patched it to use hardware ecc, so I figure DOC
> > > support should be relatively simple.
> >
> > Do you know how it boots?  Does grub support it?
>
> By "it" I assume you mean YAFFS.
>
> Doing a yaffs-specific bootloader is pretty simple. We have discussed the
> general approach  on the YAFFS list before. At least two people have done
> yaffs bootloaders. One of these might be rolled in with grub. Maybe
someone
> else on the yaffs list can answer that.
>
>
> --------------------------------------------------------------------------
-------------
> This mailing list is hosted by Toby Churchill open software
(www.toby-churchill.org).
> If mailing list membership is no longer wanted you can remove yourself
from the list by
> sending an email to yaffs-request@toby-churchill.org with the text
"unsubscribe"
> (without the quotes) as the subject.
>
>
