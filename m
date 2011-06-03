Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSIwB-0005VK-Ti
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 01:12:32 +0000
Received: by pvh11 with SMTP id 11so897688pvh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 18:12:27 -0700 (PDT)
Subject: [PATCH] mtd: denali: remove calling mtd_device_unregister() after
	nand_release()
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 09:12:15 +0800
Message-ID: <1307063535.10001.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Jamie Iles <jamie@jamieiles.com>,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The implementation of nand_release() already call mtd_device_unregister(),
no need to call it again.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/nand/denali.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index d527621..e119748 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1676,7 +1676,6 @@ static void denali_pci_remove(struct pci_dev *dev)
 	struct denali_nand_info *denali = pci_get_drvdata(dev);
 
 	nand_release(&denali->mtd);
-	mtd_device_unregister(&denali->mtd);
 
 	denali_irq_cleanup(dev->irq, denali);
 
-- 
1.7.4.1
