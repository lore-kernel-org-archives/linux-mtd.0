Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQDyb-0006GE-Fn
 for linux-mtd@lists.infradead.org; Wed, 19 Mar 2014 10:44:03 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 1/2] UBI: block: Remove __initdata from ubiblock_param_ops
Date: Wed, 19 Mar 2014 11:43:22 +0100
Message-Id: <1395225803-25037-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ezequiel.garcia@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You cannot mark these parameters as __initdata.
Otherwise the data is gone upon module exit.

Fixes:
[  172.045465] BUG: unable to handle kernel paging request at ffffffffa001db38
[  172.046020] IP: [<ffffffff81067aa4>] destroy_params+0x24/0x50

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 69a74fd..7ff473c 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -156,7 +156,7 @@ static int __init ubiblock_set_param(const char *val,
 	return 0;
 }
 
-static struct kernel_param_ops ubiblock_param_ops __initdata = {
+static struct kernel_param_ops ubiblock_param_ops = {
 	.set    = ubiblock_set_param,
 };
 module_param_cb(block, &ubiblock_param_ops, NULL, 0);
-- 
1.8.1.4
