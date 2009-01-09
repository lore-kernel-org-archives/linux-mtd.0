Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LLH0n-0004B4-Uw
	for linux-mtd@lists.infradead.org; Fri, 09 Jan 2009 13:02:54 +0000
Message-ID: <49674AFA.6090109@grandegger.com>
Date: Fri, 09 Jan 2009 14:02:50 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] CFI: major version fixup for Samsung K8P2815UQB NOR Flash
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Nicolas Pitre <nico@cam.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NOR Flash memory K8P2815UQB from Samsung uses an incorrect major
version number '0'. This patch introduces the cfi_fixup_major_minor()
function to set the major version to '1' for this chip. A normal
quirk (fixup) cannot be used, because cfi_fixup() is called after the
major/minor version check.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   10 ++++++++++
 include/linux/mtd/cfi.h             |    1 +
 2 files changed, 11 insertions(+)

Index: linux-2.6/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux-2.6.orig/drivers/mtd/chips/cfi_cmdset_0002.c
+++ linux-2.6/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -322,6 +322,14 @@ static struct cfi_fixup fixup_table[] = 
 };
 
 
+static void cfi_fixup_major_minor(struct cfi_private *cfi, 
+				  struct cfi_pri_amdstd *extp)
+{
+	if (cfi->mfr == CFI_MFR_SAMSUNG && cfi->id == 0x257e &&
+	    extp->MajorVersion == '0')
+		extp->MajorVersion = '1';
+}
+
 struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -363,6 +371,8 @@ struct mtd_info *cfi_cmdset_0002(struct 
 			return NULL;
 		}
 
+		cfi_fixup_major_minor(cfi, extp);
+
 		if (extp->MajorVersion != '1' ||
 		    (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
 			printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
Index: linux-2.6/include/linux/mtd/cfi.h
===================================================================
--- linux-2.6.orig/include/linux/mtd/cfi.h
+++ linux-2.6/include/linux/mtd/cfi.h
@@ -520,6 +520,7 @@ struct cfi_fixup {
 
 #define CFI_MFR_AMD 0x0001
 #define CFI_MFR_ATMEL 0x001F
+#define CFI_MFR_SAMSUNG 0x00EC
 #define CFI_MFR_ST  0x0020 	/* STMicroelectronics */
 
 void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
