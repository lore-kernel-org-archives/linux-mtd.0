Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MeT8Y-00012s-7z
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 12:22:31 +0000
Date: Fri, 21 Aug 2009 14:22:25 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Magnus Lilja <lilja.magnus@gmail.com>
Subject: Re: MXC nand controller performance
Message-ID: <20090821122225.GL23444@pengutronix.de>
References: <20090820125734.GI23444@pengutronix.de>
	<59b21cf20908201310s2c67dda2t294380e6e6ca5336@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59b21cf20908201310s2c67dda2t294380e6e6ca5336@mail.gmail.com>
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>,
	Linux MTD list <linux-mtd@lists.infradead.org>,
	Eric Benard <ebenard@eukrea.com>, Daniel Mack <daniel@caiaq.de>,
	Alberto Panizzo <maramaopercheseimorto@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 20, 2009 at 10:10:27PM +0200, Magnus Lilja wrote:
> Hi Sascha,
> 
> 2009/8/20 Sascha Hauer <s.hauer@pengutronix.de>:
> > Hi,
> >
> > Hi recently found out that on my i.MX27 board the mxc nand controller
> > performance nearly doubles when I disable interrupts. Can anybody
> > confirm this behaviour, possibly on other i.MXs?
> > I'm trying to figure out what to do. We could disable interrupts
> > completely in which case the driver would become simpler. Maybe using
> > polling mode has other impacts on other workloads, so maybe we want to
> > add a flag to platform_data instead of disabling interrupts completely.
> 
> A flag sounds like a good idea.
> 
> > You can use the following patch to disable interrupts. It is not meant
> > for inclusion in this form of course.
> 
> I can give it a try on i.MX31, how do you measure the performance?

I did a 'time cat /dev/mtdblockx > /dev/null' and looked at the time
needed to mount an ubifs. I haven't done any write tests though.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
