Received: from sa15.bezeqint.net ([192.115.104.30])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IkcM8-0000y0-On
	for linux-mtd@lists.infradead.org; Wed, 24 Oct 2007 10:16:56 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by sa15.bezeqint.net (Bezeq International SMTP out Mail Server) with
	ESMTP id 66DDA28274 for <linux-mtd@lists.infradead.org>;
	Wed, 24 Oct 2007 11:15:17 +0200 (IST)
Received: from sa15.bezeqint.net ([127.0.0.1])
	by localhost (sa15.bezeqint.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5j7ZKWJdP1Fz for <linux-mtd@lists.infradead.org>;
	Wed, 24 Oct 2007 11:15:17 +0200 (IST)
Received: from mail.linux-boards.com (mail.linux-boards.com [192.114.83.142])
	by sa15.bezeqint.net (Bezeq International SMTP out Mail Server) with
	ESMTP for <linux-mtd@lists.infradead.org>;
	Wed, 24 Oct 2007 11:15:17 +0200 (IST)
Received: from [10.1.1.95] ([10.1.1.95])
	by mail.linux-boards.com (8.12.5/8.12.8) with ESMTP id l9O88dat024650
	for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2007 10:08:39 +0200
Message-ID: <471F0B10.2020108@compulab.co.il>
Date: Wed, 24 Oct 2007 11:06:24 +0200
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] Add EON EN29SL800 NOR flash support
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This patch adds support for Eon Silicon Solution EN29SL800 NOR flashes

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 drivers/mtd/chips/jedec_probe.c |   58 ++++++++++++++++++++++++++++++++++++---
 1 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index a67b23b..f6afcc3 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -37,7 +37,7 @@
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_TOSHIBA	0x0098
 #define MANUFACTURER_WINBOND	0x00da
-
+#define CONTINUATION_CODE	0x007f

 /* AMD */
 #define AM29DL800BB	0x22C8
@@ -67,6 +67,10 @@
 #define AT49BV32X	0x00C8
 #define AT49BV32XT	0x00C9

+/* Eon */
+#define EN29SL800BB	0x226B
+#define EN29SL800BT	0x22EA
+
 /* Fujitsu */
 #define MBM29F040C	0x00A4
 #define MBM29F800BA	0x2258
@@ -633,6 +637,40 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000,8)
 		}
 	}, {
+		.mfr_id		= 0x1c,
+		.dev_id		= EN29SL800BT,
+		.name		= "Eon EN29SL800BT",
+		.uaddr		= {
+			[0] = MTD_UADDR_0x0555_0x02AA,  /* x8 */
+			[1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
+		},
+		.DevSize	= SIZE_1MiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 4,
+		.regions	= {
+			ERASEINFO(0x10000, 15),
+			ERASEINFO(0x08000, 1),
+			ERASEINFO(0x02000, 2),
+			ERASEINFO(0x04000, 1),
+		}
+	}, {
+		.mfr_id		= 0x1c,
+		.dev_id		= EN29SL800BB,
+		.name		= "Eon EN29SL800BB",
+		.uaddr		= {
+			[0] = MTD_UADDR_0x0555_0x02AA,  /* x8 */
+			[1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
+		},
+		.DevSize	= SIZE_1MiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 4,
+		.regions	= {
+			ERASEINFO(0x04000, 1),
+			ERASEINFO(0x02000, 2),
+			ERASEINFO(0x08000, 1),
+			ERASEINFO(0x10000, 15),
+		}
+	}, {
 		.mfr_id		= MANUFACTURER_FUJITSU,
 		.dev_id		= MBM29F040C,
 		.name		= "Fujitsu MBM29F040C",
@@ -1804,9 +1842,21 @@ static inline u32 jedec_read_mfr(struct map_info *map, __u32 base,
 {
 	map_word result;
 	unsigned long mask;
-	u32 ofs = cfi_build_cmd_addr(0, cfi_interleave(cfi), cfi->device_type);
-	mask = (1 << (cfi->device_type * 8)) -1;
-	result = map_read(map, base + ofs);
+	int bank = 0;
+
+	/* According to JEDEC "Standard Manufacturer's Identification Code"
+	 * (http://www.jedec.org/download/search/jep106W.pdf)
+	 * several first banks can contain 0x7f instead of actual ID
+	 */
+	do {
+		u32 ofs = cfi_build_cmd_addr(0 + (bank << 8),
+					     cfi_interleave(cfi),
+					     cfi->device_type);
+		mask = (1 << (cfi->device_type * 8)) -1;
+		result = map_read(map, base + ofs);
+		bank++;
+	} while ((result.x[0] & mask) == CONTINUATION_CODE);
+
 	return result.x[0] & mask;
 }

-- 
1.5.1.6
