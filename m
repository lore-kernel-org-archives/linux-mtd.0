Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auZ5G-0006i2-HZ
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 05:29:23 +0000
Date: Mon, 25 Apr 2016 07:28:57 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Daniel Walter <dwalter@sigma-star.at>
Subject: Re: Pass -EUCLEN to userspace?
Message-ID: <20160425052857.GA7860@pengutronix.de>
References: <20160420132516.GC31101@pengutronix.de>
 <20160422172456.7aaf301c@bbrezillon>
 <20160422172802.4fa830d1@bbrezillon> <571A47D3.6040602@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571A47D3.6040602@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 22, 2016 at 05:48:35PM +0200, Richard Weinberger wrote:
> Sascha, Boris,
> 
> Am 22.04.2016 um 17:28 schrieb Boris Brezillon:
> >>> I am currently working on a program similar to ubihealthd, just for raw
> >>> mtd pages, not UBI. Basically I want to find out in userspace if my Nand needs
> >>> scrubbing. Is it possible somehow to get this information in userspace?
> >>
> >> Actually we discussed that a year ago with Richard. I told him that we
> >> should put the read/write/erase statistics at the MTD level so that
> >> other MTD users (including userspace programs) could use the same infra
> >> for non-UBI partitions (I need that for the UBOOT and SPL partitions).
> >>
> >> My suggestion was to store those information at the MTD level, and let
> >> UBI implement its own scrubbing layer on top of that, but Richard
> >> decided to go for a simpler approach for its first implementation.
> 
> Yeah, I did a first implementation on UBI layer as it had everything we need
> and I didn't want to replicate UBI at MTD level.
> Another reason is that we were not sure how sophisticated ubihealthd needs to be.
> 
> Sasha, what exactly is your use case and why is the UBI approach not sufficient for you?
> On Linux MTD access should only happen through UBI and UBOOT/SPL partitions stay untouched.

On i.MX6 the Bootloader in Nand can indeed be redundant, so it's
possible to scrub the pages. This is exactly our usecase, we want to be
able to detect bitflips in the bootloader area.
Note that on i.MX6 the first page in the first n blocks on Nand contains
a structure called FCB (flash control block). This is not encoded with
the standard ECC algorithm used on the other areas in Nand. Reading
these pages will always return -EBABDMSG, they have to be read in raw
mode. That just to say that a "maximum bitflips per block" might not be
sufficient.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
