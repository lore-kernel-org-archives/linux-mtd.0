Received: from mgw1.diku.dk ([130.225.96.91])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NPhXW-0006dC-L1
	for linux-mtd@lists.infradead.org; Tue, 29 Dec 2009 19:15:34 +0000
Date: Tue, 29 Dec 2009 20:15:23 +0100 (CET)
From: Julia Lawall <julia@diku.dk>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/5] drivers/mtd : Correct the size argument to kzalloc
Message-ID: <Pine.LNX.4.64.0912292015001.4001@ask.diku.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <julia@diku.dk>

mtd_list has type struct mtd_info **, not struct mtd_info *, so the
elements of the array should have pointer type, not structure type.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@disable sizeof_type_expr@
type T;
T **x;
@@

  x =
  <+...sizeof(
- T
+ *x
  )...+>
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/maps/physmap_of.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -217,7 +217,7 @@ static int __devinit of_flash_probe(stru
 
 	dev_set_drvdata(&dev->dev, info);
 
-	mtd_list = kzalloc(sizeof(struct mtd_info) * count, GFP_KERNEL);
+	mtd_list = kzalloc(sizeof(*mtd_list) * count, GFP_KERNEL);
 	if (!mtd_list)
 		goto err_flash_remove;
 
