Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtEjm-0007nZ-1e
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 08:43:19 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/8] mtd: spear_smi: initialize writebufsize
Date: Fri,  3 Feb 2012 10:43:13 +0200
Message-Id: <7720c371a73549c301023b95ab0f8eaad7ebc6a9.1328257053.git.artem.bityutskiy@linux.intel.com>
In-Reply-To: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
References: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
In-Reply-To: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
References: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
Cc: Shiraz Hashim <shiraz.hashim@st.com>,
 spear--sw-devel@lists.codex.cro.st.com, Stefan Roese <sr@denx.de>
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
Cc: Stefan Roese <sr@denx.de>
Cc: Shiraz Hashim <shiraz.hashim@st.com>
Cc: spear--sw-devel@lists.codex.cro.st.com
---
 drivers/mtd/devices/spear_smi.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 77bcb0b..b4c02d6 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -847,6 +847,7 @@ static int spear_smi_setup_banks(struct platform_device *pdev, u32 bank)
 	flash->mtd.size = flash_info->size;
 	flash->mtd.erasesize = flash_devices[flash_index].sectorsize;
 	flash->page_size = flash_devices[flash_index].pagesize;
+	flash->mtd.writebufsize = flash->page_size;
 	flash->erase_cmd = flash_devices[flash_index].erase_cmd;
 	flash->mtd._erase = spear_mtd_erase;
 	flash->mtd._read = spear_mtd_read;
-- 
1.7.9
