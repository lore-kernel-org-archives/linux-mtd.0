Received: from smtp21.services.sfr.fr ([93.17.128.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OO6ul-00053e-Pv
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 10:29:13 +0000
Subject: [PATCH] mtd: cfi_probe: print manufacturer and id of probed chip
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Mon, 14 Jun 2010 12:33:45 +0200
Message-ID: <20100614103345.26103.40429.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_probe.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index b2acd32..5f5ba3e 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -235,9 +235,9 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	cfi_qry_mode_off(base, map, cfi);
 	xip_allowed(base, map);
 
-	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
+	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank. mfr=0x%08x id=0x%08x\n",
 	       map->name, cfi->interleave, cfi->device_type*8, base,
-	       map->bankwidth*8);
+	       map->bankwidth*8, cfi->mfr, cfi->id);
 
 	return 1;
 }
