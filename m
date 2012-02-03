Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtEjk-0007nZ-3R
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 08:43:16 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/8] mtd: lart: initialize writebufsize
Date: Fri,  3 Feb 2012 10:43:12 +0200
Message-Id: <eb60e25381d70803c827646fc65314abffcaf6e0.1328257053.git.artem.bityutskiy@linux.intel.com>
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

Set writebufsize to 4 because this drivers writes at max 4 bytes at a time.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@kernel.org [2.6.38+]
---
 drivers/mtd/devices/lart.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index a595848..6d6502c 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -630,6 +630,7 @@ static int __init lart_flash_init (void)
    mtd.name = module_name;
    mtd.type = MTD_NORFLASH;
    mtd.writesize = 1;
+   mtd.writebufsize = 4;
    mtd.flags = MTD_CAP_NORFLASH;
    mtd.size = FLASH_BLOCKSIZE_PARAM * FLASH_NUMBLOCKS_16m_PARAM + FLASH_BLOCKSIZE_MAIN * FLASH_NUMBLOCKS_16m_MAIN;
    mtd.erasesize = FLASH_BLOCKSIZE_MAIN;
-- 
1.7.9
