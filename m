Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O5Fff-0008IR-Kk
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2010 09:59:40 +0000
Subject: [PATCH v3] mtd: cfi_util: do not printk if no extended query table
To: linux-mtd <linux-mtd@lists.infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 23 Apr 2010 11:54:54 +0200
Message-ID: <20100423095454.24377.45034.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Wolfram Sang <w.sang@pengutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_util.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index ca584d0..d7c2c67 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -104,10 +104,11 @@ __xipram cfi_read_pri(struct map_info *map, __u16 adr, __u16 size, const char* n
 	int i;
 	struct cfi_extquery *extp = NULL;
 
-	printk(" %s Extended Query Table at 0x%4.4X\n", name, adr);
 	if (!adr)
 		goto out;
 
+	printk(KERN_INFO "%s Extended Query Table at 0x%4.4X\n", name, adr);
+
 	extp = kmalloc(size, GFP_KERNEL);
 	if (!extp) {
 		printk(KERN_ERR "Failed to allocate memory\n");
