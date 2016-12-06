Received: from relay101a.appriver.com ([207.97.230.14] helo=relay.appriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEK6w-0005E1-F7
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 18:05:03 +0000
From: Mike Crowe <mac@mcrowe.com>
To: linux-mtd@lists.infradead.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 2/2] nanddump: Add --input-skip
Date: Tue,  6 Dec 2016 18:04:17 +0000
Message-Id: <1481047457-25427-3-git-send-email-mac@mcrowe.com>
In-Reply-To: <1481047457-25427-1-git-send-email-mac@mcrowe.com>
References: <1481047457-25427-1-git-send-email-mac@mcrowe.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Skip the specified number of bytes (which must be page aligned) before
dumping. This differs from --startaddress when there are bad blocks:
--startaddress always seeks to the specified offset in the partition,
--output-skip works its way through the partition a page at a time from the
specified start, skipping bad blocks as required by --bb.

This can be useful if other readers of the partition will be reading using
a simple bad-block-skipping algorithm.
---
 nand-utils/nanddump.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
index a8ad334..bd0d420 100644
--- a/nand-utils/nanddump.c
+++ b/nand-utils/nanddump.c
@@ -46,6 +46,7 @@ static void display_help(int status)
 "-c         --canonicalprint     Print canonical Hex+ASCII dump\n"
 "-f file    --file=file          Dump to file\n"
 "-l length  --length=length      Length\n"
+"           --input-skip=length  Skip |length| bytes before dumping\n"
 "-n         --noecc              Read without error correction\n"
 "           --omitoob            Omit OOB data (default)\n"
 "-o         --oob                Dump OOB data\n"
@@ -81,6 +82,7 @@ static bool			noecc = false;		// don't error correct
 static bool			omitoob = true;		// omit oob data
 static long long		start_addr;		// start address
 static long long		length;			// dump length
+static long long		inputskip;              // skip bytes before dump
 static const char		*mtddev;		// mtd device name
 static const char		*dumpfile;		// dump file name
 static bool			quiet = false;		// suppress diagnostic output
@@ -105,6 +107,7 @@ static void process_options(int argc, char * const argv[])
 			{"version", no_argument, 0, 'V'},
 			{"bb", required_argument, 0, 0},
 			{"omitoob", no_argument, 0, 0},
+			{"input-skip", required_argument, 0, 0},
 			{"help", no_argument, 0, 'h'},
 			{"forcebinary", no_argument, 0, 'a'},
 			{"canonicalprint", no_argument, 0, 'c'},
@@ -146,6 +149,9 @@ static void process_options(int argc, char * const argv[])
 							errmsg_die("--oob and --oomitoob are mutually exclusive");
 						}
 						break;
+					case 3: /* --input-skip */
+						inputskip = simple_strtoll(optarg, &error);
+						break;
 				}
 				break;
 			case 'V':
@@ -404,13 +410,21 @@ int main(int argc, char * const argv[])
 
 	bs = mtd.min_io_size;
 
+	if (inputskip & (mtd.min_io_size - 1)) {
+		fprintf(stderr, "the input-skip parameter is not page-aligned!\n"
+			        "The pagesize of this NAND flash is 0x%x.\n",
+			        mtd.min_io_size);
+		goto closeall;
+	}
+
 	/* Print informative message */
 	if (!quiet) {
 		fprintf(stderr, "Block size %d, page size %d, OOB size %d\n",
 				mtd.eb_size, mtd.min_io_size, mtd.oob_size);
-		fprintf(stderr,
-				"Dumping data starting at 0x%08llx and ending at 0x%08llx...\n",
-				start_addr, end_addr);
+		if (!inputskip)
+			fprintf(stderr,
+				        "Dumping data starting at 0x%08llx and ending at 0x%08llx...\n",
+				        start_addr, end_addr);
 	}
 
 	/* Dump the flash contents */
@@ -463,6 +477,16 @@ int main(int argc, char * const argv[])
 			stat1 = stat2;
 		}
 
+		if (inputskip) {
+			inputskip -= bs;
+			end_addr += bs;
+			if (!inputskip && !quiet)
+				fprintf(stderr,
+					"Dumping data starting at 0x%08llx and ending at 0x%08llx...\n",
+					ofs + bs, end_addr);
+			continue;
+		}
+
 		/* Write out page data */
 		if (pretty_print) {
 			for (i = 0; i < bs; i += PRETTY_ROW_SIZE) {
-- 
2.1.4
