Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq3iJ-0007Jp-W2
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 12:43:53 +0000
Date: Mon, 30 Aug 2010 14:43:48 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Pull request for 2.6.36
Message-ID: <20100830124347.GK1473@pengutronix.de>
References: <20100823064024.GP27749@pengutronix.de>
	<1282865865.29421.47.camel@localhost>
	<20100827105538.GB1473@pengutronix.de>
	<1283083179.2131.33.camel@brekeke>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1283083179.2131.33.camel@brekeke>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	John Ogness <john.ogness@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> 
> Not sure if David is confused or not, but I'm confused. Could you please
> sent 2 separate pull requests: one pull request with stuff you want to
> go to 2.6.36 (important fixes) and one request with 2.6.37 material.
> Please, base both on the mtd-2.6.git tree. And make it clear in the
> subject and the e-mail body which request contains what. This will make
> things easier and will probably speed them up. And do not forget to
> refresh the patches and add all Acks, if any :-)

The mtd-2.6.git tree seems empty at the moment, so the branch is based
on linus/master.

Ok, please pull for 2.6.36:


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
