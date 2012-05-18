Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKyH-0005YM-JE
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:47 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: =?utf-8?q?=5BPATCH=2021/22=5D=20UBI=3A=20remove=20scan=2Eh?=
Date: Fri, 18 May 2012 14:04:04 +0300
Message-Id: <1337339045-8199-22-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
References: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This file is small and it does not make sense to have it separate from where
everything else lives, so merge it with ubi.h.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/scan.h |  173 ------------------------------------------------
 drivers/mtd/ubi/ubi.h  |  148 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 147 insertions(+), 174 deletions(-)
 delete mode 100644 drivers/mtd/ubi/scan.h

diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
deleted file mode 100644
index cd1f8cd..0000000
--- a/drivers/mtd/ubi/scan.h
+++ /dev/null
@@ -1,173 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2006
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
- *
- * Author: Artem Bityutskiy (Битюцкий Артём)
- */
-
-#ifndef __UBI_SCAN_H__
-#define __UBI_SCAN_H__
-
-/*
- * When a field of the attaching information has this value - its real value is
- * unknown.
- */
-#define UBI_AINF_UNKNOWN (-1)
-
-/**
- * struct ubi_ainf_peb - attach information about a physical eraseblock.
- * @ec: erase counter (%UBI_AINF_UNKNOWN if it is unknown)
- * @pnum: physical eraseblock number
- * @lnum: logical eraseblock number
- * @scrub: if this physical eraseblock needs scrubbing
- * @copy_flag: this LEB is a copy (@copy_flag is set in VID header of this LEB)
- * @sqnum: sequence number
- * @u: unions RB-tree or @list links
- * @u.rb: link in the per-volume RB-tree of &struct ubi_ainf_peb objects
- * @u.list: link in one of the eraseblock lists
- *
- * One object of this type is allocated for each physical eraseblock when
- * attaching an MTD device.
- */
-struct ubi_ainf_peb {
-	int ec;
-	int pnum;
-	int lnum;
-	unsigned int scrub:1;
-	unsigned int copy_flag:1;
-	unsigned long long sqnum;
-	union {
-		struct rb_node rb;
-		struct list_head list;
-	} u;
-};
-
-/**
- * struct ubi_ainf_volume - attaching information about a volume.
- * @vol_id: volume ID
- * @highest_lnum: highest logical eraseblock number in this volume
- * @leb_count: number of logical eraseblocks in this volume
- * @vol_type: volume type
- * @used_ebs: number of used logical eraseblocks in this volume (only for
- *            static volumes)
- * @last_data_size: amount of data in the last logical eraseblock of this
- *                  volume (always equivalent to the usable logical eraseblock
- *                  size in case of dynamic volumes)
- * @data_pad: how many bytes at the end of logical eraseblocks of this volume
- *            are not used (due to volume alignment)
- * @compat: compatibility flags of this volume
- * @rb: link in the volume RB-tree
- * @root: root of the RB-tree containing all the eraseblock belonging to this
- *        volume (&struct ubi_ainf_peb objects)
- *
- * One object of this type is allocated for each volume when attaching an MTD
- * device.
- */
-struct ubi_ainf_volume {
-	int vol_id;
-	int highest_lnum;
-	int leb_count;
-	int vol_type;
-	int used_ebs;
-	int last_data_size;
-	int data_pad;
-	int compat;
-	struct rb_node rb;
-	struct rb_root root;
-};
-
-/**
- * struct ubi_attach_info - MTD device attaching information.
- * @volumes: root of the volume RB-tree
- * @corr: list of corrupted physical eraseblocks
- * @free: list of free physical eraseblocks
- * @erase: list of physical eraseblocks which have to be erased
- * @alien: list of physical eraseblocks which should not be used by UBI (e.g.,
- *         those belonging to "preserve"-compatible internal volumes)
- * @corr_peb_count: count of PEBs in the @corr list
- * @empty_peb_count: count of PEBs which are presumably empty (contain only
- *                   0xFF bytes)
- * @alien_peb_count: count of PEBs in the @alien list
- * @bad_peb_count: count of bad physical eraseblocks
- * @maybe_bad_peb_count: count of bad physical eraseblocks which are not marked
- *                       as bad yet, but which look like bad
- * @vols_found: number of volumes found
- * @highest_vol_id: highest volume ID
- * @is_empty: flag indicating whether the MTD device is empty or not
- * @min_ec: lowest erase counter value
- * @max_ec: highest erase counter value
- * @max_sqnum: highest sequence number value
- * @mean_ec: mean erase counter value
- * @ec_sum: a temporary variable used when calculating @mean_ec
- * @ec_count: a temporary variable used when calculating @mean_ec
- * @aeb_slab_cache: slab cache for &struct ubi_ainf_peb objects
- *
- * This data structure contains the result of attaching an MTD device and may
- * be used by other UBI sub-systems to build final UBI data structures, further
- * error-recovery and so on.
- */
-struct ubi_attach_info {
-	struct rb_root volumes;
-	struct list_head corr;
-	struct list_head free;
-	struct list_head erase;
-	struct list_head alien;
-	int corr_peb_count;
-	int empty_peb_count;
-	int alien_peb_count;
-	int bad_peb_count;
-	int maybe_bad_peb_count;
-	int vols_found;
-	int highest_vol_id;
-	int is_empty;
-	int min_ec;
-	int max_ec;
-	unsigned long long max_sqnum;
-	int mean_ec;
-	uint64_t ec_sum;
-	int ec_count;
-	struct kmem_cache *aeb_slab_cache;
-};
-
-struct ubi_device;
-struct ubi_vid_hdr;
-
-/*
- * ubi_move_aeb_to_list - move a PEB from the volume tree to a list.
- *
- * @av: volume attaching information
- * @aeb: attaching eraseblock information
- * @list: the list to move to
- */
-static inline void ubi_move_aeb_to_list(struct ubi_ainf_volume *av,
-					 struct ubi_ainf_peb *aeb,
-					 struct list_head *list)
-{
-		rb_erase(&aeb->u.rb, &av->root);
-		list_add_tail(&aeb->u.list, list);
-}
-
-int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
-		  int ec, const struct ubi_vid_hdr *vid_hdr, int bitflips);
-struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
-				    int vol_id);
-void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
-struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_device *ubi,
-				       struct ubi_attach_info *ai);
-int ubi_attach(struct ubi_device *ubi);
-void ubi_destroy_ai(struct ubi_attach_info *ai);
-
-#endif /* !__UBI_SCAN_H__ */
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index e09e558..807d539 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -43,7 +43,6 @@
 #include <asm/pgtable.h>
 
 #include "ubi-media.h"
-#include "scan.h"
 
 /* Maximum number of supported UBI devices */
 #define UBI_MAX_DEVICES 32
@@ -83,6 +82,12 @@
 #define UBI_PROT_QUEUE_LEN 10
 
 /*
+ * When a field of the attaching information has this value - its real value is
+ * unknown.
+ */
+#define UBI_AINF_UNKNOWN -1
+
+/*
  * Error codes returned by the I/O sub-system.
  *
  * UBI_IO_FF: the read region of flash contains only 0xFFs
@@ -474,6 +479,121 @@ struct ubi_device {
 	struct ubi_debug_info *dbg;
 };
 
+/**
+ * struct ubi_ainf_peb - attach information about a physical eraseblock.
+ * @ec: erase counter (%UBI_AINF_UNKNOWN if it is unknown)
+ * @pnum: physical eraseblock number
+ * @lnum: logical eraseblock number
+ * @scrub: if this physical eraseblock needs scrubbing
+ * @copy_flag: this LEB is a copy (@copy_flag is set in VID header of this LEB)
+ * @sqnum: sequence number
+ * @u: unions RB-tree or @list links
+ * @u.rb: link in the per-volume RB-tree of &struct ubi_ainf_peb objects
+ * @u.list: link in one of the eraseblock lists
+ *
+ * One object of this type is allocated for each physical eraseblock when
+ * attaching an MTD device.
+ */
+struct ubi_ainf_peb {
+	int ec;
+	int pnum;
+	int lnum;
+	unsigned int scrub:1;
+	unsigned int copy_flag:1;
+	unsigned long long sqnum;
+	union {
+		struct rb_node rb;
+		struct list_head list;
+	} u;
+};
+
+/**
+ * struct ubi_ainf_volume - attaching information about a volume.
+ * @vol_id: volume ID
+ * @highest_lnum: highest logical eraseblock number in this volume
+ * @leb_count: number of logical eraseblocks in this volume
+ * @vol_type: volume type
+ * @used_ebs: number of used logical eraseblocks in this volume (only for
+ *            static volumes)
+ * @last_data_size: amount of data in the last logical eraseblock of this
+ *                  volume (always equivalent to the usable logical eraseblock
+ *                  size in case of dynamic volumes)
+ * @data_pad: how many bytes at the end of logical eraseblocks of this volume
+ *            are not used (due to volume alignment)
+ * @compat: compatibility flags of this volume
+ * @rb: link in the volume RB-tree
+ * @root: root of the RB-tree containing all the eraseblock belonging to this
+ *        volume (&struct ubi_ainf_peb objects)
+ *
+ * One object of this type is allocated for each volume when attaching an MTD
+ * device.
+ */
+struct ubi_ainf_volume {
+	int vol_id;
+	int highest_lnum;
+	int leb_count;
+	int vol_type;
+	int used_ebs;
+	int last_data_size;
+	int data_pad;
+	int compat;
+	struct rb_node rb;
+	struct rb_root root;
+};
+
+/**
+ * struct ubi_attach_info - MTD device attaching information.
+ * @volumes: root of the volume RB-tree
+ * @corr: list of corrupted physical eraseblocks
+ * @free: list of free physical eraseblocks
+ * @erase: list of physical eraseblocks which have to be erased
+ * @alien: list of physical eraseblocks which should not be used by UBI (e.g.,
+ *         those belonging to "preserve"-compatible internal volumes)
+ * @corr_peb_count: count of PEBs in the @corr list
+ * @empty_peb_count: count of PEBs which are presumably empty (contain only
+ *                   0xFF bytes)
+ * @alien_peb_count: count of PEBs in the @alien list
+ * @bad_peb_count: count of bad physical eraseblocks
+ * @maybe_bad_peb_count: count of bad physical eraseblocks which are not marked
+ *                       as bad yet, but which look like bad
+ * @vols_found: number of volumes found
+ * @highest_vol_id: highest volume ID
+ * @is_empty: flag indicating whether the MTD device is empty or not
+ * @min_ec: lowest erase counter value
+ * @max_ec: highest erase counter value
+ * @max_sqnum: highest sequence number value
+ * @mean_ec: mean erase counter value
+ * @ec_sum: a temporary variable used when calculating @mean_ec
+ * @ec_count: a temporary variable used when calculating @mean_ec
+ * @aeb_slab_cache: slab cache for &struct ubi_ainf_peb objects
+ *
+ * This data structure contains the result of attaching an MTD device and may
+ * be used by other UBI sub-systems to build final UBI data structures, further
+ * error-recovery and so on.
+ */
+struct ubi_attach_info {
+	struct rb_root volumes;
+	struct list_head corr;
+	struct list_head free;
+	struct list_head erase;
+	struct list_head alien;
+	int corr_peb_count;
+	int empty_peb_count;
+	int alien_peb_count;
+	int bad_peb_count;
+	int maybe_bad_peb_count;
+	int vols_found;
+	int highest_vol_id;
+	int is_empty;
+	int min_ec;
+	int max_ec;
+	unsigned long long max_sqnum;
+	int mean_ec;
+	uint64_t ec_sum;
+	int ec_count;
+	struct kmem_cache *aeb_slab_cache;
+};
+
 #include "debug.h"
 
 extern struct kmem_cache *ubi_wl_entry_slab;
@@ -484,6 +604,17 @@ extern struct class *ubi_class;
 extern struct mutex ubi_devices_mutex;
 extern struct blocking_notifier_head ubi_notifiers;
 
+/* scan.c */
+int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
+		  int ec, const struct ubi_vid_hdr *vid_hdr, int bitflips);
+struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
+				    int vol_id);
+void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
+struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_device *ubi,
+				       struct ubi_attach_info *ai);
+int ubi_attach(struct ubi_device *ubi);
+void ubi_destroy_ai(struct ubi_attach_info *ai);
+
 /* vtbl.c */
 int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 			   struct ubi_vtbl_record *vtbl_rec);
@@ -590,6 +721,21 @@ void ubi_do_get_volume_info(struct ubi_device *ubi, struct ubi_volume *vol,
 	     rb = rb_next(rb),                                               \
 	     pos = (rb ? container_of(rb, typeof(*pos), member) : NULL))
 
+/*
+ * ubi_move_aeb_to_list - move a PEB from the volume tree to a list.
+ *
+ * @av: volume attaching information
+ * @aeb: attaching eraseblock information
+ * @list: the list to move to
+ */
+static inline void ubi_move_aeb_to_list(struct ubi_ainf_volume *av,
+					 struct ubi_ainf_peb *aeb,
+					 struct list_head *list)
+{
+		rb_erase(&aeb->u.rb, &av->root);
+		list_add_tail(&aeb->u.list, list);
+}
+
 /**
  * ubi_zalloc_vid_hdr - allocate a volume identifier header object.
  * @ubi: UBI device description object
-- 
1.7.10
