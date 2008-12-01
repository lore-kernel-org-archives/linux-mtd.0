Subject: [PATCH] mtd: Make the third arg of mtd_concat_create() const
To: linux-mtd@lists.infradead.org
From: Catalin Marinas <catalin.marinas@arm.com>
Date: Mon, 01 Dec 2008 17:41:03 +0000
Message-ID: <20081201174103.2319.36325.stgit@pc1117.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The "name" argument of mtd_concat_create() is used to set the
concat->mtd.name pointer which is already "const char *". Setting the
argument type to "const char *" avoids the warning from drivers passing
a "const char *" pointer (like the one returned by dev_name).

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 drivers/mtd/mtdconcat.c    |    2 +-
 include/linux/mtd/concat.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 789842d..1a05cf3 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -691,7 +691,7 @@ static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs)
  */
 struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to concatenate */
 				   int num_devs,	/* number of subdevices      */
-				   char *name)
+				   const char *name)
 {				/* name for the new device   */
 	int i;
 	size_t size;
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index c02f3d2..e80c674 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -13,7 +13,7 @@
 struct mtd_info *mtd_concat_create(
     struct mtd_info *subdev[],  /* subdevices to concatenate */
     int num_devs,               /* number of subdevices      */
-    char *name);                /* name for the new device   */
+    const char *name);          /* name for the new device   */
 
 void mtd_concat_destroy(struct mtd_info *mtd);
 
