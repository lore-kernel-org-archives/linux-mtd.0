Received: from nz-out-0506.google.com ([64.233.162.238])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IpxxK-0007cO-Lq
	for linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 22:21:28 -0500
Received: by nz-out-0506.google.com with SMTP id z3so23852nzf
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Nov 2007 19:21:22 -0800 (PST)
Message-ID: <6934efce0711071921x78ede57es9e44c8245d1ef289@mail.gmail.com>
Date: Wed, 7 Nov 2007 19:21:21 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/8] MTD: add physical address to point() api -- MTD physical
	RAM fixes
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
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 56cc1ca..06d1052 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -57,20 +57,21 @@ static int phram_erase(struct mtd_info *mtd,
struct erase_info *instr)
 }

 static int phram_point(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char **mtdbuf)
+		size_t *retlen, void **virt, resource_size_t *phys)
 {
-	u_char *start = mtd->priv;
-
 	if (from + len > mtd->size)
 		return -EINVAL;

-	*mtdbuf = start + from;
+	/* can we return a physical address with this driver? */
+	if (phys)
+		return -EINVAL;
+
+	*virt = mtd->priv + from;
 	*retlen = len;
 	return 0;
 }

-static void phram_unpoint(struct mtd_info *mtd, u_char *addr, loff_t from,
-		size_t len)
+static void phram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
 }
