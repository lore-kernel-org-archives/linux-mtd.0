Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZifZ-0004Rt-Vu
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 12:06:03 +0000
Received: by wyf23 with SMTP id 23so1542235wyf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 05:06:00 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] mtd: remove put_partition_parser() from public header
Date: Thu, 23 Jun 2011 16:05:30 +0400
Message-Id: <1308830731-5698-5-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1308830731-5698-1-git-send-email-dbaryshkov@gmail.com>
References: <1308830731-5698-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no need to pollute public header with a definition private
to mtdpart.c. Move it from mtd/partitions.h to mtdpart.c

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/mtdpart.c          |    2 ++
 include/linux/mtd/partitions.h |    2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6997c6c..c90b7ba 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -706,6 +706,8 @@ static struct mtd_part_parser *get_partition_parser(const char *name)
 	return ret;
 }
 
+#define put_partition_parser(p) do { module_put((p)->owner); } while (0)
+
 int register_mtd_parser(struct mtd_part_parser *p)
 {
 	spin_lock(&part_parser_lock);
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index c98d6b8..2475228 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -79,8 +79,6 @@ struct mtd_part_parser {
 extern int register_mtd_parser(struct mtd_part_parser *parser);
 extern int deregister_mtd_parser(struct mtd_part_parser *parser);
 
-#define put_partition_parser(p) do { module_put((p)->owner); } while(0)
-
 int mtd_is_partition(struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, char *name,
 		      long long offset, long long length);
-- 
1.7.5.3
