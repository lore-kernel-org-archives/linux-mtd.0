Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8pRH-0006zB-0V
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 07:19:53 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] mtd-utils: nanddump/nandwrite: style,
	signed-ness, printing fixups
Date: Thu, 21 Oct 2010 00:19:36 -0700
Message-ID: <1287645577-13538-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1287645577-13538-1-git-send-email-computersforpeace@gmail.com>
References: <1287645577-13538-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There were some signed/unsigned integer comparisons. Their types were
changed for safety. Also, "strtol" was improperly used for unsigned
data types.

Nanddump's pretty print options needed a slight reformat to prepare for
printing offsets that are more than 32 bits (8 hex characters) wide.
This prevents overlap of output and ensures that at least one space is
printed between hex and ascii printouts. Perhaps this could use some
better alignment in the future.

Other fixes:
* Corrected several simple spacing issues
* Changed indentation of some global variable declarations in
  order to prepare for the next patch, which makes those
  declarations longer
* Used macro for PRETTY_ROW_SIZE instead of constant 16
* Reformatted, edited a multi-line comment
* Removed some unnecessary casts

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c  |   55 +++++++++++++++++++++++++++----------------------------
 nandwrite.c |   28 ++++++++++++++--------------
 2 files changed, 41 insertions(+), 42 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index bb649da..013eca0 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -77,18 +77,18 @@ static void display_version(void)
 
 // Option variables
 
-static bool		pretty_print = false;	// print nice
-static bool		noecc = false;		// don't error correct
-static bool		noskipbad = false;	// don't skip bad blocks
-static bool		omitoob = false;	// omit oob data
-static unsigned long	start_addr;		// start address
-static unsigned long	length;			// dump length
-static const char	*mtddev;		// mtd device name
-static const char	*dumpfile;		// dump file name
-static bool		omitbad = false;
-static bool		quiet = false;		// suppress diagnostic output
-static bool		canonical = false;	// print nice + ascii
-static bool		forcebinary = false;	// force printing binary to tty
+static bool			pretty_print = false;	// print nice
+static bool			noecc = false;		// don't error correct
+static bool			noskipbad = false;	// don't skip bad blocks
+static bool			omitoob = false;	// omit oob data
+static unsigned long		start_addr;		// start address
+static unsigned long		length;			// dump length
+static const char		*mtddev;		// mtd device name
+static const char		*dumpfile;		// dump file name
+static bool			omitbad = false;
+static bool			quiet = false;		// suppress diagnostic output
+static bool			canonical = false;	// print nice + ascii
+static bool			forcebinary = false;	// force printing binary to tty
 
 static void process_options(int argc, char * const argv[])
 {
@@ -135,7 +135,7 @@ static void process_options(int argc, char * const argv[])
 				omitbad = true;
 				break;
 			case 's':
-				start_addr = strtol(optarg, NULL, 0);
+				start_addr = strtoul(optarg, NULL, 0);
 				break;
 			case 'f':
 				if (!(dumpfile = strdup(optarg))) {
@@ -144,7 +144,7 @@ static void process_options(int argc, char * const argv[])
 				}
 				break;
 			case 'l':
-				length = strtol(optarg, NULL, 0);
+				length = strtoul(optarg, NULL, 0);
 				break;
 			case 'o':
 				omitoob = true;
@@ -225,14 +225,12 @@ static void pretty_dump_to_buffer(const unsigned char *buf, size_t len,
 {
 	static const char hex_asc[] = "0123456789abcdef";
 	unsigned char ch;
-	int j, lx = 0;
-	int ascii_column;
+	unsigned int j, lx = 0, ascii_column;
 
 	if (pagedump)
-		sprintf(linebuf, "0x%.8x: ", prefix);
+		lx += sprintf(linebuf, "0x%.8x: ", prefix);
 	else
-		sprintf(linebuf, "  OOB Data: ");
-	lx += 12;
+		lx += sprintf(linebuf, "  OOB Data: ");
 
 	if (!len)
 		goto nil;
@@ -253,8 +251,10 @@ static void pretty_dump_to_buffer(const unsigned char *buf, size_t len,
 	if (!ascii)
 		goto nil;
 
-	while (lx < (linebuflen - 1) && lx < (ascii_column - 1))
+	do {
 		linebuf[lx++] = ' ';
+	} while (lx < (linebuflen - 1) && lx < (ascii_column - 1));
+
 	linebuf[lx++] = '|';
 	for (j = 0; (j < len) && (lx + 2) < linebuflen; j++)
 		linebuf[lx++] = (isascii(buf[j]) && isprint(buf[j])) ? buf[j]
@@ -308,7 +308,7 @@ int main(int argc, char * const argv[])
 	oob.ptr = oobbuf;
 
 	if (noecc)  {
-		ret = ioctl(fd, MTDFILEMODE, (void *) MTD_MODE_RAW);
+		ret = ioctl(fd, MTDFILEMODE, MTD_MODE_RAW);
 		if (ret == 0) {
 			oobinfochanged = 2;
 		} else {
@@ -330,7 +330,6 @@ int main(int argc, char * const argv[])
 			}
 		}
 	} else {
-
 		/* check if we can read ecc stats */
 		if (!ioctl(fd, ECCGETSTATS, &stat1)) {
 			eccstats = true;
@@ -375,7 +374,6 @@ int main(int argc, char * const argv[])
 	bs = meminfo.writesize;
 
 	/* Print informative message */
-
 	if (!quiet) {
 		fprintf(stderr, "Block size %u, page size %u, OOB size %u\n",
 				meminfo.erasesize, meminfo.writesize, meminfo.oobsize);
@@ -383,6 +381,7 @@ int main(int argc, char * const argv[])
 				"Dumping data starting at 0x%08x and ending at 0x%08x...\n",
 				(unsigned int)start_addr, (unsigned int)end_addr);
 	}
+
 	/* Dump the flash contents */
 	for (ofs = start_addr; ofs < end_addr; ofs += bs) {
 		/* Check for bad block */
@@ -401,7 +400,7 @@ int main(int argc, char * const argv[])
 		if (badblock) {
 			if (omitbad)
 				continue;
-			memset (readbuf, 0xff, bs);
+			memset(readbuf, 0xff, bs);
 		} else {
 			/* Read page data and exit on failure */
 			if (pread(fd, readbuf, bs, ofs) != bs) {
@@ -430,8 +429,8 @@ int main(int argc, char * const argv[])
 		/* Write out page data */
 		if (pretty_print) {
 			for (i = 0; i < bs; i += PRETTY_ROW_SIZE) {
-				pretty_dump_to_buffer(readbuf+i, PRETTY_ROW_SIZE,
-						pretty_buf, PRETTY_BUF_LEN, true, canonical, ofs+i);
+				pretty_dump_to_buffer(readbuf + i, PRETTY_ROW_SIZE,
+						pretty_buf, PRETTY_BUF_LEN, true, canonical, ofs + i);
 				write(ofd, pretty_buf, strlen(pretty_buf));
 			}
 		} else
@@ -453,8 +452,8 @@ int main(int argc, char * const argv[])
 
 		/* Write out OOB data */
 		if (pretty_print) {
-			for (i = 0; i < meminfo.oobsize; i += 16) {
-				pretty_dump_to_buffer(oobbuf+i, meminfo.oobsize-i,
+			for (i = 0; i < meminfo.oobsize; i += PRETTY_ROW_SIZE) {
+				pretty_dump_to_buffer(oobbuf + i, meminfo.oobsize - i,
 						pretty_buf, PRETTY_BUF_LEN, false, canonical, 0);
 				write(ofd, pretty_buf, strlen(pretty_buf));
 			}
diff --git a/nandwrite.c b/nandwrite.c
index b5745b9..b0c4366 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -318,7 +318,6 @@ int main(int argc, char * const argv[])
 
 		// autoplace ECC ?
 		if (old_oobinfo.useecc != MTD_NANDECC_AUTOPLACE) {
-
 			if (ioctl(fd, MEMSETOOBSEL, &autoplace_oobinfo) != 0) {
 				perror("MEMSETOOBSEL");
 				close(fd);
@@ -329,7 +328,7 @@ int main(int argc, char * const argv[])
 	}
 
 	if (noecc)  {
-		ret = ioctl(fd, MTDFILEMODE, (void *)MTD_MODE_RAW);
+		ret = ioctl(fd, MTDFILEMODE, MTD_MODE_RAW);
 		if (ret == 0) {
 			oobinfochanged = 2;
 		} else {
@@ -428,7 +427,7 @@ int main(int argc, char * const argv[])
 	}
 
 	// Check, if length fits into device
-	if ( ((imglen / pagelen) * meminfo.writesize) > (meminfo.size - mtdoffset)) {
+	if (((imglen / pagelen) * meminfo.writesize) > (meminfo.size - mtdoffset)) {
 		fprintf(stderr, "Image %d bytes, NAND page %d bytes, OOB area %u bytes, device size %u bytes\n",
 				imglen, pagelen, meminfo.writesize, meminfo.size);
 		perror("Input file does not fit into device");
@@ -451,14 +450,15 @@ int main(int argc, char * const argv[])
 	 * length or zero.
 	 */
 	while (((imglen > 0) || (writebuf < (filebuf + filebuf_len)))
-		&& (mtdoffset < meminfo.size))
-	{
-		// new eraseblock , check for bad block(s)
-		// Stay in the loop to be sure if the mtdoffset changes because
-		// of a bad block, that the next block that will be written to
-		// is also checked. Thus avoiding errors if the block(s) after the
-		// skipped block(s) is also bad (number of blocks depending on
-		// the blockalign
+		&& (mtdoffset < meminfo.size)) {
+		/*
+		 * New eraseblock, check for bad block(s)
+		 * Stay in the loop to be sure that, if mtdoffset changes because
+		 * of a bad block, the next block that will be written to
+		 * is also checked. Thus, we avoid errors if the block(s) after the
+		 * skipped block(s) is also bad (number of blocks depending on
+		 * the blockalign).
+		 */
 		while (blockstart != (mtdoffset & (~meminfo.erasesize + 1))) {
 			blockstart = mtdoffset & (~meminfo.erasesize + 1);
 			offs = blockstart;
@@ -592,14 +592,14 @@ int main(int argc, char * const argv[])
 				int i, start, len;
 				int tags_pos = 0;
 				/*
-				 *  We use autoplacement and have the oobinfo with the autoplacement
+				 * We use autoplacement and have the oobinfo with the autoplacement
 				 * information from the kernel available
 				 *
 				 * Modified to support out of order oobfree segments,
 				 * such as the layout used by diskonchip.c
 				 */
 				if (!oobinfochanged && (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE)) {
-					for (i = 0;old_oobinfo.oobfree[i][1]; i++) {
+					for (i = 0; old_oobinfo.oobfree[i][1]; i++) {
 						/* Set the reserved bytes to 0xff */
 						start = old_oobinfo.oobfree[i][0];
 						len = old_oobinfo.oobfree[i][1];
@@ -620,7 +620,7 @@ int main(int argc, char * const argv[])
 							len);
 				}
 			}
-			/* Write OOB data first, as ecc will be placed in there*/
+			/* Write OOB data first, as ecc will be placed in there */
 			oob.start = mtdoffset;
 			if (ioctl(fd, MEMWRITEOOB, &oob) != 0) {
 				perror("ioctl(MEMWRITEOOB)");
-- 
1.7.0.4
