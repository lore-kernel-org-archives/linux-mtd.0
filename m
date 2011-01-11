Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pcdah-0003y2-Ee
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 12:44:51 +0000
Received: by wyf22 with SMTP id 22so20347943wyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Jan 2011 04:44:46 -0800 (PST)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/16] mtd: mpc5121_nfc: don't treat NULL clk as an error
Date: Tue, 11 Jan 2011 12:43:49 +0000
Message-Id: <1294749833-32019-13-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1294749833-32019-1-git-send-email-jamie@jamieiles.com>
References: <1294749833-32019-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Vincent Sanders <support@simtec.co.uk>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

clk_get() returns a struct clk cookie to the driver and some platforms
may return NULL if they only support a single clock.  clk_get() has only
failed if it returns a ERR_PTR() encoded pointer.

Cc: Vincent Sanders <support@simtec.co.uk>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/mpc5121_nfc.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 469e649..ddaf001 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -29,6 +29,7 @@
 #include <linux/clk.h>
 #include <linux/gfp.h>
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -758,9 +759,9 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op,
 
 	/* Enable NFC clock */
 	prv->clk = clk_get(dev, "nfc_clk");
-	if (!prv->clk) {
+	if (IS_ERR(prv->clk)) {
 		dev_err(dev, "Unable to acquire NFC clock!\n");
-		retval = -ENODEV;
+		retval = PTR_ERR(prv->clk);
 		goto error;
 	}
 
-- 
1.7.3.4
