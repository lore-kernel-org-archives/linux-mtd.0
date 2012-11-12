Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXqh8-00014w-Ln
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 09:52:43 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so2247441bkw.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 01:52:42 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] MTD: bcm63xxpart: use correct printk format for partitions
Date: Mon, 12 Nov 2012 10:52:51 +0100
Message-Id: <1352713971-1685-6-git-send-email-jonas.gorski@gmail.com>
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

Use ll to be able to remove the casts.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/bcm63xxpart.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 44cba4e..6eeb84c 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -198,9 +198,8 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	parts[curpart].size = master->size - cfelen - nvramlen;
 
 	for (i = 0; i < nrparts; i++)
-		pr_info("Partition %d is %s offset %lx and length %lx\n", i,
-			parts[i].name, (long unsigned int)(parts[i].offset),
-			(long unsigned int)(parts[i].size));
+		pr_info("Partition %d is %s offset %llx and length %llx\n", i,
+			parts[i].name, parts[i].offset,	parts[i].size);
 
 	pr_info("Spare partition is offset %x and length %x\n",	spareaddr,
 		sparelen);
-- 
1.7.2.5
