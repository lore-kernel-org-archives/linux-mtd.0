Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OiCio-0004PC-6L
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2010 20:43:55 +0000
Date: Sun, 8 Aug 2010 22:43:41 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 6/8] mxc_nand: fix correct_data function
Message-ID: <20100808204341.GA20065@pengutronix.de>
References: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
	<1281102791-8089-7-git-send-email-s.hauer@pengutronix.de>
	<20100808081955.GB8687@n2100.arm.linux.org.uk>
	<20100808083244.GC21128@jasper.tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100808083244.GC21128@jasper.tkos.co.il>
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	John Ogness <john.ogness@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 08, 2010 at 11:32:44AM +0300, Baruch Siach wrote:
> Hi Russell,
> 
> On Sun, Aug 08, 2010 at 09:19:56AM +0100, Russell King - ARM Linux wrote:
> > On Fri, Aug 06, 2010 at 03:53:09PM +0200, Sascha Hauer wrote:
> > > +		err = ecc_stat & ecc_bit_mask;
> > > +		if (err > err_limit) {
> > > +			printk(KERN_WARNING "UnCorrectable RS-ECC Error\n");
> > > +			return -1;
> > 
> > Someone's being lazy.
> 
> The code at nand_read_subpage() (drivers/mtd/nand/nand_base.c) expects the 
> .correct callback to return -1 on an uncorrectable error:
> 
>                 stat = chip->ecc.correct(mtd, p, &chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
>                 if (stat == -1)
>                         mtd->ecc_stats.failed++;
>                 else
>                         mtd->ecc_stats.corrected += stat;

Then this should be changed to check for stat < 0. I found some drivers
in the tree returning an errno value in their .correct function instead
of -1.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
