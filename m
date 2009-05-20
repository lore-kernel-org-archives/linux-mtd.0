Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M6jqd-0001Ks-O1
	for linux-mtd@lists.infradead.org; Wed, 20 May 2009 11:20:42 +0000
Date: Wed, 20 May 2009 13:20:30 +0200
From: Daniel Mack <daniel@caiaq.de>
To: linux-arm-kernel@lists.arm.linux.org.uk,
	linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] ARM: MTD: add NOR lash driver for Freescale MXC
Message-ID: <20090520112030.GA4945@buzzloop.caiaq.de>
References: <1242734830-21407-1-git-send-email-daniel@caiaq.de>
	<20090519180745.GI9288@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090519180745.GI9288@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 19, 2009 at 08:07:45PM +0200, Sascha Hauer wrote:
> On Tue, May 19, 2009 at 02:07:10PM +0200, Daniel Mack wrote:
> > This adds a driver for Freescale MXC's NOR flash.
> > The driver is taken from Freescale's BSP - I just made it compile for
> > current kernel versions and cleaned up the CodingStyle here and there.
> 
> Why do we need this driver? This is what the physmap driver is for.

Totally right, forget about that - the generic driver works fine (see
patch 6/8 in my last set).

Thanks,
Daniel
