Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5Jkc-00025c-6O
 for linux-mtd@lists.infradead.org; Thu, 19 Oct 2017 22:57:20 +0000
Received: by mail-pf0-x242.google.com with SMTP id e64so8133026pfk.9
 for <linux-mtd@lists.infradead.org>; Thu, 19 Oct 2017 15:56:58 -0700 (PDT)
From: Roy Franz <rfranz@cavium.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: roy.franz@cavium.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ddaney@cavium.com, hch@infradead.org
Subject: [PATCH v2] mtd: slram: use memremap() instead of ioremap()
Date: Thu, 19 Oct 2017 15:55:49 -0700
Message-Id: <20171019225549.11422-1-roy.franz@cavium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert slram to use memremap() to map the memory it uses to back an MTD
device, as this is the proper interface for mapping memory. This change
enables normal memory to be used to back an MTD device on arm64, as arm64
prevents ioremap() being used on normal memory.

Signed-off-by: Roy Franz <roy.franz@cavium.com>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Tested-by: David Daney <david.daney@cavium.com>
---
Tested on arm64 simulation, using simulator to preload filesystem image into RAM,
and also tested on x86_64 using video card memory.  This is useful for speeding
up booting on (very slow) emulation environments by avoiding any processing of
an initramfs.
David Daney tested on MIPS64.

v2: Fix typo in subject line, s/mdt/mtd/
    added acked-by/tested-by

 drivers/mtd/devices/slram.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 8087c36dc693..0ec85f316d24 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -163,8 +163,9 @@ static int register_device(char *name, unsigned long start, unsigned long length
 	}
 
 	if (!(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start =
-				ioremap(start, length))) {
-		E("slram: ioremap failed\n");
+		memremap(start, length,
+			 MEMREMAP_WB | MEMREMAP_WT | MEMREMAP_WC))) {
+		E("slram: memremap failed\n");
 		return -EIO;
 	}
 	((slram_priv_t *)(*curmtd)->mtdinfo->priv)->end =
@@ -186,7 +187,7 @@ static int register_device(char *name, unsigned long start, unsigned long length
 
 	if (mtd_device_register((*curmtd)->mtdinfo, NULL, 0))	{
 		E("slram: Failed to register new device\n");
-		iounmap(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start);
+		memunmap(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start);
 		kfree((*curmtd)->mtdinfo->priv);
 		kfree((*curmtd)->mtdinfo);
 		return(-EAGAIN);
@@ -206,7 +207,7 @@ static void unregister_devices(void)
 	while (slram_mtdlist) {
 		nextitem = slram_mtdlist->next;
 		mtd_device_unregister(slram_mtdlist->mtdinfo);
-		iounmap(((slram_priv_t *)slram_mtdlist->mtdinfo->priv)->start);
+		memunmap(((slram_priv_t *)slram_mtdlist->mtdinfo->priv)->start);
 		kfree(slram_mtdlist->mtdinfo->priv);
 		kfree(slram_mtdlist->mtdinfo);
 		kfree(slram_mtdlist);
-- 
2.11.0
