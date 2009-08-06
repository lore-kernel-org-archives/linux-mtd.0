Message-Id: <200908062305.n76N5XFO004949@imap1.linux-foundation.org>
Subject: [patch 3/8] drivers/mtd/mtdcore.c: make symbols static
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Thu, 06 Aug 2009 16:05:32 -0700
Cc: hsweeten@visionengravers.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, hartleys@visionengravers.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: H Hartley Sweeten <hartleys@visionengravers.com>

Make mtd_group and mtd_groups static since they are only used in this
file.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/mtdcore.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN drivers/mtd/mtdcore.c~drivers-mtd-mtdcorec-make-symbols-static drivers/mtd/mtdcore.c
--- a/drivers/mtd/mtdcore.c~drivers-mtd-mtdcorec-make-symbols-static
+++ a/drivers/mtd/mtdcore.c
@@ -213,11 +213,11 @@ static struct attribute *mtd_attrs[] = {
 	NULL,
 };
 
-struct attribute_group mtd_group = {
+static struct attribute_group mtd_group = {
 	.attrs		= mtd_attrs,
 };
 
-const struct attribute_group *mtd_groups[] = {
+static const struct attribute_group *mtd_groups[] = {
 	&mtd_group,
 	NULL,
 };
_
