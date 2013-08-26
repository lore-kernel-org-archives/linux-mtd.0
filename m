Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
 helo=ch1outboundpool.messaging.microsoft.com)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDtJY-0006rK-18
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2013 09:42:25 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 08/10] mtd: add MTD_MLCNANDFLASH case for mtd_type_show()
Date: Mon, 26 Aug 2013 17:36:46 +0800
Message-ID: <1377509808-29363-9-git-send-email-b32955@freescale.com>
In-Reply-To: <1377509808-29363-1-git-send-email-b32955@freescale.com>
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current mtd_type_show() misses the MTD_MLCNANDFLASH case.
This patch adds the case for it, and also updates the ABI.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 Documentation/ABI/testing/sysfs-class-mtd |    2 +-
 drivers/mtd/mtdcore.c                     |    3 +++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index bfd119a..1399bb2 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -104,7 +104,7 @@ Description:
 		One of the following ASCII strings, representing the device
 		type:
 
-		absent, ram, rom, nor, nand, dataflash, ubi, unknown
+		absent, ram, rom, nor, nand, mlc-nand, dataflash, ubi, unknown
 
 What:		/sys/class/mtd/mtdX/writesize
 Date:		April 2009
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5e14d54..92311a5 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -157,6 +157,9 @@ static ssize_t mtd_type_show(struct device *dev,
 	case MTD_UBIVOLUME:
 		type = "ubi";
 		break;
+	case MTD_MLCNANDFLASH:
+		type = "mlc-nand";
+		break;
 	default:
 		type = "unknown";
 	}
-- 
1.7.1
