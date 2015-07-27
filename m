Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJp3A-0007yz-8a
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2015 20:31:05 +0000
Date: 27 Jul 2015 20:30:43 -0000
Message-Id: <cover.1438028045.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 0/3] Improve mtdpart robustness
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I hit a problem with ofpart getting confused by dt nodes unrelated to
parttioning and refusing the dt which in turn led to mtd refusing access to the
device altogether.

Compiling in a partitioning scheme should not prevent you access to the
unpartitioned device.

Please apply at least the functional patches.

Thanks

Michal

Michal Suchanek (3):
  mtd: mtdpart: add debug prints to partition parser.
  mtd: ofpart: do not fail probe when no partitions exist
  mtd: mtdpart: Do not fail mtd probe when parsing partitions fails.

 drivers/mtd/mtdpart.c | 9 ++++++---
 drivers/mtd/ofpart.c  | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.1.4
