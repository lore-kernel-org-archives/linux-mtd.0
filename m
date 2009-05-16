Received: from mail-qy0-f184.google.com ([209.85.221.184])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M5IGc-0003YD-Li
	for linux-mtd@lists.infradead.org; Sat, 16 May 2009 11:41:33 +0000
Received: by qyk14 with SMTP id 14so5873594qyk.28
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 May 2009 04:41:26 -0700 (PDT)
Subject: [PATCH] cfi_cmdset_0001.c: quirk for PF38F4476.
From: Daniel Ribeiro <drwyrm@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Sat, 16 May 2009 08:41:12 -0300
Message-Id: <1242474072.30413.32.camel@brutus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: openezx-devel <openezx-devel@lists.openezx.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This chip reports CFI 1.3, but the CFI PRI is like CFI 1.1. Add a quirk
to pass probe on this chip.
(This patch depends on "cfi_cmdset_0001.c: CFI 1.0 and CFI 1.1")

Signed-off-by: Daniel Ribeiro <drwyrm@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index bf07d14..0e01ab9 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -46,6 +46,7 @@
 #define MANUFACTURER_INTEL	0x0089
 #define I82802AB	0x00ad
 #define I82802AC	0x00ac
+#define PF38F4476	0x881c
 #define MANUFACTURER_ST         0x0020
 #define M50LPW080       0x002F
 #define M50FLW080A	0x0080
@@ -315,9 +316,18 @@ static struct cfi_fixup fixup_table[] = {
 	{ 0, 0, NULL, NULL }
 };
 
+static void cfi_fixup_major_minor(struct cfi_private *cfi,
+						struct cfi_pri_intelext *extp)
+{
+	if (cfi->mfr == MANUFACTURER_INTEL &&
+			cfi->id == PF38F4476 && extp->MinorVersion == '3')
+		extp->MinorVersion = '1';
+}
+
 static inline struct cfi_pri_intelext *
 read_pri_intelext(struct map_info *map, __u16 adr)
 {
+	struct cfi_private *cfi = map->fldrv_priv;
 	struct cfi_pri_intelext *extp;
 	unsigned int extra_size = 0;
 	unsigned int extp_size = sizeof(*extp);
@@ -327,6 +337,8 @@ read_pri_intelext(struct map_info *map, __u16 adr)
 	if (!extp)
 		return NULL;
 
+	cfi_fixup_major_minor(cfi, extp);
+
 	if (extp->MajorVersion != '1' ||
 	    (extp->MinorVersion < '0' || extp->MinorVersion > '5')) {
 		printk(KERN_ERR "  Unknown Intel/Sharp Extended Query "
-- 
tg: (385157b..) mtd/pf38f4476-fix (depends on: mtd/cfi1.1-has-extra-too)

-- 
Daniel Ribeiro
