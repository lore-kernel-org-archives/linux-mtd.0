Received: from wa-out-1112.google.com ([209.85.146.177])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Ipy2c-0008BH-SH
	for linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 22:26:57 -0500
Received: by wa-out-1112.google.com with SMTP id v33so36794wah
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Nov 2007 19:26:47 -0800 (PST)
Message-ID: <6934efce0711071926x7ffab11cl8e47f0874848d68c@mail.gmail.com>
Date: Wed, 7 Nov 2007 19:26:47 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/8] MTD: add physical address to point() api -- slram
	interface fixes
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
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index d293add..110884f 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -76,8 +76,8 @@ static char *map;
 static slram_mtd_list_t *slram_mtdlist = NULL;

 static int slram_erase(struct mtd_info *, struct erase_info *);
-static int slram_point(struct mtd_info *, loff_t, size_t, size_t *, u_char **);
-static void slram_unpoint(struct mtd_info *, u_char *, loff_t,	size_t);
+static int slram_point(struct mtd_info *, loff_t, size_t, size_t *,
void **, resource_size_t *);
+static void slram_unpoint(struct mtd_info *, loff_t, size_t);
 static int slram_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int slram_write(struct mtd_info *, loff_t, size_t, size_t *,
const u_char *);

@@ -104,19 +104,23 @@ static int slram_erase(struct mtd_info *mtd,
struct erase_info *instr)
 }

 static int slram_point(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char **mtdbuf)
+		size_t *retlen, void **virt, resource_size_t *phys)
 {
 	slram_priv_t *priv = mtd->priv;

+	/* can we return a physical address with this driver? */
+	if (phys)
+		return -EINVAL;
+
 	if (from + len > mtd->size)
 		return -EINVAL;

-	*mtdbuf = priv->start + from;
+	*virt = priv->start + from;
 	*retlen = len;
 	return(0);
 }

-static void slram_unpoint(struct mtd_info *mtd, u_char *addr, loff_t
from, size_t len)
+static void slram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
 }
