Received: from mail-ea0-f169.google.com ([209.85.215.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TtoGb-000298-7T
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2013 23:44:05 +0000
Received: by mail-ea0-f169.google.com with SMTP id a12so943726eaa.28
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2013 15:44:02 -0800 (PST)
From: Tormod Volden <lists.tormod@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: print source of "uncorrectable error" message
Date: Sat, 12 Jan 2013 00:43:55 +0100
Message-Id: <1357947835-20194-1-git-send-email-lists.tormod@gmail.com>
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

Not sure if above messages come from this code. I also believe there must be
a better way, advice welcome. Maybe we need to make sure all possible callers
print additional information if -1 is returned.

But this small change should be better than nothing, meanwhile.

Regards,
Tormod


 drivers/mtd/nand/nand_ecc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index b7cfe0d..cee06e9 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -507,7 +507,7 @@ int __nand_correct_data(unsigned char *buf,
 	if ((bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) == 1)
 		return 1;	/* error in ECC data; no action needed */
 
-	printk(KERN_ERR "uncorrectable error : ");
+	printk(KERN_ERR "__nand_correct_data: uncorrectable error : ");
 	return -1;
 }
 EXPORT_SYMBOL(__nand_correct_data);
-- 
1.7.9.5
