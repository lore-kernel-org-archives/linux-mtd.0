Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LWZZd-0007Gi-4h
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 17:05:36 +0000
Date: Mon, 9 Feb 2009 17:05:25 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: hartleys <hartleys@visionengravers.com>
Subject: Re: [PATCH] [MTD] NAND: add ts7xxx driver
Message-ID: <20090209170525.GX11872@woodchuck>
References: <20090208085919.GD11872@woodchuck>
	<BD79186B4FD85F4B8E60E381CAEE19090120BF36@mi8nycmail19.Mi8.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19090120BF36@mi8nycmail19.Mi8.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

* hartleys <hartleys@visionengravers.com> [2009-02-09 11:56:25-0500]:
> 
> Sunday, February 08, 2009 1:59 AM, Alexander Clouter wrote:
> >
> > This patch adds support for the NAND found in Technologic
> > Systems ARM boards[1].  The platform specific parts (IO 
> > address and parititoning schemes) have been moved into
> > platform specific files whilst the driver it's self can
> > be used as a complete replacement for the ts7250 NAND driver.
> >
> > [1] http://www.embeddedarm.com/products/arm-sbc.php
> 
> With a little work the generic plat_nand driver could probably be used
> instead of this new driver or the original ts7250 driver.
>
I was always curious if that was the way to go, but as there were more 
than one platform (TS-7800 and TS-72X0) I thought it would spare the 
duplication of code in the kernel; as the code between the two platforms 
is really just in the HW ECC and soon-one-day-maybe DMA support in the 
TS-7800.
 
> The only thing special about the original ts7250 driver appears to be
> the fall-back partitioning scheme that uses the size of the device to
> figure out what static mtd_partition table to use.
> 
I would have not really put too much effort in that if I was going for a 
TS-7800 only (plat_nand based driver) as it would have not been worth 
it.  It was only useless in the case of the TS-72X0 as it comes with 
several different NAND sizes, unlike currently the TS-7800 which only 
has the one.

> This driver uses a similar approach but passes a callback to the
> platform driver to use instead.  It also adds some conditional ecc
> support.
> 
> It might be more useful to create a generic patch for plat_nand that
> adds this functionality and then obsolete the old ts7250 driver.
> 
Well, from a practical level it would make mainlining the code much 
easier as it would lurk in the TS-7800 platform code and no one would 
care other than me.  The downside is the duplication of code surely, 
well I guess the duplicate code is really already in the plat_nand 
driver anyway?

> I have been using the plat_nand driver on a custom ep93xx based board
> for quite a while with no problems.
> 
If you think it's better to go with the plat_nand driver than I'll go 
for it, I would be interested in seeing your one if you can send me a 
copy?

I guess there would be no code duplication really, shame, I was quite 
proud of the parititoning code :)

Cheers

-- 
Alexander Clouter
.sigmonster says: Money cannot buy love, nor even friendship.
