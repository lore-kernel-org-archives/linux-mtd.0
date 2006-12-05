Received: from mtagate1.uk.ibm.com ([195.212.29.134])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GrbF9-0002tt-Gw
	for linux-mtd@lists.infradead.org; Tue, 05 Dec 2006 14:26:03 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate1.uk.ibm.com (8.13.8/8.13.8) with ESMTP id kB5EPeUw083174
	for <linux-mtd@lists.infradead.org>; Tue, 5 Dec 2006 14:25:40 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with
	ESMTP id kB5EPYB62392302
	for <linux-mtd@lists.infradead.org>; Tue, 5 Dec 2006 14:25:34 GMT
Received: from d06av03.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id kB5EPX9c024849
	for <linux-mtd@lists.infradead.org>; Tue, 5 Dec 2006 14:25:34 GMT
From: Timo Lindhorst <lindhors@vnet.ibm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] NAND: use SmartMedia ECC byte order for ndfc
MIME-Version: 1.0
Content-Disposition: inline
Date: Tue, 5 Dec 2006 15:23:33 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200612051523.34000.lindhors@linux.vnet.ibm.com>
Cc: tglx@cruncher.tec.linutronix.de, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD] NAND: use SmartMedia ECC byte order for ndfc

Select MTD_NAND_ECC_SMC (ECC byte order according to the Smart Media
Specification) if MTD_NAND_NDFC is used.
Using the wrong byte order causes fatal, unnoticed data damage.

For further information see:
http://lists.infradead.org/pipermail/linux-mtd/2006-November/016920.html

From: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
Signed-off-by: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
---
 drivers/mtd/nand/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- mtd-2.6.orig/drivers/mtd/nand/Kconfig
+++ mtd-2.6/drivers/mtd/nand/Kconfig
@@ -133,6 +133,7 @@ config MTD_NAND_S3C2410_HWECC
 config MTD_NAND_NDFC
 	tristate "NDFC NanD Flash Controller"
 	depends on MTD_NAND && 44x
+	select MTD_NAND_ECC_SMC
 	help
 	 NDFC Nand Flash Controllers are integrated in EP44x SoCs
 
