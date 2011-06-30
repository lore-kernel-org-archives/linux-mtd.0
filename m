Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcFou-0007xT-7A
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 11:54:08 +0000
Received: by qyk7 with SMTP id 7so1424289qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 04:53:17 -0700 (PDT)
Subject: [PATCH] mtd: fsl_upm: fix a memory leak in fun_chip_init error path
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 30 Jun 2011 19:53:09 +0800
Message-ID: <1309434789.3256.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Anton Vorontsov <avorontsov@ru.mvista.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/nand/fsl_upm.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index da92fed..b4f3cc9 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -196,6 +196,8 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 	ret = mtd_device_parse_register(&fun->mtd, NULL, &ppdata, NULL, 0);
 err:
 	of_node_put(flash_np);
+	if (ret)
+		kfree(fun->mtd.name);
 	return ret;
 }
 
-- 
1.7.4.1
