Received: from py-out-1112.google.com ([64.233.166.179])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GE0b1-0002db-Jr
	for linux-mtd@lists.infradead.org; Fri, 18 Aug 2006 10:24:56 +0100
Received: by py-out-1112.google.com with SMTP id c31so1054045pyd
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Aug 2006 02:23:51 -0700 (PDT)
Message-ID: <6934efce0608180223g4591c1beja5be00f57d5173f4@mail.gmail.com>
Date: Fri, 18 Aug 2006 02:23:51 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] CORE: Allow kernel access to struct mtd_part and PART() for
	axfs
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

In order to mount to mtd partitions axfs (axfs.sf.net) needs the
physical address
found by using the mtd_part structure.  This patch simply moves the
definition of struct mtd_part and PART() from drivers/mtd/mtdpart.c to
include/linux/mtd/partitions.h where other parts of the kernel, such as
axfs, can use it.

This is actually in my brand new shiny users/jehulber/mtd-intel.git
all ready to be pulled.  If everyone is okay with it that is.

This is best way we could figure out to get access to the physical
address of a given partition.  We _need_ the physical address to use
remap_pfn_range().

<AXFSCODE>
	part = PART(mtd);
	map = part->master->priv;
	fsi->virtaddr = (void *)virtaddr;
	fsi->clean_up_callback = axfs_mtd_cleanup;
	fsi->callback_data = (u32) mtdnr;
	fsi->physaddr = (void *)(map->phys + part->offset);
</AXFSCODE>


<PATCH>
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -24,23 +24,6 @@
/* Our partition linked list */
static LIST_HEAD(mtd_partitions);
-/* Our partition node structure */
-struct mtd_part {
- struct mtd_info mtd;
- struct mtd_info *master;
- u_int32_t offset;
- int index;
- struct list_head list;
- int registered;
-};
-
-/*
- * Given a pointer to the MTD object in the mtd_part structure, we can retrieve
- * the pointer to that structure with this macro.
- */
-#define PART(x) ((struct mtd_part *)(x))
-
-
/*
* MTD methods which simply translate the effective address and pass through
* to the _real_ device.
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -45,6 +45,22 @@ struct mtd_partition {
struct mtd_info **mtdp; /* pointer to store the MTD object */
};
+/* Our partition node structure */
+struct mtd_part {
+ struct mtd_info mtd;
+ struct mtd_info *master;
+ u_int32_t offset;
+ int index;
+ struct list_head list;
+ int registered;
+};
+
+/*
+ * Given a pointer to the MTD object in the mtd_part structure, we can retrieve
+ * the pointer to that structure with this macro.
+ */
+#define PART(x) ((struct mtd_part *)(x))
+
#define MTDPART_OFS_NXTBLK (-2)
#define MTDPART_OFS_APPEND (-1)
#define MTDPART_SIZ_FULL (0)
</PATCH>
