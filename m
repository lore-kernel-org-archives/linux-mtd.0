Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HsjnA-0006w4-HI
	for linux-mtd@lists.infradead.org; Mon, 28 May 2007 14:18:07 -0400
Date: Mon, 28 May 2007 19:17:54 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nand_base.c: fix type of eccpos pointer
Message-ID: <20070528181754.GA32286@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand_base.c driver implicitly casts the uint32_t
eccpos array to 'int *', which is not only not guaranteed
to be the same sign as the source, but is not guaranteed
to be the same size.

Fix by changing nand_base.c to use uint32_t
referencing the eccpos fields.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

diff -urpN -X linux-2.6.22-rc3/Documentation/dontdiff linux-2.6.22-rc3/drivers/mtd/nand/nand_base.c linux-2.6.22-rc3-sparse1/drivers/mtd/nand/nand_base.c
--- linux-2.6.22-rc3/drivers/mtd/nand/nand_base.c	2007-05-27 18:54:21.000000000 +0100
+++ linux-2.6.22-rc3-sparse1/drivers/mtd/nand/nand_base.c	2007-05-28 19:13:30.000000000 +0100
@@ -768,7 +768,7 @@ static int nand_read_page_swecc(struct m
 	uint8_t *p = buf;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	uint8_t *ecc_code = chip->buffers->ecccode;
-	int *eccpos = chip->ecc.layout->eccpos;
+	uint32_t *eccpos = chip->ecc.layout->eccpos;
 
 	chip->ecc.read_page_raw(mtd, chip, buf);
 
@@ -810,7 +810,7 @@ static int nand_read_page_hwecc(struct m
 	uint8_t *p = buf;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	uint8_t *ecc_code = chip->buffers->ecccode;
-	int *eccpos = chip->ecc.layout->eccpos;
+	uint32_t *eccpos = chip->ecc.layout->eccpos;
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
 		chip->ecc.hwctl(mtd, NAND_ECC_READ);
@@ -1416,7 +1416,7 @@ static void nand_write_page_swecc(struct
 	int eccsteps = chip->ecc.steps;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	const uint8_t *p = buf;
-	int *eccpos = chip->ecc.layout->eccpos;
+	uint32_t *eccpos = chip->ecc.layout->eccpos;
 
 	/* Software ecc calculation */
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
@@ -1442,7 +1442,7 @@ static void nand_write_page_hwecc(struct
 	int eccsteps = chip->ecc.steps;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	const uint8_t *p = buf;
-	int *eccpos = chip->ecc.layout->eccpos;
+	uint32_t *eccpos = chip->ecc.layout->eccpos;
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
 		chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
