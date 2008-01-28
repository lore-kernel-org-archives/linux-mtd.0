Received: from smtp-out3.tiscali.nl ([195.241.79.178])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJRXK-0006OQ-PH
	for linux-mtd@lists.infradead.org; Mon, 28 Jan 2008 10:48:28 +0000
Message-ID: <479DB2E9.2040500@tiscali.nl>
Date: Mon, 28 Jan 2008 11:48:09 +0100
From: Roel Kluin <12o3l@tiscali.nl>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: [PATCH 1/1][MTD] Test devtype, not definition in flash_probe(),
	drivers/mtd/devices/lart.c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

drivers/mtd/devices/lart.c:119:#define FLASH_DEVICE_16mbit_BOTTOM 0x88f488f4
As was, unless "manufacturer != FLASH_MANUFACTURER" this returned true
--
Test devtype, not definition

Signed-off-by: Roel Kluin <12o3l@tiscali.nl>
---
diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 4ea50a1..99fd210 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -323,7 +323,7 @@ static int flash_probe (void)
    /* put the flash back into command mode */
    write32 (DATA_TO_FLASH (READ_ARRAY),0x00000000);
 
-   return (manufacturer == FLASH_MANUFACTURER && (devtype == FLASH_DEVICE_16mbit_TOP || FLASH_DEVICE_16mbit_BOTTOM));
+   return (manufacturer == FLASH_MANUFACTURER && (devtype == FLASH_DEVICE_16mbit_TOP || devtype == FLASH_DEVICE_16mbit_BOTTOM));
 }
 
 /*
