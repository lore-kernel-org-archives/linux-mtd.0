Received: from metis.ext.4.pengutronix.de ([92.198.50.35])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbv6y-0007u8-Bw
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 20:14:38 +0000
Date: Thu, 9 Feb 2017 21:14:04 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH] mtd: Add partition device node to mtd partition devices
Message-ID: <20170209201404.fsokiexnj7xvukyd@pengutronix.de>
References: <20170209105024.1579-1-u.kleine-koenig@pengutronix.de>
 <20170209163458.41b3bea7@bbrezillon>
 <20170209193940.vd63higxuowsxj3d@pengutronix.de>
 <20170209205922.5ba01ee1@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170209205922.5ba01ee1@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Boris,

On Thu, Feb 09, 2017 at 08:59:22PM +0100, Boris Brezillon wrote:
> On Thu, 9 Feb 2017 20:39:40 +0100
> Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:
> 
> > On Thu, Feb 09, 2017 at 04:34:58PM +0100, Boris Brezillon wrote:
> > > +Moritz
> > > 
> > > On Thu,  9 Feb 2017 11:50:24 +0100
> > > Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:
> > >   
> > > > From: Sascha Hauer <s.hauer@pengutronix.de>
> > > > 
> > > > The user visible change here is that mtd partitions get an of_node link
> > > > in sysfs.  
> > > 
> > > The same patch has already been posted last year [1].
> > > Brian, can we take one of these?
> > > 
> > > [1]https://patchwork.ozlabs.org/patch/625978/  
> > 
> > Moritz' patch is more lame, it even updates the documentation (ok, one
> > point for Moriz :-) Other than that the only difference is "node" vs.
> > "of_node" (half a point for Sascha) and the position of the assignment
> > in mtdpart.c has a different position (another half point for Sascha).
> > 
> > If that would be liked to be seen I can volunteer to create a patch
> > picking the best from both sources.
> 
> Sure, you can also add my ack (which I already put on Moritz patch).
> BTW, is the of_node link in sysfs the only motivation for this change?
> I know Moritz had bigger plans (nvmem blocks on top of MTD devices), and
> I also considered advanced stuff (like per-partition ECC config) which
> required having a valid ->of_node on slave MTD devices.

The motivation for Sascha to create this patch and now me to mainline
it, is that we specify some non-volatile state space in dts (to store
for example hardware revision, serial number and mac addresses). See
http://barebox.org/doc/latest/devicetree/bindings/barebox/barebox,state.html
for some details.

For the userspace part we read the dtb, something like

	state {
		compatible = "barebox,state";
		backend = &mtdstatepartition;
		...
	}

, and with the symlink introduced by the patch under discussion it gets
much simpler to find the device file (in /dev) that contains our state
data.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
