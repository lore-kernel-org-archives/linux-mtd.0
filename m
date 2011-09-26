Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R80h1-0007Y7-8d
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2011 02:13:16 +0000
Received: by gwa2 with SMTP id 2so3862979gwa.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 25 Sep 2011 19:13:13 -0700 (PDT)
Subject: [PATCH v2] mtd: r852: make r852_pm_ops static
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Sep 2011 10:13:03 +0800
Message-ID: <1317003183.6468.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <artem.bityutskiy@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is not used outside this driver so no need to make the symbol global.
Also make r852_suspend and r852_resume static.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
v2: Also make r852_suspend and r852_resume static

 drivers/mtd/nand/r852.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index cae2e01..f20f393 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -1027,7 +1027,7 @@ void r852_shutdown(struct pci_dev *pci_dev)
 }
 
 #ifdef CONFIG_PM
-int r852_suspend(struct device *device)
+static int r852_suspend(struct device *device)
 {
 	struct r852_device *dev = pci_get_drvdata(to_pci_dev(device));
 
@@ -1048,7 +1048,7 @@ int r852_suspend(struct device *device)
 	return 0;
 }
 
-int r852_resume(struct device *device)
+static int r852_resume(struct device *device)
 {
 	struct r852_device *dev = pci_get_drvdata(to_pci_dev(device));
 
@@ -1092,7 +1092,7 @@ static const struct pci_device_id r852_pci_id_tbl[] = {
 
 MODULE_DEVICE_TABLE(pci, r852_pci_id_tbl);
 
-SIMPLE_DEV_PM_OPS(r852_pm_ops, r852_suspend, r852_resume);
+static SIMPLE_DEV_PM_OPS(r852_pm_ops, r852_suspend, r852_resume);
 
 static struct pci_driver r852_pci_driver = {
 	.name		= DRV_NAME,
-- 
1.7.4.1
