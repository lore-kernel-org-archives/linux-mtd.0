Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFAIN-000699-Sn
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2016 01:48:21 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Kees Trommel <ctrommel@aimvalley.nl>
Subject: [PATCH V2] nandwrite: Factor out buffer checking code
Date: Fri,  9 Dec 2016 02:47:41 +0100
Message-Id: <20161209014741.15609-1-marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pull the buffer content checking code into separate function and
simplify the code invoking it slightly.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Kees Trommel <ctrommel@aimvalley.nl>
---
 include/common.h       | 25 +++++++++++++++++++++++++
 nand-utils/nandwrite.c | 17 +++--------------
 2 files changed, 28 insertions(+), 14 deletions(-)
---
V2: Move the buffer_check_pattern() to include/common.h

diff --git a/include/common.h b/include/common.h
index 32b5d23..2812f49 100644
--- a/include/common.h
+++ b/include/common.h
@@ -181,6 +181,31 @@ static inline int is_power_of_2(unsigned long long n)
 	return (n != 0 && ((n & (n - 1)) == 0));
 }
 
+/* Check whether buffer is filled with character 'pattern' */
+static inline int buffer_check_pattern(unsigned char *buffer, size_t size,
+				       unsigned char pattern)
+{
+	/* Invalid input */
+	if (!buffer || (size == 0))
+		return 0;
+
+	/* No match on first byte */
+	if (*buffer != pattern)
+		return 0;
+
+	/* First byte matched and buffer is 1 byte long, OK. */
+	if (size == 1)
+		return 1;
+
+	/*
+	 * Check buffer longer than 1 byte. We already know that buffer[0]
+	 * matches the pattern, so the test below only checks whether the
+	 * buffer[0...size-2] == buffer[1...size-1] , which is a test for
+	 * whether the buffer is filled with constant value.
+	 */
+	return !memcmp(buffer, buffer + 1, size - 1);
+}
+
 /**
  * simple_strtoX - convert a hex/dec/oct string into a number
  * @snum: buffer to convert
diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
index b376869..9602a6e 100644
--- a/nand-utils/nandwrite.c
+++ b/nand-utils/nandwrite.c
@@ -523,18 +523,8 @@ int main(int argc, char * const argv[])
 			}
 		}
 
-		allffs = 0;
-		if (skipallffs) 
-		{
-			for (ii = 0; ii < mtd.min_io_size; ii += sizeof(uint32_t))
-			{
-				if (*(uint32_t*)(writebuf + ii) != 0xffffffff)
-					break;
-			}
-			if (ii == mtd.min_io_size)
-				allffs = 1;
-		}
-		if (!allffs) {
+		ret = 0;
+		if (!skipallffs || !buffer_check_pattern(writebuf, mtd.min_io_size, 0xff)) {
 			/* Write out data */
 			ret = mtd_write(mtd_desc, &mtd, fd, mtdoffset / mtd.eb_size,
 					mtdoffset % mtd.eb_size,
@@ -543,9 +533,8 @@ int main(int argc, char * const argv[])
 					writeoob ? oobbuf : NULL,
 					writeoob ? mtd.oob_size : 0,
 					write_mode);
-		} else  {
-			ret = 0;
 		}
+
 		if (ret) {
 			long long i;
 			if (errno != EIO) {
-- 
2.10.2
