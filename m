Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTX6U-0004vm-5x
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2010 09:59:59 +0000
Subject: [PATCH v5 2/2] mtd: cfi_cmdset_0002: add support for Samsung
	K8D3x16UxC NOR chips
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 17 Dec 2010 10:59:47 +0100
Message-ID: <20101217095947.8560.45288.stgit@shiryu>
In-Reply-To: <20101217095941.8560.75355.stgit@shiryu>
References: <20101217095941.8560.75355.stgit@shiryu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Matthias Buecher / Germany <mail@maddes.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Wolfram Sang <w.sang@pengutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These chips report CFI v3.3 [1], so patch them on the fly to the more
correct v1.3.
Discussed and tested by the OpenWRT people [2].

[1] http://www.samsung.com/global/system/business/semiconductor/product/2007/6/11/NORFlash/32Mbit/K8D3216UBC/ds_K8D3x16UxC_rev17.pdf
[2] https://dev.openwrt.org/ticket/866

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 324fee4..a43ab45 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -393,10 +393,12 @@ static void cfi_fixup_major_minor(struct cfi_private *cfi,
 				  struct cfi_pri_amdstd *extp)
 {
 	if (cfi->mfr == CFI_MFR_SAMSUNG) {
-		if (extp->MajorVersion == '0' && extp->MinorVersion == '0') {
+		if ((extp->MajorVersion == '0' && extp->MinorVersion == '0') ||
+		    (extp->MajorVersion == '3' && extp->MinorVersion == '3')) {
 			/*
 			 * Samsung K8P2815UQB and K8D6x16UxM chips
 			 * report major=0 / minor=0.
+			 * K8D3x16UxC chips report major=3 / minor=3.
 			 */
 			printk(KERN_NOTICE "  Fixing Samsung's Amd/Fujitsu"
 			       " Extended Query version to 1.%c\n",
