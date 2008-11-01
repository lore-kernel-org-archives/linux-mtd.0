Received: from mail.openmoko.org ([88.198.124.205])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kw6xM-0000aR-B0
	for linux-mtd@lists.infradead.org; Sat, 01 Nov 2008 03:15:21 +0000
Date: Sat, 1 Nov 2008 01:15:05 -0200
From: Werner Almesberger <werner@openmoko.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nand_read_subpage vs. S3C244x NAND: non-word reads
Message-ID: <20081101031505.GA5177@almesberger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Ben Dooks <ben@trinity.fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In recent kernels, the optimized OOB reads in nand_read_subpage often
make requests which aren't an exact multiple of a word, which caused
nand/s3c2410.c to do a partial read, yielding chaos and mayhem.

I'm not entirely sure whether nand_read_subpage is to blame for making
non-word requests, or whether nand/s3c2410.c is to blame for not
supporting them, but here's a patch for the latter.

Note that s3c2410_nand_write_buf has a similar issue. RNDIN is used in
nand_write_oob_syndrome, so this may also be a real problems.

- Werner

---------------------------------- cut here -----------------------------------

fix-s3c-nand-read-bytes.patch

With the introduction of optimized OOB reads in nand_read_subpage,
the length of the data requested may not be a multiple of four bytes.

This caused a partial read on the 2440, leading to false ECC errors
and, worse, attempts to "correct" them.

Note that there is a similar issue in s3c2440_nand_write_buf, which
doesn't seem to cause trouble yet.

Signed-off-by: Werner Almesberger <werner@openmoko.org>

---

Index: ktrack/drivers/mtd/nand/s3c2410.c
===================================================================
--- ktrack.orig/drivers/mtd/nand/s3c2410.c	2008-11-01 00:29:45.000000000 -0200
+++ ktrack/drivers/mtd/nand/s3c2410.c	2008-11-01 00:38:10.000000000 -0200
@@ -530,7 +530,14 @@
 static void s3c2440_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
+
 	readsl(info->regs + S3C2440_NFDATA, buf, len / 4);
+	if (unlikely(len & 3)) {
+		u32 data;
+
+		data = readl(info->regs + S3C2440_NFDATA);
+		memcpy(buf + (len & ~3), &data, len & 3);
+	}
 }
 
 static void s3c2410_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
