Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OtBwj-0004CD-TA
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 04:07:43 +0000
From: Roy Zang <tie-fei.zang@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: fix the build warning for fsl_upm.c
Date: Wed, 8 Sep 2010 11:46:01 +0800
Message-ID: <1283917561-13930-1-git-send-email-tie-fei.zang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: akpm@linux-foundation.org, dwmw2@infradead.org, cbouatmailru@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix the build warning:

drivers/mtd/nand/fsl_upm.c: In function 'fun_chip_init':
drivers/mtd/nand/fsl_upm.c:190: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'

Signed-off-by: Roy Zang <tie-fei.zang@freescale.com>
---
 drivers/mtd/nand/fsl_upm.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 4eff8b2..dc61ecf 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -186,8 +186,8 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 	if (!flash_np)
 		return -ENODEV;
 
-	fun->mtd.name = kasprintf(GFP_KERNEL, "%x.%s", io_res->start,
-				  flash_np->name);
+	fun->mtd.name = kasprintf(GFP_KERNEL, "%x.%s", 
+			(unsigned int)io_res->start, flash_np->name);
 	if (!fun->mtd.name) {
 		ret = -ENOMEM;
 		goto err;
-- 
1.5.6.5
