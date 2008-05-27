Received: from mxout10.netvision.net.il ([194.90.6.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K0uPd-0001NM-Dl
	for linux-mtd@lists.infradead.org; Tue, 27 May 2008 08:20:05 +0000
Received: from mail.linux-boards.com ([62.90.235.247])
	by mxout10.netvision.net.il
	(Sun Java System Messaging Server 6.2-8.04 (built Feb 28 2007))
	with ESMTP id <0K1I004ROPYNL9B0@mxout10.netvision.net.il> for
	linux-mtd@lists.infradead.org; Tue, 27 May 2008 11:23:11 +0300 (IDT)
Date: Tue, 27 May 2008 11:20:07 +0300
From: Mike Rapoport <mike@compulab.co.il>
Subject: [PATCH 2/2] Add support for Eon  EN29SL800B[BT] NOR flash chips
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <483BC437.7000402@compulab.co.il>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch add support for non-CFI Eon EN29SL800B[BT] NOR flash chips.
The Eon chips have manufacturer ID in the first bank, therefore this patch
depends on support for flash chips with ID in bank other than 0.

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 drivers/mtd/chips/jedec_probe.c |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 9e57aec..623b2e0 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -26,6 +26,7 @@
 /* Manufacturers */
 #define MANUFACTURER_AMD	0x0001
 #define MANUFACTURER_ATMEL	0x001f
+#define MANUFACTURER_EON	0x001c
 #define MANUFACTURER_FUJITSU	0x0004
 #define MANUFACTURER_HYUNDAI	0x00AD
 #define MANUFACTURER_INTEL	0x0089
@@ -70,6 +71,10 @@
 #define AT49BV32X	0x00C8
 #define AT49BV32XT	0x00C9

+/* Eon */
+#define EN29SL800BB	0x226B
+#define EN29SL800BT	0x22EA
+
 /* Fujitsu */
 #define MBM29F040C	0x00A4
 #define MBM29F800BA	0x2258
@@ -632,6 +637,36 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x02000,8)
 		}
 	}, {
+		.mfr_id		= MANUFACTURER_EON,
+		.dev_id		= EN29SL800BT,
+		.name		= "Eon EN29SL800BT",
+		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
+		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
+		.dev_size	= SIZE_1MiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 4,
+		.regions	= {
+			ERASEINFO(0x10000,15),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x04000,1),
+		}
+	}, {
+		.mfr_id		= MANUFACTURER_EON,
+		.dev_id		= EN29SL800BB,
+		.name		= "Eon EN29SL800BB",
+		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
+		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
+		.dev_size	= SIZE_1MiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 4,
+		.regions	= {
+			ERASEINFO(0x04000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x10000,15),
+		}
+	}, {
 		.mfr_id		= MANUFACTURER_FUJITSU,
 		.dev_id		= MBM29F040C,
 		.name		= "Fujitsu MBM29F040C",
-- 
1.5.3.7


-- 
Sincerely yours,
Mike.
