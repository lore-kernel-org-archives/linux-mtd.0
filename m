Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOQPQ-0005Am-DH
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2012 09:27:13 +0000
Date: Sun, 29 Apr 2012 11:27:01 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 00/10] allow mxc_nand to be probed via device tree
Message-ID: <20120429092701.GS20039@pengutronix.de>
References: <20120423092240.GA18013@pengutronix.de>
 <1335615654.1937.20.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1335615654.1937.20.camel@koala>
Cc: devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

On Sat, Apr 28, 2012 at 03:20:54PM +0300, Artem Bityutskiy wrote:
> On Mon, 2012-04-23 at 11:22 +0200, Uwe Kleine-König wrote:
> > Hello,
> > 
> > this series aims to be able to probe mxc_nand devices via device tree.
> > Most of its patches reorganize the driver to only use cpu_is_mxYZ for
> > the case that the device is not probed via device tree.
> > 
> > I split this conversion in several patches to allow easier review. IMHO
> > it makes sense to keep this splitting for an eventual bisection.
> > 
> > This is tested on an i.MX27 based machine and works fine including
> > passing of partition data.
> 
> Applied all 11 patches from your git tree to l2-mtd.git. Note, you have
> one checkpatch.pl warning:
> 
> WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
> #69: FILE: drivers/mtd/nand/mxc_nand.c:274:
> +static const char *part_probes[] = { "RedBoot", "cmdlinepart", "ofpart", NULL };
I noticed that, too. This is not new though and as
mtd_device_parse_register takes a const char **types applying
checkpatch's advice would yield another warning. But probably fixing
both would work. I wouldn't address this as part of this series.

> Also there are still several sparse warnings, e.g.
> 
> +drivers/mtd/nand/mxc_nand.c:1249:26: warning: incorrect type in initializer (different modifiers) [sparse]
> +drivers/mtd/nand/mxc_nand.c:1249:26:    expected void *data [sparse]
> +drivers/mtd/nand/mxc_nand.c:1249:26:    got struct mxc_nand_devtype_data static const [toplevel] *<noident> [sparse]
> 
> And you added few gcc warnings, e.g.:
> 
> +drivers/mtd/nand/mxc_nand.c:1252:3: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
This is the same problem, i.e. casting away several consts. Hmm, and for
me neither gcc nor sparse provide that warning but I wonder why. At some
point I saw this warning, so I sent a patch:

http://mid.gmane.org/1335171381-24869-1-git-send-email-u.kleine-koenig@pengutronix.de

(I developed my series on top of that and rebased on linus/master for
posting.) Sparse only tells me:

	include/asm-generic/bitops/ffs.h:19:23: warning: right shift by bigger than source value

(using gcc 4.3.2 and sparse (from Debian) 0.4.3+20110419-1)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
