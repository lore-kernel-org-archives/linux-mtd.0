Received: from nz-out-0506.google.com ([64.233.162.226])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IpxpW-0006tP-BL
	for linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 22:13:24 -0500
Received: by nz-out-0506.google.com with SMTP id z3so22478nzf
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Nov 2007 19:13:14 -0800 (PST)
Message-ID: <6934efce0711071913n4bdb74dbvbcf38c704b132e60@mail.gmail.com>
Date: Wed, 7 Nov 2007 19:13:12 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/8] MTD: add physical address to point() api -- core changes
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

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
----
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6174a97..5f62018 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -68,7 +68,7 @@ static int part_read (struct mtd_info *mtd, loff_t
from, size_t len,
 }

 static int part_point (struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, u_char **buf)
+			size_t *retlen, void **virt, resource_size_t *phys)
 {
 	struct mtd_part *part = PART(mtd);
 	if (from >= mtd->size)
@@ -76,14 +76,14 @@ static int part_point (struct mtd_info *mtd,
loff_t from, size_t len,
 	else if (from + len > mtd->size)
 		len = mtd->size - from;
 	return part->master->point (part->master, from + part->offset,
-				    len, retlen, buf);
+				    len, retlen, virt, phys);
 }

-static void part_unpoint (struct mtd_info *mtd, u_char *addr, loff_t
from, size_t len)
+static void part_unpoint (struct mtd_info *mtd, loff_t from, size_t len)
 {
 	struct mtd_part *part = PART(mtd);

-	part->master->unpoint (part->master, addr, from + part->offset, len);
+	part->master->unpoint (part->master, from + part->offset, len);
 }

 static int part_read_oob(struct mtd_info *mtd, loff_t from,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 783fc98..041ce23 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -143,10 +143,12 @@ struct mtd_info {
 	int (*erase) (struct mtd_info *mtd, struct erase_info *instr);

 	/* This stuff for eXecute-In-Place */
-	int (*point) (struct mtd_info *mtd, loff_t from, size_t len, size_t
*retlen, u_char **mtdbuf);
+	/* phys is optional and may be set to NULL */
+	int (*point) (struct mtd_info *mtd, loff_t from, size_t len,
+			size_t *retlen, void **virt, resource_size_t *phys);

 	/* We probably shouldn't allow XIP if the unpoint isn't a NULL */
-	void (*unpoint) (struct mtd_info *mtd, u_char * addr, loff_t from,
size_t len);
+	void (*unpoint) (struct mtd_info *mtd, loff_t from, size_t len);


 	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t
*retlen, u_char *buf);
