Received: from host-84-9-201-23.bulldogdsl.com ([84.9.201.23]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FsF8s-0004f4-FI
	for linux-mtd@lists.infradead.org; Mon, 19 Jun 2006 04:30:12 -0400
Received: from ben by aeryn.fluff.org.uk with local (Exim 3.36 #1 (Debian))
	id 1FsF8o-0003jm-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2006 09:29:50 +0100
Date: Mon, 19 Jun 2006 09:29:50 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [NAND] S3C2410: cleanup compile
Message-ID: <20060619082950.GA14365@home.fluff.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
Sender: Ben Dooks <ben@fluff.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove two unused variables and update the comments
for the new NAND command code entries

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="2617-mtd-nand-cleanup.patch"

diff -urNp -X linux-2.6-bjd2/Documentation/dontdiff linux-2.6-bjd2/drivers/mtd/nand/s3c2410.c linux-2.6-bjd3/drivers/mtd/nand/s3c2410.c
--- linux-2.6-bjd2/drivers/mtd/nand/s3c2410.c	2006-06-19 09:24:03.000000000 +0100
+++ linux-2.6-bjd3/drivers/mtd/nand/s3c2410.c	2006-06-19 09:27:14.000000000 +0100
@@ -268,20 +268,16 @@ static void s3c2410_nand_select_chip(str
 		clk_disable(info->clk);
 }
 
-/* command and control functions
- *
- * Note, these all use tglx's method of changing the IO_ADDR_W field
- * to make the code simpler, and use the nand layer's code to issue the
- * command and address sequences via the proper IO ports.
+/* s3c2410_nand_hwcontrol
  *
+ * Issue command and address cycles to the chip
 */
 
 static void s3c2410_nand_hwcontrol(struct mtd_info *mtd, int cmd,
 				   unsigned int ctrl)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
-	struct nand_chip *chip = mtd->priv;
-
+	
 	if (cmd == NAND_CMD_NONE)
 		return;
 
@@ -297,7 +293,6 @@ static void s3c2440_nand_hwcontrol(struc
 				   unsigned int ctrl)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
-	struct nand_chip *chip = mtd->priv;
 
 	if (cmd == NAND_CMD_NONE)
 		return;

--J2SCkAp4GZ/dPZZf--
