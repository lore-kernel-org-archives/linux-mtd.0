Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aK1jT-000490-FG
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2016 10:35:52 +0000
Received: by mail-wm0-x242.google.com with SMTP id b14so2141721wmb.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2016 02:35:31 -0800 (PST)
From: Romain Izard <romain.izard.pro@gmail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>,
 Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH v2 2/8] mtd: atmel_nand: Simplify error messages
Date: Fri, 15 Jan 2016 11:34:56 +0100
Message-Id: <1452854102-6125-3-git-send-email-romain.izard.pro@gmail.com>
In-Reply-To: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The error messages when the ECC controller is misconfigured through the
device tree are very precise. As a result they can (and will) get
obsolete when new revisions of the controller appear.

Simplify them before adding the support for the new revision.

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
v2: split from the 32-bit ECC enabling patch

 drivers/mtd/nand/atmel_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index b8abf14e1298..6e548fc3ab7b 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1549,7 +1549,7 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 		if ((val != 2) && (val != 4) && (val != 8) && (val != 12) &&
 				(val != 24)) {
 			dev_err(host->dev,
-				"Unsupported PMECC correction capability: %d; should be 2, 4, 8, 12 or 24\n",
+				"Required ECC strength not supported: %u\n",
 				val);
 			return -EINVAL;
 		}
@@ -1559,7 +1559,7 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 	if (of_property_read_u32(np, "atmel,pmecc-sector-size", &val) == 0) {
 		if ((val != 512) && (val != 1024)) {
 			dev_err(host->dev,
-				"Unsupported PMECC sector size: %d; should be 512 or 1024 bytes\n",
+				"Required ECC sector size not supported: %u\n",
 				val);
 			return -EINVAL;
 		}
-- 
2.5.0
