Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OWy4b-0001qH-G5
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 20:51:58 +0000
From: "Brian Norris" <norris@broadcom.com>
To: "Artem Bityutskiy" <Artem.Bityutskiy@nokia.com>
Subject: [PATCH 2/6] mtd-utils/nanddump.c: Robust pretty hexdump
Date: Thu, 8 Jul 2010 13:50:05 -0700
Message-ID: <1278622209-20149-3-git-send-email-norris@broadcom.com>
In-Reply-To: <1278622209-20149-1-git-send-email-norris@broadcom.com>
References: <1278622209-20149-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adapted code from the linux kernel hex_dump_to_buffer() (lib/hexdump.c)
to provide a more robust hexdump for the pretty option. Now, nanddump
can print out any size of OOB (or page for that matter...) without
having to worry about non-multiples of 16.

This also provides ability to dump ASCII format next to the hex output
once additional command-line flags are added.

Tested with Samsung K9GAG08U0D

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 nanddump.c |  116 ++++++++++++++++++++++++++++++++++++++++++-----------------
 1 files changed, 82 insertions(+), 34 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 735ae48..7281279 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -83,6 +83,7 @@ static const char	*mtddev;		// mtd device name
 static const char	*dumpfile;		// dump file name
 static bool		omitbad = false;
 static bool		quiet = false;		// suppress diagnostic output
+static bool		ascii = false;
 
 static void process_options (int argc, char * const argv[])
 {
@@ -171,6 +172,79 @@ static void process_options (int argc, char * const argv[])
 	mtddev = argv[optind];
 }
 
+#define PRETTY_ROW_SIZE 16
+#define PRETTY_BUF_LEN 80
+
+/**
+ * pretty_dump_to_buffer - formats a blob of data to "hex ASCII" in memory
+ * @buf: data blob to dump
+ * @len: number of bytes in the @buf
+ * @linebuf: where to put the converted data
+ * @linebuflen: total size of @linebuf, including space for terminating NULL
+ * @pagedump: true - dumping as page format; false - dumping as OOB format
+ * @prefix: address to print before line in a page dump, ignored if !pagedump
+ *
+ * pretty_dump_to_buffer() works on one "line" of output at a time, i.e.,
+ * PRETTY_ROW_SIZE bytes of input data converted to hex + ASCII output.
+ *
+ * Given a buffer of unsigned char data, pretty_dump_to_buffer() converts the
+ * input data to a hex/ASCII dump at the supplied memory location. A prefix
+ * is included based on whether we are dumping page or OOB data. The converted
+ * output is always NULL-terminated.
+ *
+ * e.g. with ascii = false:
+ *   pretty_dump_to_buffer(data, data_len, prettybuf, linelen,
+ *                         true, 256);
+ * produces:
+ *   0x00000100: 40 41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e 4f
+ * NOTE: This function was adapted from linux kernel, "lib/hexdump.c"
+ */
+static void pretty_dump_to_buffer(const unsigned char *buf, size_t len,
+		char *linebuf, size_t linebuflen, bool pagedump,
+		unsigned int prefix)
+{
+	static const char hex_asc[] = "0123456789abcdef";
+	unsigned char ch;
+	int j, lx = 0;
+	int ascii_column;
+
+	if (pagedump)
+		sprintf(linebuf, "0x%.8x: ", prefix);
+	else
+		sprintf(linebuf, "  OOB Data: ");
+	lx += 12;
+
+	if (!len)
+		goto nil;
+	if (len > PRETTY_ROW_SIZE)	/* limit to one line at a time */
+		len = PRETTY_ROW_SIZE;
+
+	for (j = 0; (j < len) && (lx + 3) <= linebuflen; j++) {
+		ch = buf[j];
+		linebuf[lx++] = hex_asc[ch & 0x0f];
+		linebuf[lx++] = hex_asc[(ch & 0xf0) >> 4];
+		linebuf[lx++] = ' ';
+	}
+	if (j)
+		lx--;
+
+	ascii_column = 3 * PRETTY_ROW_SIZE + 14;
+
+	if (!ascii)
+		goto nil;
+
+	while (lx < (linebuflen - 1) && lx < (ascii_column - 1))
+		linebuf[lx++] = ' ';
+	linebuf[lx++] = '|';
+	for (j = 0; (j < len) && (lx + 2) < linebuflen; j++)
+		linebuf[lx++] = (isascii(buf[j]) && isprint(buf[j])) ? buf[j]
+			: '.';
+	linebuf[lx++] = '|';
+nil:
+	linebuf[lx++] = '\n';
+	linebuf[lx++] = '\0';
+}
+
 /*
  * Buffers for reading data from flash
  */
@@ -189,7 +263,7 @@ int main(int argc, char * const argv[])
 	int ret, i, fd, ofd, bs, badblock = 0;
 	struct mtd_oob_buf oob = {0, 16, oobbuf};
 	mtd_info_t meminfo;
-	char pretty_buf[80];
+	char pretty_buf[PRETTY_BUF_LEN];
 	int oobinfochanged = 0 ;
 	struct nand_oobinfo old_oobinfo;
 	struct mtd_ecc_stats stat1, stat2;
@@ -336,20 +410,10 @@ int main(int argc, char * const argv[])
 
 		/* Write out page data */
 		if (pretty_print) {
-			for (i = 0; i < bs; i += 16) {
-				sprintf(pretty_buf,
-						"0x%08x: %02x %02x %02x %02x %02x %02x %02x "
-						"%02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
-						(unsigned int) (ofs + i),  readbuf[i],
-						readbuf[i+1], readbuf[i+2],
-						readbuf[i+3], readbuf[i+4],
-						readbuf[i+5], readbuf[i+6],
-						readbuf[i+7], readbuf[i+8],
-						readbuf[i+9], readbuf[i+10],
-						readbuf[i+11], readbuf[i+12],
-						readbuf[i+13], readbuf[i+14],
-						readbuf[i+15]);
-				write(ofd, pretty_buf, 60);
+			for (i = 0; i < bs; i += PRETTY_ROW_SIZE) {
+				pretty_dump_to_buffer(readbuf+i, PRETTY_ROW_SIZE,
+						pretty_buf, PRETTY_BUF_LEN, true, ofs+i);
+				write(ofd, pretty_buf, strlen(pretty_buf));
 			}
 		} else
 			write(ofd, readbuf, bs);
@@ -372,26 +436,10 @@ int main(int argc, char * const argv[])
 
 		/* Write out OOB data */
 		if (pretty_print) {
-			if (meminfo.oobsize < 16) {
-				sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
-						"%02x %02x\n",
-						oobbuf[0], oobbuf[1], oobbuf[2],
-						oobbuf[3], oobbuf[4], oobbuf[5],
-						oobbuf[6], oobbuf[7]);
-				write(ofd, pretty_buf, 48);
-				continue;
-			}
-
 			for (i = 0; i < meminfo.oobsize; i += 16) {
-				sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
-						"%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
-						oobbuf[i], oobbuf[i+1], oobbuf[i+2],
-						oobbuf[i+3], oobbuf[i+4], oobbuf[i+5],
-						oobbuf[i+6], oobbuf[i+7], oobbuf[i+8],
-						oobbuf[i+9], oobbuf[i+10], oobbuf[i+11],
-						oobbuf[i+12], oobbuf[i+13], oobbuf[i+14],
-						oobbuf[i+15]);
-				write(ofd, pretty_buf, 60);
+				pretty_dump_to_buffer(oobbuf+i, meminfo.oobsize-i,
+						pretty_buf, PRETTY_BUF_LEN, false, 0);
+				write(ofd, pretty_buf, strlen(pretty_buf));
 			}
 		} else
 			write(ofd, oobbuf, meminfo.oobsize);
-- 
1.7.0.4
