Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jbdyb-0005pl-ID
	for linux-mtd@lists.infradead.org; Tue, 18 Mar 2008 15:43:46 +0000
Date: Tue, 18 Mar 2008 18:43:44 +0300
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] fsl_elbc_nand: fix mtd name
Message-ID: <20080318154344.GA31173@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
Cc: Scott Wood <scottwood@freescale.com>, linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently fsl_elbc_nand doesn't initialize mtd->name, and this causes
nand_get_flash_type() to assign name that is equal to chip type, like
this:

   root@b1:~# cat /proc/mtd
   dev:    size   erasesize  name
   mtd0: 00800000 00010000 "fe000000.flash"
   mtd1: 02000000 00004000 "NAND 32MiB 3,3V 8-bit"

mtd0 is physmap_of flash (normal name), and mtd1 is fsl_elbc_nand.

Despite inconsistency, with mtd name like this specifying paritions
from the kernel command line becomes a torture (though, I didn't tried
and not sure if mtdparts= can handle spaces at all). Plus, this causes
real bugs when multiple fsl_elbc_nand chips registered.

With this patch applied fsl_elbc_nand chip will have proper name:

   root@b1:~# cat /proc/mtd
   dev:    size   erasesize  name
   mtd0: 00800000 00010000 "fe000000.flash"
   mtd1: 02000000 00004000 "e0600000.flash"

p.s. We can't use priv->dev->bus_id as in physmap_of, because
fsl_elbc_nand pretends to be a localbus controller, so its bus_id is
"address.localbus", which is incorrect and thus will also not work
for multiple chips.

Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index b025dfe..54a9d83 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -974,6 +974,8 @@ static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
 
 	nand_release(&priv->mtd);
 
+	kfree(priv->mtd.name);
+
 	if (priv->vbase)
 		iounmap(priv->vbase);
 
@@ -1050,6 +1052,8 @@ static int fsl_elbc_chip_probe(struct fsl_elbc_ctrl *ctrl,
 	if (ret)
 		goto err;
 
+	priv->mtd.name = kasprintf(GFP_KERNEL, "%x.flash", res.start);
+
 #ifdef CONFIG_MTD_PARTITIONS
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
-- 
1.5.2.2
