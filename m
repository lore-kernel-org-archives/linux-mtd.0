Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YmdoX-0002tS-JD
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2015 07:50:50 +0000
Date: Mon, 27 Apr 2015 09:50:23 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 2/4] mtd: mxc_nand: limit the size of used oob
Message-ID: <20150427075023.GF19431@pengutronix.de>
References: <cover.1430034929.git.baruch@tkos.co.il>
 <4bd5da1f7d57aa32c5682297f7aa0c768e8c6e49.1430034929.git.baruch@tkos.co.il>
 <20150426200725.GC19431@pengutronix.de>
 <20150427043906.GR2258@tarshish>
 <20150427071238.GE19431@pengutronix.de>
 <20150427072057.GT2258@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150427072057.GT2258@tarshish>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <sha@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Baruch,

On Mon, Apr 27, 2015 at 10:20:57AM +0300, Baruch Siach wrote:
> On Mon, Apr 27, 2015 at 09:12:38AM +0200, Uwe Kleine-König wrote:
> > On Mon, Apr 27, 2015 at 07:39:06AM +0300, Baruch Siach wrote:
> > > On Sun, Apr 26, 2015 at 10:07:25PM +0200, Uwe Kleine-König wrote:
> > > > On Sun, Apr 26, 2015 at 11:16:49AM +0300, Baruch Siach wrote:
> > > > > +	/* hardware can only use 218 or 128 oob bytes for ecc */
> > > > > +	if (mtd->oobsize >= 218)
> > > > IMHO this is the wrong check. What if your part (with 224 bytes spare)
> > > > is used but the machine only uses the small layout e.g. for booting?
> > > > (That would work, wouldn't it?)
> > > 
> > > Yes, but how would I know? I am following here the assumption of get_eccsize() 
> > > that enables 8 bit ECC when there is enough oobsize.
> > Hmm I rechecked the reference manual and found a register to specify the
> > size of the spare area (I didn't notice that one before). Did you try
> > what happens if you set this to 0x70 for 224 bytes oob?
> 
> Which register is that?
Spare Area Size Register (SPAS) at offset 0x1e10 for the i.MX25 (that's
what you're using, don't you?).
 
> > Optimally this would result in the last 6 bytes being written but not 
> > protected by hardware ecc.
> 
> Last 6 bytes of what? AFAIK, hardware ECC does not protect oob at all.
I thought it did, might be wrong here.

> > > > Moreover the comment is misleading as it
> > > > only applies to 4K flashes. At least the driver works well with (2ki +
> > > > 128) bytes pages (while there are only 64 bytes spare used?? Maybe there
> > > > are still more bugs?).
> > > 
> > > I suspect there are more bugs. A simple way to trigger the bug I encountered 
> > > is by doing a sub-page write, that is:
> > > 
> > >   dd if=/dev/zero bs=1024 count=1 of=/dev/mtd2
> > >   dd if=/dev/zero bs=1024 count=1 seek=1 of=/dev/mtd2
> > > 
> > > and then try reading this page. You may need to dirty the (useless; random) 
> > > content of ecccalc to see the bug (you can conveniently use 
> > > mxc_nand_calculate_ecc() for that). What copy_spare() currently do (spread ECC 
> > > chunks evenly over oob) does not match nandv2_hw_eccoob_largepage.
> > I didn't follow, but would be willing to review a fix :-)
> 
> OK. I'll try something.
\o/

Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
