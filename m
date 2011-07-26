Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qlnuq-0003EY-H9
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2011 20:07:45 +0000
Received: by qyk7 with SMTP id 7so506253qyk.15
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2011 13:07:42 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 26 Jul 2011 15:07:42 -0500
Message-ID: <CAHyXW61rWcoE0Wcd9K7BsP3+VKzmQo=RPMM9+1DTw+QdF9MVew@mail.gmail.com>
Subject: [PATCH v3] mtd: eLBC NAND: update ecc_stats.corrected when lteccr
	available
From: Michael Hench <michaelhench@gmail.com>
To: scottwood@freescale.com, linux-mtd@lists.infradead.org,
	linuxppc-dev@ozlabs.org, mhench@elutions.com, mlcreech@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Reply-To: MichaelHench@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

update ecc_stats.corrected if LTECCR register is available.

v2: kernel standard C formatting

v3: kernel standard C formatting again, changed a comment to get under 80 chars

Signed-off-by: Michael Hench <MichaelHench@gmail.com>
---
diff -purN orig/drivers/mtd/nand/fsl_elbc_nand.c
linux-3.0/drivers/mtd/nand/fsl_elbc_nand.c
--- orig/drivers/mtd/nand/fsl_elbc_nand.c	2011-07-25 14:50:56.838326055 -0500
+++ linux-3.0/drivers/mtd/nand/fsl_elbc_nand.c	2011-07-25
14:48:35.680940052 -0500
@@ -256,6 +256,25 @@ static int fsl_elbc_run_command(struct m
 		return -EIO;
 	}

+	if (chip->ecc.mode != NAND_ECC_HW)
+		return 0;
+
+	if (elbc_fcm_ctrl->read_bytes == mtd->writesize + mtd->oobsize) {
+		uint32_t lteccr = in_be32(&lbc->lteccr);
+		/*
+		 * if command was a full page read and the ELBC
+		 * has the LTECCR register, then bits 12-15 (ppc order) of
+		 * LTECCR indicates which 512 byte sub-pages had fixed errors.
+		 * bits 28-31 are uncorrectable errors, marked elsewhere.
+		 * for small page nand only 1 bit is used.
+		 * if the ELBC doesn't have the lteccr register it reads 0
+		 */
+		if (lteccr & 0x000F000F)
+			out_be32(&lbc->lteccr, 0x000F000F); /* clear lteccr */
+		if (lteccr & 0x000F0000)
+			mtd->ecc_stats.corrected++;
+	}
+
 	return 0;
 }

--
