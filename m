Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H97Mo-00034n-Kd
	for linux-mtd@lists.infradead.org; Mon, 22 Jan 2007 17:10:22 -0500
Received: from hermes.tec.linutronix.de (unknown [192.168.0.1])
	by mail.tglx.de (Postfix) with ESMTP id 4D13B65C065
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Jan 2007 23:09:55 +0100 (CET)
Received: from localhost.localdomain (atlas.tec.linutronix.de [192.168.0.87])
	by hermes.tec.linutronix.de (Postfix) with SMTP id B3CE6685D4
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Jan 2007 23:09:54 +0100 (CET)
Date: Mon, 22 Jan 2007 23:09:54 +0100
From: Benedikt Spranger <b.spranger@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH][UBI] remove __exit on functions referenced in '.text' or
	'.init.text'
Message-Id: <20070122230954.1b7f77e6.b.spranger@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

linking the current ubi-2.6 git tree results in tons of "`.exit.text'
referenced in section `.text'" or ".init.text". Solution is simple:
remove all __exit in referenced function.

Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
---

Index: ubi-2.6/drivers/mtd/ubi/account.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/account.c	2007-01-22
21:42:15.050480049 +0100 +++ ubi-2.6/drivers/mtd/ubi/account.c
2007-01-22 21:42:46.625671415 +0100 @@ -189,7 +189,7 @@ out_acc:
 	return err;
 }
 
-void __exit ubi_acc_close(const struct ubi_info *ubi)
+void ubi_acc_close(const struct ubi_info *ubi)
 {
 	dbg_acc("close the accounting unit");
 	ubi_kfree(ubi->acc);
Index: ubi-2.6/drivers/mtd/ubi/account.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/account.h	2007-01-22
21:42:17.842408539 +0100 +++ ubi-2.6/drivers/mtd/ubi/account.h
2007-01-22 21:42:37.761898392 +0100 @@ -95,7 +95,7 @@ int __init
ubi_acc_init_scan(struct ubi_ *
  * @ubi: the UBI device description object
  */
-void __exit ubi_acc_close(const struct ubi_info *ubi);
+void ubi_acc_close(const struct ubi_info *ubi);
 
 /**
  * struct ubi_acc_info - the UBI accounting unit's description data
structure. Index: ubi-2.6/drivers/mtd/ubi/alloc.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/alloc.c	2007-01-22
21:48:42.440573911 +0100 +++ ubi-2.6/drivers/mtd/ubi/alloc.c
2007-01-22 21:48:53.452292784 +0100 @@ -336,7 +336,7 @@ out:
 	return -ENOMEM;
 }
 
-void __exit ubi_alloc_close(void)
+void ubi_alloc_close(void)
 {
 	if (scan_volume_slab)
 		kmem_cache_destroy(scan_volume_slab);
Index: ubi-2.6/drivers/mtd/ubi/alloc.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/alloc.h	2007-01-22
21:48:44.904511005 +0100 +++ ubi-2.6/drivers/mtd/ubi/alloc.h
2007-01-22 21:49:04.856001675 +0100 @@ -230,6 +230,6 @@ int __init
ubi_alloc_init(void); /**
  * ubi_alloc_close - close the UBI memory allocation unit.
  */
-void __exit ubi_alloc_close(void);
+void ubi_alloc_close(void);
 
 #endif /* !__UBI_ALLOC_H__ */
Index: ubi-2.6/drivers/mtd/ubi/background.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/background.c	2007-01-22
21:50:07.766396195 +0100 +++
ubi-2.6/drivers/mtd/ubi/background.c	2007-01-22
21:50:25.277949439 +0100 @@ -315,7 +315,7 @@ out_bgt: return err;
 }
 
-void __exit ubi_bgt_close(struct ubi_info *ubi)
+void ubi_bgt_close(struct ubi_info *ubi)
 {
 	struct ubi_bgt_info *bgt = ubi->bgt;
 
Index: ubi-2.6/drivers/mtd/ubi/background.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/background.h	2007-01-22
21:50:10.810318534 +0100 +++
ubi-2.6/drivers/mtd/ubi/background.h	2007-01-22
21:50:38.737606095 +0100 @@ -114,7 +114,7 @@ int __init ubi_bgt_init
(struct ubi_info *
  * @ubi: the UBI device description object
  */
-void __exit ubi_bgt_close(struct ubi_info *ubi);
+void ubi_bgt_close(struct ubi_info *ubi);
 
 /**
  * ubi_bgt_worker_t - background worker function prototype.
Index: ubi-2.6/drivers/mtd/ubi/badeb.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/badeb.c	2007-01-22
21:50:48.889347158 +0100 +++ ubi-2.6/drivers/mtd/ubi/badeb.c
2007-01-22 21:51:05.976911356 +0100 @@ -215,7 +215,7 @@ int __init
ubi_beb_init(struct ubi_info return 0;
 }
 
-void __exit ubi_beb_close(struct ubi_info *ubi)
+void ubi_beb_close(struct ubi_info *ubi)
 {
 	ubi_kfree(ubi->beb);
 }
Index: ubi-2.6/drivers/mtd/ubi/badeb.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/badeb.h	2007-01-22
21:50:51.061291761 +0100 +++ ubi-2.6/drivers/mtd/ubi/badeb.h
2007-01-22 21:51:15.856659409 +0100 @@ -89,7 +89,7 @@ int __init
ubi_beb_init(struct ubi_info *
  * @ubi: the UBI device description object
  */
-void __exit ubi_beb_close(struct ubi_info *ubi);
+void ubi_beb_close(struct ubi_info *ubi);
 
 /**
  * struct ubi_beb_info - UBI bad PEB handling unit description data
structure. Index: ubi-2.6/drivers/mtd/ubi/build.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/build.c	2007-01-22
22:04:01.001323909 +0100 +++ ubi-2.6/drivers/mtd/ubi/build.c
2007-01-22 22:31:17.656569330 +0100 @@ -123,7 +123,7 @@ out_io:
 	return err;
 }
 
-void __exit ubi_bld_detach_mtd_dev(struct ubi_info *ubi)
+void ubi_bld_detach_mtd_dev(struct ubi_info *ubi)
 {
 	int mtd_num = ubi->io->mtd_num, ubi_num = ubi->ubi_num;
 
Index: ubi-2.6/drivers/mtd/ubi/build.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/build.h	2007-01-22
22:04:03.569259855 +0100 +++ ubi-2.6/drivers/mtd/ubi/build.h
2007-01-22 22:31:29.300279826 +0100 @@ -59,6 +59,6 @@ int __init
ubi_bld_attach_mtd_dev(struct *
  * @ubi: the UBI device description object
  */
-void __exit ubi_bld_detach_mtd_dev(struct ubi_info *ubi);
+void ubi_bld_detach_mtd_dev(struct ubi_info *ubi);
 
 #endif /* __UBI_BUILD_H__ */
Index: ubi-2.6/drivers/mtd/ubi/cdev.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/cdev.c	2007-01-22
21:38:05.952867317 +0100 +++ ubi-2.6/drivers/mtd/ubi/cdev.c
2007-01-22 21:38:33.168168773 +0100 @@ -147,7 +147,7 @@ out_unreg:
 
 }
 
-void __exit ubi_cdev_close(const struct ubi_info *ubi)
+void ubi_cdev_close(const struct ubi_info *ubi)
 {
 	struct ubi_uif_info *uif = ubi->uif;
 	const struct ubi_acc_info *acc = ubi->acc;
Index: ubi-2.6/drivers/mtd/ubi/cdev.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/cdev.h	2007-01-22
21:38:07.980815259 +0100 +++ ubi-2.6/drivers/mtd/ubi/cdev.h
2007-01-22 21:38:55.307600642 +0100 @@ -79,6 +79,6 @@ int __init
ubi_cdev_init(struct ubi_info *
  * @ubi: the UBI device description object
  */
-void __exit ubi_cdev_close(const struct ubi_info *ubi);
+void ubi_cdev_close(const struct ubi_info *ubi);
 
 #endif /* !__UBI_CDEV_H__ */
Index: ubi-2.6/drivers/mtd/ubi/debug.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/debug.c	2007-01-22
22:04:09.517111495 +0100 +++ ubi-2.6/drivers/mtd/ubi/debug.c
2007-01-22 22:07:03.204780028 +0100 @@ -395,7 +395,7 @@ out:
 	return err;
 }
 
-void __exit ubi_dbg_close(void)
+void ubi_dbg_close(void)
 {
 	int i;
 
Index: ubi-2.6/drivers/mtd/ubi/debug.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/debug.h	2007-01-22
22:04:11.721056522 +0100 +++ ubi-2.6/drivers/mtd/ubi/debug.h
2007-01-22 22:07:15.472474158 +0100 @@ -236,7 +236,7 @@ int __init
ubi_dbg_init(void); /**
  * ubi_dbg_close - close the debugging unit.
  */
-void __exit ubi_dbg_close(void);
+void ubi_dbg_close(void);
 
 #else
 
Index: ubi-2.6/drivers/mtd/ubi/eba.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/eba.c	2007-01-22
21:52:45.254380503 +0100 +++ ubi-2.6/drivers/mtd/ubi/eba.c
2007-01-22 21:53:00.897981878 +0100 @@ -964,7 +964,7 @@ out:
 	return err;
 }
 
-void __exit ubi_eba_close(const struct ubi_info *ubi)
+void ubi_eba_close(const struct ubi_info *ubi)
 {
 	unsigned int i;
 	struct ubi_eba_info *eba = ubi->eba;
Index: ubi-2.6/drivers/mtd/ubi/eba.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/eba.h	2007-01-22
21:52:47.482323729 +0100 +++ ubi-2.6/drivers/mtd/ubi/eba.h
2007-01-22 21:53:12.677681743 +0100 @@ -280,7 +280,7 @@ int __init
ubi_eba_init_scan(struct ubi_ *
  * @ubi: the UBI device description object
  */
-void __exit ubi_eba_close(const struct ubi_info *ubi);
+void ubi_eba_close(const struct ubi_info *ubi);
 
 /**
  * struct ubi_eba_tbl_rec - a record in the eraseblock association
table. Index: ubi-2.6/drivers/mtd/ubi/io.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/io.c	2007-01-22
22:08:04.447253160 +0100 +++ ubi-2.6/drivers/mtd/ubi/io.c
2007-01-22 22:08:43.938268700 +0100 @@ -660,7 +660,7 @@ out_io:
 	return err;
 }
 
-void __exit ubi_io_close(const struct ubi_info *ubi)
+void ubi_io_close(const struct ubi_info *ubi)
 {
 	const struct ubi_io_info *io = ubi->io;
 
Index: ubi-2.6/drivers/mtd/ubi/io.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/io.h	2007-01-22
22:08:06.687197319 +0100 +++ ubi-2.6/drivers/mtd/ubi/io.h
2007-01-22 22:08:54.534004577 +0100 @@ -311,7 +311,7 @@ int __init
ubi_io_init(struct ubi_info * *
  * @ubi: the UBI device description object
  */
-void __exit ubi_io_close(const struct ubi_info *ubi);
+void ubi_io_close(const struct ubi_info *ubi);
 
 /**
  * struct ubi_io_info - UBI I/O unit description data structure.
Index: ubi-2.6/drivers/mtd/ubi/sysfs.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/sysfs.c	2007-01-22
21:36:24.911462322 +0100 +++ ubi-2.6/drivers/mtd/ubi/sysfs.c
2007-01-22 21:56:36.716487140 +0100 @@ -67,7 +67,7 @@ out:
  	return err;
 }
 
-void __exit ubi_sysfs_global_close(void)
+void ubi_sysfs_global_close(void)
 {
 	class_remove_file(ubi_class, &ubi_version);
 	class_destroy(ubi_class);
@@ -180,7 +180,7 @@ out:
 	return err;
 }
 
-void __exit ubi_sysfs_close(const struct ubi_info *ubi)
+void ubi_sysfs_close(const struct ubi_info *ubi)
 {
 	struct ubi_uif_info *uif = ubi->uif;
 
Index: ubi-2.6/drivers/mtd/ubi/sysfs.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/sysfs.h	2007-01-22
21:36:27.435397471 +0100 +++ ubi-2.6/drivers/mtd/ubi/sysfs.h
2007-01-22 21:56:47.780205688 +0100 @@ -64,7 +64,7 @@ int __init
ubi_sysfs_init(const struct u *
  * @ubi: the UBI device description object
  */
-void __exit ubi_sysfs_close(const struct ubi_info *ubi);
+void ubi_sysfs_close(const struct ubi_info *ubi);
 
 /**
  * ubi_sysfs_global_init - initialize UBI sysfs support.
@@ -77,6 +77,6 @@ int __init ubi_sysfs_global_init(void);
 /**
  * ubi_sysfs_global_close - close UBI sysfs support.
  */
-void __exit ubi_sysfs_global_close(void);
+void ubi_sysfs_global_close(void);
 
 #endif /* !__UBI_SYSFS_H__ */
Index: ubi-2.6/drivers/mtd/ubi/uif.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/uif.c	2007-01-22
21:54:19.959967956 +0100 +++ ubi-2.6/drivers/mtd/ubi/uif.c
2007-01-22 22:31:48.823794415 +0100 @@ -658,7 +658,7 @@ out_uif:
 	return err;
 }
 
-void __exit ubi_uif_close(const struct ubi_info *ubi)
+void ubi_uif_close(const struct ubi_info *ubi)
 {
 	struct ubi_uif_info *uif = ubi->uif;
 
@@ -676,7 +676,7 @@ int __init ubi_uif_global_init(void)
 	return ubi_sysfs_global_init();
 }
 
-void __exit ubi_uif_global_close(void)
+void ubi_uif_global_close(void)
 {
 	return ubi_sysfs_global_close();
 }
@@ -686,7 +686,7 @@ void __exit ubi_uif_global_close(void)
  *
  * @ubi: the UBI device description object
  */
-static void __exit delete_volumes(const struct ubi_info *ubi)
+static void delete_volumes(const struct ubi_info *ubi)
 {
 	struct ubi_uif_volume *vol, *vol_tmp;
 	struct ubi_uif_info *uif = ubi->uif;
Index: ubi-2.6/drivers/mtd/ubi/uif.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/uif.h	2007-01-22
21:54:22.551901953 +0100 +++ ubi-2.6/drivers/mtd/ubi/uif.h
2007-01-22 22:09:27.849174159 +0100 @@ -88,7 +88,7 @@ int __init
ubi_uif_init(struct ubi_info *
  * @ubi: the UBI device description object
  */
-void __exit ubi_uif_close(const struct ubi_info *ubi);
+void ubi_uif_close(const struct ubi_info *ubi);
 
 /**
  * ubi_uif_global_init - initialize the UBI user interface unit.
@@ -101,7 +101,7 @@ int __init ubi_uif_global_init(void);
 /**
  * ubi_uif_global_close - close the UBI user interface unit.
  */
-void __exit ubi_uif_global_close(void);
+void ubi_uif_global_close(void);
 
 /**
  * struct ubi_uif_volume - a per-volume user interface data structure.
Index: ubi-2.6/drivers/mtd/ubi/upd.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/upd.c	2007-01-22
21:46:25.144081152 +0100 +++ ubi-2.6/drivers/mtd/ubi/upd.c
2007-01-22 21:46:41.043674797 +0100 @@ -410,7 +410,7 @@ out_free_upd:
 	return err;
 }
 
-void __exit ubi_upd_close(const struct ubi_info *ubi)
+void ubi_upd_close(const struct ubi_info *ubi)
 {
 	dbg_upd("close the update unit");
 	ubi_kfree(ubi->upd->upd_buf);
Index: ubi-2.6/drivers/mtd/ubi/upd.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/upd.h	2007-01-22
21:46:28.160004069 +0100 +++ ubi-2.6/drivers/mtd/ubi/upd.h
2007-01-22 21:46:50.019445422 +0100 @@ -133,7 +133,7 @@ int __init
ubi_upd_init_scan(struct ubi_ *
  * @ubi: the UBI device description object
  */
-void __exit ubi_upd_close(const struct ubi_info *ubi);
+void ubi_upd_close(const struct ubi_info *ubi);
 
 /**
  * struct ubi_upd_info - UBI update unit description data structure.
Index: ubi-2.6/drivers/mtd/ubi/volmgmt.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/volmgmt.c	2007-01-22
21:43:30.880538427 +0100 +++ ubi-2.6/drivers/mtd/ubi/volmgmt.c
2007-01-22 21:44:13.319452333 +0100 @@ -276,7 +276,7 @@ out_vmt:
 	return err;
 }
 
-void __exit ubi_vmt_close(const struct ubi_info *ubi)
+void ubi_vmt_close(const struct ubi_info *ubi)
 {
 	dbg_vmt("close the volume management unit");
 	ubi_upd_close(ubi);
Index: ubi-2.6/drivers/mtd/ubi/volmgmt.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/volmgmt.h	2007-01-22
21:43:35.276425909 +0100 +++ ubi-2.6/drivers/mtd/ubi/volmgmt.h
2007-01-22 21:43:56.315887440 +0100 @@ -115,7 +115,7 @@ int __init
ubi_vmt_init_scan(struct ubi_ *
  * @ubi: the UBI device description object
  */
-void __exit ubi_vmt_close(const struct ubi_info *ubi);
+void ubi_vmt_close(const struct ubi_info *ubi);
 
 /**
  * struct ubi_vmt_info - volume management unit description data
Index: ubi-2.6/drivers/mtd/ubi/vtbl.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/vtbl.c	2007-01-22
21:47:17.914732665 +0100 +++ ubi-2.6/drivers/mtd/ubi/vtbl.c
2007-01-22 22:33:08.669809365 +0100 @@ -235,7 +235,7 @@ process_lvol
(const struct ubi_info *ubi, static int __init check_scanning_info
(const struct ubi_info *ubi, struct ubi_scan_info *si);
 
-static void __exit free_volume_info(const struct ubi_info *ubi);
+static void free_volume_info(const struct ubi_info *ubi);
 
 static void __init init_ivols(struct ubi_info *ubi);
 
@@ -354,7 +354,7 @@ out:
 	return err;
 }
 
-void __exit ubi_vtbl_close(const struct ubi_info *ubi)
+void ubi_vtbl_close(const struct ubi_info *ubi)
 {
 	dbg_vtbl("close the volume table unit");
 	free_volume_info(ubi);
@@ -933,7 +933,7 @@ static int __init init_ram_vt(const stru
  *
  * @ubi: the UBI device description object
  */
-static void __exit free_volume_info(const struct ubi_info *ubi)
+static void free_volume_info(const struct ubi_info *ubi)
 {
 	int i;
 
Index: ubi-2.6/drivers/mtd/ubi/vtbl.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/vtbl.h	2007-01-22
21:47:20.682661950 +0100 +++ ubi-2.6/drivers/mtd/ubi/vtbl.h
2007-01-22 21:47:36.310262726 +0100 @@ -213,7 +213,7 @@ int __init
ubi_vtbl_init_scan(struct ubi *
  * @ubi: the UBI device description object
  */
-void __exit ubi_vtbl_close(const struct ubi_info *ubi);
+void ubi_vtbl_close(const struct ubi_info *ubi);
 
 /**
  * struct ubi_vtbl_vtr - in-memory representation of volume table
records. Index: ubi-2.6/drivers/mtd/ubi/wl.c
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/wl.c	2007-01-22
21:48:01.305624297 +0100 +++ ubi-2.6/drivers/mtd/ubi/wl.c
2007-01-22 22:33:38.537062899 +0100 @@ -336,7 +336,7 @@ int
ubi_wl_erase_flush(const struct ubi_ return 0;
 }
 
-static void __exit tree_destroy(struct rb_root *root);
+static void tree_destroy(struct rb_root *root);
 
 int __init ubi_wl_init_scan(struct ubi_info *ubi, struct ubi_scan_info
*si) {
@@ -473,9 +473,9 @@ out_free:
 	return err;
 }
 
-static void __exit protection_trees_destroy(struct ubi_wl_info *wl);
+static void protection_trees_destroy(struct ubi_wl_info *wl);
 
-void __exit ubi_wl_close(struct ubi_info *ubi)
+void ubi_wl_close(struct ubi_info *ubi)
 {
 	struct ubi_wl_info *wl = ubi->wl;
 
@@ -1589,7 +1589,7 @@ static int in_wl_tree(struct ubi_wl_entr
  *
  * @root: the root of the tree to destroy
  */
-static void __exit tree_destroy(struct rb_root *root)
+static void tree_destroy(struct rb_root *root)
 {
 	struct rb_node *rb;
 	struct ubi_wl_entry *e;
@@ -1621,7 +1621,7 @@ static void __exit tree_destroy(struct r
  *
  * @wl: the wear-leveling unit description data structure
  */
-static void __exit protection_trees_destroy(struct ubi_wl_info *wl)
+static void protection_trees_destroy(struct ubi_wl_info *wl)
 {
 	struct rb_node *rb;
 	struct ubi_wl_prot_entry *pe;
Index: ubi-2.6/drivers/mtd/ubi/wl.h
===================================================================
--- ubi-2.6.orig/drivers/mtd/ubi/wl.h	2007-01-22
21:48:03.333572505 +0100 +++ ubi-2.6/drivers/mtd/ubi/wl.h
2007-01-22 21:48:22.869073629 +0100 @@ -154,7 +154,7 @@ int __init
ubi_wl_init_scan(struct ubi_i *
  * @ubi: the UBI device description object
  */
-void __exit ubi_wl_close(struct ubi_info *ubi);
+void ubi_wl_close(struct ubi_info *ubi);
 
 /**
  * struct ubi_wl_entry - a wear-leveling entry.
