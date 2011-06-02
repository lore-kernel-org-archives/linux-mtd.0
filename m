Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9FM-00074e-4w
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:51:41 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so758005wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:51:39 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 040/104] mtd: drop mtd_has_cmdlinepart()
Date: Thu,  2 Jun 2011 18:51:18 +0400
Message-Id: <1307026293-8535-6-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This function is unused now. Drop it.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 include/linux/mtd/partitions.h |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 3a6f037..08c9c7b 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -83,12 +83,6 @@ static inline int of_mtd_parse_partitions(struct device *dev,
 }
 #endif
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-static inline int mtd_has_cmdlinepart(void) { return 1; }
-#else
-static inline int mtd_has_cmdlinepart(void) { return 0; }
-#endif
-
 int mtd_is_partition(struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, char *name,
 		      long long offset, long long length);
-- 
1.7.4.4
