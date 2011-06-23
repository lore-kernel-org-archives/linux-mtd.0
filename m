Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZifd-0004Qz-CD
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 12:06:06 +0000
Received: by mail-ww0-f49.google.com with SMTP id 22so1295734wwf.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 05:06:05 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] mtd: drop mtd_device_register
Date: Thu, 23 Jun 2011 16:05:31 +0400
Message-Id: <1308830731-5698-6-git-send-email-dbaryshkov@gmail.com>
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

mtd_device_register() is a limited version of mtd_device_parse_register.
Replace it with macro calling mtd_device_parse_register().

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/mtdcore.c   |   23 -----------------------
 include/linux/mtd/mtd.h |    5 ++---
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e186399..f9cc2d2 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -429,29 +429,6 @@ out_error:
 }
 
 /**
- * mtd_device_register - register an MTD device.
- *
- * @master: the MTD device to register
- * @parts: the partitions to register - only valid if nr_parts > 0
- * @nr_parts: the number of partitions in parts.  If zero then the full MTD
- *            device is registered
- *
- * Register an MTD device with the system and optionally, a number of
- * partitions.  If nr_parts is 0 then the whole device is registered, otherwise
- * only the partitions are registered.  To register both the full device *and*
- * the partitions, call mtd_device_register() twice, once with nr_parts == 0
- * and once equal to the number of partitions.
- */
-int mtd_device_register(struct mtd_info *master,
-			const struct mtd_partition *parts,
-			int nr_parts)
-{
-	return parts ? add_mtd_partitions(master, parts, nr_parts) :
-		add_mtd_device(master);
-}
-EXPORT_SYMBOL_GPL(mtd_device_register);
-
-/**
  * mtd_device_parse_register - parse partitions and register an MTD device.
  *
  * @mtd: the MTD device to register
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index b2b454b..67774f9 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -325,14 +325,13 @@ static inline uint32_t mtd_mod_by_ws(uint64_t sz, struct mtd_info *mtd)
 struct mtd_partition;
 struct mtd_part_parser_data;
 
-extern int mtd_device_register(struct mtd_info *master,
-			       const struct mtd_partition *parts,
-			       int nr_parts);
 extern int mtd_device_parse_register(struct mtd_info *mtd,
 			      const char **part_probe_types,
 			      struct mtd_part_parser_data *parser_data,
 			      const struct mtd_partition *defparts,
 			      int defnr_parts);
+#define mtd_device_register(master, parts, nr_parts)	\
+	mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
 extern int mtd_device_unregister(struct mtd_info *master);
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
 extern int __get_mtd_device(struct mtd_info *mtd);
-- 
1.7.5.3
