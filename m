Received: from ey-out-1920.google.com ([74.125.78.148])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MaPzv-0008Fy-VP
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 08:12:56 +0000
Received: by ey-out-1920.google.com with SMTP id 5so915248eyb.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Aug 2009 01:12:50 -0700 (PDT)
Message-ID: <4A7FD765.3020200@gmail.com>
Date: Mon, 10 Aug 2009 10:16:37 +0200
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: pmcmsp-flash.c: correct clean up?
References: <4A709A88.30103@gmail.com> <4A7EED48.6050103@gmail.com>
In-Reply-To: <4A7EED48.6050103@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This also adds cleaning up after errors in init_msp_flash().

Also cleanup_msp_flash() attempts to determine the size of
msp_flash with `sizeof(msp_flash) / sizeof(struct mtd_info **)'
This will not work since msp_flash is not an array.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
> I think jumping into the middle of a loop is not nice. Would it
> be better to free the recources belonging to the current interation
> inside the allocation loop, and then jump to the beginning of
> the freeing loop instead?

Done,

thanks.

diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
index 4768bd5..c8fd8da 100644
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ b/drivers/mtd/maps/pmcmsp-flash.c
@@ -50,7 +50,7 @@ static int fcnt;
 
 static int __init init_msp_flash(void)
 {
-	int i, j;
+	int i, j, ret = -ENOMEM;
 	int offset, coff;
 	char *env;
 	int pcnt;
@@ -75,14 +75,16 @@ static int __init init_msp_flash(void)
 	printk(KERN_NOTICE "Found %d PMC flash devices\n", fcnt);
 
 	msp_flash = kmalloc(fcnt * sizeof(struct map_info *), GFP_KERNEL);
+	if (!msp_flash)
+		return -ENOMEM;
+
 	msp_parts = kmalloc(fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
+	if (!msp_parts)
+		goto free_msp_flash;
+
 	msp_maps = kcalloc(fcnt, sizeof(struct mtd_info), GFP_KERNEL);
-	if (!msp_flash || !msp_parts || !msp_maps) {
-		kfree(msp_maps);
-		kfree(msp_parts);
-		kfree(msp_flash);
-		return -ENOMEM;
-	}
+	if (!msp_maps)
+		goto free_msp_parts;
 
 	/* loop over the flash devices, initializing each */
 	for (i = 0; i < fcnt; i++) {
@@ -100,13 +102,18 @@ static int __init init_msp_flash(void)
 
 		msp_parts[i] = kcalloc(pcnt, sizeof(struct mtd_partition),
 				       GFP_KERNEL);
+		if (!msp_parts[i])
+			goto cleanup_loop;
 
 		/* now initialize the devices proper */
 		flash_name[5] = '0' + i;
 		env = prom_getenv(flash_name);
 
-		if (sscanf(env, "%x:%x", &addr, &size) < 2)
-			return -ENXIO;
+		if (sscanf(env, "%x:%x", &addr, &size) < 2) {
+			ret = -ENXIO;
+			kfree(msp_parts[i]);
+			goto cleanup_loop;
+		}
 		addr = CPHYSADDR(addr);
 
 		printk(KERN_NOTICE
@@ -122,13 +129,23 @@ static int __init init_msp_flash(void)
 		 */
 		if (size > CONFIG_MSP_FLASH_MAP_LIMIT)
 			size = CONFIG_MSP_FLASH_MAP_LIMIT;
+
 		msp_maps[i].virt = ioremap(addr, size);
+		if (msp_maps[i].virt == NULL) {
+			ret = -ENXIO;
+			kfree(msp_parts[i]);
+			goto cleanup_loop;
+		}
+
 		msp_maps[i].bankwidth = 1;
-		msp_maps[i].name = strncpy(kmalloc(7, GFP_KERNEL),
-					flash_name, 7);
+		msp_maps[i].name = kmalloc(7, GFP_KERNEL);
+		if (!msp_maps[i].name) {
+			iounmap(msp_maps[i].virt);
+			kfree(msp_parts[i]);
+			goto cleanup_loop;
+		}
 
-		if (msp_maps[i].virt == NULL)
-			return -ENXIO;
+		msp_maps[i].name = strncpy(msp_maps[i].name, flash_name, 7);
 
 		for (j = 0; j < pcnt; j++) {
 			part_name[5] = '0' + i;
@@ -136,8 +153,14 @@ static int __init init_msp_flash(void)
 
 			env = prom_getenv(part_name);
 
-			if (sscanf(env, "%x:%x:%n", &offset, &size, &coff) < 2)
-				return -ENXIO;
+			if (sscanf(env, "%x:%x:%n", &offset, &size,
+						&coff) < 2) {
+				ret = -ENXIO;
+				kfree(msp_maps[i].name);
+				iounmap(msp_maps[i].virt);
+				kfree(msp_parts[i]);
+				goto cleanup_loop;
+			}
 
 			msp_parts[i][j].size = size;
 			msp_parts[i][j].offset = offset;
@@ -152,18 +175,37 @@ static int __init init_msp_flash(void)
 			add_mtd_partitions(msp_flash[i], msp_parts[i], pcnt);
 		} else {
 			printk(KERN_ERR "map probe failed for flash\n");
-			return -ENXIO;
+			ret = -ENXIO;
+			kfree(msp_maps[i].name);
+			iounmap(msp_maps[i].virt);
+			kfree(msp_parts[i]);
+			goto cleanup_loop;
 		}
 	}
 
 	return 0;
+
+cleanup_loop:
+	while (i--) {
+		del_mtd_partitions(msp_flash[i]);
+		map_destroy(msp_flash[i]);
+		kfree(msp_maps[i].name);
+		iounmap(msp_maps[i].virt);
+		kfree(msp_parts[i]);
+	}
+	kfree(msp_maps);
+free_msp_parts:
+	kfree(msp_parts);
+free_msp_flash:
+	kfree(msp_flash);
+	return ret;
 }
 
 static void __exit cleanup_msp_flash(void)
 {
 	int i;
 
-	for (i = 0; i < sizeof(msp_flash) / sizeof(struct mtd_info **); i++) {
+	for (i = 0; i < fcnt; i++) {
 		del_mtd_partitions(msp_flash[i]);
 		map_destroy(msp_flash[i]);
 		iounmap((void *)msp_maps[i].virt);
