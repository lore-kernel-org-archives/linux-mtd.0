Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJp3A-0007zB-8Y
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2015 20:31:05 +0000
Date: 27 Jul 2015 20:30:43 -0000
Message-Id: <5e4bfaabd4912d099463bda1a1246d55b9b7bdc6.1438028045.git.hramrach@gmail.com>
In-Reply-To: <cover.1438028045.git.hramrach@gmail.com>
References: <cover.1438028045.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 3/3] mtd: mtdpart: Do not fail mtd probe when parsing
 partitions fails.
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

Due to wrong assumption in ofpart ofpart fails on Exynos on SPI chips
with no partitions because the subnode containing controller data
confuses the ofpart parser.

Thus compiling in ofpart support automatically fails probing any SPI NOR
flash without partitions on Exynos. Compiling in a partitioning scheme
should not cause probe of otherwise valid device to fail.

Remove that failure possibility.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/mtdpart.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a79c4f7..37a2b79 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -743,7 +743,6 @@ static const char * const default_mtd_part_types[] = {
  * partitions parsed out by the first parser.
  *
  * This function may return:
- * o a negative error code in case of failure
  * o zero if no partitions were found
  * o a positive number of found partitions, in which case on exit @pparts will
  *   point to an array containing this number of &struct mtd_info objects.
@@ -773,10 +772,10 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
 			       ret, parser->name, master->name);
-			break;
+			return ret;
 		}
 	}
-	return ret;
+	return 0;
 }
 
 int mtd_is_partition(const struct mtd_info *mtd)
-- 
2.1.4
