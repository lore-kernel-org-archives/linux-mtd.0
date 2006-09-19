Received: from av2.karneval.cz ([81.27.192.122])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GPlh8-0007gS-03
	for linux-mtd@lists.infradead.org; Tue, 19 Sep 2006 20:55:50 +0100
Message-id: <91new349121291221@karneval.cz>
Subject: [PATCH 2/3] pmc551 use kzalloc
From: Jiri Slaby <jirislaby@gmail.com>
To: Andrew Morton <akpm@osdl.org>
Date: Tue, 19 Sep 2006 21:55:18 +0200 (CEST)
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

Use kzalloc instad of kmalloc+memset(0).

Signed-off-by: Jiri Slaby <jirislaby@gmail.com>

---
commit eb0edd8068cde9b5e6afaf09065a94cb83c10efd
tree a2f56ac7c0f5cb8e0e3dba707faa68cc8d5c9952
parent 22f07f42debab2cc3b6ab895d2fa2c34d192c25c
author Jiri Slaby <jirislaby@gmail.com> Tue, 19 Sep 2006 21:33:07 +0200
committer Jiri Slaby <xslaby@anemoi.localdomain> Tue, 19 Sep 2006 21:33:07 +0200

 drivers/mtd/devices/pmc551.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 4d40236..62a9188 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -732,23 +732,20 @@ static int __init init_pmc551(void)
 			msize = length;
 		}
 
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
 
