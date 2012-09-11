Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBM7g-0008Rq-P4
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 08:47:09 +0000
Date: Tue, 11 Sep 2012 10:47:03 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: =?iso-8859-15?Q?Ga=EBtan?= Carlier <gcembed@gmail.com>
Subject: Re: [PATCH 1/1] mxc_nand : allow swapping the Bad block Indicator
 for NFC v1.
Message-ID: <20120911084703.GO18243@pengutronix.de>
References: <1345811288.2848.308.camel@sauron.fi.intel.com>
 <1345825064-9147-1-git-send-email-gcembed@gmail.com>
 <201209061056.12386.jbe@pengutronix.de>
 <504DF9BB.8050509@gmail.com>
 <20120911071715.GB18243@pengutronix.de>
 <504EF035.2090508@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <504EF035.2090508@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, J.Lambrecht@televic.com,
 Juergen Beisert <jbe@pengutronix.de>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 11, 2012 at 10:03:01AM +0200, Gaëtan Carlier wrote:
> >>The point is not the necessity of swapping bytes if factory bad
> >>block markers are not used.
> >>In my case, the bytes must be swapped because all previous
> >>operations on flash swapped these bytes :
> >>* Flashes redboot (bootloader) via JTAG using OpenOCD which swaps bytes;
> >>* Writes kernel and rootfs via TFTP using redboot which swaps bytes;
> >>So to be able to read rootfs partition, mxc-nand driver have to swap
> >>bytes otherwise, JFFS2 detects error on partition and is unable to
> >>mount it.
> >
> >I am all in favour to be able to swap the factory bad block marker with
> >the position the mtd framework expects it.
> >
> >That according to our understanding are bytes 0x7d0 in the main area
> >and byte 0x0 in the spare area.
> >
> >>
> >>I have not chosen to swap these bytes. In a training, I received
> >>redboot and kernel 2.6.22 with set of patches to support i.MX27 and
> >>these patches included swap of bytes in nand driver. So I start my
> >>development with this workaround and it is now impossible to get
> >>back because boards are already in production.
> >
> >So you are swapping the factory bad block marker with some position
> >where the mtd layer does not expect the bad block marker. With this
> >you preserve the factor bad block marker, but do not use it to detect
> >bad blocks.
> The factor bad block marker are used by redboot. I don't know how
> kernel handles them.

This depends on chip->badblockpos. Normally this defaults to
NAND_LARGE_BADBLOCK_POS for 2k nands. This would be the first oob byte.

So you would have to swap the factory bad block marker with some other
oob byte, but you would also have to make sure that you set
chip->badblockpos to the location you swap with.

One BIG problem is that I've seen multiple variants of this patch, for
example one variant I've seen swaps with oob byte 5 or 6 (the standard
badblock marker for 512byte page nands). So you would not only have
to put a 'bool swap' into platformdata, but also the information with
which byte to swap.

This is all very annoying, because the swap location (or no swap at all)
is specific to a single board, *not* to a board type. This makes this
information unsuitable for platform_data (For example someone might
use redboot on some board which swaps the bad block marker, some other
persion might use another bootloader which does not swap on the very
same board type). The only sane solution would be to store this
information inside the flash chip itself.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
