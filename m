Received: from mail-ob0-f171.google.com ([209.85.214.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLk9Q-0006Pc-Qv
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 01:32:25 +0000
Received: by mail-ob0-f171.google.com with SMTP id wm4so4723692obc.30
 for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2013 18:32:00 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: fix memory leak in ONFI extended parameter page
Date: Mon, 16 Sep 2013 18:31:52 -0700
Message-Id: <1379381512-2007-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes a memory leak in the ONFI support code for detecting the
required ECC levels from this commit:

  commit 6dcbe0cdd83fb5f77be4f44c9e06c535281c375a
  Author: Huang Shijie <b32955@freescale.com>
  Date:   Wed May 22 10:28:27 2013 +0800

      mtd: get the ECC info from the Extended Parameter Page

In the success case, we never freed the 'ep' buffer.

Also, this fixes an oversight in the same commit where we (harmlessly)
freed the NULL pointer.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>
---
David, if there are no objections, can you send this to Linus for 3.12?

If this doesn't make it into 3.12, then it will be -stable material.

 drivers/mtd/nand/nand_base.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d4578a1..00022b4 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2869,10 +2869,8 @@ static int nand_flash_detect_ext_param_page(struct mtd_info *mtd,
 
 	len = le16_to_cpu(p->ext_param_page_length) * 16;
 	ep = kmalloc(len, GFP_KERNEL);
-	if (!ep) {
-		ret = -ENOMEM;
-		goto ext_out;
-	}
+	if (!ep)
+		return -ENOMEM;
 
 	/* Send our own NAND_CMD_PARAM. */
 	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
@@ -2920,7 +2918,7 @@ static int nand_flash_detect_ext_param_page(struct mtd_info *mtd,
 	}
 
 	pr_info("ONFI extended param page detected.\n");
-	return 0;
+	ret = 0;
 
 ext_out:
 	kfree(ep);
-- 
1.8.4
