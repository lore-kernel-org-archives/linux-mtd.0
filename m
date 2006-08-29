Received: from nz-out-0102.google.com ([64.233.162.207])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GHvTN-0006el-8t
	for linux-mtd@lists.infradead.org; Tue, 29 Aug 2006 05:45:14 +0100
Received: by nz-out-0102.google.com with SMTP id s1so2331652nze
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Aug 2006 21:44:11 -0700 (PDT)
Message-ID: <6934efce0608282144ge2250dbv1635377c005a9f74@mail.gmail.com>
Date: Mon, 28 Aug 2006 21:44:11 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] CORE: adding mtd_get_partition_physaddr()
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is to allow axfs to get the physical address on the flash of it's
partition.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 06a9303..37aed8a 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -40,6 +40,17 @@ struct mtd_part {
  */
 #define PART(x)  ((struct mtd_part *)(x))

+/*
+ * Allow other modules to get the physical address of a given partition
+ */
+void * mtd_get_partition_physaddr (struct mtd_info *mtd)
+{
+	struct mtd_part *part = PART(mtd);
+	struct map_info *map = part->master->priv;
+
+	return (void *)(map->phys + part->offset);
+}
+EXPORT_SYMBOL_GPL(mtd_get_partition_physaddr);

 /*
  * MTD methods which simply translate the effective address and pass through
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index da6b3d6..adf6207 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -68,6 +68,7 @@ extern int register_mtd_parser(struct mt
 extern int deregister_mtd_parser(struct mtd_part_parser *parser);
 extern int parse_mtd_partitions(struct mtd_info *master, const char **types,
 				struct mtd_partition **pparts, unsigned long origin);
+extern void * mtd_get_partition_physaddr(struct mtd_info *mtd);

 #define put_partition_parser(p) do { module_put((p)->owner); } while(0)
