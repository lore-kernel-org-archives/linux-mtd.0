From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/2] mxc_nand: fixes for purposed updates
Date: Mon,  9 Aug 2010 14:38:12 +0300
Message-Id: <cover.1281353601.git.baruch@tkos.co.il>
In-Reply-To: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
References: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
Cc: John Ogness <john.ogness@linutronix.de>, Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With these patches applied I've tested mxc-nand-pu on a i.MX25 based system.

Baruch Siach (2):
  mxc_nand: fix build error
  mxc_nand: remove unused variables

 drivers/mtd/nand/mxc_nand.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)
