Received: from mxout10.netvision.net.il ([194.90.6.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K0uPZ-0000vd-FF
	for linux-mtd@lists.infradead.org; Tue, 27 May 2008 08:20:02 +0000
Received: from mail.linux-boards.com ([62.90.235.247])
	by mxout10.netvision.net.il
	(Sun Java System Messaging Server 6.2-8.04 (built Feb 28 2007))
	with ESMTP id <0K1I0044BPYJKUB0@mxout10.netvision.net.il> for
	linux-mtd@lists.infradead.org; Tue, 27 May 2008 11:23:07 +0300 (IDT)
Date: Tue, 27 May 2008 11:20:03 +0300
From: Mike Rapoport <mike@compulab.co.il>
Subject: [PATCH 1/2] Add support for flash chips with ID in bank other than 0
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <483BC433.8020607@compulab.co.il>
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

According to JEDEC "Standard Manufacturer's Identification Code"
(http://www.jedec.org/download/search/jep106W.pdf)
several first banks of NOR flash can contain 0x7f instead of actual ID.
This patch adds support for reading manufacturer ID from banks other than 0.

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 drivers/mtd/chips/jedec_probe.c |   19 ++++++++++++++++---
 1 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 02e375b..9e57aec 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -37,6 +37,7 @@
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_TOSHIBA	0x0098
 #define MANUFACTURER_WINBOND	0x00da
+#define CONTINUATION_CODE	0x007f


 /* AMD */
@@ -1728,9 +1729,21 @@ static inline u32 jedec_read_mfr(struct map_info *map, uint32_t base,
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
+		mask = (1 << (cfi->device_type * 8)) - 1;
+		result = map_read(map, base + ofs);
+		bank++;
+	} while ((result.x[0] & mask) == CONTINUATION_CODE);
+
 	return result.x[0] & mask;
 }

-- 
1.5.3.7


-- 
Sincerely yours,
Mike.
