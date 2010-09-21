Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OxxST-0008FA-7N
	for linux-mtd@lists.infradead.org; Tue, 21 Sep 2010 07:40:10 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [GIT PULL] mxc nand patch for -rc
Date: Tue, 21 Sep 2010 09:40:01 +0200
Message-Id: <1285054802-21388-1-git-send-email-s.hauer@pengutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David, Artem,

I originally wanted to delay this patch to the next merge window, but
now I realized that the mxc-nand driver is not working anymore, so please
pull the following to fix it.

Sascha

The following changes since commit 9c03f1622af051004416dd3e24d8a0fa31e34178:

  Merge ssh://master.kernel.org/home/hpa/tree/sec (2010-09-14 17:07:51 -0700)

are available in the git repository at:

  git://git.pengutronix.de/git/imx/linux-2.6.git mtd-imx-nand

Sascha Hauer (1):
      mtd: mxc_nand: do not depend on disabling the irq in the interrupt handler

 drivers/mtd/nand/mxc_nand.c |   92 ++++++++++++++++++++++++++++++++++++++----
 1 files changed, 83 insertions(+), 9 deletions(-)
