Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0pH4-0006Md-7U
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 05:32:15 +0000
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9H00CLKU1NBN20@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 14:32:11 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9H00H1DU1N79@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 14:32:11 +0900 (KST)
Date: Wed, 29 Sep 2010 14:32:05 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] mtd: OneNAND: S5PC210 OneNAND support
To: linux-mtd@lists.infradead.org
Message-id: <20100929053205.GA13105@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

S5PC210 has the same OneNAND controller as S5PC110

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/Kconfig |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index 3f32289..4dbd0f5 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -32,10 +32,11 @@ config MTD_ONENAND_OMAP2
 
 config MTD_ONENAND_SAMSUNG
         tristate "OneNAND on Samsung SOC controller support"
-        depends on ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210
+        depends on ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_S5PV310
         help
-          Support for a OneNAND flash device connected to an Samsung SOC
-          S3C64XX/S5PC1XX controller.
+          Support for a OneNAND flash device connected to an Samsung SOC.
+          S3C64XX/S5PC100 use command mapping method.
+          S5PC110/S5PC210 use generic OneNAND method.
 
 config MTD_ONENAND_OTP
 	bool "OneNAND OTP Support"
-- 
1.5.3.3
