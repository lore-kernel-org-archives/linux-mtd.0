Received: from nwd2mail11.analog.com ([137.71.25.57])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IW5WU-0005xs-EL
	for linux-mtd@lists.infradead.org; Fri, 14 Sep 2007 03:23:35 -0400
Subject: Re: [PATCH] Blackfin BF54x NAND Flash Controller driver
From: Bryan Wu <bryan.wu@analog.com>
To: Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20070913013702.d446739a.akpm@linux-foundation.org>
References: <1188804323.29566.6.camel@roc-laptop>
	<20070913013702.d446739a.akpm@linux-foundation.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Sep 2007 15:19:41 +0800
Message-Id: <1189754381.8165.11.camel@roc-desktop>
Mime-Version: 1.0
Cc: bryan.wu@analog.com, linux-mtd@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: bryan.wu@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-09-13 at 01:37 -0700, Andrew Morton wrote:
> On Mon, 03 Sep 2007 15:25:23 +0800 Bryan Wu <bryan.wu@analog.com>
> wrote:
> 
> > This is the driver for latest Blackfin BF54x nand flash controller
> > 
> >  - use nand_chip and mtd_info common nand driver interface
> >  - provide both PIO and dma operation
> >  - compiled with ezkit bf548 configuration
> >  - use hardware 1-bit ECC
> >  - tested with YAFFS2 and can mount YAFFS2 filesystem as rootfs
> > 
> > ...
> >
> > +int hardware_ecc = 0;
> 
> scripts/checkpatch.pl, please.
> 
Things are fixed in the try#3 version of the driver, which will be sent
out soon.

> > +#endif
> > +
> > +unsigned short bfin_nfc_pin_req[] = {P_NAND_CE, P_NAND_RB, 0};
> 
> static.  Please review whole patch for this.
> 
[!snip!]

> > +
> > +/*
> > + * bf54x_nand_probe
> > + *
> > + * called by device layer when it finds a device matching
> > + * one our driver can handled. This code checks to see if
> > + * it can allocate all necessary resources then calls the
> > + * nand layer to look for devices
> > + */
> > +static int bf54x_nand_probe(struct platform_device *pdev)
> > +{
> > +	struct bf54x_nand_platform *plat = to_nand_plat(pdev);
> > +	struct bf54x_nand_info *info = NULL;
> > +	struct nand_chip *chip = NULL;
> > +	struct mtd_info *mtd = NULL;
> > +	int err = 0;
> > +
> > +	dev_dbg(&pdev->dev, "(%p)\n", pdev);
> > +
> > +	if (!plat) {
> > +		dev_err(&pdev->dev, "no platform specific information\n");
> > +		goto exit_error;
> 
> and can this?
> 

Try to prevent board configuration missing the bf54x_nand_platform
information.

> > +	}
> > +
> > +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> > +	if (info == NULL) {
> > +		dev_err(&pdev->dev, "no memory for flash info\n");
> > +		err = -ENOMEM;
> > +		goto exit_error;
> > +	}


Thanks
-Bryan Wu
