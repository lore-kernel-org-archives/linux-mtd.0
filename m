Received: from relay101a.appriver.com ([207.97.230.14] helo=relay.appriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTSLs-0006zk-K9
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 11:55:02 +0000
From: Mike Crowe <mac@mcrowe.com>
To: linux-mtd@lists.infradead.org
Cc: Mike Crowe <mac@mcrowe.com>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>, richard@nod.at
Subject: [PATCH 1/2] nandwrite: Add --skip-bad-blocks-to-start option
Date: Tue, 17 Jan 2017 11:54:03 +0000
Message-Id: <1484654044-17722-2-git-send-email-mac@mcrowe.com>
In-Reply-To: <1484654044-17722-1-git-send-email-mac@mcrowe.com>
References: <1484654044-17722-1-git-send-email-mac@mcrowe.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The --skip-bad-blocks-to-start option will increase the seek offset by the
size of each bad block encountered between the start of the partition and
the specified start address.

This can be useful when writing part way through a partition that will be
read using a simple bad-block-skipping algorithm.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 nand-utils/nandwrite.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
index c7a53d1..f29fc67 100644
--- a/nand-utils/nandwrite.c
+++ b/nand-utils/nandwrite.c
@@ -56,6 +56,8 @@ static void display_help(int status)
 "  -o, --oob               Input contains oob data\n"
 "  -O, --onlyoob           Input contains oob data and only write the oob part\n"
 "  -s addr, --start=addr   Set output start address (default is 0)\n"
+"  --skip-bad-blocks-to-start"
+"                          Skip bad blocks when seeking to the start address\n"
 "  -p, --pad               Pad writes to page size\n"
 "  -b, --blockalign=1|2|4  Set multiple of eraseblocks to align to\n"
 "      --input-skip=length Skip |length| bytes of the input file\n"
@@ -96,6 +98,7 @@ static bool		autoplace = false;
 static bool		skipallffs = false;
 static bool		noskipbad = false;
 static bool		pad = false;
+static bool		skip_bad_blocks_to_start = false;
 static int		blockalign = 1; /* default to using actual block size */
 
 static void process_options(int argc, char * const argv[])
@@ -110,6 +113,7 @@ static void process_options(int argc, char * const argv[])
 			{"version", no_argument, 0, 'V'},
 			{"input-skip", required_argument, 0, 0},
 			{"input-size", required_argument, 0, 0},
+			{"skip-bad-blocks-to-start", no_argument, 0, 0},
 			{"help", no_argument, 0, 'h'},
 			{"blockalign", required_argument, 0, 'b'},
 			{"markbad", no_argument, 0, 'm'},
@@ -139,6 +143,9 @@ static void process_options(int argc, char * const argv[])
 			case 2: /* --input-size */
 				inputsize = simple_strtoll(optarg, &error);
 				break;
+			case 3: /* --skip-bad-blocks-to-start */
+				skip_bad_blocks_to_start = true;
+				break;
 			}
 			break;
 		case 'V':
@@ -365,6 +372,25 @@ int main(int argc, char * const argv[])
 		goto closeall;
 	}
 
+	/* Skip bad blocks on the way to the start address if necessary */
+	if (skip_bad_blocks_to_start) {
+		long long bbs_offset = 0;
+		while (bbs_offset < mtdoffset) {
+			ret = is_virt_block_bad(&mtd, fd, bbs_offset);
+			if (ret < 0) {
+				sys_errmsg("%s: MTD get bad block failed", mtd_device);
+				goto closeall;
+			} else if (ret == 1) {
+				if (!quiet)
+					fprintf(stderr, "Bad block at %llx, %u block(s) "
+						"from %llx will be skipped\n",
+						bbs_offset, blockalign, bbs_offset);
+				mtdoffset += ebsize_aligned;
+			}
+			bbs_offset += ebsize_aligned;
+		}
+	}
+
 	/* Check, if length fits into device */
 	if ((imglen / pagelen) * mtd.min_io_size > mtd.size - mtdoffset) {
 		fprintf(stderr, "Image %lld bytes, NAND page %d bytes, OOB area %d"
-- 
2.1.4
