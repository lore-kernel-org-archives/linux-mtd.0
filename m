Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TyPqh-0005uw-HU
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2013 16:40:24 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org
Subject: [PATCH 5/6] mtd: bcm47xxpart: add support for other erase sizes
Date: Thu, 24 Jan 2013 17:39:58 +0100
Message-Id: <1359045599-1305-6-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1359045599-1305-1-git-send-email-hauke@hauke-m.de>
References: <1359045599-1305-1-git-send-email-hauke@hauke-m.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To make the partitions writable they should aligned to erase sizes of
the flash. If the erase size is small use 0x10000.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/bcm47xxpart.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 3411bc2..986ab6e 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -59,11 +59,14 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	uint32_t *buf;
 	size_t bytes_read;
 	uint32_t offset;
-	uint32_t blocksize = 0x10000;
+	uint32_t blocksize = master->erasesize;
 	struct trx_header *trx;
 	int trx_part = -1;
 	int last_trx_part = -1;
 
+	if (blocksize <= 0x10000)
+		blocksize = 0x10000;
+
 	/* Alloc */
 	parts = kzalloc(sizeof(struct mtd_partition) * BCM47XXPART_MAX_PARTS,
 			GFP_KERNEL);
-- 
1.7.10.4
