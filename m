Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJnaF-0000df-Fl
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2010 13:02:12 +0000
Received: by mail-fx0-f49.google.com with SMTP id 15so4682798fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Jun 2010 06:02:11 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: dwmw2 <dwmw2@infradead.org>
Subject: [PATCH 4/4] MTD: Fix NAND submenu
Date: Wed,  2 Jun 2010 16:01:48 +0300
Message-Id: <1275483708-11929-5-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1275483708-11929-1-git-send-email-maximlevitsky@gmail.com>
References: <1275483708-11929-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
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


Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/Kconfig |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 98a04b3..5927239 100644
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
-- 
1.7.0.4
