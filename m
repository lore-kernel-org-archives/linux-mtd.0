Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtEjh-0007nZ-Ff
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 08:43:13 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/8] mtd: doc2001plus: initialize writebufsize
Date: Fri,  3 Feb 2012 10:43:10 +0200
Message-Id: <ac4cc3b2741b1871801c74d2a268c96ae88c846d.1328257053.git.artem.bityutskiy@linux.intel.com>
In-Reply-To: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
References: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
In-Reply-To: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
References: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The writebufsize concept was introduce by commit
"0e4ca7e mtd: add writebufsize field to mtd_info struct" and it represents
the maximum amount of data the device writes to the media at a time. This is
an important parameter for UBIFS which is used during recovery and which
basically defines how big a corruption caused by a power cut can be.

Set it to be equivalent to mtd->writesize because this is the maximum amount
of data the driver writes at a time.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@kernel.org [2.6.38+]
---
 drivers/mtd/devices/doc2001plus.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 409fa31..c9fbadd 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -467,7 +467,7 @@ void DoCMilPlus_init(struct mtd_info *mtd)
 
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->writesize = 512;
+	mtd->writebufsize = mtd->writesize = 512;
 	mtd->oobsize = 16;
 	mtd->owner = THIS_MODULE;
 	mtd->_erase = doc_erase;
-- 
1.7.9
