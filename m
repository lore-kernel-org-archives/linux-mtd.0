Received: from relay101b.appriver.com ([207.97.230.15] helo=relay.appriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEK6v-0005E2-Ab
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 18:05:02 +0000
From: Mike Crowe <mac@mcrowe.com>
To: linux-mtd@lists.infradead.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 1/2] nandwrite: Add --output-skip
Date: Tue,  6 Dec 2016 18:04:16 +0000
Message-Id: <1481047457-25427-2-git-send-email-mac@mcrowe.com>
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
writing. This differs from --start when there are bad blocks: --start
always seeks to the specified offset in the flash, --output-skip works its
way through the flash a page at a time from the specified start, skipping
bad blocks provided --noskipbad was not also passed.

This can be useful when writing part way through a partition that will be
read using a simple bad-block-skipping algorithm.
---
 nand-utils/nandwrite.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
index b376869..b4a6d8c 100644
--- a/nand-utils/nandwrite.c
+++ b/nand-utils/nandwrite.c
@@ -60,6 +60,7 @@ static void display_help(int status)
 "  -b, --blockalign=1|2|4  Set multiple of eraseblocks to align to\n"
 "      --input-skip=length Skip |length| bytes of the input file\n"
 "      --input-size=length Only read |length| bytes of the input file\n"
+"      --output-skip=length Skip |length| bytes before writing\n"
 "  -q, --quiet             Don't display progress messages\n"
 "  -h, --help              Display this help and exit\n"
 "  -V, --version           Output version information and exit\n"
@@ -87,6 +88,7 @@ static const char	*mtd_device, *img;
 static long long	mtdoffset = 0;
 static long long	inputskip = 0;
 static long long	inputsize = 0;
+static long long	outputskip = 0;
 static bool		quiet = false;
 static bool		writeoob = false;
 static bool		onlyoob = false;
@@ -110,6 +112,7 @@ static void process_options(int argc, char * const argv[])
 			{"version", no_argument, 0, 'V'},
 			{"input-skip", required_argument, 0, 0},
 			{"input-size", required_argument, 0, 0},
+			{"output-skip", required_argument, 0, 0},
 			{"help", no_argument, 0, 'h'},
 			{"blockalign", required_argument, 0, 'b'},
 			{"markbad", no_argument, 0, 'm'},
@@ -139,6 +142,9 @@ static void process_options(int argc, char * const argv[])
 			case 2: /* --input-size */
 				inputsize = simple_strtoll(optarg, &error);
 				break;
+			case 3: /* --output-skip */
+				outputskip = simple_strtoll(optarg, &error);
+				break;
 			}
 			break;
 		case 'V':
@@ -286,6 +292,11 @@ int main(int argc, char * const argv[])
 			   "The pagesize of this NAND Flash is 0x%x.\n",
 			   mtd.min_io_size);
 
+	if (outputskip % ebsize_aligned)
+		errmsg_die("The output skip length is not page-aligned !\n"
+			   "The pagesize of this NAND flash is 0x%x.\n",
+			   mtd.min_io_size);
+
 	/* Select OOB write mode */
 	if (noecc)
 		write_mode = MTD_OPS_RAW;
@@ -350,7 +361,7 @@ int main(int argc, char * const argv[])
 	}
 
 	/* Check, if length fits into device */
-	if ((imglen / pagelen) * mtd.min_io_size > mtd.size - mtdoffset) {
+	if ((imglen / pagelen) * mtd.min_io_size > mtd.size - mtdoffset - outputskip) {
 		fprintf(stderr, "Image %lld bytes, NAND page %d bytes, OOB area %d"
 				" bytes, device size %lld bytes\n",
 				imglen, pagelen, mtd.oob_size, mtd.size);
@@ -400,7 +411,7 @@ int main(int argc, char * const argv[])
 			}
 
 			baderaseblock = false;
-			if (!quiet)
+			if (!quiet && (outputskip == 0))
 				fprintf(stdout, "Writing data to block %lld at offset 0x%llx\n",
 						 blockstart / ebsize_aligned, blockstart);
 
@@ -432,7 +443,12 @@ int main(int argc, char * const argv[])
 
 				offs +=  ebsize_aligned / blockalign;
 			} while (offs < blockstart + ebsize_aligned);
+		}
 
+		if (outputskip > 0) {
+			mtdoffset += mtd.min_io_size;
+			outputskip -= mtd.min_io_size;
+			continue;
 		}
 
 		/* Read more data from the input if there isn't enough in the buffer */
-- 
2.1.4
