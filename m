Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oe8wj-0008Cm-6G
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2010 15:53:38 +0000
Received: by bwz15 with SMTP id 15so5030995bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Jul 2010 08:53:28 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] MTD: update description on sm_ftl
Date: Wed, 28 Jul 2010 18:53:17 +0300
Message-Id: <1280332397-6031-3-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1280332397-6031-1-git-send-email-maximlevitsky@gmail.com>
References: <1280332397-6031-1-git-send-email-maximlevitsky@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think that scary description can go now...

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/Kconfig |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index f8210bf..8664133 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -311,11 +311,14 @@ config SM_FTL
 	select MTD_BLKDEVS
 	select MTD_NAND_ECC
 	help
-	  This enables new and very EXPERMENTAL support for SmartMedia/xD
+	  This enables EXPERMENTAL R/W support for SmartMedia/xD
 	  FTL (Flash translation layer).
-	  Write support isn't yet well tested, therefore this code IS likely to
-	  eat your card, so please don't use it together with valuable data.
-	  Use readonly driver (CONFIG_SSFDC) instead.
+	  Write support is only lightly tested, therefore this driver
+	  isn't recommended to use with valuable data (anyway if you have
+	  valuable data, do backups regardsless of software/hardware you
+	  use, because you never know what will eat your data...)
+	  If you only need R/O access, you can use older R/O driver
+	  (CONFIG_SSFDC)
 
 config MTD_OOPS
 	tristate "Log panic/oops to an MTD buffer"
-- 
1.7.0.4
