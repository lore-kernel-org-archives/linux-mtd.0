Received: from cmccmta3.chinamobile.com ([221.176.66.81])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajHhz-00023W-6S
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 02:42:44 +0000
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 baiyaowei@cmss.chinamobile.com
Subject: [PATCH 1/5] drivers/mtd: mtd_is_partition can be boolean
Date: Fri, 25 Mar 2016 10:41:51 +0800
Message-Id: <1458873715-3670-2-git-send-email-baiyaowei@cmss.chinamobile.com>
In-Reply-To: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
References: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes mtd_is_partition return bool to improve
readability due to this particular function only using either
one or zero as its return value.

No functional change.

Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
---
 drivers/mtd/mtdpart.c          | 6 +++---
 include/linux/mtd/partitions.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 10bf304..1aae1f4 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -829,15 +829,15 @@ void mtd_part_parser_cleanup(struct mtd_partitions *parts)
 	}
 }
 
-int mtd_is_partition(const struct mtd_info *mtd)
+bool mtd_is_partition(const struct mtd_info *mtd)
 {
 	struct mtd_part *part;
-	int ispart = 0;
+	bool ispart = false;
 
 	mutex_lock(&mtd_partitions_mutex);
 	list_for_each_entry(part, &mtd_partitions, list)
 		if (&part->mtd == mtd) {
-			ispart = 1;
+			ispart = true;
 			break;
 		}
 	mutex_unlock(&mtd_partitions_mutex);
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 70736e1..042f3be 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -96,7 +96,7 @@ extern void deregister_mtd_parser(struct mtd_part_parser *parser);
 	module_driver(__mtd_part_parser, register_mtd_parser, \
 		      deregister_mtd_parser)
 
-int mtd_is_partition(const struct mtd_info *mtd);
+bool mtd_is_partition(const struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, const char *name,
 		      long long offset, long long length);
 int mtd_del_partition(struct mtd_info *master, int partno);
-- 
1.9.1
