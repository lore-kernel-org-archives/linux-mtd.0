Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtEjn-0007nZ-FZ
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 08:43:20 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 8/8] mtd: sst25l: initialize writebufsize
Date: Fri,  3 Feb 2012 10:43:14 +0200
Message-Id: <59fc09045cf8b118c88733c1181afd8555d05867.1328257053.git.artem.bityutskiy@linux.intel.com>
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

Set writebufsize to the flash page size because it is the maximum amount of
data it writes at a time.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/sst25l.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index a665eba..8b9ffaf 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -402,6 +402,7 @@ static int __devinit sst25l_probe(struct spi_device *spi)
 	flash->mtd.flags	= MTD_CAP_NORFLASH;
 	flash->mtd.erasesize	= flash_info->erase_size;
 	flash->mtd.writesize	= flash_info->page_size;
+	flash->mtd.writebufsize	= flash_info->page_size;
 	flash->mtd.size		= flash_info->page_size * flash_info->nr_pages;
 	flash->mtd._erase	= sst25l_erase;
 	flash->mtd._read		= sst25l_read;
-- 
1.7.9
