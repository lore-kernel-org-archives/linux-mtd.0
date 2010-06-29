Received: from smtp22.services.sfr.fr ([93.17.128.11])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OTW9k-0004Ac-90
	for linux-mtd@lists.infradead.org; Tue, 29 Jun 2010 08:27:01 +0000
Subject: [PATCH] mtd: cfi_probe: print manufacturer and id of probed chip
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Tue, 29 Jun 2010 10:32:37 +0200
Message-ID: <20100629083204.11146.37097.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/6/29 Artem Bityutskiy <dedekind1@gmail.com>:
> This is not a debugging print, so I think you should do it in a more
> user-friendly way. E.g., "manufect. ID %#08x, chip id %#08x".

OK, here it is again.

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_probe.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index b2acd32..8f5b96a 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -235,9 +235,9 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	cfi_qry_mode_off(base, map, cfi);
 	xip_allowed(base, map);
 
-	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
+	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank. Manufacturer ID %#08x Chip ID %#08x\n",
 	       map->name, cfi->interleave, cfi->device_type*8, base,
-	       map->bankwidth*8);
+	       map->bankwidth*8, cfi->mfr, cfi->id);
 
 	return 1;
 }
