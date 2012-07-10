Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SodEE-000841-5s
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2012 16:24:00 +0000
Received: by wibhm11 with SMTP id hm11so133006wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2012 09:23:55 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/4] mtd_is_partition: struct mtd_info should be const
Date: Tue, 10 Jul 2012 18:23:39 +0200
Message-Id: <1341937423-16516-2-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

struct mtd_info is not modified by mtd_is_partition so it should be a
const.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/mtdpart.c          |    2 +-
 include/linux/mtd/partitions.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index d518e4d..8500584 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -744,7 +744,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 	return ret;
 }
 
-int mtd_is_partition(struct mtd_info *mtd)
+int mtd_is_partition(const struct mtd_info *mtd)
 {
 	struct mtd_part *part;
 	int ispart = 0;
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 2475228..02a5115 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -79,7 +79,7 @@ struct mtd_part_parser {
 extern int register_mtd_parser(struct mtd_part_parser *parser);
 extern int deregister_mtd_parser(struct mtd_part_parser *parser);
 
-int mtd_is_partition(struct mtd_info *mtd);
+int mtd_is_partition(const struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, char *name,
 		      long long offset, long long length);
 int mtd_del_partition(struct mtd_info *master, int partno);
-- 
1.7.2.5
