Received: from nz-out-0506.google.com ([64.233.162.235])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IpxvE-0007HJ-Lv
	for linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 22:19:18 -0500
Received: by nz-out-0506.google.com with SMTP id z3so23494nzf
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Nov 2007 19:19:11 -0800 (PST)
Message-ID: <6934efce0711071919k68042d3o3b689a8df92114da@mail.gmail.com>
Date: Wed, 7 Nov 2007 19:19:11 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/8] MTD: add physical address to point() api -- mtdram fixes
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
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index e427c82..fe39a9d 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -47,18 +47,21 @@ static int ram_erase(struct mtd_info *mtd, struct
erase_info *instr)
 }

 static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char **mtdbuf)
+		size_t *retlen, void **virt, resource_size_t *phys)
 {
 	if (from + len > mtd->size)
 		return -EINVAL;

-	*mtdbuf = mtd->priv + from;
+	/* can we return a physical address with this driver? */
+	if (phys)
+		return -EINVAL;
+
+	*virt = mtd->priv + from;
 	*retlen = len;
 	return 0;
 }

-static void ram_unpoint(struct mtd_info *mtd, u_char * addr, loff_t from,
-		size_t len)
+static void ram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
 }
