Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQDyb-0006GH-Fn
 for linux-mtd@lists.infradead.org; Wed, 19 Mar 2014 10:44:03 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 2/2] UBI: block: Implement kernel_param_ops->get()
Date: Wed, 19 Mar 2014 11:43:23 +0100
Message-Id: <1395225803-25037-2-git-send-email-richard@nod.at>
In-Reply-To: <1395225803-25037-1-git-send-email-richard@nod.at>
References: <1395225803-25037-1-git-send-email-richard@nod.at>
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

The ->get() function is not optional.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/block.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 7ff473c..9ef7df7 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -158,6 +158,7 @@ static int __init ubiblock_set_param(const char *val,
 
 static struct kernel_param_ops ubiblock_param_ops = {
 	.set    = ubiblock_set_param,
+	.get	= param_get_charp,
 };
 module_param_cb(block, &ubiblock_param_ops, NULL, 0);
 MODULE_PARM_DESC(block, "Attach block devices to UBI volumes. Parameter format: block=<path|dev,num|dev,name>.\n"
-- 
1.8.1.4
