Date: Tue, 16 Dec 2008 18:25:34 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, jaredeh@gmail.com
Subject: [PATCH 8/8]LPDDR: folder for lpddr
Message-ID: <alpine.LFD.2.00.0812161824170.15885@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

LPDDR should to solves the same problems as CFI but it is another
interface. So it make sense to place it in own folder as it did for CFI.

Signed-off-by: Alexey Korolev <akorolev@infradead.org>
Acked-by: Jared Hulbert <jaredeh@gmail.com>
---

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index a90d50c..ad20dc3 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -316,6 +316,8 @@ source "drivers/mtd/nand/Kconfig"
 
 source "drivers/mtd/onenand/Kconfig"
 
+source "drivers/mtd/lpddr/Kconfig"
+
 source "drivers/mtd/ubi/Kconfig"
 
 endif # MTD
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 4b77335..7fb3dfb 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -29,6 +29,6 @@ obj-$(CONFIG_MTD_OOPS)		+= mtdoops.o
 nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
 
-obj-y		+= chips/ maps/ devices/ nand/ onenand/
+obj-y		+= chips/ lpddr/ maps/ devices/ nand/ onenand/ 
 
 obj-$(CONFIG_MTD_UBI)		+= ubi/
