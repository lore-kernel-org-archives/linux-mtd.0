Received: from mail.openmoko.org ([88.198.124.205])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KyZ1y-0001aF-Fz
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 21:38:14 +0000
Date: Fri, 7 Nov 2008 19:37:57 -0200
From: Werner Almesberger <werner@openmoko.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] clarify and improve calculation in nand_read_subpage
Message-ID: <20081107213757.GC5177@almesberger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

clarify-nand-ecc-access.patch

The ECC access calculation in nand_read_subpage is quite hard to
understand. This patch makes it more readable.

There is a small change in what the algorithm does: while
if (eccpos[(start_step + num_steps) * chip->ecc.bytes] & (busw - 1))
looks at the position of the ECC byte following the bytes we're
currently reading,
aligned_len = ALIGN(eccfrag_len+(pos-aligned_pos), busw);
only looks at their length plus the additional data we have to read
due to aligning the start position.

The latter is more correct than the former, since the next ECC byte
could be located anywhere and its location therefore may not give the
alignment information we seek.

The change also saves 44 bytes on ARM.

Signed-off-by: Werner Almesberger <werner@openmoko.org>
Acked-by: Alexey Korolev <akorolev@infradead.org>

---

Index: ktrack/drivers/mtd/nand/nand_base.c
===================================================================
--- ktrack.orig/drivers/mtd/nand/nand_base.c	2008-11-02 02:28:19.000000000 -0200
+++ ktrack/drivers/mtd/nand/nand_base.c	2008-11-02 02:38:22.000000000 -0200
@@ -851,12 +851,12 @@
 	} else {
 		/* send the command to read the particular ecc bytes */
 		/* take care about buswidth alignment in read_buf */
-		aligned_pos = eccpos[start_step * chip->ecc.bytes] & ~(busw - 1);
-		aligned_len = eccfrag_len;
-		if (eccpos[start_step * chip->ecc.bytes] & (busw - 1))
-			aligned_len++;
-		if (eccpos[(start_step + num_steps) * chip->ecc.bytes] & (busw - 1))
-			aligned_len++;
+
+		int pos;
+
+		pos = eccpos[start_step * chip->ecc.bytes];
+		aligned_pos = pos & ~(busw - 1);
+		aligned_len = ALIGN(eccfrag_len+(pos-aligned_pos), busw);
 
 		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize + aligned_pos, -1);
 		chip->read_buf(mtd, &chip->oob_poi[aligned_pos], aligned_len);
