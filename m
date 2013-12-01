Received: from mail-pd0-f175.google.com ([209.85.192.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vn4kb-0002ai-JI
 for linux-mtd@lists.infradead.org; Sun, 01 Dec 2013 10:59:46 +0000
Received: by mail-pd0-f175.google.com with SMTP id w10so16154589pde.20
 for <linux-mtd@lists.infradead.org>; Sun, 01 Dec 2013 02:59:19 -0800 (PST)
Message-ID: <1385895555.3994.4.camel@phoenix>
Subject: [PATCH 1/2] mtd: Make deregister_mtd_parser return void
From: Axel Lin <axel.lin@ingics.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
Date: Sun, 01 Dec 2013 18:59:15 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

deregister_mtd_parser never fails, hence make it return void.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/mtd/mtdpart.c          | 3 +--
 include/linux/mtd/partitions.h | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 67a89bb..29ee91e 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -682,12 +682,11 @@ int register_mtd_parser(struct mtd_part_parser *p)
 }
 EXPORT_SYMBOL_GPL(register_mtd_parser);
 
-int deregister_mtd_parser(struct mtd_part_parser *p)
+void deregister_mtd_parser(struct mtd_part_parser *p)
 {
 	spin_lock(&part_parser_lock);
 	list_del(&p->list);
 	spin_unlock(&part_parser_lock);
-	return 0;
 }
 EXPORT_SYMBOL_GPL(deregister_mtd_parser);
 
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 335ffca..d513ffb 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -77,7 +77,7 @@ struct mtd_part_parser {
 };
 
 extern int register_mtd_parser(struct mtd_part_parser *parser);
-extern int deregister_mtd_parser(struct mtd_part_parser *parser);
+extern void deregister_mtd_parser(struct mtd_part_parser *parser);
 
 int mtd_is_partition(const struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, const char *name,
-- 
1.8.1.2
