Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LWcEv-00012a-1w
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 19:56:34 +0000
Date: Mon, 9 Feb 2009 19:56:20 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: hartleys <hartleys@visionengravers.com>
Subject: Re: [PATCH] [MTD] NAND: add ts7xxx driver
Message-ID: <20090209195619.GZ11872@woodchuck>
References: <20090208085919.GD11872@woodchuck>
	<BD79186B4FD85F4B8E60E381CAEE19090120BFB5@mi8nycmail19.Mi8.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19090120BFB5@mi8nycmail19.Mi8.com>
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

* hartleys <hartleys@visionengravers.com> [2009-02-09 14:00:48-0500]:
> 
> Sunday, February 08, 2009 1:59 AM, Alexander Clouter wrote:
>
> > This patch adds support for the NAND found in Technologic
> > Systems ARM boards[1].  The platform specific parts (IO 
> > address and parititoning schemes) have been moved into
> > platform specific files whilst the driver it's self can 
> > be used as a complete replacement for the ts7250 NAND
> > driver.
>
> I think the TS-7800 series is Marvell 88F5182 based but the TS-7200
> series is Cirrus ep93xx based.
>
> There is are already a nand driver for each of these, orion_nand.c and
> ts7250.c.  Both appear to be just variations of the plat_nand.c driver.
> 
You would have hoped TS would use the NAND silicon already on the 
Marvell chip, but no they decided to use up FPGA LUT's to re-invent the 
wheel; although I do think their just pulled over the FPGA bitstream 
they were using in the TS-7200 series.

Cheers

-- 
Alexander Clouter
.sigmonster says: Lonely is a man without love.
                  		-- Englebert Humperdinck
