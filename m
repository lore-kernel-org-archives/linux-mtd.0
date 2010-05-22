Received: from fg-out-1718.google.com ([72.14.220.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OFdCA-0006Fz-AT
	for linux-mtd@lists.infradead.org; Sat, 22 May 2010 01:08:07 +0000
Received: by fg-out-1718.google.com with SMTP id l26so1094115fgb.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 May 2010 18:08:06 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] MTD: Kconfig cleanups
Date: Sat, 22 May 2010 04:07:56 +0300
Message-Id: <1274490476-16057-3-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1274490185.15285.22.camel@maxim-laptop>
References: <1274490185.15285.22.camel@maxim-laptop>
Cc: dwmw2 <dwmw2@infradead.org>, Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move all nand options under 'if MTD_NAND'
otherwise xconfig output is broken.

make Ricoh xD driver depend on MTD_NAND_ECC_SMC, untill
proper solution is made

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/Kconfig |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 98a04b3..8db333f 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -8,6 +8,8 @@ menuconfig MTD_NAND
 	  devices. For further information see
 	  <http://www.linux-mtd.infradead.org/doc/nand.html>.
 
+if MTD_NAND
+
 config MTD_NAND_ECC
 	tristate
 
@@ -19,7 +21,7 @@ config MTD_NAND_ECC_SMC
 	  Software ECC according to the Smart Media Specification.
 	  The original Linux implementation had byte 0 and 1 swapped.
 
-if MTD_NAND
+
 
 config MTD_NAND_VERIFY_WRITE
 	bool "Verify NAND page writes"
@@ -129,6 +131,7 @@ config MTD_NAND_RICOH
 	default n
 	depends on PCI
 	select MTD_SM_COMMON
+	select MTD_NAND_ECC_SMC
 	help
 	  Enable support for Ricoh R5C852 xD card reader
 	  You also need to enable ether
-- 
1.7.0.4
