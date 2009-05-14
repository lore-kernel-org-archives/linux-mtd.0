Received: from mail-gx0-f158.google.com ([209.85.217.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4WJ2-0004sQ-Li
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 08:28:51 +0000
Received: by gxk2 with SMTP id 2so2224091gxk.3
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 May 2009 01:28:43 -0700 (PDT)
MIME-Version: 1.0
Sender: mcjin02@gmail.com
Date: Thu, 14 May 2009 17:28:42 +0900
Message-ID: <280b69ac0905140128u135f8b2aua50114faebb593e0@mail.gmail.com>
Subject: oobavail size calculation error in nand_base.c
From: Jinyoung Park <parkjy@mtekvision.com>
To: tglx@linutronix.de
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

I found error in nand_base.c.
In nand_scan_tail() function, oobavail size calculation result is
wrong as follow circumstances.
    - Define nand_ecclayout using full oobfree array like below.
	.oobfree = { {2, 6}, {11, 2}, {16, 8}, {27, 2}, {32, 8}, {43, 2},{48,
8}, {59, 2} }
    - Using ARM EABI cross compiler when kernel compile also enable
"Use the ARM EABI to compile the kernl" feature in kernel menuconfig.
      I using ARM EABI compiler that codesourcery release arm-2008q3-51.

In this case, right oobavail size is 38 but result is too much
value(e.g. 2703572308...). It's random.
I think sometimes happen that after beyond oobfree array(oobfree[8])
is not 0 when ARM EABI compilation.
Below codes are my modified code. Please check...

Thanks.

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3d7ed43..abb5998 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2756,9 +2756,12 @@ int nand_scan_tail(struct mtd_info *mtd)
	* the out of band area
	*/
	chip->ecc.layout->oobavail = 0;
-	for (i = 0; chip->ecc.layout->oobfree[i].length; i++)
+	for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES; i++) {
+	if (chip->ecc.layout->oobfree[i].length == 0)
+		break;
	chip->ecc.layout->oobavail +=
		chip->ecc.layout->oobfree[i].length;
+	}
	mtd->oobavail = chip->ecc.layout->oobavail;
