Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtEjg-0007na-JE
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 08:43:13 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/8] mtd: doc2001: initialize writebufsize
Date: Fri,  3 Feb 2012 10:43:09 +0200
Message-Id: <d88a1db7b795fca836e99f39f6c3ee69edaab16b.1328257053.git.artem.bityutskiy@linux.intel.com>
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
 drivers/mtd/devices/doc2001.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index 3785733..b1185f9 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -346,7 +346,7 @@ void DoCMil_init(struct mtd_info *mtd)
 
 	/* FIXME: erase size is not always 8KiB */
 	mtd->erasesize = 0x2000;
-	mtd->writesize = 512;
+	mtd->writebufsize = mtd->writesize = 512;
 	mtd->oobsize = 16;
 	mtd->owner = THIS_MODULE;
 	mtd->_erase = doc_erase;
-- 
1.7.9
