Received: from mtagate6.de.ibm.com ([195.212.29.155])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gofnp-0007ga-P5
	for linux-mtd@lists.infradead.org; Mon, 27 Nov 2006 12:41:46 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.8/8.13.8) with ESMTP id kARCZpFO255680
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2006 12:35:51 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com
	[9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with
	ESMTP id kARCdQ1i3268828
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2006 13:39:26 +0100
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id kARCZo5j019196
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2006 13:35:51 +0100
From: Timo Lindhorst <lindhors@vnet.ibm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] NAND: fix ifdef option in nand_ecc.c
MIME-Version: 1.0
Content-Disposition: inline
Date: Mon, 27 Nov 2006 13:35:49 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200611271335.49226.lindhors@linux.vnet.ibm.com>
Cc: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix up the config option in the #ifdef statements in nand_ecc.c

From: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
Signed-off-by: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
---
 drivers/mtd/nand/nand_ecc.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- ubi-2.6.orig/drivers/mtd/nand/nand_ecc.c
+++ ubi-2.6/drivers/mtd/nand/nand_ecc.c
@@ -112,7 +112,7 @@ int nand_calculate_ecc(struct mtd_info *
 	tmp2 |= (reg2 & 0x01) << 0; /* B7 -> B0 */
 
 	/* Calculate final ECC code */
-#ifdef CONFIG_NAND_ECC_SMC
+#ifdef CONFIG_MTD_NAND_ECC_SMC
 	ecc_code[0] = ~tmp2;
 	ecc_code[1] = ~tmp1;
 #else
@@ -148,7 +148,7 @@ int nand_correct_data(struct mtd_info *m
 {
 	uint8_t s0, s1, s2;
 
-#ifdef CONFIG_NAND_ECC_SMC
+#ifdef CONFIG_MTD_NAND_ECC_SMC
 	s0 = calc_ecc[0] ^ read_ecc[0];
 	s1 = calc_ecc[1] ^ read_ecc[1];
 	s2 = calc_ecc[2] ^ read_ecc[2];
