Received: from mail-ea0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TtyQ7-00045z-AX
 for linux-mtd@lists.infradead.org; Sat, 12 Jan 2013 10:34:36 +0000
Received: by mail-ea0-f177.google.com with SMTP id c10so1005090eaa.36
 for <linux-mtd@lists.infradead.org>; Sat, 12 Jan 2013 02:34:33 -0800 (PST)
From: Tormod Volden <lists.tormod@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd/nand: Print source of error message
Date: Sat, 12 Jan 2013 11:34:27 +0100
Message-Id: <1357986867-22396-1-git-send-email-lists.tormod@gmail.com>
In-Reply-To: <50F12660.6010208@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Tormod Volden <debian.tormod@gmail.com>

Add the function name to the error message.

These messages are not very helpful:

[183356.176682] uncorrectable error :
[183356.180273] uncorrectable error :
[183356.184194] uncorrectable error :
[183356.187773] uncorrectable error :
[183356.191280] uncorrectable error :

Signed-off-by: Tormod Volden <debian.tormod@gmail.com>
---

Vikram Narayanan wrote:
> Better to use %s and __func__.
> Despite adding the function name, it'd be much better to briefly convey
> what has happened.

Hi Vikram,

I agree. I also replaced printk with pr_err which seems to be preferred
nowadays.

Sorry I can not help much with the better solution since I don't know this
code. The function is called via function pointers so it is not straight-
forward to find all callers and check their code.

Regards,
Tormod


 drivers/mtd/nand/nand_ecc.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index b7cfe0d..526fa3b 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -55,8 +55,7 @@ struct mtd_info;
 #define MODULE_AUTHOR(x)	/* x */
 #define MODULE_DESCRIPTION(x)	/* x */
 
-#define printk printf
-#define KERN_ERR		""
+#define pr_err printf
 #endif
 
 /*
@@ -507,7 +506,7 @@ int __nand_correct_data(unsigned char *buf,
 	if ((bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) == 1)
 		return 1;	/* error in ECC data; no action needed */
 
-	printk(KERN_ERR "uncorrectable error : ");
+	pr_err("%s: uncorrectable error : ", __func__);
 	return -1;
 }
 EXPORT_SYMBOL(__nand_correct_data);
-- 
1.7.9.5
