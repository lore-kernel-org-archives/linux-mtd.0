Received: from sa10.bezeqint.net ([192.115.104.24])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IV5EA-000205-Ol
	for linux-mtd@lists.infradead.org; Tue, 11 Sep 2007 08:52:31 -0400
Received: from localhost (unknown [127.0.0.1])
	by sa10.bezeqint.net (Bezeq International SMTP out Mail Server) with
	ESMTP id BB47C106742 for <linux-mtd@lists.infradead.org>;
	Tue, 11 Sep 2007 15:52:22 +0300 (IDT)
Received: from sa10.bezeqint.net ([127.0.0.1])
	by localhost (sa10.bezeqint.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12216-04 for <linux-mtd@lists.infradead.org>;
	Tue, 11 Sep 2007 15:52:22 +0300 (IDT)
Received: from mail.linux-boards.com (unknown [192.114.83.142])
	by sa10.bezeqint.net (Bezeq International SMTP out Mail Server) with
	ESMTP for <linux-mtd@lists.infradead.org>;
	Tue, 11 Sep 2007 15:52:22 +0300 (IDT)
Received: from [10.1.1.95] ([10.1.1.95])
	by mail.linux-boards.com (8.12.5/8.12.8) with ESMTP id l8BCkRjB023967
	for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2007 15:46:27 +0300
Message-ID: <46E68DFC.20905@compulab.co.il>
Date: Tue, 11 Sep 2007 15:45:48 +0300
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] Add Eon EN29SL800 flash
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

This patch adds support for Eon EN29SL800 flashes

Signed-off-by: Mike Rapoport <mike@compulab.co.il>

 drivers/mtd/chips/jedec_probe.c |   58 ++++++++++++++++++++++++++++++++++++---
 1 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 58e561e..7050e71 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -38,7 +38,7 @@
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_TOSHIBA	0x0098
 #define MANUFACTURER_WINBOND	0x00da
-
+#define CONTINUATION_CODE	0x007f

 /* AMD */
 #define AM29DL800BB	0x22C8
@@ -68,6 +68,10 @@
 #define AT49BV32X	0x00C8
 #define AT49BV32XT	0x00C9

+/* Eon */
+#define EN29SL800BB	0x226B
+#define EN29SL800BT	0x22EA
+
 /* Fujitsu */
 #define MBM29F040C	0x00A4
 #define MBM29LV650UE	0x22D7
@@ -632,6 +636,40 @@ static const struct amd_flash_info jedec_table[] = {
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
@@ -1769,9 +1807,21 @@ static inline u32 jedec_read_mfr(struct map_info *map,
__u32 base,
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
