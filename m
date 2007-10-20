Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IjCOR-0000sc-4a
	for linux-mtd@lists.infradead.org; Sat, 20 Oct 2007 12:21:26 +0100
Date: Sat, 20 Oct 2007 13:13:44 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: [PATCH] Replace -1 with -EBADMSG in nand error correction code
Message-ID: <20071020111344.GF32465@lazybastard.org>
References: <1192656803-32151-1-git-send-email-mattjreimer@gmail.com>
	<20071020104226.GD32465@lazybastard.org>
	<20071020111126.GE32465@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20071020111126.GE32465@lazybastard.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Matt Reimer <mreimer@vpop.net>, linux-mtd@lists.infradead.org,
	mattjreimer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Magic numerical values are just bad style.  Particularly so when
undocumented.

--- linux-2.6.22cow/lib/reed_solomon/decode_rs.c~nand_minusone	2007-10-20 12:46:52.000000000 +0200
+++ linux-2.6.22cow/lib/reed_solomon/decode_rs.c	2007-10-20 12:51:12.000000000 +0200
@@ -202,7 +202,7 @@
 		 * deg(lambda) unequal to number of roots => uncorrectable
 		 * error detected
 		 */
-		count = -1;
+		count = -EBADMSG;
 		goto finish;
 	}
 	/*
--- linux-2.6.22cow/lib/reed_solomon/reed_solomon.c~rs_ERANGE	2007-05-16 02:02:00.000000000 +0200
+++ linux-2.6.22cow/lib/reed_solomon/reed_solomon.c	2007-10-20 12:48:12.000000000 +0200
@@ -320,6 +320,7 @@ EXPORT_SYMBOL_GPL(encode_rs8);
  *  The syndrome and parity uses a uint16_t data type to enable
  *  symbol size > 8. The calling code must take care of decoding of the
  *  syndrome result and the received parity before calling this code.
+ *  Returns the number of corrected bits or -EBADMSG for uncorrectable errors.
  */
 int decode_rs8(struct rs_control *rs, uint8_t *data, uint16_t *par, int len,
 	       uint16_t *s, int no_eras, int *eras_pos, uint16_t invmsk,
@@ -363,6 +364,7 @@ EXPORT_SYMBOL_GPL(encode_rs16);
  *  @corr:	buffer to store correction bitmask on eras_pos
  *
  *  Each field in the data array contains up to symbol size bits of valid data.
+ *  Returns the number of corrected bits or -EBADMSG for uncorrectable errors.
  */
 int decode_rs16(struct rs_control *rs, uint16_t *data, uint16_t *par, int len,
 		uint16_t *s, int no_eras, int *eras_pos, uint16_t invmsk,
--- linux-2.6.22cow/drivers/mtd/nand/diskonchip.c~nand_minusone	2007-10-20 12:29:54.000000000 +0200
+++ linux-2.6.22cow/drivers/mtd/nand/diskonchip.c	2007-10-20 12:50:14.000000000 +0200
@@ -225,7 +225,7 @@ static int doc_ecc_decode(struct rs_cont
 		}
 	}
 	/* If the parity is wrong, no rescue possible */
-	return parity ? -1 : nerr;
+	return parity ? -EBADMSG : nerr;
 }
 
 static void DoC_Delay(struct doc_priv *doc, unsigned short cycles)
@@ -1039,7 +1039,7 @@ static int doc200x_correct_data(struct m
 		WriteDOC(DOC_ECC_DIS, docptr, Mplus_ECCConf);
 	else
 		WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
-	if (no_ecc_failures && (ret == -1)) {
+	if (no_ecc_failures && (ret == -EBADMSG)) {
 		printk(KERN_ERR "suppressing ECC failure\n");
 		ret = 0;
 	}
--- linux-2.6.22cow/drivers/mtd/nand/nand_ecc.c~nand_minusone	2007-02-12 11:33:26.000000000 +0100
+++ linux-2.6.22cow/drivers/mtd/nand/nand_ecc.c	2007-10-20 12:52:56.000000000 +0200
@@ -189,7 +189,7 @@ int nand_correct_data(struct mtd_info *m
 	if(countbits(s0 | ((uint32_t)s1 << 8) | ((uint32_t)s2 <<16)) == 1)
 		return 1;
 
-	return -1;
+	return -EBADMSG;
 }
 EXPORT_SYMBOL(nand_correct_data);
 
