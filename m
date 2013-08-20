Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBgmb-0004iW-7I
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 07:55:17 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2] m25p80 / fast read
Date: Tue, 20 Aug 2013 09:54:38 +0200
Message-Id: <1376985281-16293-1-git-send-email-s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Changes since v1:

- rebase on git.infradead.org/l2-mtd.git
- improve description for patch 2/3

Sascha

----------------------------------------------------------------
Markus Niebel (1):
      mtd: m25p80: add support for mr25h10

Sascha Hauer (2):
      mtd: m25p80: Pass flags through CAT25_INFO macro
      mtd: m25p80: make CONFIG_M25PXX_USE_FAST_READ safe to enable

 drivers/mtd/devices/m25p80.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)
