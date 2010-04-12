Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1F7f-0005DE-BE
	for linux-mtd@lists.infradead.org; Mon, 12 Apr 2010 08:36:02 +0000
Received: by pvc30 with SMTP id 30so2685072pvc.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Apr 2010 01:35:57 -0700 (PDT)
MIME-Version: 1.0
Sender: brijesh.s.singh@gmail.com
Date: Mon, 12 Apr 2010 14:05:57 +0530
Message-ID: <q2p6b5362aa1004120135l28e57df1kc51c284620ca0033@mail.gmail.com>
Subject: PATCH 1/7] ubi: logging feature for ubi
From: Brijesh Singh <brij.singh@samsung.com>
To: Artem.Bityutskiy@nokia.com, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: brijesh.s.singh@gmail.com, rohitvdongre@gmail.com,
	linux-mtd@lists.infradead.org, rohit.dongre@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
    I am sending the patches that add logging support to UBI.

Thanks and Regards,
Brijesh


Note: Media headers and in ram structures files for ubi logging functionality

Signed-off-by: brijesh singh <brij.singh@samsung.com>
---
--- ubi_old/drivers/mtd/ubi/ubi.h	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/ubi.h	2010-04-09 21:54:02.645580870 +0530
@@ -39,6 +39,9 @@
 #include <linux/notifier.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/ubi.h>
+#ifdef CONFIG_MTD_UBI_LOGGED
+#include <linux/crc32.h>
+#endif

 #include "ubi-media.h"
 #include "scan.h"
@@ -81,6 +84,80 @@
  */
 #define UBI_PROT_QUEUE_LEN 10

+
+#ifdef CONFIG_MTD_UBI_LOGGED
+/*
+ * ubi maintains two copies of super block.
+ * UBI_SB_RESRVD_BUDS: number of reserved buds for sb
+ * UBI_CMT_BUDS_RESRVD: number of reserved buds for cmt.
+ *
+ */
+#define UBIL_SB_BUDS_RESRVD 2
+#define UBIL_CMT_COPIES 2
+
+/*
+ * If ubi has added anything to log after commit, commit is dirty.
+ * If nothing is written to log, commit is not needed.
+ * 0: commit is dirty
+ * 1: commit is clean
+ */
+enum{
+	C_DIRTY = 0,
+	C_CLEAN
+};
+
+/*
+ * Commit status.
+ * 0: not commiting.
+ * 1: commit started
+ * 2: commit Writing
+ * 3: commit finished
+ * 4: commit failed
+ */
+enum{
+	C_FREE = 0,
+	C_STARTED,
+	C_WRITING,
+	C_FINISHED,
+	C_FAILED
+};
+
+/*
+ * error code for node validation.
+ * 100: node is empty, all 0xff
+ * 101: node has bad hdr, error in crc
+ * 102: node has bad data, error data crc
+ * 103: bud is full
+ */
+
+enum {
+	UBIL_NODE_EMPTY = 100,
+	UBIL_NODE_BAD_HDR,
+	UBIL_NODE_BAD_DATA,
+	UBIL_BUD_FULL
+};
+
+/*
+ *  status code in log and commit subsystem.
+ *  1: peb has gone bad
+ *  2: peb needs correction
+ *  3: peb is used
+ *  4: peb is used as special peb. for sb, cmt or ebal
+ *  5: peb is free
+ *  6: peb is pending for erase
+ */
+
+enum {
+	UBIL_PEB_BAD = 1,
+	UBIL_PEB_CORR,
+	UBIL_PEB_USED,
+	UBIL_PEB_USED_SP,
+	UBIL_PEB_FREE,
+	UBIL_PEB_ERASE_PENDING
+};
+
+#endif
+
 /*
  * Error codes returned by the I/O sub-system.
  *
@@ -288,6 +365,24 @@

 struct ubi_wl_entry;

+#ifdef CONFIG_MTD_UBI_LOGGED
+#ifdef CONFIG_MTD_UBIL_COMPR
+/**
+ * struct ubi_compressor - UBI compressor description structure.
+ * @compr_type: compressor type (%UBIFS_COMPR_LZO, etc)
+ * @cc: cryptoapi compressor handle
+ * @name: compressor name
+ * @capi_name: cryptoapi compressor name
+ */
+struct ubi_compressor {
+	int compr_type;
+	struct crypto_comp *cc;
+	const char *name;
+	const char *capi_name;
+};
+#endif
+#endif
+
 /**
  * struct ubi_device - UBI device description structure
  * @dev: UBI device object to use the the Linux device model
@@ -330,12 +425,13 @@
  * @erroneous: RB-tree of erroneous used physical eraseblocks
  * @free: RB-tree of free physical eraseblocks
  * @scrub: RB-tree of physical eraseblocks which need scrubbing
+ * @resvd: RB-tree of physical eraseblocks reserved for cmt or sb or el
  * @pq: protection queue (contain physical eraseblocks which are temporarily
  *      protected from the wear-leveling worker)
  * @pq_head: protection queue head
  * @wl_lock: protects the @used, @free, @pq, @pq_head, @lookuptbl, @move_from,
- * 	     @move_to, @move_to_put @erase_pending, @wl_scheduled, @works,
- * 	     @erroneous, and @erroneous_peb_count fields
+ *	     @move_to, @move_to_put @erase_pending, @wl_scheduled, @works,
+ *	     @erroneous, and @erroneous_peb_count fields
  * @move_mutex: serializes eraseblock moves
  * @work_sem: synchronizes the WL worker with use tasks
  * @wl_scheduled: non-zero if the wear-leveling was scheduled
@@ -375,7 +471,37 @@
  *               not
  * @nor_flash: non-zero if working on top of NOR flash
  * @mtd: MTD device descriptor
- *
+ * --  ubil variables start here --
+ * @peb_lookup: array of peb info. each peb has one entry in this array
+ * @bud_start_offset: offset from where data can be written to bud
+ * @bud_usable_len: usable bud len. This is bud len - bud hdr len
+ * @bud_max_nodes: how many nodes can fit in bud
+ * @node_size: node size. usually it is write size
+ * @sb_node: one inram copy of sb node is always maintained.
+ * @sb_lock: lock protecting sb node
+ * @sb_sqnum: sequence number for sb
+ * @sb_buds: array of sb buds
+ * @sb_active_bud: the bud which is active.
+ * sb is written alternatively in each node.
+ * @sb_mutex: mutex protecting sb log
+ * @sb_offset: corrent log offset
+ * @sb_needs_rcvry: when sb has a flip or bad data recovery is set
+ * @el_mutex: mutex protecting el log.
+ * @el_buds: array of el buds
+ * @el_reservd_buds: how many buds are reserved for el
+ * @el_active_bud: where in el is corrent el
+ * @el_offset: corrent offset in corrent bud
+ * @el_pebs_in_grp: no of pebs in el group.
+ * @el_no_of_grps: no of groups for entire partition
+ * @c_buds: array of cmt buds
+ * @c_reservd_buds: array of buffer reserved buds
+ * @c_previous_status: last commit operation status
+ * @c_max_no_of_rec: maximum commit bud entries
+ * @c_max_data_size: maximum data commit bud contain
+ * @c_dirty: flag invalidating last commit
+ * @schedule_cmt: flag to schedule commit operation
+ * @cmt_lock: lock protecting commit data
+ * @c_status: status of commit operation in progress
  * @peb_buf1: a buffer of PEB size used for different purposes
  * @peb_buf2: another buffer of PEB size used for different purposes
  * @buf_mutex: protects @peb_buf1 and @peb_buf2
@@ -420,6 +546,9 @@
 	struct rb_root erroneous;
 	struct rb_root free;
 	struct rb_root scrub;
+#ifdef CONFIG_MTD_UBI_LOGGED
+	struct rb_root resvd;
+#endif
 	struct list_head pq[UBI_PROT_QUEUE_LEN];
 	int pq_head;
 	spinlock_t wl_lock;
@@ -450,15 +579,56 @@
 	int ro_mode;
 	int leb_size;
 	int leb_start;
+#ifndef CONFIG_MTD_UBI_LOGGED
 	int ec_hdr_alsize;
 	int vid_hdr_alsize;
 	int vid_hdr_offset;
 	int vid_hdr_aloffset;
 	int vid_hdr_shift;
+#endif
 	unsigned int bad_allowed:1;
 	unsigned int nor_flash:1;
 	struct mtd_info *mtd;

+#ifdef CONFIG_MTD_UBI_LOGGED
+	struct peb_info *peb_lookup;
+	int bud_start_offset;
+	int bud_usable_len;
+	int node_size;
+
+	/* sb */
+	struct ubi_sb *sb_node;
+	spinlock_t sb_lock;
+	unsigned long long sb_sqnum;
+	int sb_buds[UBIL_SB_BUDS_RESRVD];
+	int sb_active_bud;
+	struct mutex sb_mutex;
+	int sb_offset;
+	int sb_needs_rcvry;
+
+	/* el */
+	struct mutex el_mutex;
+	int *el_buds;
+	int el_reservd_buds;
+	int el_active_bud;
+	int el_offset;
+	int el_pebs_in_grp;
+	int el_no_of_grps;
+
+	/* cmt */
+	int *c_buds;
+	int c_reservd_buds;
+	int c_previous_status;
+	int c_max_no_of_rec;
+	int c_max_data_size;
+	int c_dirty;
+	int schedule_cmt;
+	spinlock_t cmt_lock;
+	int c_status;
+#ifdef CONFIG_MTD_UBIL_COMPR
+	struct ubi_compressor *compr;
+#endif
+#endif
 	void *peb_buf1;
 	void *peb_buf2;
 	struct mutex buf_mutex;
@@ -483,6 +653,10 @@
 int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
 			    struct list_head *rename_list);
 int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_scan_info *si);
+#ifdef CONFIG_MTD_UBI_LOGGED
+int ubi_vtbl_create_dflt_volume_table(struct ubi_device *ubi);
+int ubi_vtbl_create_dflt_image(struct ubi_device *ubi, int copy, int pnum);
+#endif

 /* vmt.c */
 int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req);
@@ -523,6 +697,10 @@
 int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		     struct ubi_vid_hdr *vid_hdr);
 int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si);
+#ifdef CONFIG_MTD_UBI_LOGGED
+int ubi_eba_leb_to_peb(struct ubi_device *ubi, struct ubi_volume *vol,
+		      int lnum);
+#endif

 /* wl.c */
 int ubi_wl_get_peb(struct ubi_device *ubi, int dtype);
@@ -541,17 +719,75 @@
 int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture);
 int ubi_io_is_bad(const struct ubi_device *ubi, int pnum);
 int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum);
+#ifndef CONFIG_MTD_UBI_LOGGED
 int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		       struct ubi_ec_hdr *ec_hdr, int verbose);
 int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 			struct ubi_ec_hdr *ec_hdr);
 int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			struct ubi_vid_hdr *vid_hdr, int verbose);
+#endif
 int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 			 struct ubi_vid_hdr *vid_hdr);
+#ifdef CONFIG_MTD_UBI_LOGGED
+int ubi_read_node(struct ubi_device *ubi, struct node_t *node, int pnum,
+			int offset, int len);
+int ubi_write_node(struct ubi_device *ubi, struct node_t *node, int pnum,
+			int offset, int len);
+
+/* super.c */
+struct ubi_sb *ubi_sb_get_node(struct ubi_device *ubi);
+void ubi_sb_put_node(struct ubi_device *ubi);
+int ubi_sb_sync_node(struct ubi_device *ubi);
+int ubi_get_sb(struct ubi_device *ubi);
+int ubi_sb_init(struct ubi_device *ubi);
+int ubi_sb_create_dflt(struct ubi_device *ubi, int copy, int pnum);
+int ubi_sb_close(struct ubi_device *ubi);
+
+/* el.c */
+int ubi_el_read_ec_hdr(struct ubi_device *ubi, int pnum);
+int ubi_el_write_ec_hdr(struct ubi_device *ubi, int pnum, int ec);
+int ubi_el_write_ec_hdr_no_sync(struct ubi_device *ubi, int pnum, int ec);
+int ubi_el_mark_pending(struct ubi_device *ubi, int pnum);
+int ubi_el_read_vid_hdr(struct ubi_device *ubi, int pnum,
+			struct ubi_vid_hdr *vid_hdr, int verbose);
+int ubi_el_write_vid_hdr(struct ubi_device *ubi, int pnum,
+			 struct ubi_vid_hdr *vid_hdr);
+int  ubi_el_init(struct ubi_device *ubi);
+void  ubi_el_close(struct ubi_device *ubi);
+int  ubi_el_scan(struct ubi_device *ubi);
+int  ubi_el_create_dflt(struct ubi_device *ubi, int copy, int pnum);
+
+/* commit.c */
+
+int ubi_ensure_cmt(struct ubi_device *ubi);
+void ubi_schedule_cmt(struct ubi_device *ubi);
+int ubi_cmt_progress(struct ubi_device *ubi);
+int ubi_cmt_init(struct ubi_device *ubi);
+int ubi_cmt_ubinize_write(struct ubi_device *ubi);
+int ubi_cmt_read(struct ubi_device *ubi);
+int ubi_cmt_sb_init(struct ubi_device *ubi);
+#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+int paranoid_check_special(struct ubi_device *ubi, int in_pnum);
+int paranoid_check_reservd_status(struct ubi_device *ubi);
+#else
+#define paronoid_check_special(ubi, in_pnum) 0
+#define paronoid_check_reservd_status(ubi) 0
+#endif
+int ubi_cmt_close(struct ubi_device *ubi);
+int ubi_cmt(struct ubi_device *ubi);
+int ubi_cmt_put_resvd_peb(struct ubi_device *ubi);
+
+
+#endif

 /* build.c */
+
+#ifdef CONFIG_MTD_UBI_LOGGED
+int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int ubinize);
+#else
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset);
+#endif
 int ubi_detach_mtd_dev(int ubi_num, int anyway);
 struct ubi_device *ubi_get_device(int ubi_num);
 void ubi_put_device(struct ubi_device *ubi);
@@ -595,8 +831,11 @@
 ubi_zalloc_vid_hdr(const struct ubi_device *ubi, gfp_t gfp_flags)
 {
 	void *vid_hdr;
-
+#ifndef CONFIG_MTD_UBI_LOGGED
 	vid_hdr = kzalloc(ubi->vid_hdr_alsize, gfp_flags);
+#else
+	vid_hdr = kzalloc(sizeof(struct ubi_vid_hdr), gfp_flags);
+#endif
 	if (!vid_hdr)
 		return NULL;

@@ -604,7 +843,12 @@
 	 * VID headers may be stored at un-aligned flash offsets, so we shift
 	 * the pointer.
 	 */
+
+#ifndef CONFIG_MTD_UBI_LOGGED
 	return vid_hdr + ubi->vid_hdr_shift;
+#else
+	return vid_hdr;
+#endif
 }

 /**
@@ -620,7 +864,11 @@
 	if (!p)
 		return;

+#ifndef CONFIG_MTD_UBI_LOGGED
 	kfree(p - ubi->vid_hdr_shift);
+#else
+	kfree(p);
+#endif
 }

 /*
@@ -685,4 +933,115 @@
 		return idx;
 }

+#ifdef CONFIG_MTD_UBI_LOGGED
+
+/*
+ *  alloc_nodes - allocate nodes
+ *  @ubi: ubi decription object
+ *  @nodes: no of nodes
+ *  returns NULL for failure else ptr.
+ */
+static inline void *alloc_nodes(struct ubi_device *ubi, int nodes)
+{
+	return kmalloc(ubi->node_size * nodes, GFP_KERNEL);
+}
+
+/*
+ *  free_nodes - free nodes
+ *  @p: node pointer
+ */
+static inline void free_nodes(void *p)
+{
+	kfree(p);
+}
+
+#define node2lnode(f) (&f->lh)
+
+/**
+ * check_pattern - check if buffer contains only a certain byte pattern.
+ * @buf: buffer to check
+ * @patt: the pattern to check
+ * @size: buffer size in bytes
+ *
+ * This function returns %1 in there are only @patt bytes in @buf, and %0 if
+ * something else was also found.
+ */
+static inline int check_pattern(const void *buf, uint8_t patt, int size)
+{
+	int i;
+
+	for (i = 0; i < size; i++)
+		if (((const uint8_t *)buf)[i] != patt)
+			return 0;
+	return 1;
+}
+
+/**
+ * verify_node - verify node header
+ * @ubi_device: UBI device description object
+ * @lh: node to verify
+ * @type: expected type of node.
+ *
+ * this function verifies the consistency of a generic node.
+ * node_type is validated against passed value.
+ *
+ * returns 0 on success, error code on failure.
+ */
+static inline int verify_node(struct ubi_device *ubi,
+				struct node_t *lh, int type) {
+	int data_size, node_type;
+	int magic, crc, stored_crc;
+
+	magic = be32_to_cpu(lh->magic);
+	if (magic != UBIL_NODE_MAGIC) {
+		/* bad magic. Check for all 0xFF pattern i.e. empty node.*/
+		if (check_pattern(lh, 0xFF, ubi->node_size)) {
+			/* the physical eraseblock is supposedly empty */
+			return UBIL_NODE_EMPTY;
+		}
+
+		/* this is not a valid node. */
+		ubi_err("bad magic in node");
+		return UBIL_NODE_BAD_HDR;
+	}
+
+	/* check node type */
+	node_type =  be32_to_cpu(lh->node_type);
+	if (node_type != type) {
+		ubi_err("bad node type");
+		return -EBADMSG;
+	}
+
+
+	/* validate header crc */
+	stored_crc = be32_to_cpu(lh->hdr_crc);
+	crc = crc32(UBI_CRC32_INIT, lh, UBIL_NODE_SIZE_CRC);
+
+	if (stored_crc != crc) {
+		ubi_err("bad header crc");
+		dbg_bld("crc error: stored %d calculated %d", stored_crc, crc);
+		return UBIL_NODE_BAD_HDR;
+	}
+
+
+	/* validate data crc */
+	data_size = be32_to_cpu(lh->data_size);
+	if (data_size > ubi->node_size) {
+		ubi_err("bad data size");
+		return -EBADMSG;
+	}
+
+	/* check for data crc */
+	stored_crc = be32_to_cpu(lh->data_crc);
+	crc = crc32(UBI_CRC32_INIT, lh->data, data_size);
+
+	if (crc != stored_crc) {
+		ubi_err("bad data crc");
+		dbg_bld("crc error: stored %d calculated %d", stored_crc, crc);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+#endif	/* ! CONFIG_MTD_UBI_LOGGED */
 #endif /* !__UBI_UBI_H__ */
--- ubi-2.6/include/mtd/ubi-user.h	2010-04-11 13:19:21.516404100 +0530
+++ myubi-2.6/include/mtd/ubi-user.h	2010-04-11 13:17:44.063914743 +0530
@@ -209,6 +209,9 @@
 	UBI_LONGTERM  = 1,
 	UBI_SHORTTERM = 2,
 	UBI_UNKNOWN   = 3,
+#ifdef CONFIG_MTD_UBI_LOGGED
+	UBIL_RESVD    = 4,
+#endif
 };

 /*
@@ -237,6 +240,7 @@
  * @ubi_num: UBI device number to create
  * @mtd_num: MTD device number to attach
  * @vid_hdr_offset: VID header offset (use defaults if %0)
+ * @ubinize: ubinize the partition
  * @padding: reserved for future, not used, has to be zeroed
  *
  * This data structure is used to specify MTD device UBI has to attach and the
@@ -251,6 +255,9 @@
  * 512 in case of a 512 bytes page NAND flash with no sub-page support. Or
  * it will be 512 in case of a 2KiB page NAND flash with 4 512-byte sub-pages.
  *
+ * ubinize option is selected in first instance of ubi.this will be used when
+ * applications want the mtd partition to be ubinized.
+ *
  * But in rare cases, if this optimizes things, the VID header may be placed to
  * a different offset. For example, the boot-loader might do things faster if
  * the VID header sits at the end of the first 2KiB NAND page with 4 sub-pages.
@@ -264,7 +271,11 @@
 struct ubi_attach_req {
 	__s32 ubi_num;
 	__s32 mtd_num;
+#ifdef CONFIG_MTD_UBI_LOGGED
+	__s32 ubinize;
+#else
 	__s32 vid_hdr_offset;
+#endif
 	__s8 padding[12];
 };

--- ubi_old/drivers/mtd/ubi/ubi-media.h	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/ubi-media.h	2010-04-09 21:54:02.635580892 +0530
@@ -36,7 +36,15 @@
 #define UBI_VERSION 1

 /* The highest erase counter value supported by this implementation */
+
+#ifdef CONFIG_MTD_UBI_LOGGED
+/* UBIL takes 32 bit ec values. */
+#define UBI_MAX_ERASECOUNTER 0x7FFF
+/* default ec count to start with */
+#define UBIL_EC_START 0x0001
+#else
 #define UBI_MAX_ERASECOUNTER 0x7FFFFFFF
+#endif

 /* The initial CRC32 value used when calculating CRC checksums */
 #define UBI_CRC32_INIT 0xFFFFFFFFU
@@ -46,6 +54,69 @@
 /* Volume identifier header magic number (ASCII "UBI!") */
 #define UBI_VID_HDR_MAGIC 0x55424921

+#ifdef CONFIG_MTD_UBI_LOGGED
+/*
+ * UBI expects sub page size >=512. If not it will still work with size= 512
+ * TODO Try to fix UBIL for NOR. Single peb_info log entry should be possible.
+ */
+#define UBIL_MIN_SUB_PAGE_SIZE 512
+/* Offset where sb, el or cmt bud header will start */
+#define UBIL_BUD_HDR_OFFSET	0
+
+/* Version numbers of subsystem implementation */
+#define UBIL_EL_VERSION	1
+#define UBIL_CMT_VERSION 1
+#define UBIL_SB_VERSION 1
+
+/* UBI magic: (ASCII "UBIU") */
+#define UBI_MAGIC  0x55424955
+/* UBIL Node magic: (ASCII "UBIN")*/
+#define UBIL_NODE_MAGIC 0x5542494E
+/* UBIL sb bud hdr magic: (ASCII "UBIS") */
+#define UBIL_SB_BUD_MAGIC 0x55424953
+/* UBIL sb magic: (ASCII "UBIs")*/
+#define UBIL_SB_MAGIC  0x55424973
+/* UBIL EL bud header magic:(ASCII "UBIE" */
+#define UBIL_EL_BUD_HDR_MAGIC  0x55424945
+/* UBIL EL magic: (ASCII "UBIe" */
+#define UBIL_EL_MAGIC 0x55424965
+/* UBIL CMT Bud header magic: (ASCII "UBIC") */
+#define UBIL_CMT_BUD_HDR_MAGIC  0x55424943
+
+/* size of each eba log record */
+#define UBIL_EL_REC_SIZE sizeof(struct peb_info)
+/* size of each eba log node */
+#define UBIL_EL_NODE_HDR_SIZE sizeof(struct el_node)
+/* size of each UBIL node */
+#define UBIL_NODE_HDR_SIZE sizeof(struct node_t)
+
+/* size of each UBIL node excluding crc */
+#define UBIL_NODE_SIZE_CRC  (UBIL_NODE_HDR_SIZE  - sizeof(__be32))
+
+/* last commit status success or faild in between */
+#define UBIL_CMT_WRITE_SUCCESS 0x1
+#define UBIL_CMT_INVALID 0x0
+
+/**
+ * type of node.node is generic and could be any of following types
+ * UBIL_SB_BUD_HDR_T: sb bud hdr node type
+ * UBIL_EL_BUD_HDR_T: el bud hdr node type
+ * UBIL_CMT_BUD_HDR_T: cmt bud hdr node type
+ * UBIL_SB_NODE_T: sb node type
+ * UBIL_EL_NODE_T: el node type
+ * UBIL_CMT_NODE_T: cmt node type
+ */
+enum{
+	UBIL_SB_BUD_HDR_T  = 1,
+	UBIL_EL_BUD_HDR_T,
+	UBIL_CMT_BUD_HDR_T,
+	UBIL_SB_NODE_T,
+	UBIL_EL_NODE_T,
+	UBIL_CMT_NODE_T
+};
+
+#endif
+
 /*
  * Volume type constants used in the volume identifier header.
  *
@@ -204,7 +275,7 @@
  *
  * 1. Because UBI may erase physical eraseblocks asynchronously, the following
  * situation is possible: L is asynchronously erased, so P is scheduled for
- * erasure, then L is written to,i.e. mapped to another physical eraseblock P1,
+ * erasure, then L is written to, i.e. mapped to another physical
eraseblock P1,
  * so P1 is written to, then an unclean reboot happens. Result - there are 2
  * physical eraseblocks P and P1 corresponding to the same logical eraseblock
  * L. But P1 has greater sequence number, so UBI picks P1 when it attaches the
@@ -294,6 +365,212 @@
 	__be32  hdr_crc;
 } __attribute__ ((packed));

+#ifdef CONFIG_MTD_UBI_LOGGED
+
+/* media headers for UBIL start here */
+
+/**
+ * struct node_t: variable size stuctur to be used for sb, el, cmt
+ * @magic: node magic
+ * @node_type: identification expressing which type node it is
+ * @node_id:   unique identification to be used by node implementation.
+ * @data_size:	size of data this node contains
+ * @sqnum: sequence number of node, optional to use
+ * @padding2[32]: padding.
+ * @data_crc: data crc for node
+ * @hdr_crc: hdr crc
+ * @data: node data, variable size array. data_size shows the size.
+ *
+ * node_t is variable size of node, generic enough to be used for el node or sb
+ * node. node magic will remain same as NODE_MAGIC.
+ * node_type will decide which type of node it is, it can be
+ *	UBIL_SB_BUD_HDR_T: sb bud hdr node type
+ *	UBIL_EL_BUD_HDR_T: el bud hdr node type
+ *	UBIL_CMT_BUD_HDR_T: cmt bud hdr node type
+ *	UBIL_SB_NODE_T: sb node type
+ *	UBIL_EL_NODE_T: el node type
+ *	UBIL_CMT_NODE_T: cmt node type
+ * node_id can be used for node identification by implementation. el uses it
+ * to store the group id.
+ * data_size shows the size of node excluding the size of hdr. This helps for
+ * variable size node.
+ * TODO NOR: padding2 can be removed and if peb_info fits in 32 bytes, each
+ * group may contain one peb_info.
+ */
+
+struct node_t{
+	__be32	magic;
+	__be32	node_type;
+	__be32	node_id;
+	__be32	data_size;
+	__be64	sqnum;
+	__u8	padding[32];
+	__be32	data_crc;
+	__be32	hdr_crc;
+	__u8	data[0];
+} __attribute__((packed));
+
+/**
+ * struct sb_bud_hdr:  sb bud hdr type node
+ * @lh: this is node derived from generic node. Ref to generic node.
+ * @MAGIC: node magic
+ * @ubi_version: ubi version
+ * @log_version: el version
+ * @cmt_version: cmt version
+ * @rsvd_pebs: reserved pebs at the time of ubinize
+ * @beb_rsvd_pebs: reserved pebs for bad block
+ * @beb_rsvd_level: bad erase block level
+ * @flash_size: flash size at ubinize time
+ * @sqnum:
+ * @peb_count: peb count for the partition at ubinize time
+ * @peb_size: peb size
+ * @min_io_size: min io size at ubinize
+ * @hdrs_min_io_size: hdr min io size at ubinize
+ * @bad_allowed: is bad allowed?
+ *
+ * sb_bud_hdr is main structur of UBIL. This structer is calculated at ubinize.
+ * For each mount it is verified. UBIL does not handle resized mtd partition
+ * after ubinizing. This struct is footprint for UBIL. If mtd partition is not
+ * ubinized, user will need to do it explicitely.
+ */
+struct sb_bud_hdr{
+	struct node_t lh;
+	__be32 MAGIC;
+	__be32 ubi_version;
+	__be32 el_version;
+	__be32 cmt_version;
+
+	__be32 rsvd_pebs;
+	__be32 beb_rsvd_pebs;
+	__be32 beb_rsvd_level;
+	__be64 flash_size;
+	__be64 sqnum;
+	__be32 peb_count;
+	__be32 peb_size;
+	__be32 min_io_size;
+	__be32 hdrs_min_io_size;
+	__be32 bad_allowed;
+} __attribute__((packed));
+
+/**
+ * struct el_bud_hdr:  el bud hdr type node
+ * @lh: this is node derived from generic node. Ref to generic node.
+ * @MAGIC: node magic
+ * @el_version: el version
+ * @padding: padding 56 bytes
+ */
+
+struct el_bud_hdr{
+	struct node_t lh;
+	__be32 MAGIC;
+	__be32 log_version;
+	__u8 padding[56];
+} __attribute__((packed));
+
+/**
+ * struct ubil_vid_t on-flash UBIL volume identifier header.
+ * @vol_type: volume type (%UBI_VID_DYNAMIC or %UBI_VID_STATIC)
+ * @copy_flag: if this logical eraseblock was copied from another physical
+ *             eraseblock (for wear-leveling reasons)
+ * @compat: compatibility of this volume (%0, %UBI_COMPAT_DELETE,
+ *          %UBI_COMPAT_IGNORE, %UBI_COMPAT_PRESERVE, or %UBI_COMPAT_REJECT)
+ * @vol_id: ID of this volume
+ * @lnum: logical eraseblock number
+ * @data_size: how many bytes of data this logical eraseblock contains
+ * @used_ebs: total number of used logical eraseblocks in this volume
+ * @data_crc: CRC checksum of the data stored in this logical eraseblock
+ * @sqnum: sequence number
+ */
+
+struct ubil_vid_t{
+	__u8    vol_type;
+	__u8    copy_flag;
+	__u8    compat;
+
+	__be32  vol_id;
+	__be32  lnum;
+	__be32  data_size;
+	__be32  used_ebs;
+	__be32  data_crc;
+	__be64  sqnum;
+} __attribute__((packed));
+
+/**
+ * struct peb_info- on-flash UBIL peb information.
+ * @status: status of peb
+ * @v: volume header of peb
+ * @ec: ec count of peb
+ *
+ * status of peb helps in knowing the peb state. If a peb is marked pending,
+ * it's inram status is made PENDING. If the group is written this state will
+ * be synced to flash. This will help in reducing sqnum calculation for such
+ * pebs.
+ */
+struct peb_info{
+	__u8 status;
+	struct ubi_vid_hdr v;
+	__be32 ec;
+} __attribute__((packed));
+
+/**
+ * struct el_node:  el node type node
+ * @lh: this is node derived from generic node. Ref to generic node.
+ * @peb_info recs: array of peb_info in that group.
+ *
+ * el_node groups multiple peb records in it. For NAND as minimum write size is
+ * much more that size needed for one peb, they are grouped in this node.
+ */
+
+struct el_node{
+	struct node_t lh;
+	struct peb_info recs[0];
+} __attribute__((packed));
+
+/**
+ * struct ubi_sb:  ubi_sb type node
+ * @lh: this is node derived from generic node. Ref to generic node.
+ * @version: sb version
+ * @el_resrvd_buds: how many pebs are reserved for el?
+ * @vtbl_peb[2]: pebs used for vtbl.
+ * @cmt_status: status of commit.
+ * @cmt_resrvd_buds: how many pebs are reserved for cmt
+ * @cmt_next_buds: the buds where next cmt was getting written
+ * @buds: array of buds where peb location is stored. el, cmt checks
+ * these location. this is variable array. It has EL buds, then cmt
+ * buds and then cmt_next_buds.
+ */
+
+struct ubi_sb{
+	struct node_t lh;
+	__be32 version;
+	__be32 cmt_status;
+	__be32 el_resrvd_buds;
+	__be32 cmt_resrvd_buds;
+	__be32 cmt_next_buds;
+	__be32 vtbl_peb[2];
+	__be32 buds[0];
+} __attribute__((packed));
+
+
+/**
+ * struct cmt_bud_hdr:  commit type node
+ * @lh: this is node derived from generic node. Ref to generic node.
+ * @MAGIC: magic of cmt bud
+ * @cmt_version: cmt version
+ * @padding: padding to align the header to 128 bytes.
+ */
+
+struct cmt_bud_hdr{
+	struct node_t lh;
+	__be32 MAGIC;
+	__be32 cmt_version;
+	__be32 data_size;
+	__u8 padding[48];
+	__be32 data_crc;
+} __attribute__((packed));
+
+#endif
+
 /* Internal UBI volumes count */
 #define UBI_INT_VOL_COUNT 1
