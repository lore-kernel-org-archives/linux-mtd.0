Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzQ4m-0007UP-TM
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 08:58:04 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2F8vwEH031828
	for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2011 10:57:58 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/7] UBI: remove UBI_IO_DEBUG macro
Date: Tue, 15 Mar 2011 11:00:33 +0200
Message-Id: <1300179636-12183-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300179636-12183-1-git-send-email-dedekind1@gmail.com>
References: <1300179636-12183-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This additional little macro is used to print a bit more messages
while scanning the media. However, we have the 'dbg_bld()' macro
for this, so we better us 'dbg_bld()' and kill UBI_IO_DEBUG. This
simplifies the code a tiny bit.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/debug.h |    3 ---
 drivers/mtd/ubi/io.c    |   34 ++++++++++++++++------------------
 2 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 9eca950..8bd1d17 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -91,10 +91,8 @@ void ubi_dbg_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len);
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_BLD
 /* Initialization and build messages */
 #define dbg_bld(fmt, ...) dbg_msg(fmt, ##__VA_ARGS__)
-#define UBI_IO_DEBUG 1
 #else
 #define dbg_bld(fmt, ...) ({})
-#define UBI_IO_DEBUG 0
 #endif
 
 #ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
@@ -177,7 +175,6 @@ static inline int ubi_dbg_is_erase_failure(void)
 #define ubi_dbg_dump_flash(ubi, pnum, offset, len) ({})
 #define ubi_dbg_print_hex_dump(l, ps, pt, r, g, b, len, a)  ({})
 
-#define UBI_IO_DEBUG               0
 #define DBG_DISABLE_BGT            0
 #define ubi_dbg_is_bitflip()       0
 #define ubi_dbg_is_write_failure() 0
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 35da5aa..b1ad1ec 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -783,9 +783,8 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 			if (verbose)
 				ubi_warn("no EC header found at PEB %d, "
 					 "only 0xFF bytes", pnum);
-			else if (UBI_IO_DEBUG)
-				dbg_msg("no EC header found at PEB %d, "
-					"only 0xFF bytes", pnum);
+			dbg_bld("no EC header found at PEB %d, "
+				"only 0xFF bytes", pnum);
 			if (!read_err)
 				return UBI_IO_FF;
 			else
@@ -800,9 +799,9 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 			ubi_warn("bad magic number at PEB %d: %08x instead of "
 				 "%08x", pnum, magic, UBI_EC_HDR_MAGIC);
 			ubi_dbg_dump_ec_hdr(ec_hdr);
-		} else if (UBI_IO_DEBUG)
-			dbg_msg("bad magic number at PEB %d: %08x instead of "
-				"%08x", pnum, magic, UBI_EC_HDR_MAGIC);
+		}
+		dbg_bld("bad magic number at PEB %d: %08x instead of "
+			"%08x", pnum, magic, UBI_EC_HDR_MAGIC);
 		return UBI_IO_BAD_HDR;
 	}
 
@@ -814,9 +813,9 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 			ubi_warn("bad EC header CRC at PEB %d, calculated "
 				 "%#08x, read %#08x", pnum, crc, hdr_crc);
 			ubi_dbg_dump_ec_hdr(ec_hdr);
-		} else if (UBI_IO_DEBUG)
-			dbg_msg("bad EC header CRC at PEB %d, calculated "
-				"%#08x, read %#08x", pnum, crc, hdr_crc);
+		}
+		dbg_bld("bad EC header CRC at PEB %d, calculated "
+			"%#08x, read %#08x", pnum, crc, hdr_crc);
 
 		if (!read_err)
 			return UBI_IO_BAD_HDR;
@@ -1039,9 +1038,8 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			if (verbose)
 				ubi_warn("no VID header found at PEB %d, "
 					 "only 0xFF bytes", pnum);
-			else if (UBI_IO_DEBUG)
-				dbg_msg("no VID header found at PEB %d, "
-					"only 0xFF bytes", pnum);
+			dbg_bld("no VID header found at PEB %d, "
+				"only 0xFF bytes", pnum);
 			if (!read_err)
 				return UBI_IO_FF;
 			else
@@ -1052,9 +1050,9 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			ubi_warn("bad magic number at PEB %d: %08x instead of "
 				 "%08x", pnum, magic, UBI_VID_HDR_MAGIC);
 			ubi_dbg_dump_vid_hdr(vid_hdr);
-		} else if (UBI_IO_DEBUG)
-			dbg_msg("bad magic number at PEB %d: %08x instead of "
-				"%08x", pnum, magic, UBI_VID_HDR_MAGIC);
+		}
+		dbg_bld("bad magic number at PEB %d: %08x instead of "
+			"%08x", pnum, magic, UBI_VID_HDR_MAGIC);
 		return UBI_IO_BAD_HDR;
 	}
 
@@ -1066,9 +1064,9 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			ubi_warn("bad CRC at PEB %d, calculated %#08x, "
 				 "read %#08x", pnum, crc, hdr_crc);
 			ubi_dbg_dump_vid_hdr(vid_hdr);
-		} else if (UBI_IO_DEBUG)
-			dbg_msg("bad CRC at PEB %d, calculated %#08x, "
-				"read %#08x", pnum, crc, hdr_crc);
+		}
+		dbg_bld("bad CRC at PEB %d, calculated %#08x, "
+			"read %#08x", pnum, crc, hdr_crc);
 		if (!read_err)
 			return UBI_IO_BAD_HDR;
 		else
-- 
1.7.2.3
