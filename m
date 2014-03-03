Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKVxK-0005Im-Bv
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 16:43:08 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/3] UBI: block: Mark init-only symbol as __initdata
Date: Mon,  3 Mar 2014 13:42:38 -0300
Message-Id: <1393864960-20825-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1393864960-20825-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393864960-20825-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubiblock_param_ops should be marked as __init as it's only used to set
a driver parameter on insertion time. This commit fixes the following:

  WARNING: drivers/mtd/built-in.o(.text+0x653ac): Section mismatch in
  reference from the variable ubiblock_param_ops to the function
  .init.text:ubiblock_set_param()

  The function ubiblock_param_ops() references the function __init
  ubiblock_set_param(). This is often because ubiblock_param_ops lacks a
  __init annotation or the annotation of ubiblock_set_param is wrong.

Given gcc errors if the struct is marked const __initdata, this commit
drops the const mark from it.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index cea7d1c..4c970bc 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -156,7 +156,7 @@ static int __init ubiblock_set_param(const char *val,
 	return 0;
 }
 
-static const struct kernel_param_ops ubiblock_param_ops = {
+static struct kernel_param_ops ubiblock_param_ops __initdata = {
 	.set    = ubiblock_set_param,
 };
 module_param_cb(block, &ubiblock_param_ops, NULL, 0);
-- 
1.8.1.5
