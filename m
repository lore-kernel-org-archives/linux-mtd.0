Received: from metis.extern.pengutronix.de ([83.236.181.26])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtjbM-0000AF-6b
	for linux-mtd@lists.infradead.org; Wed, 07 May 2008 13:22:32 +0000
Date: Wed, 7 May 2008 15:25:14 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: jffs2 and unaligned access
Message-ID: <20080507132514.GF4326@pengutronix.de>
References: <20080507102724.GE4326@pengutronix.de>
	<1210157630.25560.884.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1210157630.25560.884.camel@pmac.infradead.org>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Jon Smirl <jonsmirl@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 07, 2008 at 11:53:49AM +0100, David Woodhouse wrote:
> On Wed, 2008-05-07 at 12:27 +0200, Sascha Hauer wrote:
> > memcpy_from/to_io() use word aligned accesses on the io side of memory.
> > The MPC5200 local plus bus where our flashes are connected does not
> > allow unaligned accesses, so we have to use the io versions of memcpy.
> 
> But this region of flash is marked as suitable for execute-in-place,
> otherwise the point() function wouldn't be working to give a direct
> pointer to it. It sounds like we shouldn't be allowing that.

It actually is suitable for execute-in-place. It's the flash U-Boot
starts from. The compiler will generate a proper alignment for you.

> 
> Which in turn means that perhaps we should have a property in the
> corresponding node in the device-tree which indicates that it's not
> suitable for direct access?

So far we did not work with the device-tree flash binding but with the
physmap-flash driver, but ok, this is subject to change anyway.

I gave it a quick try to disable direct accesses. It works, but has a
1:10 performance impact on mounting a jffs2. At least it's a clean
solution.

Sascha


-- 
Pengutronix e.K. - Linux Solutions for Science and Industry
-----------------------------------------------------------
Kontakt-Informationen finden Sie im Header dieser Mail oder
auf der Webseite -> http://www.pengutronix.de/impressum/ <-
