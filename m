Received: from mail.openmoko.org ([88.198.124.205])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KwVsT-0002lm-NC
	for linux-mtd@lists.infradead.org; Sun, 02 Nov 2008 05:51:57 +0000
Date: Sun, 2 Nov 2008 03:51:38 -0200
From: Werner Almesberger <werner@openmoko.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: clarify calculation in nand_read_subpage and fix possible bug
Message-ID: <20081102055138.GB5177@almesberger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexey,

while debugging a NAND ECC problem, I tried to figure out how the
optimized ECC position calculation in nand_read_subpage worked. A
few pulled hairs later :-) ... I think it could be simplified a
bit, which also helps GCC to generate more compact code for it.

If I understand things correctly, it also seems that the original
algorithm had a small bug that would show with busw = 2 and
non-contiguous ECC blocks. My analysis is below.

Could you please have a look at it and ack it if you think it's
okay ?

Thanks !

- Werner

---------------------------------- cut here -----------------------------------

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

I believe the latter to be more correct than the former, since the
next ECC byte could be located anywhere and its location therefore
may not give the alignment information we seek. I'm not even sure
its position is always defined (what if we're reading the last ECC
of the page ?).

The last byte considered in the "gaps" test that checks that all ECC
bytes are contiguous is
  eccfrag_len-2+start_step*ecc.bytes+1 =
  num_steps*ecc.bytes-2+start_step*ecc.bytes+1 =
  (start_step+num+steps)*ecc.bytes-1
so it doesn't include (start_step + num_steps) * chip->ecc.bytes.

The change also saves 44 bytes on ARM.

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
