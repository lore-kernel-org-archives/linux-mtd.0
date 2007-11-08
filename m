Received: from nz-out-0506.google.com ([64.233.162.224])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Ipy4P-0008Kf-W7
	for linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 22:28:48 -0500
Received: by nz-out-0506.google.com with SMTP id z3so25086nzf
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Nov 2007 19:28:41 -0800 (PST)
Message-ID: <6934efce0711071928j215693c5ybfd85f08f9732712@mail.gmail.com>
Date: Wed, 7 Nov 2007 19:28:40 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 8/8] MTD: add physical address to point() api -- uclinux map
	fix
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

dding the ability to get a physical address from point() in addition
to virtual address.  This physical address will be required for axfs
and cramfs with XIP.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
----
diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index 14ffb1a..c42f4b8 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -40,10 +40,12 @@ struct mtd_partition uclinux_romfs[] = {
 /****************************************************************************/

 int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
-	size_t *retlen, u_char **mtdbuf)
+	size_t *retlen, void **virt, resource_size_t *phys)
 {
 	struct map_info *map = mtd->priv;
-	*mtdbuf = (u_char *) (map->virt + ((int) from));
+	*virt = map->virt + from;
+	if (phys)
+		*phys = map->phys + from;
 	*retlen = len;
 	return(0);
 }
