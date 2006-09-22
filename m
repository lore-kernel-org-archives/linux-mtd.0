Received: from clix-jaquesmartin-nz.cpe.clix.net.nz ([203.97.0.186]
	helo=firstline.co.nz)
	by pentafluge.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GQsyV-00040K-8n
	for linux-mtd@lists.infradead.org; Fri, 22 Sep 2006 22:54:24 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Marginally faster nand_ecc.c
Date: Sat, 23 Sep 2006 09:58:42 +1200
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_SyFFFQ2rtCmwcHE"
Message-Id: <200609230958.43000.manningc2@actrix.gen.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Boundary-00=_SyFFFQ2rtCmwcHE
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Folks

Herewith a patch that speeds up nand_ecc.c slightly. This should speed it up 
to be the same as yaffs_ecc.c which runs approx 15% faster than regular 
nand_ecc.c in the tests I have done.

All we're doing is moving the masking to outside the loop so we only take the 
hit once.

-- CHarles



--Boundary-00=_SyFFFQ2rtCmwcHE
Content-Type: text/x-diff;
  charset="us-ascii";
  name="nand_ecc_patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="nand_ecc_patch"

--- nand_ecc.c.orig	2006-09-23 09:51:09.000000000 +1200
+++ nand_ecc.c	2006-09-23 09:52:12.000000000 +1200
@@ -128,7 +128,7 @@
 
 		/* Get CP0 - CP5 from table */
 		idx = nand_ecc_precalc_table[dat[j]];
-		reg1 ^= (idx & 0x3f);
+		reg1 ^= idx;
 
 		/* All bit XOR = 1 ? */
 		if (idx & 0x40) {
@@ -136,6 +136,8 @@
 			reg2 ^= ~((u_char) j);
 		}
 	}
+	
+	reg1 &= 0x3f;
 
 	/* Create non-inverted ECC code from line parity */
 	nand_trans_result(reg2, reg3, ecc_code);

--Boundary-00=_SyFFFQ2rtCmwcHE--
