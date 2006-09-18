Received: from av1.karneval.cz ([81.27.192.123])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GPSGp-0003S1-66
	for linux-mtd@lists.infradead.org; Tue, 19 Sep 2006 00:11:23 +0100
Message-id: <91292349121291221@karneval.cz>
Subject: [PATCH 3/4] pmc551 use kzalloc
From: Jiri Slaby <jirislaby@gmail.com>
To: Andrew Morton <akpm@osdl.org>
Date: Tue, 19 Sep 2006 00:47:34 +0200 (CEST)
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mark Ferrell <mferrell@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

pmc551 use kzalloc

Signed-off-by: Jiri Slaby <jirislaby@gmail.com>

---
commit 912ff3e53f760cb166988fcd46fc173f8e4c22e7
tree 8dbed23771076f4cb714ffe9115849150791f13a
parent f562d858f77d4a83f55cf7fa962cd4dbef3eb0d6
author Jiri Slaby <xslaby@anemoi.localdomain> Tue, 19 Sep 2006 00:32:53 +0200
committer Jiri Slaby <xslaby@anemoi.localdomain> Tue, 19 Sep 2006 00:32:53 +0200

 drivers/mtd/devices/pmc551.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 0ee22ca..5f5de9c 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -725,23 +725,20 @@ static int __init init_pmc551(void)
 		} else
 			msize = length;
 
-		mtd = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
+		mtd = kzalloc(sizeof(struct mtd_info), GFP_KERNEL);
 		if (!mtd) {
 			printk(KERN_NOTICE "pmc551: Cannot allocate new MTD "
 				"device.\n");
 			break;
 		}
 
-		memset(mtd, 0, sizeof(struct mtd_info));
-
-		priv = kmalloc(sizeof(struct mypriv), GFP_KERNEL);
+		priv = kzalloc(sizeof(struct mypriv), GFP_KERNEL);
 		if (!priv) {
 			printk(KERN_NOTICE "pmc551: Cannot allocate new MTD "
 				"device.\n");
 			kfree(mtd);
 			break;
 		}
-		memset(priv, 0, sizeof(*priv));
 		mtd->priv = priv;
 		priv->dev = PCI_Device;
 
