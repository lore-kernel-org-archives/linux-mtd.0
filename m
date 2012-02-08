Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv6Si-0001t3-0I
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 12:17:24 +0000
Received: by eaai1 with SMTP id i1so158342eaa.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 04:17:21 -0800 (PST)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 1/7] mtd: sh_flctl: Update FLCMNCR register bit field
Date: Wed,  8 Feb 2012 13:16:45 +0100
Message-Id: <1328703411-3452-1-git-send-email-hechtb@gmail.com>
Cc: Bastian Hecht <hechtb@gmail.com>, magnus.damm@gmail.com,
 laurent.pinchart@ideasonboard.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Updates the FLCMNCR bit field to match the newest hardware generation.
Some defines are added to select an appropriate clocking scheme.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
 include/linux/mtd/sh_flctl.h |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/sh_flctl.h b/include/linux/mtd/sh_flctl.h
index 9cf4c4c..ecbf3e6 100644
--- a/include/linux/mtd/sh_flctl.h
+++ b/include/linux/mtd/sh_flctl.h
@@ -67,6 +67,30 @@
 #define	CE0_ENABLE	(0x1 << 3)	/* Chip Enable 0 */
 #define	TYPESEL_SET	(0x1 << 0)
 
+/*
+ * Clock settings using the PULSEx registers from FLCMNCR
+ *
+ * Some hardware uses registers called PULSEx instead of FCKSEL_E and QTSEL_E
+ * to control the clock divider used between the High-Speed Peripheral Clock
+ * and the FLCTL internal clock. If so, use CLK_8_BIT_xxx for connecting 8 bit
+ * and CLK_16_BIT_xxx for connecting 16 bit bus bandwith NAND chips. For the 16
+ * bit version the divider is seperate for the pulse width of high and low
+ * signals.
+ */
+#define PULSE3	(0x1 << 27)
+#define PULSE2	(0x1 << 17)
+#define PULSE1	(0x1 << 15)
+#define PULSE0	(0x1 << 9)
+#define CLK_8_BIT_0_5HP			PULSE1
+#define CLK_8_BIT_1HP			0x0
+#define CLK_8_BIT_1_5HP			(PULSE1 | PULSE2)
+#define CLK_8_BIT_2HP			PULSE0
+#define CLK_8_BIT_3HP			(PULSE0 | PULSE1 | PULSE2)
+#define CLK_8_BIT_4HP			(PULSE0 | PULSE2)
+#define CLK_16_BIT_6HP_LOW_2HP_HIGH	PULSE0
+#define CLK_16_BIT_9HP_LOW_3HP_HIGH	(PULSE0 | PULSE1 | PULSE2)
+#define CLK_16_BIT_12HP_LOW_4HP_HIGH	(PULSE0 | PULSE2)
+
 /* FLCMDCR control bits */
 #define ADRCNT2_E	(0x1 << 31)	/* 5byte address enable */
 #define ADRMD_E		(0x1 << 26)	/* Sector address access */
-- 
1.7.5.4
