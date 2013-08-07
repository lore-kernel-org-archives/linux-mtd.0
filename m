Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6y0G-0006E4-83
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 07:17:53 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MR5001PGG8RX890@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 16:17:30 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 6/7] mtd: maps: cfi_flagadm: add missing __iomem annotation
Date: Wed, 07 Aug 2013 16:17:29 +0900
Message-id: <004601ce933e$2d73eaf0$885bc0d0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, Jingoo Han <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added missing __iomem annotation and staticized local symbols
in order to fix the following sparse warnings:

drivers/mtd/maps/cfi_flagadm.c:58:17: warning: symbol 'flagadm_map' was not declared. Should it be static?
drivers/mtd/maps/cfi_flagadm.c:64:22: warning: symbol 'flagadm_parts' was not declared. Should it be static?
drivers/mtd/maps/cfi_flagadm.c:115:18: warning: cast removes address space of expression
drivers/mtd/maps/cfi_flagadm.c:115:18: warning: incorrect type in argument 1 (different address spaces)
drivers/mtd/maps/cfi_flagadm.c:115:18:    expected void volatile [noderef] <asn:2>*addr
drivers/mtd/maps/cfi_flagadm.c:115:18:    got void *<noident>
drivers/mtd/maps/cfi_flagadm.c:126:26: warning: cast removes address space of expression
drivers/mtd/maps/cfi_flagadm.c:126:26: warning: incorrect type in argument 1 (different address spaces)
drivers/mtd/maps/cfi_flagadm.c:126:26:    expected void volatile [noderef] <asn:2>*addr
drivers/mtd/maps/cfi_flagadm.c:126:26:    got void *<noident>
drivers/mtd/maps/cfi_flagadm.c:127:36: warning: Using plain integer as NULL pointer

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/maps/cfi_flagadm.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/cfi_flagadm.c b/drivers/mtd/maps/cfi_flagadm.c
index d16fc9d..d504b3d 100644
--- a/drivers/mtd/maps/cfi_flagadm.c
+++ b/drivers/mtd/maps/cfi_flagadm.c
@@ -55,13 +55,13 @@
 #define FLASH_PARTITION3_SIZE 0x001C0000
 
 
-struct map_info flagadm_map = {
+static struct map_info flagadm_map = {
 		.name =		"FlagaDM flash device",
 		.size =		FLASH_SIZE,
 		.bankwidth =	2,
 };
 
-struct mtd_partition flagadm_parts[] = {
+static struct mtd_partition flagadm_parts[] = {
 	{
 		.name =		"Bootloader",
 		.offset	=	FLASH_PARTITION0_ADDR,
@@ -112,7 +112,7 @@ static int __init init_flagadm(void)
 		return 0;
 	}
 
-	iounmap((void *)flagadm_map.virt);
+	iounmap((void __iomem *)flagadm_map.virt);
 	return -ENXIO;
 }
 
@@ -123,8 +123,8 @@ static void __exit cleanup_flagadm(void)
 		map_destroy(mymtd);
 	}
 	if (flagadm_map.virt) {
-		iounmap((void *)flagadm_map.virt);
-		flagadm_map.virt = 0;
+		iounmap((void __iomem *)flagadm_map.virt);
+		flagadm_map.virt = NULL;
 	}
 }
 
-- 
1.7.10.4
