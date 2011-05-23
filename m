Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOOXB-00018g-Oi
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 06:22:34 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4N6MURj002377
	for <linux-mtd@lists.infradead.org>; Mon, 23 May 2011 09:22:32 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] UBI: turn some macros into static inline
Date: Mon, 23 May 2011 09:26:28 +0300
Message-Id: <1306131989-5391-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1306131989-5391-1-git-send-email-dedekind1@gmail.com>
References: <1306131989-5391-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Similarly as we have done for UBIFS in
1dcffad74183bb00e8129ba1c5bb2c9931d31bd7, turn the debugging macros into static
inline functions, for the same reasons: to avoid gcc 4.5 warnings.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/debug.h |   63 ++++++++++++++++++++++++++++------------------
 1 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index bdd2c73..b2dba2c 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -21,6 +21,14 @@
 #ifndef __UBI_DEBUG_H__
 #define __UBI_DEBUG_H__
 
+struct ubi_ec_hdr;
+struct ubi_vid_hdr;
+struct ubi_volume;
+struct ubi_vtbl_record;
+struct ubi_scan_volume;
+struct ubi_scan_leb;
+struct ubi_mkvol_req;
+
 #ifdef CONFIG_MTD_UBI_DEBUG
 #include <linux/random.h>
 
@@ -45,14 +53,6 @@
 
 #define ubi_dbg_dump_stack() dump_stack()
 
-struct ubi_ec_hdr;
-struct ubi_vid_hdr;
-struct ubi_volume;
-struct ubi_vtbl_record;
-struct ubi_scan_volume;
-struct ubi_scan_leb;
-struct ubi_mkvol_req;
-
 void ubi_dbg_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr);
 void ubi_dbg_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 void ubi_dbg_dump_vol_info(const struct ubi_volume *vol);
@@ -209,23 +209,36 @@ static inline int ubi_dbg_is_erase_failure(void)
 #define dbg_io(fmt, ...)   dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_bld(fmt, ...)  dbg_msg(fmt, ##__VA_ARGS__)
 
-#define ubi_dbg_dump_stack()             ({})
-#define ubi_dbg_dump_ec_hdr(ec_hdr)      ({})
-#define ubi_dbg_dump_vid_hdr(vid_hdr)    ({})
-#define ubi_dbg_dump_vol_info(vol)       ({})
-#define ubi_dbg_dump_vtbl_record(r, idx) ({})
-#define ubi_dbg_dump_sv(sv)              ({})
-#define ubi_dbg_dump_seb(seb, type)      ({})
-#define ubi_dbg_dump_mkvol_req(req)      ({})
-#define ubi_dbg_dump_flash(ubi, pnum, offset, len) ({})
-#define ubi_dbg_print_hex_dump(l, ps, pt, r, g, b, len, a)  ({})
-
-#define ubi_dbg_is_bgt_disabled()  0
-#define ubi_dbg_is_bitflip()       0
-#define ubi_dbg_is_write_failure() 0
-#define ubi_dbg_is_erase_failure() 0
-#define ubi_dbg_check_all_ff(ubi, pnum, offset, len) 0
-#define ubi_dbg_check_write(ubi, buf, pnum, offset, len) 0
+static inline void ubi_dbg_dump_stack(void)                          { return; }
+static inline void
+ubi_dbg_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr)                 { return; }
+static inline void
+ubi_dbg_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr)              { return; }
+static inline void
+ubi_dbg_dump_vol_info(const struct ubi_volume *vol)                  { return; }
+static inline void
+ubi_dbg_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)   { return; }
+static inline void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv) { return; }
+static inline void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb,
+				    int type)                        { return; }
+static inline void
+ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req)              { return; }
+static inline void ubi_dbg_dump_flash(struct ubi_device *ubi,
+				      int pnum, int offset, int len) { return; }
+static inline void
+ubi_dbg_print_hex_dump(const char *l, const char *ps, int pt, int r,
+		       int g, const void *b, size_t len, bool a)     { return; }
+
+static inline int ubi_dbg_is_bgt_disabled(void)                    { return 0; }
+static inline int ubi_dbg_is_bitflip(void)                         { return 0; }
+static inline int ubi_dbg_is_write_failure(void)                   { return 0; }
+static inline int ubi_dbg_is_erase_failure(void)                   { return 0; }
+static inline int ubi_dbg_check_all_ff(struct ubi_device *ubi,
+				       int pnum, int offset,
+				       int len)                    { return 0; }
+static inline int ubi_dbg_check_write(struct ubi_device *ubi,
+				      const void *buf, int pnum,
+				      int offset, int len)         { return 0; }
 
 #endif /* !CONFIG_MTD_UBI_DEBUG */
 #endif /* !__UBI_DEBUG_H__ */
-- 
1.7.2.3
