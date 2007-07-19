Received: from wx-out-0506.google.com ([66.249.82.239])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IBcsT-0000ge-FS
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 16:45:38 -0400
Received: by wx-out-0506.google.com with SMTP id s7so606309wxc
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Jul 2007 13:45:32 -0700 (PDT)
Message-ID: <469FCD5E.80808@gmail.com>
Date: Thu, 19 Jul 2007 16:45:18 -0400
From: Florin Malita <fmalita@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: potential leak in rfd_ftl_add_mtd
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes a leak in the !mtd->erasesize error path (Coverity 1765).


Signed-off-by: Florin Malita <fmalita@gmail.com>
---

 drivers/mtd/rfd_ftl.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index d4b1ba8..006c03a 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -779,6 +779,7 @@ static void rfd_ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	else {
 		if (!mtd->erasesize) {
 			printk(KERN_WARNING PREFIX "please provide block_size");
+			kfree(part);
 			return;
 		}
 		else
