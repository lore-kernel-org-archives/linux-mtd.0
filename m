Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJvP7-00042X-9a
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 18:42:02 +0000
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] MTD: Intel StrataFlash P33 is locked on bootup
Date: Tue, 29 Jan 2008 19:36:49 +0100
Message-Id: <1201631809-32193-1-git-send-email-hskinnemoen@atmel.com>
Cc: Haavard Skinnemoen <hskinnemoen@atmel.com>, Paolo.Santos@devoteam.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add appropriate fixups for all the devices listed in the Intel P33
data sheet.

Thanks to Paolo Santos for reporting this issue and testing the patch.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 1707f98..b723af1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -246,6 +246,12 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
 	{ MANUFACTURER_INTEL, 0x891c,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, 0x881d,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, 0x881e,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, 0x891f,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, 0x8820,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, 0x8821,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, 0x8922,	      fixup_use_powerup_lock, NULL, },
 	{ 0, 0, NULL, NULL }
 };
 
-- 
1.5.3.8
