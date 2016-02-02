Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQmA-0002Zc-Ry
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:09 +0000
Received: by mail-pa0-x241.google.com with SMTP id gi1so7946753pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:50 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 17/17] drivers:mtd:ubi: Kconfig Makefile
Date: Tue,  2 Feb 2016 02:30:52 +0000
Message-Id: <1454380252-16170-18-git-send-email-jackyard88@gmail.com>
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bean Huo <beanhuo@micron.com>

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/ubi/Kconfig  | 15 +++++++++++++++
 drivers/mtd/ubi/Makefile |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index f0855ce..d9f01fa 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -77,6 +77,21 @@ config MTD_UBI_FASTMAP
 
 	   If in doubt, say "N".
 
+config MTD_UBI_MLC_NAND_BAKVOL
+	bool "UBI solution for NAND pair page (Experimental feature)"
+	default n
+	help
+	   This used for MLC NAND paired page power-cut protection.
+
+	   MLC NAND paired page power loss is a known issue so far.
+	   Namely, MLC NAND pages are coupled in a sense that if you cut
+	   power while writing to a page, you corrupt not only this page,
+	   but also one of the previous pages which is paired with the current
+	   one. More detail information,please refer to follwoing link:
+	   http://www.linux-mtd.infradead.org/doc/ubifs.html
+
+	   If in doubt, say "N".
+
 config MTD_UBI_GLUEBI
 	tristate "MTD devices emulation driver (gluebi)"
 	help
diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
index 4e3c3d7..6bd78aa 100644
--- a/drivers/mtd/ubi/Makefile
+++ b/drivers/mtd/ubi/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_MTD_UBI) += ubi.o
 
-ubi-y += vtbl.o vmt.o upd.o build.o cdev.o kapi.o eba.o io.o wl.o attach.o
+ubi-y += vtbl.o vmt.o upd.o build.o cdev.o kapi.o eba.o io.o wl.o attach.o bakvol.o
 ubi-y += misc.o debug.o
 ubi-$(CONFIG_MTD_UBI_FASTMAP) += fastmap.o
 ubi-$(CONFIG_MTD_UBI_BLOCK) += block.o
-- 
1.9.1
