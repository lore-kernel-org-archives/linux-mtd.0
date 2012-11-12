Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXqh2-00014w-Hp
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 09:52:37 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so2247441bkw.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 01:52:35 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] MTD: bcm63xxpart: remove unused variable
Date: Mon, 12 Nov 2012 10:52:47 +0100
Message-Id: <1352713971-1685-2-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
References: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
Cc: Maxime Bizon <mbizon@freebox.fr>, Kevin Cernekee <cernekee@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

namelen is never used, so drop it.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/bcm63xxpart.c |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 63d2a64..1eb1416 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -79,7 +79,6 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	unsigned int rootfsaddr, kerneladdr, spareaddr;
 	unsigned int rootfslen, kernellen, sparelen, totallen;
 	unsigned int cfelen, nvramlen;
-	int namelen = 0;
 	int i;
 	u32 computed_crc;
 	bool rootfs_first = false;
@@ -143,15 +142,11 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	}
 
 	/* Determine number of partitions */
-	namelen = 8;
-	if (rootfslen > 0) {
+	if (rootfslen > 0)
 		nrparts++;
-		namelen += 6;
-	}
-	if (kernellen > 0) {
+
+	if (kernellen > 0)
 		nrparts++;
-		namelen += 6;
-	}
 
 	/* Ask kernel for more memory */
 	parts = kzalloc(sizeof(*parts) * nrparts + 10 * nrparts, GFP_KERNEL);
-- 
1.7.2.5
