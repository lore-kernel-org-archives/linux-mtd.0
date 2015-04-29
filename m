Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnNNM-0002ux-49
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2015 08:29:49 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] libmtd: fix comment typo
Date: Wed, 29 Apr 2015 11:28:43 +0300
Message-Id: <01505da2d41012cbde4429a53ba58cda40943c48.1430296123.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 lib/libmtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index a6665f08018e..60b4782710c8 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -476,7 +476,7 @@ static int dev_node2num(struct libmtd *lib, const char *node, int *mtd_num)
  * sysfs_is_supported - check whether the MTD sub-system supports MTD.
  * @lib: MTD library descriptor
  *
- * The Linux kernel MTD subsystem gained MTD support starting from kernel
+ * The Linux kernel MTD subsystem gained sysfs support starting from kernel
  * 2.6.30 and libmtd tries to use sysfs interface if possible, because the NAND
  * sub-page size is available there (and not available at all in pre-sysfs
  * kernels).
-- 
2.1.4
