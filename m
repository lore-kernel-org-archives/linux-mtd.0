Received: from an-out-0708.google.com ([209.85.132.249])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HtjqJ-00082k-TG
	for linux-mtd@lists.infradead.org; Thu, 31 May 2007 08:33:29 -0400
Received: by an-out-0708.google.com with SMTP id c3so53569ana
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 May 2007 05:33:26 -0700 (PDT)
Message-ID: <465EC08F.3080809@gmail.com>
Date: Thu, 31 May 2007 16:33:19 +0400
From: Vitaly Wool <vitalywool@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] fix plat_nand compilation
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this patch fixes plat_nand compilation problem with modern gcc compilers.

 drivers/mtd/nand/plat_nand.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Signed-off-by: Vitaly Wool <vitalywool@gmail.com>

Index: linux-2.6/drivers/mtd/nand/plat_nand.c
===================================================================
--- linux-2.6.orig/drivers/mtd/nand/plat_nand.c
+++ linux-2.6/drivers/mtd/nand/plat_nand.c
@@ -125,7 +125,7 @@ static int __devexit plat_nand_remove(st
 
 static struct platform_driver plat_nand_driver = {
 	.probe		= plat_nand_probe,
-	.remove		= plat_nand_remove,
+	.remove		= __devexit_p(plat_nand_remove),
 	.driver		= {
 		.name	= "gen_nand",
 		.owner	= THIS_MODULE,
