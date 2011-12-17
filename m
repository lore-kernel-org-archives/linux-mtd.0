Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rbtqp-0008JX-V6
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 12:58:56 +0000
Received: by eekc13 with SMTP id c13so2862499eek.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 04:58:54 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] MTD: bcm63xxpart: don't assume NVRAM is always the fourth
 partition
Date: Sat, 17 Dec 2011 13:58:16 +0100
Message-Id: <1324126698-9919-4-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
References: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of referencing the sizes of fixed partitions, use the
precomputed CFE/NVRAM lengths.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/bcm63xxpart.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 23f6201..3becb4d 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -165,8 +165,8 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	/* Global partition "linux" to make easy firmware upgrade */
 	curpart++;
 	parts[curpart].name = "linux";
-	parts[curpart].offset = parts[0].size;
-	parts[curpart].size = master->size - parts[0].size - parts[3].size;
+	parts[curpart].offset = cfelen;
+	parts[curpart].size = master->size - cfelen - nvramlen;
 
 	for (i = 0; i < nrparts; i++)
 		pr_info("Partition %d is %s offset %lx and length %lx\n", i,
-- 
1.7.2.5
