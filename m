Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkZNa-0007b9-6e
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 11:28:50 +0000
Date: Fri, 29 Jun 2012 13:28:47 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: [PATCH 1/2] mtd mxc_nand: use 32bit copy functions
Message-ID: <20120629112847.GD12019@pengutronix.de>
References: <1337955762-19157-1-git-send-email-s.hauer@pengutronix.de>
 <20120627175234.GF18096@pengutronix.de>
 <1340969124.3070.155.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1340969124.3070.155.camel@sauron.fi.intel.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Fri, Jun 29, 2012 at 02:25:24PM +0300, Artem Bityutskiy wrote:
> On Wed, 2012-06-27 at 19:52 +0200, Uwe Kleine-König wrote:
> > I don't know about the sparse problems this introduces, but without this
> > patch the mxc-nand driver is broken, so it should really go in before
> > 3.5.
> 
> The problems, AFAIU, are that you cannot directly dereference __iomem
> pointers, you always need to use helpers like 'readl()'. This patch
> introduces the following warnings:
> 
> +drivers/mtd/nand/mxc_nand.c:281:33: warning: incorrect type in initializer (different address spaces) [sparse]
> +drivers/mtd/nand/mxc_nand.c:281:33:    expected unsigned int const volatile [usertype] *s [sparse]
> +drivers/mtd/nand/mxc_nand.c:281:33:    got void const volatile [noderef] <asn:2>*src [sparse]
> +drivers/mtd/nand/mxc_nand.c:284 memcpy32_fromio() warn: side effect in macro '__raw_readl' doing 's++' [smatch]
> +drivers/mtd/nand/mxc_nand.c:284:24: warning: incorrect type in argument 1 (different address spaces) [sparse]
> +drivers/mtd/nand/mxc_nand.c:284:24:    expected void const volatile [noderef] <asn:2>*<noident> [sparse]
> +drivers/mtd/nand/mxc_nand.c:284:24:    got unsigned int const volatile [usertype] * [sparse]
> +drivers/mtd/nand/mxc_nand.c:290:27: warning: incorrect type in initializer (different address spaces) [sparse]
> +drivers/mtd/nand/mxc_nand.c:290:27:    expected unsigned int volatile [usertype] *t [sparse]
> +drivers/mtd/nand/mxc_nand.c:290:27:    got void volatile [noderef] <asn:2>*trg [sparse]
> +drivers/mtd/nand/mxc_nand.c:294 memcpy32_toio() warn: side effect in macro '__raw_writel' doing 't++' [smatch]
> +drivers/mtd/nand/mxc_nand.c:294:17: warning: incorrect type in argument 1 (different address spaces) [sparse]
> +drivers/mtd/nand/mxc_nand.c:294:17:    expected void const volatile [noderef] <asn:2>*<noident> [sparse]
> +drivers/mtd/nand/mxc_nand.c:294:17:    got unsigned int volatile [usertype] * [sparse]
> 
> The "volitile" should be also removed.
Did you see that Sascha posted a v2?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
