Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBFJN-0004fb-Ji
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 02:35:32 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 8/9] mtd: add MTD_MLCNANDFLASH case for mtd_type_show()
Date: Mon, 19 Aug 2013 10:31:17 +0800
Message-ID: <1376879478-22128-9-git-send-email-b32955@freescale.com>
In-Reply-To: <1376879478-22128-1-git-send-email-b32955@freescale.com>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, akinobu.mita@gmail.com, matthieu.castet@parrot.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
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
index a795582..8104410 100644
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
