Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ms2aP-0005xU-RG
	for linux-mtd@lists.infradead.org; Sun, 27 Sep 2009 22:51:27 +0000
Date: Sun, 27 Sep 2009 23:51:04 +0100
From: Russell King <rmk@arm.linux.org.uk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] Fix warning in sa1100-flash.c
Message-ID: <20090927225104.GA6588@rmk-PC.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

drivers/mtd/maps/sa1100-flash.c: In function 'sa1100_probe_subdev':
drivers/mtd/maps/sa1100-flash.c:214: warning: format '%d' expects type 'int', but argument 3 has type 'uint64_t'

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 drivers/mtd/maps/sa1100-flash.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index fdb97f3..d7a4757 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -209,8 +209,8 @@ static int sa1100_probe_subdev(struct sa_subdev_info *subdev, struct resource *r
 	}
 	subdev->mtd->owner = THIS_MODULE;
 
-	printk(KERN_INFO "SA1100 flash: CFI device at 0x%08lx, %dMiB, "
-		"%d-bit\n", phys, subdev->mtd->size >> 20,
+	printk(KERN_INFO "SA1100 flash: CFI device at 0x%08lx, %uMiB, %d-bit\n",
+		phys, (unsigned)(subdev->mtd->size >> 20),
 		subdev->map.bankwidth * 8);
 
 	return 0;
