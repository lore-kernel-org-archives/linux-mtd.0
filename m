Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFFU1-0005IX-In
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 15:03:10 -0500
From: Artem Bityutskiy <dedekind@infradead.org>
To: MTDML <linux-mtd@lists.infradead.org>
Date: Thu, 08 Feb 2007 22:02:47 +0200
Message-Id: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
Subject: [PATCH] UBI: introduce sequential counter
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] UBI: introduce sequential counter

This patch introduces the global sequence counter - a 64-bit number
which is increased every time a LEB is mapped to a PEB. When a VID header
is written, the current global sequence counter value is saved there and
the counter is increased. So it each VID header contains unique sequence
number and for any 2 PBS we can say which one is newer. The counter
is 64-bit and we assume it never overflows.

To store the sequance number, a new 'sqnum' field was added to the VID
header. The padding area is used so it is compatible with older UBI
versions.

Now, when the sequence counter is here, we do not need the 'leb_ver' field
any longer but it was preserved for compatibility - so new UBI binaries
understand old UBI versions and old UBI binaries understands new UBI images.
But eventually we can remove the 'leb_ver' altogether.

Essentially, 'leb_ver' is the same as 'sqnum' but 'leb_ver' it is per-LEB.
The following are advantages and motivation for 'sqnum':

1. it is not necessary to keep leb_ver field for in _each_ EBA table entry;
2. id does not overflow, so we do not have to do different perversions to
   make sure we handle this properly
3. in the wear-leveling code we can distinguish between LEBs which were
   written to long time ago and recently. Indeed, if the sequential number
   is close to the current one, it was written recently. This provides us
   an opportunity to distinguish between LEBs with static data vs. LEBs
   with not really static data (e.g., we have just recently taken a LEB
   with low erase counter and wrote data there). This is useful for WL.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/mtd/ubi-header.h |   71 ++++++++++++++++++++++++++++++++-------------
 1 files changed, 50 insertions(+), 21 deletions(-)

Index: ubi-2.6.git/include/mtd/ubi-header.h
===================================================================
--- ubi-2.6.git.orig/include/mtd/ubi-header.h
+++ ubi-2.6.git/include/mtd/ubi-header.h
@@ -166,34 +166,61 @@ struct ubi_Ev_hdr {
  * %UBI_COMPAT_IGNORE, %UBI_COMPAT_PRESERVE, or %UBI_COMPAT_REJECT)
  * @vol_id: ID of this volume
  * @lnum: logical eraseblock number
- * @leb_ver: eraseblock copy number
  * @data_size: how many bytes of data this eraseblock contains
  * @used_ebs: total number of used logical eraseblocks in this volume
  * @data_pad: how many bytes at the end of this eraseblock are not used
  * @data_crc: CRC checksum of the data stored in this eraseblock
  * @padding1: reserved for future, zeroes
+ * @sqnum: sequence number
+ * @padding2: reserved for future, zeroes
  * @hdr_crc: volume identifier header CRC checksum
  *
- * The @leb_ver and the @copy_flag fields are used to distinguish between older
- * and newer copies of the logical eraseblock, as well as to guarantee
- * robustness against unclean reboots. As UBI erases logical eraseblocks
- * asynchronously, in background, it has to distinguish between older and newer
- * copies of logical eraseblocks. This is done using the @version field. On the
- * other hand, when UBI moves data of an eraseblock, its version is also
- * increased and the @copy_flag is set to 1. Additionally, when moving data of
- * eraseblocks, UBI calculates data CRC and stores it in the @data_crc field,
- * even for dynamic volumes.
- *
- * Thus, if there are 2 physical eraseblocks belonging to the logical
- * eraseblock (same volume ID and logical eraseblock number), UBI uses the
- * following algorithm to pick one of them. It first picks the one with larger
- * version (say, A). If @copy_flag is not set, then A is picked. If @copy_flag
- * is set, UBI checks the CRC of data of this physical eraseblock (@data_crc).
- * This is needed to ensure that the copying was finished. If the CRC is all
- * right, A is picked. If not, the older physical eraseblock is picked.
- *
- * Note, the @leb_ver field may overflow. Thus, if you have 2 versions X and Y,
- * then X > Y if abs(X-Y) < 0x7FFFFFFF, otherwise X < Y.
+ * The @sqnum is the value of the global sequence counter at the time when this
+ * VID header was created. The global sequence counter only grows and is
+ * incremented each time UBI writes a new VID header to the flash, i.e. when it
+ * maps a logical eraseblock to a new physical eraseblock. The global sequence
+ * counter is an unsigned 64-bit integer and we assume it never overflows. The
+ * @sqnum (sequence number) is used to distinguish between older and newer
+ * versions of logical eraseblocks.
+ *
+ * There are 2 situations when there may be more then one physical eraseblock
+ * corresponding to the same logical eraseblock, i.e., having the same @vol_id
+ * and @lnum values in the volume identifier header. Suppose we have a logical
+ * eraseblock L and it is mapped to the physical eraseblock P.
+ *
+ * 1. Because UBI may erase physical eraseblocks asynchronously, the following
+ * situation may take place: L is asynchronously erased, P is scheduled for
+ * erasure, L is written to, so mapped to another physical eraseblock P1, so P1
+ * is written to, then an unclean reboot happens. Result - there are 2 physical
+ * eraseblocks P and P1. But P1 has greater sequence number, so UBI pick P1.
+ *
+ * 2. From time to time UBI moves the the contents of logical eraseblocks to
+ * other physical eraseblocks for wear-leveling reasons. If, for example, UBI
+ * moves the contents of L from P to P1, and an unclean reboot happens before P
+ * is physically erased, there are two physical eraseblocks P and P1
+ * corresponding to L and UBI has to select one of them. The @ts field says
+ * which PEB is the original (obviously P will have lower @ts) and the copy.
+ * But it is not enough to select the physical eraseblock with the higher
+ * version, because the unclean reboot could have happen in the middle of the
+ * copying process, so the data in P is corrupted. It is also not enough to
+ * just select the physical eraseblock with lower version, because the data
+ * there may be old (consider a case if more data was added to P1 after the
+ * copying). Moreover, the unclean reboot may happen when the erasure of P was
+ * just started, so it may result in unstable P, which is "mostly" OK, but
+ * still has unstable data or is corrupted.
+ *
+ * UBI uses the @copy_flag field to indicate that this physical eraseblock is a
+ * copy of some other physical eraseblock. UBI also calculates data CRC when
+ * the data is moved and stores it at the @data_crc field of the copy (P1). So
+ * when there is a need to pick one physical eraseblock of two (P or P1), the
+ * @copy_flag of the newer one (P1) is examined. If it is cleared, the situation
+ * is simple and just the newer one is picked. If it is set, the data CRC of
+ * the copy (P1) is examined. If the CRC checksum is correct, this physical
+ * eraseblock is selected (P1). Otherwise the older one (P) is selected.
+ *
+ * Note, there is an obsolete @leb_ver field which was used instead of @ts in
+ * the past. But it is not used anymore and we keep it in order to be able to
+ * deal with old UBI images. It will be removed at some point.
  *
  * There are 2 sorts of volumes in UBI: user volumes and internal volumes.
  * Internal volumes are not seen from outside and are used for various internal
@@ -244,12 +271,14 @@ struct ubi_vid_hdr {
 	uint8_t compat;
 	ubi32_t vol_id;
 	ubi32_t lnum;
-	ubi32_t leb_ver;
+	ubi32_t leb_ver; /* obsolete, to be removed */
 	ubi32_t data_size;
 	ubi32_t used_ebs;
 	ubi32_t data_pad;
 	ubi32_t data_crc;
-	uint8_t padding1[24];
+	uint8_t padding1[4];
+	ubi64_t sqnum;
+	uint8_t padding2[12];
 	ubi32_t hdr_crc;
 } __attribute__ ((packed));
 
Index: ubi-2.6.git/drivers/mtd/ubi/scan.h
===================================================================
--- ubi-2.6.git.orig/drivers/mtd/ubi/scan.h
+++ ubi-2.6.git/drivers/mtd/ubi/scan.h
@@ -201,7 +201,7 @@ struct ubi_scan_volume {
  * @pnum: physical eraseblock number
  * @lnum: logical eraseblock number
  * @scrub: if this physical eraseblock needs scrubbing
- * @leb_ver: version of this logical eraseblock
+ * @sqnum: sequence number
  * @u.rb: link in the per-volume RB-tree of &struct ubi_scan_leb objects
  * @u.list: link in one of the eraseblock lists
  *
@@ -213,11 +213,12 @@ struct ubi_scan_leb {
 	int pnum;
 	int lnum;
 	int scrub;
-	uint32_t leb_ver;
+	uint64_t sqnum;
 	union {
 		struct rb_node rb;
 		struct list_head list;
 	} u;
+	uint32_t leb_ver; /* obsolete, to be removed */
 };
 
 /**
@@ -236,6 +237,7 @@ struct ubi_scan_leb {
  * @is_empty: a flag indicating whether the flash device is empty or not
  * @min_ec: the lowest found erase counter value
  * @max_ec: the highest found erase counter value
+ * @max_sn: the highest sequence number value
  * @mean_ec: mean erase counter value
  * @ec_sum: a temporary variable used when calculating @mean_ec
  * @ec_count: a temporary variable used when calculating @mean_ec
@@ -259,21 +261,22 @@ struct ubi_scan_leb {
  * erased are put to the @erase list.
  */
 struct ubi_scan_info {
-	struct rb_root volumes;  /* public  */
-	struct list_head corr;   /* public  */
-	struct list_head free;   /* public  */
-	struct list_head erase;  /* public  */
-	struct list_head alien;  /* public  */
-	int vols_found;          /* public  */
-	int highest_vol_id;      /* public  */
-	int bad_peb_count;       /* public  */
-	int alien_peb_count;     /* public  */
-	int is_empty;            /* public  */
-	int min_ec;              /* public  */
-	int max_ec;              /* public  */
-	int mean_ec;             /* public  */
-	int ec_sum;              /* private */
-	int ec_count;            /* private */
+	struct rb_root volumes; /* public  */
+	struct list_head corr;  /* public  */
+	struct list_head free;  /* public  */
+	struct list_head erase; /* public  */
+	struct list_head alien; /* public  */
+	int vols_found;         /* public  */
+	int highest_vol_id;     /* public  */
+	int bad_peb_count;      /* public  */
+	int alien_peb_count;    /* public  */
+	int is_empty;           /* public  */
+	int min_ec;             /* public  */
+	int max_ec;             /* public  */
+	uint64_t max_sqnum;     /* public  */
+	int mean_ec;            /* public  */
+	int ec_sum;             /* private */
+	int ec_count;           /* private */
 };
 
 #endif /* !__UBI_SCAN_H__ */
Index: ubi-2.6.git/drivers/mtd/ubi/eba.c
===================================================================
--- ubi-2.6.git.orig/drivers/mtd/ubi/eba.c
+++ ubi-2.6.git/drivers/mtd/ubi/eba.c
@@ -48,12 +48,11 @@
 
 #ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_EBA
 static int paranoid_check_leb(const struct ubi_info *ubi, int pnum, int vol_id,
-			      int lnum, int leb_ver,
-			      const struct ubi_vid_hdr *vid_hdr);
+			      int lnum, const struct ubi_vid_hdr *vid_hdr);
 static int paranoid_check_leb_locked(const struct ubi_info *ubi, int vol_id,
 				     int lnum);
 #else
-#define paranoid_check_leb(ubi, vol_id, pnum, lnum, leb_ver, vid_hdr) 0
+#define paranoid_check_leb(ubi, vol_id, pnum, lnum, vid_hdr) 0
 #define paranoid_check_leb_locked(ubi, vol_id, lnum)
 #endif
 
@@ -96,7 +95,8 @@ static inline int idx2vol_id(const struc
  * @vol_id: the volume ID
  * @lnum: the logical eraseblock number
  *
- * The logical eraseblock has to be locked.
+ * The logical eraseblock has to be locked. Note, all this leb_ver stuff is
+ * obsolete and should be removed.
  */
 static inline int leb_get_ver(const struct ubi_info *ubi, int vol_id, int lnum)
 {
@@ -113,6 +113,25 @@ static inline int leb_get_ver(const stru
 }
 
 /**
+ * leb_next_sqnum - get sequence number.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns current sequence number and increases the global
+ * sequence counter.
+ */
+static inline uint64_t leb_next_sqnum(struct ubi_eba_info *eba)
+{
+	uint64_t sqnum;
+
+	spin_lock(&eba->eba_tbl_lock);
+	sqnum = eba->global_sq_cnt++;
+	spin_unlock(&eba->eba_tbl_lock);
+
+	return sqnum;
+}
+
+/**
  * leb_map - map a logical eraseblock to a physical eraseblock.
  *
  * @ubi: the UBI device description object
@@ -454,9 +473,7 @@ int ubi_eba_read_leb(const struct ubi_in
 		if (unlikely(err == UBI_IO_BITFLIPS))
 			scrub = 1;
 
-		err = paranoid_check_leb(ubi, pnum, vol_id, lnum,
-					 leb_get_ver(ubi, vol_id, lnum),
-					 vid_hdr);
+		err = paranoid_check_leb(ubi, pnum, vol_id, lnum, vid_hdr);
 		if (unlikely(err)) {
 			if (err > 0)
 				err = -EINVAL;
@@ -510,9 +527,11 @@ int ubi_eba_write_leb(const struct ubi_i
 {
 	int err, pnum, tries = 0;
 	uint32_t leb_ver;
+	uint64_t sqnum;
 	struct ubi_vid_hdr *vid_hdr;
 	const struct ubi_vtbl_vtr *vtr;
 	const struct ubi_io_info *io = ubi->io;
+	struct ubi_eba_info *eba = ubi->eba;
 
 retry:
 	/* Input arguments sanity check */
@@ -527,7 +546,7 @@ retry:
 	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
 	ubi_assert(!IS_ERR(vtr));
 	ubi_assert(offset + len <= io->leb_size - vtr->data_pad);
-	ubi_assert(lnum < ubi->eba->eba_tbl[vol_id2idx(ubi, vol_id)].leb_count);
+	ubi_assert(lnum < eba->eba_tbl[vol_id2idx(ubi, vol_id)].leb_count);
 	ubi_assert(len % io->min_io_size == 0);
 	ubi_assert(offset % io->min_io_size == 0);
 	ubi_assert(vtr->vol_type == UBI_DYNAMIC_VOLUME);
@@ -545,7 +564,6 @@ retry:
 		return err;
 
 	pnum = leb2peb(ubi, vol_id, lnum);
-	leb_ver = leb_get_ver(ubi, vol_id, lnum);
 	if (pnum >= 0) {
 		dbg_eba("write %zd bytes at offset %d of LEB %d:%d, PEB %d",
 			len, offset, vol_id, lnum, pnum);
@@ -570,7 +588,11 @@ retry:
 		goto out_unlock;
 	}
 
+	sqnum = leb_next_sqnum(eba);
+	leb_ver = leb_get_ver(ubi, vol_id, lnum);
+
 	vid_hdr->vol_type = UBI_VID_DYNAMIC;
+	vid_hdr->sqnum = cpu_to_ubi64(sqnum);
 	vid_hdr->leb_ver = cpu_to_ubi32(leb_ver);
 	vid_hdr->vol_id = cpu_to_ubi32(vol_id);
 	vid_hdr->lnum = cpu_to_ubi32(lnum);
@@ -582,6 +604,7 @@ retry:
 		err = pnum;
 		goto out_vid_hdr;
 	}
+
 	dbg_eba("write VID hdr and %zd bytes at offset %d of LEB %d:%d, PEB %d",
 		len, offset, vol_id, lnum, pnum);
 
@@ -658,9 +681,11 @@ int ubi_eba_write_leb_st(const struct ub
 	int err, pnum, tries = 0;
 	size_t data_size = len;
 	uint32_t leb_ver, crc;
+	uint64_t sqnum;
 	struct ubi_vid_hdr *vid_hdr;
 	const struct ubi_vtbl_vtr *vtr;
 	const struct ubi_io_info *io = ubi->io;
+	struct ubi_eba_info *eba = ubi->eba;
 
 retry:
 	/* Input arguments sanity check */
@@ -673,7 +698,7 @@ retry:
 
 	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
 	ubi_assert(!IS_ERR(vtr));
-	ubi_assert(lnum < ubi->eba->eba_tbl[vol_id2idx(ubi, vol_id)].leb_count);
+	ubi_assert(lnum < eba->eba_tbl[vol_id2idx(ubi, vol_id)].leb_count);
 	ubi_assert(lnum < used_ebs);
 	ubi_assert(used_ebs >= 0);
 	ubi_assert(vtr->vol_type == UBI_STATIC_VOLUME);
@@ -714,7 +739,10 @@ retry:
 		goto out_unlock;
 	}
 
+	sqnum = leb_next_sqnum(eba);
 	leb_ver = leb_get_ver(ubi, vol_id, lnum);
+
+	vid_hdr->sqnum = cpu_to_ubi64(sqnum);
 	vid_hdr->leb_ver = cpu_to_ubi32(leb_ver);
 	vid_hdr->vol_id = cpu_to_ubi32(vol_id);
 	vid_hdr->lnum = cpu_to_ubi32(lnum);
@@ -732,6 +760,7 @@ retry:
 		err = pnum;
 		goto out_vid_hdr;
 	}
+
 	dbg_eba("write VID hdr and %zd bytes at of LEB %d:%d, PEB %d",
 		len, vol_id, lnum, pnum);
 
@@ -949,6 +978,8 @@ int ubi_eba_init_scan(struct ubi_info *u
 	spin_lock_init(&eba->ltree_lock);
 	eba->ltree = RB_ROOT;
 
+	eba->global_sq_cnt = si->max_sqnum;
+
 	eba->num_volumes = acc->max_volumes + acc->ivol_count;
 	sz = eba->num_volumes * sizeof(struct ubi_eba_tbl_volume);
 	eba->eba_tbl = ubi_kzalloc(sz);
@@ -1132,17 +1163,15 @@ static struct ubi_eba_ltree_entry *ltree
  * @pnum: the physical eraseblock number
  * @vol_id: the volume ID to check
  * @lnum: the logical eraseblock number to check
- * @leb_ver: the logical eraseblock version to check
  * @vid_hdr: volume identifier header to check
  *
  * This function returns zero if the headers are all right, %1 if not, and a
  * negative error code in case of error.
  */
 static int paranoid_check_leb(const struct ubi_info *ubi, int pnum, int vol_id,
-			      int lnum, int leb_ver,
-			      const struct ubi_vid_hdr *vid_hdr)
+			      int lnum, const struct ubi_vid_hdr *vid_hdr)
 {
-	int err, hdr_vol_id, hdr_lnum, hdr_leb_ver;
+	int err, hdr_vol_id, hdr_lnum;
 	struct ubi_ec_hdr *ec_hdr;
 
 	/* Check the EC header */
@@ -1160,7 +1189,6 @@ static int paranoid_check_leb(const stru
 
 	hdr_vol_id = ubi32_to_cpu(vid_hdr->vol_id);
 	hdr_lnum = ubi32_to_cpu(vid_hdr->lnum);
-	hdr_leb_ver = ubi32_to_cpu(vid_hdr->leb_ver);
 
 	if (unlikely(vol_id != hdr_vol_id)) {
 		ubi_err("bad vol_id %d, should be %d", hdr_vol_id, vol_id);
@@ -1172,11 +1200,6 @@ static int paranoid_check_leb(const stru
 		goto fail;
 	}
 
-	if (unlikely(leb_ver != hdr_leb_ver)) {
-		ubi_err("bad leb_ver %d, should be %d", hdr_leb_ver, leb_ver);
-		goto fail;
-	}
-
 	return 0;
 
 fail:
Index: ubi-2.6.git/drivers/mtd/ubi/eba.h
===================================================================
--- ubi-2.6.git.orig/drivers/mtd/ubi/eba.h
+++ ubi-2.6.git/drivers/mtd/ubi/eba.h
@@ -287,13 +287,12 @@ void ubi_eba_close(const struct ubi_info
  * struct ubi_eba_tbl_rec - a record in the eraseblock association table.
  *
  * @pnum: physical eraseblock number
- * @leb_ver: logical eraseblock version
  *
  * This structure represents a record in the eraseblock association table.
  */
 struct ubi_eba_tbl_rec {
 	int pnum;
-	uint32_t leb_ver;
+	uint32_t leb_ver; /* obsolete, to be removed */
 };
 
 /**
@@ -335,7 +334,8 @@ struct ubi_eba_ltree_entry {
  * struct ubi_eba_info - UBI EBA unit description data structure.
  *
  * @eba_tbl: the eraseblock association table
- * @eba_tbl_lock: protects the EBA table
+ * @global_sq_cnt: global sequence counter
+ * @eba_tbl_lock: protects the EBA table and the global sequence counter
  * @ltree: the lock tree
  * @ltree_lock: protects the lock tree
  * @num_volumes: number of volumes mapped by the EBA table
@@ -347,9 +347,16 @@ struct ubi_eba_ltree_entry {
  * The lock tree is an RB-tree which refers all the currently locked logical
  * eraseblocks. The lock tree elements are &struct ubi_eba_ltree_entry objects.
  * They are indexed by (@vol_id,@lnum) pairs.
+ *
+ * The global sequence counter is incremented each time a logical eraseblock is
+ * mapped to a physical eraseblock and it is stored in the volume identifier
+ * header. This means that each VID header has a unique sequence number. The
+ * sequence number is only increased an we assume 64 bit is enough to never
+ * overflow.
  */
 struct ubi_eba_info {
 	struct ubi_eba_tbl_volume *eba_tbl; /* private */
+	uint64_t global_sq_cnt;             /* private */
 	spinlock_t eba_tbl_lock;            /* private */
 	struct rb_root ltree;               /* private */
 	spinlock_t ltree_lock;              /* private */
Index: ubi-2.6.git/drivers/mtd/ubi/debug.c
===================================================================
--- ubi-2.6.git.orig/drivers/mtd/ubi/debug.c
+++ ubi-2.6.git/drivers/mtd/ubi/debug.c
@@ -796,6 +796,8 @@ void ubi_dbg_dump_vid_hdr(const struct u
 	dump_msg("data_size %d",   ubi32_to_cpu(vid_hdr->data_size));
 	dump_msg("used_ebs  %d",   ubi32_to_cpu(vid_hdr->used_ebs));
 	dump_msg("data_pad  %d",   ubi32_to_cpu(vid_hdr->data_pad));
+	dump_msg("sqnum     %llu",
+		 (unsigned long long)ubi64_to_cpu(vid_hdr->sqnum));
 	dump_msg("hdr_crc   %08x", ubi32_to_cpu(vid_hdr->hdr_crc));
 	dump_msg("volume identifier header hexdump:");
 	ubi_dbg_hexdump_nolock(vid_hdr, UBI_VID_HDR_SIZE_CRC);
@@ -890,6 +892,9 @@ void ubi_dbg_dump_seb(const struct ubi_s
 	switch (type) {
 		case 0:
 			dump_msg("lnum     %d", seb->lnum);
+			dump_msg("scrub    %d", seb->scrub);
+			dump_msg("sqnum    %llu",
+				 (unsigned long long)seb->sqnum);
 			dump_msg("leb_ver  %u", seb->leb_ver);
 			break;
 		case 1:
