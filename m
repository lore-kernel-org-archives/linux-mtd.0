Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aubmr-0005Cx-IA
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 08:22:34 +0000
Date: Mon, 25 Apr 2016 10:22:11 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Daniel Walter <dwalter@sigma-star.at>
Subject: Re: Pass -EUCLEN to userspace?
Message-ID: <20160425082211.GC7860@pengutronix.de>
References: <20160420132516.GC31101@pengutronix.de>
 <20160422172456.7aaf301c@bbrezillon>
 <20160422172802.4fa830d1@bbrezillon> <571A47D3.6040602@nod.at>
 <20160425052857.GA7860@pengutronix.de>
 <20160425095034.697411aa@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160425095034.697411aa@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 25, 2016 at 09:50:34AM +0200, Boris Brezillon wrote:
> On Mon, 25 Apr 2016 07:28:57 +0200
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > On Fri, Apr 22, 2016 at 05:48:35PM +0200, Richard Weinberger wrote:
> > > Sascha, Boris,
> > > 
> > > Am 22.04.2016 um 17:28 schrieb Boris Brezillon:  
> > > >>> I am currently working on a program similar to ubihealthd, just for raw
> > > >>> mtd pages, not UBI. Basically I want to find out in userspace if my Nand needs
> > > >>> scrubbing. Is it possible somehow to get this information in userspace?  
> > > >>
> > > >> Actually we discussed that a year ago with Richard. I told him that we
> > > >> should put the read/write/erase statistics at the MTD level so that
> > > >> other MTD users (including userspace programs) could use the same infra
> > > >> for non-UBI partitions (I need that for the UBOOT and SPL partitions).
> > > >>
> > > >> My suggestion was to store those information at the MTD level, and let
> > > >> UBI implement its own scrubbing layer on top of that, but Richard
> > > >> decided to go for a simpler approach for its first implementation.  
> > > 
> > > Yeah, I did a first implementation on UBI layer as it had everything we need
> > > and I didn't want to replicate UBI at MTD level.
> > > Another reason is that we were not sure how sophisticated ubihealthd needs to be.
> > > 
> > > Sasha, what exactly is your use case and why is the UBI approach not sufficient for you?
> > > On Linux MTD access should only happen through UBI and UBOOT/SPL partitions stay untouched.  
> > 
> > On i.MX6 the Bootloader in Nand can indeed be redundant, so it's
> > possible to scrub the pages. This is exactly our usecase, we want to be
> > able to detect bitflips in the bootloader area.
> > Note that on i.MX6 the first page in the first n blocks on Nand contains
> > a structure called FCB (flash control block). This is not encoded with
> > the standard ECC algorithm used on the other areas in Nand. Reading
> > these pages will always return -EBABDMSG, they have to be read in raw
> > mode. That just to say that a "maximum bitflips per block" might not be
> > sufficient.
> 
> Okay, pretty much the same use-case we have on sunxi platforms: the SPL
> partition is written in raw mode because the page layout (in-band/ECC
> data disposition) is not the one we're using for the rest of the NAND.
> For this specific partition, I see 2 solutions that you can implement
> in userspace to count the number of bitflips:
> 
> 1/ read the partition page by page in raw mode and compare each
>    page to a reference file. This implies having a reference file stored
>    on your FS.
> 2/ if you know the ECC algorithm (and the platform specific config,
>    like the polynomial for a BCH engine) then you can create a tool
>    doing the ECC error detection in userspace.

I can do the ECC calculation for the FBCs in userspace, that's no
problem. I was referring to:

> Fair enough. So all we'll need is a way to retrieve the maximum number
> of bitflips for a given block

When a block contains both FCB and data protected with regular ECC in
other pages, an algorithm retrieving the maximum number of bitlfips for
a given block might stumble over the bad data in the page containing the
FCB. So I think we need the maximum number of bitflips per page, not per
block.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
