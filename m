Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PQMXl-0000la-Nm
	for linux-mtd@lists.infradead.org; Wed, 08 Dec 2010 16:07:03 +0000
Subject: [PATCH v3 1/2] mtd: cfi_cmdset_0002: add support for Samsung
	K8D6x16UxM NOR chips
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Wed, 08 Dec 2010 17:00:18 +0100
Message-ID: <20101208160018.22017.8779.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Matthias Buecher / Germany <mail@maddes.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These chips report CFI v0.0 [1], so extend cfi_fixup_major_minor()
to patch all Samsung chips with Major == 0 to 1.0.
Discussed and tested by the OpenWRT people [2].

[1] http://www.samsung.com/global/system/business/semiconductor/product/2007/6/11/NORFlash/64Mbit/K8D6316UTM/ds_K8D6x16UxM_rev16.pdf
[2] https://dev.openwrt.org/ticket/7348

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   16 +++++++++++++---
 1 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 9d68ab9..7966f07 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -392,9 +392,19 @@ static struct cfi_fixup fixup_table[] = {
 static void cfi_fixup_major_minor(struct cfi_private *cfi,
 				  struct cfi_pri_amdstd *extp)
 {
-	if (cfi->mfr == CFI_MFR_SAMSUNG && cfi->id == 0x257e &&
-	    extp->MajorVersion == '0')
-		extp->MajorVersion = '1';
+	if (cfi->mfr == CFI_MFR_SAMSUNG) {
+		if (extp->MajorVersion == '0') {
+			/*
+			 * Samsung K8P2815UQB and K8D6x16UxM chips report major=0 / minor=0
+			 */
+			printk(KERN_NOTICE "  Fixed Samsung's Amd/Fujitsu Extended Query version from 0.%c to 1.0\n",
+			       extp->MinorVersion);
+
+			extp->MajorVersion = '1';
+			extp->MinorVersion = '0';
+		}
+	}
+
 	/*
 	 * SST 38VF640x chips report major=0xFF / minor=0xFF.
 	 */
