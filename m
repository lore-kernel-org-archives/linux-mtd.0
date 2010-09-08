Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=DB3EHSOBE004.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OtGeh-0001xl-BW
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 09:09:24 +0000
From: Roy Zang <tie-fei.zang@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: fix the build warning for fsl_upm.c
Date: Wed, 8 Sep 2010 16:47:55 +0800
Message-ID: <1283935675-14215-1-git-send-email-tie-fei.zang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: akpm@linux-foundation.org, dedekind1@gmail.com, dwmw2@infradead.org,
	cbouatmailru@gmail.com
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
Comparing v1, using u64 instead of u32 for io_res->start.

 drivers/mtd/nand/fsl_upm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 4eff8b2..c8ab156 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -186,7 +186,7 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 	if (!flash_np)
 		return -ENODEV;
 
-	fun->mtd.name = kasprintf(GFP_KERNEL, "%x.%s", io_res->start,
+	fun->mtd.name = kasprintf(GFP_KERNEL, "0x%llx.%s", (u64)io_res->start,
 				  flash_np->name);
 	if (!fun->mtd.name) {
 		ret = -ENOMEM;
-- 
1.5.6.5
