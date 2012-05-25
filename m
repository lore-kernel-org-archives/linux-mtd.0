Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXvyp-00073k-Bd
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 14:59:04 +0000
Date: Fri, 25 May 2012 16:59:01 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: [PATCH 1/2] mtd mxc_nand: use 32bit copy functions
Message-ID: <20120525145901.GS30400@pengutronix.de>
References: <1337955762-19157-1-git-send-email-s.hauer@pengutronix.de>
 <1337957902.30969.46.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1337957902.30969.46.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 25, 2012 at 05:58:22PM +0300, Artem Bityutskiy wrote:
> On Fri, 2012-05-25 at 16:22 +0200, Sascha Hauer wrote:
> > The following commit changes the function used to copy from/to
> > the hardware buffer to memcpy_[from|to]io. This does not work
> > since the hardware cannot handle the byte accesses used by these
> > functions. Instead of reverting this patch introduce 32bit
> > correspondents of these functions.
> 
> Could you please take a look at the checkpatch.pl updates?

Will do.

> 
> WARNING:LONG_LINE: line over 80 characters
> #103: FILE: drivers/mtd/nand/mxc_nand.c:276:
> +static void memcpy32_fromio(void *trg, const volatile void __iomem  *src, size_t size)
> 
> WARNING:VOLATILE: Use of volatile is usually wrong: see Documentation/volatile-considered-harmful.txt
> #103: FILE: drivers/mtd/nand/mxc_nand.c:276:
> +static void memcpy32_fromio(void *trg, const volatile void __iomem  *src, size_t size)

This makes me wonder a bit, I basically copied the prototype from
the _memcpy_*_io template from arch/arm/kernel/io.c. Should they
be wrong?
otoh I also wondered why there were volatiles in arch/arm/kernel/io.c
in the first place ;)

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
