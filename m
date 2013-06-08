Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UlLD5-0007jG-EG
 for linux-mtd@lists.infradead.org; Sat, 08 Jun 2013 15:37:44 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: David Woodhouse <dwmw2@infradead.org>,
	zajec5@gmail.com
Subject: [PATCH] drivers/mtd/devices/bcm47xxsflash.c: correct argument to kfree
Date: Sat,  8 Jun 2013 17:36:23 +0200
Message-Id: <1370705783-2140-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <Julia.Lawall@lip6.fr>

The argument to kfree should not be the address of a structure field.
The argument is adjusted to correspond to what is found in the subsequent
remove function.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
identifier f;
@@

* kfree(&e->f)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/devices/bcm47xxsflash.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 2060856..59848e7 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -155,7 +155,7 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 	return 0;
 
 err_dev_reg:
-	kfree(&b47s->mtd);
+	kfree(b47s);
 out:
 	return err;
 }
