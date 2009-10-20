Subject: RE: [PATCH] mtd: Fix kernel NULL pointer dereference in physmap.c
From: David Woodhouse <dwmw2@infradead.org>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901E24827@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901E246A0@mi8nycmail19.Mi8.com>
	<20091021.002941.41633716.anemo@mba.ocn.ne.jp>
	<BD79186B4FD85F4B8E60E381CAEE190901E24827@mi8nycmail19.Mi8.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Oct 2009 06:37:38 +0900
Message-Id: <1256074658.4230.6.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-10-20 at 12:23 -0400, H Hartley Sweeten wrote:
> During the probe for physmap platform flash devices there are a
> number error exit conditions that all do a goto err_out which
> then calls physmap_flash_remove().  In that function one of the
> cleanup steps is:
> 
> #ifdef CONFIG_MTD_CONCAT
> 	if (info->cmtd != info->mtd[0])
> 		mtd_concat_destroy(info->cmtd);
> #endif
> 
> This test will succeed since info->cmtd == NULL and info->mtd[0] is
> valid, which then causes a NULL pointer dereference when mtd_concat_destroy()
> is called.  Fix this by moving the mtd_concat_destroy() step into the
> if (info->cmtd) condition.
> 
> Also, move the kfree(info->parts) cleanup to remove an #ifdef.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> 
> ---
> 
> V2 - As pointed out by Atsushi Nemoto, the map_destroy loop should not
>      be skipped even when info->cmtd == NULL.

Thanks.

In an attempt to improve my responsiveness as maintainer, I'd already
committed the first version. How does this look:

commit 8ce110ac19bc88b82e3feacfbb3a2ee08a07fe22
Author: H Hartley Sweeten <hartleys@visionengravers.com>
Date:   Tue Oct 20 12:23:33 2009 -0400

    mtd: Fix compile failure and error path in physmap.c
    
    Commit 4b56ffcacee937a85bf39e14872dd141e23ee85f ("mtd: Fix kernel NULL
    pointer dereference in physmap.c") introduced a couple of bugs.
    
    It neglected to run the loop of map_destroy() calls in
    physmap_flash_remove(), if !info->cmtd, which would happen if that
    function was called to clean up errors during probe.
    
    It also failed to compile if CONFIG_MTD_PARTITIONS was not defined.
    
    Reported-By: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
    Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 65f52d4..3f13a96 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -44,12 +44,10 @@ static int physmap_flash_remove(struct platform_device *dev)
 		return 0;
 	platform_set_drvdata(dev, NULL);
 
-	if (info->cmtd == NULL)
-		return 0;
-
 	physmap_data = dev->dev.platform_data;
 
-	if (mtd_has_partitions()) {
+	if (info->cmtd) {
+#ifdef CONFIG_MTD_PARTITIONS
 		if (info->nr_parts || physmap_data->nr_parts) {
 			del_mtd_partitions(info->cmtd);
 
@@ -58,14 +56,14 @@ static int physmap_flash_remove(struct platform_device *dev)
 		} else {
 			del_mtd_device(info->cmtd);
 		}
-	} else {
+#else
 		del_mtd_device(info->cmtd);
-	}
-
+#endif
 #ifdef CONFIG_MTD_CONCAT
-	if (info->cmtd != info->mtd[0])
-		mtd_concat_destroy(info->cmtd);
+		if (info->cmtd != info->mtd[0])
+			mtd_concat_destroy(info->cmtd);
 #endif
+	}
 
 	for (i = 0; i < MAX_RESOURCES; i++) {
 		if (info->mtd[i] != NULL)
@@ -170,22 +168,22 @@ static int physmap_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
-	if (mtd_has_partitions()) {
-		err = parse_mtd_partitions(info->cmtd, part_probe_types,
-					&info->parts, 0);
-		if (err > 0) {
-			add_mtd_partitions(info->cmtd, info->parts, err);
-			info->nr_parts = err;
-			return 0;
-		}
+#ifdef CONFIG_MTD_PARTITIONS
+	err = parse_mtd_partitions(info->cmtd, part_probe_types,
+				&info->parts, 0);
+	if (err > 0) {
+		add_mtd_partitions(info->cmtd, info->parts, err);
+		info->nr_parts = err;
+		return 0;
+	}
 
-		if (physmap_data->nr_parts) {
-			printk(KERN_NOTICE "Using physmap partition information\n");
-			add_mtd_partitions(info->cmtd, physmap_data->parts,
-					physmap_data->nr_parts);
-			return 0;
-		}
+	if (physmap_data->nr_parts) {
+		printk(KERN_NOTICE "Using physmap partition information\n");
+		add_mtd_partitions(info->cmtd, physmap_data->parts,
+				   physmap_data->nr_parts);
+		return 0;
 	}
+#endif
 
 	add_mtd_device(info->cmtd);
 	return 0;


-- 
dwmw2
