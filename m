Received: from mail-ea0-x232.google.com ([2a00:1450:4013:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V0gFr-0002jn-Fi
 for linux-mtd@lists.infradead.org; Sat, 20 Jul 2013 23:08:00 +0000
Received: by mail-ea0-f178.google.com with SMTP id l15so3032766eak.37
 for <linux-mtd@lists.infradead.org>; Sat, 20 Jul 2013 16:07:36 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: jedec_probe: fix LH28F640BF definition
Date: Sun, 21 Jul 2013 01:07:33 +0200
Message-Id: <1374361653-3004-1-git-send-email-andrea.adami@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zaurus 5500 contains 2 LH28F640BFHE-PTTL90 (64M 4Mx16) and
the LH28F640BFHE-PTTL90.pdf datasheet available on the net shows
the exact erasesize and the OTP support.
At the moment only jedec_probe can discover the chip and
the NOR is mounted read only probably because of wrong vpp.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 drivers/mtd/chips/jedec_probe.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index c443f52..7c0b27d 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -120,7 +120,7 @@
 #define PM49FL008	0x006A
 
 /* Sharp */
-#define LH28F640BF	0x00b0
+#define LH28F640BF	0x00B0
 
 /* ST - www.st.com */
 #define M29F800AB	0x0058
@@ -1299,13 +1299,14 @@ static const struct amd_flash_info jedec_table[] = {
 		.mfr_id		= CFI_MFR_SHARP,
 		.dev_id		= LH28F640BF,
 		.name		= "LH28F640BF",
-		.devtypes	= CFI_DEVICETYPE_X8,
+		.devtypes	= CFI_DEVICETYPE_X16,
 		.uaddr		= MTD_UADDR_UNNECESSARY,
-		.dev_size	= SIZE_4MiB,
-		.cmd_set	= P_ID_INTEL_STD,
-		.nr_regions	= 1,
+		.dev_size	= SIZE_8MiB,
+		.cmd_set	= P_ID_INTEL_EXT,
+		.nr_regions	= 2,
 		.regions	= {
-			ERASEINFO(0x40000,16),
+			ERASEINFO(0x10000, 127),
+			ERASEINFO(0x02000, 8),
 		}
 	}, {
 		.mfr_id		= CFI_MFR_SST,
-- 
1.8.1.5
