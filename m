Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KDglc-0004mh-Dc
	for linux-mtd@lists.infradead.org; Tue, 01 Jul 2008 14:23:36 +0000
Date: Tue, 1 Jul 2008 16:23:24 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] Nand driver for TMIO devices
Message-ID: <20080701142323.GA3114@logfs.org>
References: <20080627094340.GA2748@doriath.ww600.siemens.net>
	<20080701115309.GB7238@doriath.ww600.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080701115309.GB7238@doriath.ww600.siemens.net>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 1 July 2008 15:53:09 +0400, Dmitry Baryshkov wrote:
> On Fri, Jun 27, 2008 at 01:43:40PM +0400, Dmitry Baryshkov wrote:
> > Add support nand controller part of toshiba mobile i/o controllers
> > and some custom ASIC found in some PDAs.
> > 
> > Respective parts which handle platform device registration are merged
> > via Russell's arm:devel tree.
> > 
> > Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
> > ---
> >  drivers/mtd/nand/Kconfig     |    7 +
> >  drivers/mtd/nand/Makefile    |    1 +
> >  drivers/mtd/nand/tmio_nand.c |  534 ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 542 insertions(+), 0 deletions(-)
> >  create mode 100644 drivers/mtd/nand/tmio_nand.c
> 
> Any comments regarding this patch?

I don't see any obvious problems with it.  I guess David will take a
closer look in the next merge window.  He tends to ignore the list for
some month, then merge dozens of patches in one hour.

Jörn

-- 
All models are wrong. Some models are useful.
-- George Box
