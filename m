Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHTsD-0002lD-NO
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 06:48:56 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/7] mtd: merge mtdchar module with mtdcore
Date: Mon, 18 Mar 2013 08:50:19 +0200
Message-Id: <1363589422-1378-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
References: <1363260463-10609-1-git-send-email-dedekind1@gmail.com>
 <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The MTD subsystem has historically tried to be as configurable as possible. The
side-effect of this is that its configuration menu is rather large, and we are
gradually shrinking it. For example, we recently merged partitions support with
the mtdcore.

This patch does the next step - it merges the mtdchar module to mtdcore. And in
this case this is not only about eliminating too fine-grained separation and
simplifying the configuration menu. This is also about eliminating seemingly
useless kernel module.

Indeed, mtdchar is a module that allows user-space making use of MTD devices
via /dev/mtd* character devices. If users do not enable it, they simply cannot
use MTD devices at all. The cannot read or write the flash contents. Is it a
sane and useful setup? I believe not. And everyone just enables mtdchar.

Having mtdchar separate is also a little bit harmful. People sometimes miss the
fact that they need to enable an additional configuration option to have
user-space MTD interfaces, and then they wonder why on earth the kernel does
not allow using the flash? They spend time asking around.

Thus, let's just get rid of this module and make it part of mtd core.

Note, mtdchar had additional configuration option to enable OTP interfaces,
which are present on some flashes. I removed that option as well - it saves a
really tiny amount space.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/Kconfig         |   13 -------------
 drivers/mtd/Makefile        |    3 +--
 drivers/mtd/chips/Kconfig   |    1 -
 drivers/mtd/devices/Kconfig |    1 -
 drivers/mtd/mtdchar.c       |   20 ++++----------------
 drivers/mtd/mtdcore.c       |   13 +++++++++----
 drivers/mtd/mtdcore.h       |    7 +++++--
 drivers/mtd/onenand/Kconfig |    1 -
 8 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 557bec5..5fab4e6e 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -157,19 +157,6 @@ config MTD_BCM47XX_PARTS
 
 comment "User Modules And Translation Layers"
 
-config MTD_CHAR
-	tristate "Direct char device access to MTD devices"
-	help
-	  This provides a character device for each MTD device present in
-	  the system, allowing the user to read and write directly to the
-	  memory chips, and also use ioctl() to obtain information about
-	  the device, or to erase parts of it.
-
-config HAVE_MTD_OTP
-	bool
-	help
-	  Enable access to OTP regions using MTD_CHAR.
-
 config MTD_BLKDEVS
 	tristate "Common interface to block layer for MTD 'translation layers'"
 	depends on BLOCK
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 18a38e5..4cfb31e 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -4,7 +4,7 @@
 
 # Core functionality.
 obj-$(CONFIG_MTD)		+= mtd.o
-mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o
+mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
 
 obj-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
@@ -15,7 +15,6 @@ obj-$(CONFIG_MTD_BCM63XX_PARTS)	+= bcm63xxpart.o
 obj-$(CONFIG_MTD_BCM47XX_PARTS)	+= bcm47xxpart.o
 
 # 'Users' - code which presents functionality to userspace.
-obj-$(CONFIG_MTD_CHAR)		+= mtdchar.o
 obj-$(CONFIG_MTD_BLKDEVS)	+= mtd_blkdevs.o
 obj-$(CONFIG_MTD_BLOCK)		+= mtdblock.o
 obj-$(CONFIG_MTD_BLOCK_RO)	+= mtdblock_ro.o
diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index c219e3d..e4696b3 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -146,7 +146,6 @@ config MTD_CFI_I8
 config MTD_OTP
 	bool "Protection Registers aka one-time programmable (OTP) bits"
 	depends on MTD_CFI_ADV_OPTIONS
-	select HAVE_MTD_OTP
 	default n
 	help
 	  This enables support for reading, writing and locking so called
diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index ec4a2cc..2a4d55e 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -71,7 +71,6 @@ config MTD_DATAFLASH_WRITE_VERIFY
 config MTD_DATAFLASH_OTP
 	bool "DataFlash OTP support (Security Register)"
 	depends on MTD_DATAFLASH
-	select HAVE_MTD_OTP
 	help
 	  Newer DataFlash chips (revisions C and D) support 128 bytes of
 	  one-time-programmable (OTP) data.  The first half may be written
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index c729252..e0e59bf 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -38,6 +38,8 @@
 
 #include <asm/uaccess.h>
 
+#include "mtdcore.h"
+
 static DEFINE_MUTEX(mtd_mutex);
 
 /*
@@ -365,7 +367,6 @@ static void mtdchar_erase_callback (struct erase_info *instr)
 	wake_up((wait_queue_head_t *)instr->priv);
 }
 
-#ifdef CONFIG_HAVE_MTD_OTP
 static int otp_select_filemode(struct mtd_file_info *mfi, int mode)
 {
 	struct mtd_info *mtd = mfi->mtd;
@@ -395,9 +396,6 @@ static int otp_select_filemode(struct mtd_file_info *mfi, int mode)
 
 	return 0;
 }
-#else
-# define otp_select_filemode(f,m)	-EOPNOTSUPP
-#endif
 
 static int mtdchar_writeoob(struct file *file, struct mtd_info *mtd,
 	uint64_t start, uint32_t length, void __user *ptr,
@@ -890,7 +888,6 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		break;
 	}
 
-#ifdef CONFIG_HAVE_MTD_OTP
 	case OTPSELECT:
 	{
 		int mode;
@@ -946,7 +943,6 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		ret = mtd_lock_user_prot_reg(mtd, oinfo.start, oinfo.length);
 		break;
 	}
-#endif
 
 	/* This ioctl is being deprecated - it truncates the ECC layout */
 	case ECCGETLAYOUT:
@@ -1242,7 +1238,7 @@ static struct file_system_type mtd_inodefs_type = {
 };
 MODULE_ALIAS_FS("mtd_inodefs");
 
-static int __init init_mtdchar(void)
+int __init init_mtdchar(void)
 {
 	int ret;
 
@@ -1268,18 +1264,10 @@ err_unregister_chdev:
 	return ret;
 }
 
-static void __exit cleanup_mtdchar(void)
+void __exit cleanup_mtdchar(void)
 {
 	unregister_filesystem(&mtd_inodefs_type);
 	__unregister_chrdev(MTD_CHAR_MAJOR, 0, 1 << MINORBITS, "mtd");
 }
 
-module_init(init_mtdchar);
-module_exit(cleanup_mtdchar);
-
-MODULE_ALIAS_CHARDEV_MAJOR(MTD_CHAR_MAJOR);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
-MODULE_DESCRIPTION("Direct character-device access to MTD devices");
 MODULE_ALIAS_CHARDEV_MAJOR(MTD_CHAR_MAJOR);
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 91c2efd..71877ff 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -41,6 +41,7 @@
 #include <linux/mtd/partitions.h>
 
 #include "mtdcore.h"
+
 /*
  * backing device capabilities for non-mappable devices (such as NAND flash)
  * - permits private mappings, copies are taken of the data
@@ -96,11 +97,7 @@ EXPORT_SYMBOL_GPL(__mtd_next_device);
 static LIST_HEAD(mtd_notifiers);
 
 
-#if defined(CONFIG_MTD_CHAR) || defined(CONFIG_MTD_CHAR_MODULE)
 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
-#else
-#define MTD_DEVT(index) 0
-#endif
 
 /* REVISIT once MTD uses the driver model better, whoever allocates
  * the mtd_info will probably want to use the release() hook...
@@ -1185,8 +1182,15 @@ static int __init init_mtd(void)
 
 	proc_mtd = proc_create("mtd", 0, NULL, &mtd_proc_ops);
 
+	ret = init_mtdchar();
+	if (ret)
+		goto out_procfs;
+
 	return 0;
 
+out_procfs:
+	if (proc_mtd)
+		remove_proc_entry("mtd", NULL);
 err_bdi3:
 	bdi_destroy(&mtd_bdi_ro_mappable);
 err_bdi2:
@@ -1200,6 +1204,7 @@ err_reg:
 
 static void __exit cleanup_mtd(void)
 {
+	cleanup_mtdchar();
 	if (proc_mtd)
 		remove_proc_entry("mtd", NULL);
 	class_unregister(&mtd_class);
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 9b10fed..7b03533 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -1,6 +1,6 @@
 /*
- * These are exported solely for the purpose of mtd_blkdevs.c. You
- * should not use them for _anything_ else.
+ * These are exported solely for the purpose of mtd_blkdevs.c and mtdchar.c.
+ * You should not use them for _anything_ else.
  */
 
 extern struct mutex mtd_table_mutex;
@@ -14,6 +14,9 @@ int parse_mtd_partitions(struct mtd_info *master, const char * const *types,
 			 struct mtd_partition **pparts,
 			 struct mtd_part_parser_data *data);
 
+int __init init_mtdchar(void);
+void __exit cleanup_mtdchar(void);
+
 #define mtd_for_each_device(mtd)			\
 	for ((mtd) = __mtd_next_device(0);		\
 	     (mtd) != NULL;				\
diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index 91467bb..eac7bb2 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -40,7 +40,6 @@ config MTD_ONENAND_SAMSUNG
 
 config MTD_ONENAND_OTP
 	bool "OneNAND OTP Support"
-	select HAVE_MTD_OTP
 	help
 	  One Block of the NAND Flash Array memory is reserved as
 	  a One-Time Programmable Block memory area.
-- 
1.7.10.4
