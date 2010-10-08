Received: from mo-p05-ob.rzone.de ([81.169.146.180])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P4CGV-0003IY-Ob
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2010 12:41:37 +0000
Received: from quad.fritz.box (p57BD4AAE.dip.t-dialin.net [87.189.74.174])
	by post.strato.de (mrclete mo37) (RZmta 23.5)
	with ESMTP id 403186m98BA59L for <linux-mtd@lists.infradead.org>;
	Fri, 8 Oct 2010 14:41:29 +0200 (MEST)
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: physmap_of: Loop through all "reg" tuples for mapping
Date: Fri,  8 Oct 2010 14:41:27 +0200
Message-Id: <1286541687-5706-1-git-send-email-sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch changes the loop over the "reg" tuples to not exit
directly upon of_address_to_resource() failure but to continue
with the next "reg" tuple instead. This failure could be due to
size = 0, which might be passed via the device-tree.

This is needed for boards, where a "reg" tuple might have size 0
(of_address_to_resource() returns with EINVAL when size = 0).

Example:

Fully equipped board:

	reg = <0 0x00000000 0x00400000
	       0 0x00400000 0x00400000>;

Partially equipped board:

	reg = <0 0x00000000 0x00400000
	       0 0x00400000 0x00000000>;

This could be the case on boards with runtime detection of
multiple NOR flash configurations where the detected flash size
is inserted into the dtb in U-Boot.

Signed-off-by: Stefan Roese <sr@denx.de>
---
 drivers/mtd/maps/physmap_of.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index fe63f6b..6967348 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -267,9 +267,11 @@ static int __devinit of_flash_probe(struct platform_device *dev,
 	for (i = 0; i < count; i++) {
 		err = -ENXIO;
 		if (of_address_to_resource(dp, i, &res)) {
-			dev_err(&dev->dev, "Can't get IO address from device"
-				" tree\n");
-			goto err_out;
+			/*
+			 * Continue with next register tuple if this
+			 * one is not mappable
+			 */
+			continue;
 		}
 
 		dev_dbg(&dev->dev, "of_flash device: %.8llx-%.8llx\n",
-- 
1.7.3.1
