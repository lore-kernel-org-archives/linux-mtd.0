Received: from gate.aminocom.com
	([193.132.141.181] helo=aminocom.com ident=0)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17NVn5-0003cc-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2002 10:42:15 +0100
Received: from aminocom.com (eclarke@eclarke.aminocom.com [10.171.23.32])
	by aminocom.com (8.11.6/8.11.6) with ESMTP id g5R9gEH08704
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2002 10:42:14 +0100
Message-ID: <3D1ADDBA.DD33F2A9@aminocom.com>
Date: Thu, 27 Jun 2002 10:41:14 +0100
From: Elizabeth Clarke <eclarke@aminocom.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Problem with ecc in drivers/mtd/nand.c
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

Porting our in-house noddy nand filesystem to use mtd I came across a
number of problemettes. Mainly down to ecc. When writing
(nand_write_page), only half the eccvalid byte was being set when
writing the full 512bytes. And when reading (nand_read_ecc) it didn't
check the ecc at all. It also appeared the ecc valid nibbles were
inconsistent. I fixed it by simply making them consistent, but its
occurred to me that there might be a 'proper' way: written first page
then set eccvalid byte to 0x0f, write to the second page add 0xf0. Or
the other way round?

Anyway, patch attached for Thomas/David to find.

Beth

--- nand.c	Thu Jun 27 10:00:52 2002
+++ nand.new.c	Thu Jun 27 09:21:34 2002
@@ -311,7 +311,7 @@
 		for (i = 0; i < 3; i++)
 			this->data_buf[(mtd->oobblock + oob_config.ecc_pos[i])] =
ecc_code[i];
 		if (oob_config.eccvalid_pos != -1)
-			this->data_buf[mtd->oobblock + oob_config.eccvalid_pos] = 0xf0;
+			this->data_buf[mtd->oobblock + oob_config.eccvalid_pos] = 0x0f;
 	}
 
 	/* Calculate and write the second ECC if we have enough data */
@@ -320,7 +320,7 @@
 		for (i = 3; i < 6; i++)
 			this->data_buf[(mtd->oobblock + oob_config.ecc_pos[i])] =
ecc_code[i];
 		if (oob_config.eccvalid_pos != -1)
-			this->data_buf[mtd->oobblock + oob_config.eccvalid_pos] &= 0x0f;
+			this->data_buf[mtd->oobblock + oob_config.eccvalid_pos] |= 0xf0;
 	}
 #endif
 	/* Prepad for partial page programming !!! */
@@ -478,7 +478,7 @@
 		/* Calculate the ECC and verify it */
 		/* If block was not written with ECC, skip ECC */
 		if (oob_config.eccvalid_pos != -1 &&
-		    (this->data_buf[mtd->oobblock + oob_config.eccvalid_pos] & 0x0f)
!= 0x0f) {
+		    (this->data_buf[mtd->oobblock + oob_config.eccvalid_pos] & 0x0f)
== 0x0f) {
 
 			nand_calculate_ecc (&this->data_buf[0], &ecc_calc[0]);
 			switch (nand_correct_data (&this->data_buf[0], &ecc_code[0],
&ecc_calc[0])) {
@@ -494,7 +494,7 @@
 		}
 
 		if (oob_config.eccvalid_pos != -1 &&
-		    mtd->oobblock == 512 && (this->data_buf[mtd->oobblock +
oob_config.eccvalid_pos] & 0xf0) != 0xf0) {
+		    mtd->oobblock == 512 && (this->data_buf[mtd->oobblock +
oob_config.eccvalid_pos] & 0xf0) == 0xf0) {
 
 			nand_calculate_ecc (&this->data_buf[256], &ecc_calc[3]);
 			switch (nand_correct_data (&this->data_buf[256], &ecc_code[3],
&ecc_calc[3])) {
