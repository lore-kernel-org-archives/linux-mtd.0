Received: from mail-qa0-f49.google.com ([209.85.216.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TdgbK-0004fH-Si
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2012 12:18:52 +0000
Received: by mail-qa0-f49.google.com with SMTP id c3so4689713qae.15
 for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2012 04:18:49 -0800 (PST)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] ubi: Introduce helpers dbg_chk_{io, gen}
Date: Wed, 28 Nov 2012 09:18:29 -0300
Message-Id: <1354105110-24721-2-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1354105110-24721-1-git-send-email-elezegarcia@gmail.com>
References: <1354105110-24721-1-git-send-email-elezegarcia@gmail.com>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With this patch code is a bit more readable and there's no
generated code or functionality impact.
Furthermore, this abstracts implementation details and
will allow to change ubi_debug_info in a less invasive way.

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/mtd/ubi/attach.c |    4 ++--
 drivers/mtd/ubi/debug.h  |    9 +++++++++
 drivers/mtd/ubi/io.c     |   14 +++++++-------
 drivers/mtd/ubi/vmt.c    |    2 +-
 drivers/mtd/ubi/vtbl.c   |    2 +-
 drivers/mtd/ubi/wl.c     |    6 +++---
 6 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index fec406b..b6edfeb 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1453,7 +1453,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 		goto out_wl;
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
-	if (ubi->fm && ubi->dbg->chk_gen) {
+	if (ubi->fm && ubi_dbg_chk_gen(ubi)) {
 		struct ubi_attach_info *scan_ai;
 
 		scan_ai = alloc_ai("ubi_ckh_aeb_slab_cache");
@@ -1503,7 +1503,7 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	struct ubi_ainf_peb *aeb, *last_aeb;
 	uint8_t *buf;
 
-	if (!ubi->dbg->chk_gen)
+	if (!ubi_dbg_chk_gen(ubi))
 		return 0;
 
 	/*
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 3dbc877..0add8d8 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -158,4 +158,13 @@ static inline int ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
 	return 0;
 }
 
+static inline int ubi_dbg_chk_io(const struct ubi_device *ubi)
+{
+	return ubi->dbg->chk_io;
+}
+
+static inline int ubi_dbg_chk_gen(const struct ubi_device *ubi)
+{
+	return ubi->dbg->chk_gen;
+}
 #endif /* !__UBI_DEBUG_H__ */
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 78a1dcb..bf79def 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1132,7 +1132,7 @@ static int self_check_not_bad(const struct ubi_device *ubi, int pnum)
 {
 	int err;
 
-	if (!ubi->dbg->chk_io)
+	if (!ubi_dbg_chk_io(ubi))
 		return 0;
 
 	err = ubi_io_is_bad(ubi, pnum);
@@ -1159,7 +1159,7 @@ static int self_check_ec_hdr(const struct ubi_device *ubi, int pnum,
 	int err;
 	uint32_t magic;
 
-	if (!ubi->dbg->chk_io)
+	if (!ubi_dbg_chk_io(ubi))
 		return 0;
 
 	magic = be32_to_cpu(ec_hdr->magic);
@@ -1197,7 +1197,7 @@ static int self_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum)
 	uint32_t crc, hdr_crc;
 	struct ubi_ec_hdr *ec_hdr;
 
-	if (!ubi->dbg->chk_io)
+	if (!ubi_dbg_chk_io(ubi))
 		return 0;
 
 	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
@@ -1241,7 +1241,7 @@ static int self_check_vid_hdr(const struct ubi_device *ubi, int pnum,
 	int err;
 	uint32_t magic;
 
-	if (!ubi->dbg->chk_io)
+	if (!ubi_dbg_chk_io(ubi))
 		return 0;
 
 	magic = be32_to_cpu(vid_hdr->magic);
@@ -1282,7 +1282,7 @@ static int self_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
 	struct ubi_vid_hdr *vid_hdr;
 	void *p;
 
-	if (!ubi->dbg->chk_io)
+	if (!ubi_dbg_chk_io(ubi))
 		return 0;
 
 	vid_hdr = ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
@@ -1334,7 +1334,7 @@ static int self_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 	void *buf1;
 	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
 
-	if (!ubi->dbg->chk_io)
+	if (!ubi_dbg_chk_io(ubi))
 		return 0;
 
 	buf1 = __vmalloc(len, GFP_NOFS, PAGE_KERNEL);
@@ -1398,7 +1398,7 @@ int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 	void *buf;
 	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
 
-	if (!ubi->dbg->chk_io)
+	if (!ubi_dbg_chk_io(ubi))
 		return 0;
 
 	buf = __vmalloc(len, GFP_NOFS, PAGE_KERNEL);
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 99ef8a1..8330703 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -847,7 +847,7 @@ static int self_check_volumes(struct ubi_device *ubi)
 {
 	int i, err = 0;
 
-	if (!ubi->dbg->chk_gen)
+	if (!ubi_dbg_chk_gen(ubi))
 		return 0;
 
 	for (i = 0; i < ubi->vtbl_slots; i++) {
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 926e3df..d77b1c1 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -858,7 +858,7 @@ out_free:
  */
 static void self_vtbl_check(const struct ubi_device *ubi)
 {
-	if (!ubi->dbg->chk_gen)
+	if (!ubi_dbg_chk_gen(ubi))
 		return;
 
 	if (vtbl_check(ubi, ubi->vtbl)) {
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 9447f05..5a05c69 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -2016,7 +2016,7 @@ static int self_check_ec(struct ubi_device *ubi, int pnum, int ec)
 	long long read_ec;
 	struct ubi_ec_hdr *ec_hdr;
 
-	if (!ubi->dbg->chk_gen)
+	if (!ubi_dbg_chk_gen(ubi))
 		return 0;
 
 	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
@@ -2056,7 +2056,7 @@ out_free:
 static int self_check_in_wl_tree(const struct ubi_device *ubi,
 				 struct ubi_wl_entry *e, struct rb_root *root)
 {
-	if (!ubi->dbg->chk_gen)
+	if (!ubi_dbg_chk_gen(ubi))
 		return 0;
 
 	if (in_wl_tree(e, root))
@@ -2082,7 +2082,7 @@ static int self_check_in_pq(const struct ubi_device *ubi,
 	struct ubi_wl_entry *p;
 	int i;
 
-	if (!ubi->dbg->chk_gen)
+	if (!ubi_dbg_chk_gen(ubi))
 		return 0;
 
 	for (i = 0; i < UBI_PROT_QUEUE_LEN; ++i)
-- 
1.7.8.6
