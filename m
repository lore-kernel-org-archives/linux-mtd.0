Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VVSgC-00076J-DV
 for linux-mtd@lists.infradead.org; Sun, 13 Oct 2013 20:54:25 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org,
	zajec5@gmail.com
Subject: [PATCH] mtd: bcm47xxpart: handle malloc failures
Date: Sun, 13 Oct 2013 22:53:49 +0200
Message-Id: <1381697629-31272-1-git-send-email-hauke@hauke-m.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Handle return NULL in malloc.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/bcm47xxpart.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 9279a91..6d42746 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -71,7 +71,14 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	/* Alloc */
 	parts = kzalloc(sizeof(struct mtd_partition) * BCM47XXPART_MAX_PARTS,
 			GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
+
 	buf = kzalloc(BCM47XXPART_BYTES_TO_READ, GFP_KERNEL);
+	if (!buf) {
+		kfree(parts);
+		return -ENOMEM;
+	}
 
 	/* Parse block by block looking for magics */
 	for (offset = 0; offset <= master->size - blocksize;
-- 
1.7.10.4
