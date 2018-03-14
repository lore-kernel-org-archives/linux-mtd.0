Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew8SI-0004Uo-Dz
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2018 15:36:45 +0000
Received: by mail-pf0-x243.google.com with SMTP id f80so1543660pfa.8
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2018 08:36:31 -0700 (PDT)
From: Arushi Singhal <arushisinghal19971997@gmail.com>
To: dwmw2@infradead.org
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arushi Singhal <arushisinghal19971997@gmail.com>
Subject: [PATCH 2/3] mtd: maps: Remove print after allocation failure
Date: Wed, 14 Mar 2018 21:05:17 +0530
Message-Id: <1521041718-32492-2-git-send-email-arushisinghal19971997@gmail.com>
In-Reply-To: <1521041718-32492-1-git-send-email-arushisinghal19971997@gmail.com>
References: <1521041718-32492-1-git-send-email-arushisinghal19971997@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The prints after [k|v][m|z|c]alloc() functions are not needed, because
in case of failure, allocator will print their internal error prints
anyway.

Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
---
 drivers/mtd/maps/sun_uflash.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index 1e73bba..80a253c 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -62,10 +62,8 @@ int uflash_devinit(struct platform_device *op, struct device_node *dp)
 	}
 
 	up = kzalloc(sizeof(struct uflash_dev), GFP_KERNEL);
-	if (!up) {
-		printk(KERN_ERR PFX "Cannot allocate struct uflash_dev\n");
+	if (!up)
 		return -ENOMEM;
-	}
 
 	/* copy defaults and tweak parameters */
 	memcpy(&up->map, &uflash_map_templ, sizeof(uflash_map_templ));
-- 
2.7.4
