Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPJSC-0008Ko-BY
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 20:13:45 +0000
Received: by yhjj52 with SMTP id j52so2534703yhj.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 13:13:42 -0700 (PDT)
From: "Shawn J. Goff" <shawn7400@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Change linking order of SPI and MTD.
Date: Tue,  1 May 2012 16:12:28 -0400
Message-Id: <1335903148-29539-1-git-send-email-shawn7400@gmail.com>
Cc: "Shawn J. Goff" <shawn7400@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Shawn J. Goff" <shawn7400@gmail.com>

Currently, UBI initializes before SPI. This is a problem
if you intend to boot to a UBI volume on an SPI device.  UBI will
fail to initialize with the following message:

UBI error: ubi_init: UBI error: cannot initialize UBI, error -19

The initialization order is determined by the order the modules are
linked into the kernel, so the fix was to change this order. UBI is
under the MTD tree, so SPI is now linked in before MTD.

Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
---
 drivers/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index c07be02..0ccc4b1 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -51,8 +51,8 @@ obj-$(CONFIG_IDE)		+= ide/
 obj-$(CONFIG_SCSI)		+= scsi/
 obj-$(CONFIG_ATA)		+= ata/
 obj-$(CONFIG_TARGET_CORE)	+= target/
-obj-$(CONFIG_MTD)		+= mtd/
 obj-$(CONFIG_SPI)		+= spi/
+obj-$(CONFIG_MTD)		+= mtd/
 obj-y				+= net/
 obj-$(CONFIG_ATM)		+= atm/
 obj-$(CONFIG_FUSION)		+= message/
-- 
1.7.10
