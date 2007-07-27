Received: from nz-out-0506.google.com ([64.233.162.233])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IEDKE-0002Jm-Uw
	for linux-mtd@lists.infradead.org; Thu, 26 Jul 2007 20:05:00 -0400
Received: by nz-out-0506.google.com with SMTP id z3so578251nzf
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Jul 2007 17:04:57 -0700 (PDT)
Message-ID: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
Date: Thu, 26 Jul 2007 17:04:56 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH][MTD] mtdpart.c: allow other drivers to get physical address
	of partition
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

This is necessary to XIP applications because vm_insert_pfn() requires
a physical address.  Allows AXFS to get the physical address on the
flash of it's partition.  Second try, see
(www.infradead.org/pipermail/linux-mtd/2006-August/016342.html)

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>


diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 9c62368..af0c1ff 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -20,6 +20,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/compatmac.h>
+#include <linux/mtd/map.h>

 /* Our partition linked list */
 static LIST_HEAD(mtd_partitions);
@@ -40,6 +41,17 @@ struct mtd_part {
  */
 #define PART(x)  ((struct mtd_part *)(x))

+/*
+ * Allow other modules to get the physical address of a given partition
+ */
+void *mtd_get_partition_physaddr(struct mtd_info *mtd)
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
index da6b3d6..3e9ff2c 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -52,6 +52,7 @@ struct mtd_partition {

 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
+void *mtd_get_partition_physaddr(struct mtd_info *);

 /*
  * Functions dealing with the various ways of partitioning the space
