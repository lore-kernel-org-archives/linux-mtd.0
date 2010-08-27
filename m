Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oowaz-000741-Q2
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 10:55:43 +0000
Date: Fri, 27 Aug 2010 12:55:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Pull request: i.MX nand driver updates
Message-ID: <20100827105538.GB1473@pengutronix.de>
References: <20100823064024.GP27749@pengutronix.de>
	<1282865865.29421.47.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1282865865.29421.47.camel@localhost>
Cc: linux-mtd@lists.infradead.org, John Ogness <john.ogness@linutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 27, 2010 at 12:37:45AM +0100, David Woodhouse wrote:
> On Mon, 2010-08-23 at 08:40 +0200, Sascha Hauer wrote:
> > Hi Artem,
> > 
> > Please pull the following patches to the i.MX nand driver for -next.
> > The patches have been reviewed here on the list and on linux-arm-kernel.
> > 
> > Sascha
> > 
> > The following changes since commit da5cabf80e2433131bf0ed8993abc0f7ea618c73:
> > 
> >   Linux 2.6.36-rc1 (2010-08-15 17:41:37 -0700)
> > 
> > are available in the git repository at:
> >   git://git.pengutronix.de/git/imx/linux-2.6.git mtd-imx-nand
> > 
> > John Ogness (2):
> >       mxc_nand: Do not do byte accesses to the NFC buffer.
> >       mxc_nand: remove unused variables.
> > 
> > Sascha Hauer (10):
> >       mxc_nand: remove 0xe00 offset from registers
> >       mxc_nand: rework get_dev_status
> >       mxc_nand: make some internally used functions overwriteable
> >       mxc_nand: factor out a check_int function
> >       mxc_nand: add V1_V2 namespace to registers
> >       mxc_nand: support 8bit ecc
> >       mxc_nand: fix correct_data function
> >       mxc_nand: Add v3 (i.MX51) Support
> >       mxc_nand: do not depend on disabling the irq in the interrupt handler
> >       mxc_nand: configure pages per block for v2 controller
> 
> Um, that repo seems to be based on something earlier than 2.6.36-rc1.
> And the real -rc1 already contains most of those commits.
> 
> I think there are four commits which aren't already included. Of those,
> at least one looks like a bug fix which needs to go into 2.6.36. What
> about the others?

The patch from John Ogness is a bug fix. 'configure pages per block for
v2 controller' can be considered a bug fix since before this patch we
relied on some register bits being set correctly by the bootloader.
One patch can wait for the next merge window I think.
I updated the branch to contain the following:


The following changes since commit d1b113bb028999e82a8528e1484be8c23fb5a7d9:

  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-2.6 (2010-08-23 18:30:30 -0700)

are available in the git repository at:

  git://git.pengutronix.de/git/imx/linux-2.6.git mtd-imx-nand

John Ogness (1):
      mxc_nand: Do not do byte accesses to the NFC buffer.

Sascha Hauer (1):
      mxc_nand: configure pages per block for v2 controller

 drivers/mtd/nand/mxc_nand.c |   47 +++++++++++++++++++++++-------------------
 1 files changed, 26 insertions(+), 21 deletions(-)


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
