Received: from wa-out-1112.google.com ([209.85.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Ipxrv-00078g-Uo
	for linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 22:15:54 -0500
Received: by wa-out-1112.google.com with SMTP id v33so34408wah
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Nov 2007 19:15:46 -0800 (PST)
Message-ID: <6934efce0711071915n4fece86dj4c63a3effccd2023@mail.gmail.com>
Date: Wed, 7 Nov 2007 19:15:46 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/8] MTD: add physical address to point() api -- fixing
	cfi_cmdset_0001
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding the ability to get a physical address from point() in addition
to virtual address.  This physical address will be required for axfs
and cramfs with XIP.

Fixes cfi_cmdset_0001 interface.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
----
diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c
b/drivers/mtd/chips/cfi_cmdset_0001.c
index da851c2..a4ef81a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -82,8 +82,8 @@ static struct mtd_info *cfi_intelext_setup (struct
mtd_info *);
 static int cfi_intelext_partition_fixup(struct mtd_info *, struct
cfi_private **);

 static int cfi_intelext_point (struct mtd_info *mtd, loff_t from, size_t len,
-		     size_t *retlen, u_char **mtdbuf);
-static void cfi_intelext_unpoint (struct mtd_info *mtd, u_char *addr,
loff_t from,
+		     size_t *retlen, void **virt, resource_size_t *phys);
+static void cfi_intelext_unpoint (struct mtd_info *mtd, loff_t from,
 			size_t len);

 static int chip_ready (struct map_info *map, struct flchip *chip,
unsigned long adr, int mode);
@@ -1216,7 +1216,8 @@ static int do_point_onechip (struct map_info
*map, struct flchip *chip, loff_t a
 	return ret;
 }

-static int cfi_intelext_point (struct mtd_info *mtd, loff_t from,
size_t len, size_t *retlen, u_char **mtdbuf)
+static int cfi_intelext_point (struct mtd_info *mtd, loff_t from,
size_t len, size_t *retlen,
+		void **virt, resource_size_t *phys)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -1233,8 +1234,10 @@ static int cfi_intelext_point (struct mtd_info
*mtd, loff_t from, size_t len, si
 	chipnum = (from >> cfi->chipshift);
 	ofs = from - (chipnum << cfi->chipshift);

-	*mtdbuf = (void *)map->virt + cfi->chips[chipnum].start + ofs;
+	*virt = map->virt + cfi->chips[chipnum].start + ofs;
 	*retlen = 0;
+	if (phys)
+		*phys = map->phys + cfi->chips[chipnum].start + ofs;

 	while (len) {
 		unsigned long thislen;
@@ -1267,7 +1270,7 @@ static int cfi_intelext_point (struct mtd_info
*mtd, loff_t from, size_t len, si
 	return 0;
 }

-static void cfi_intelext_unpoint (struct mtd_info *mtd, u_char *addr,
loff_t from, size_t len)
+static void cfi_intelext_unpoint (struct mtd_info *mtd, loff_t from,
size_t len)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
