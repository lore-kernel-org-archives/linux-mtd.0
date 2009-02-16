Message-ID: <4999928F.1010304@nokia.com>
Date: Mon, 16 Feb 2009 18:21:35 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtdoops: allow MTD selection by name
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Viktor Rosendahl <Viktor.Rosendahl@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD's have both an index number and a name.  Formerly,
the MTD selected for mtdoops was done only by index
number.  With this patch, a name can be used instead.

For example, the kernel command line:

	console=ttyMTD5

selects MTD 5 for mtdoops.  But now this is also possible:

	console=ttyMTD,log

which selects the MTD named "log" for mtdoops.

This has the advantage that partitions can be added or
removed that would affect the MTD index number but not the
name, without having to then change the kernel command line.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/mtdoops.c |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1a6b3be..fdf504f 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -44,6 +44,7 @@ static struct mtdoops_context {
 	int oops_pages;
 	int nextpage;
 	int nextcount;
+	char *name;
 
 	void *oops_buf;
 
@@ -273,6 +274,9 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
 
+	if (cxt->name && !strcmp(mtd->name, cxt->name))
+		cxt->mtd_index = mtd->index;
+
 	if ((mtd->index != cxt->mtd_index) || cxt->mtd_index < 0)
 		return;
 
@@ -383,8 +387,12 @@ static int __init mtdoops_console_setup(struct console *co, char *options)
 {
 	struct mtdoops_context *cxt = co->data;
 
-	if (cxt->mtd_index != -1)
+	if (cxt->mtd_index != -1 || cxt->name)
 		return -EBUSY;
+	if (options) {
+		cxt->name = kstrdup(options, GFP_KERNEL);
+		return 0;
+	}
 	if (co->index == -1)
 		return -EINVAL;
 
@@ -432,6 +440,7 @@ static void __exit mtdoops_console_exit(void)
 
 	unregister_mtd_user(&mtdoops_notifier);
 	unregister_console(&mtdoops_console);
+	kfree(cxt->name);
 	vfree(cxt->oops_buf);
 }
 
-- 
1.5.6.3
