Received: from relay101a.appriver.com ([207.97.230.14] helo=relay.appriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTSLu-0006zk-Hp
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 11:55:09 +0000
From: Mike Crowe <mac@mcrowe.com>
To: linux-mtd@lists.infradead.org
Cc: Mike Crowe <mac@mcrowe.com>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>, richard@nod.at
Subject: [PATCH 2/2] nanddump: Add --skip-bad-blocks-to-start option
Date: Tue, 17 Jan 2017 11:54:04 +0000
Message-Id: <1484654044-17722-3-git-send-email-mac@mcrowe.com>
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

The --skip-bad-blocks-to-start option will increase the start address by
the size of each bad block encountered between the start of the partition
and the specified start address.

This can be useful if other readers of the partition will be reading using
a simple bad-block-skipping algorithm.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 nand-utils/nanddump.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
index a8ad334..bebb48e 100644
--- a/nand-utils/nanddump.c
+++ b/nand-utils/nanddump.c
@@ -52,6 +52,8 @@ static void display_help(int status)
 "-p         --prettyprint        Print nice (hexdump)\n"
 "-q         --quiet              Don't display progress and status messages\n"
 "-s addr    --startaddress=addr  Start address\n"
+"           --skip-bad-blocks-to-start\n"
+"                                Skip bad blocks when seeking to the start address\n"
 "\n"
 "--bb=METHOD, where METHOD can be `padbad', `dumpbad', or `skipbad':\n"
 "    padbad:  dump flash data, substituting 0xFF for any bad blocks\n"
@@ -86,6 +88,7 @@ static const char		*dumpfile;		// dump file name
 static bool			quiet = false;		// suppress diagnostic output
 static bool			canonical = false;	// print nice + ascii
 static bool			forcebinary = false;	// force printing binary to tty
+static bool			skip_bad_blocks_to_start = false;
 
 static enum {
 	padbad,   // dump flash data, substituting 0xFF for any bad blocks
@@ -105,6 +108,7 @@ static void process_options(int argc, char * const argv[])
 			{"version", no_argument, 0, 'V'},
 			{"bb", required_argument, 0, 0},
 			{"omitoob", no_argument, 0, 0},
+			{"skip-bad-blocks-to-start", no_argument, 0, 0 },
 			{"help", no_argument, 0, 'h'},
 			{"forcebinary", no_argument, 0, 'a'},
 			{"canonicalprint", no_argument, 0, 'c'},
@@ -146,6 +150,9 @@ static void process_options(int argc, char * const argv[])
 							errmsg_die("--oob and --oomitoob are mutually exclusive");
 						}
 						break;
+					case 3: /* --skip-bad-blocks-to-start */
+						skip_bad_blocks_to_start = true;
+						break;
 				}
 				break;
 			case 'V':
@@ -397,6 +404,22 @@ int main(int argc, char * const argv[])
 				mtd.min_io_size);
 		goto closeall;
 	}
+	if (skip_bad_blocks_to_start) {
+		long long bbs_offset = 0;
+		while (bbs_offset < start_addr) {
+			err = mtd_is_bad(&mtd, fd, bbs_offset / mtd.eb_size);
+			if (err < 0) {
+				sys_errmsg("%s: MTD get bad block failed", mtddev);
+				goto closeall;
+			} else if (err == 1) {
+				if (!quiet)
+					fprintf(stderr, "Bad block at %llx\n", bbs_offset);
+				start_addr += mtd.eb_size;
+			}
+			bbs_offset += mtd.eb_size;
+		}
+	}
+
 	if (length)
 		end_addr = start_addr + length;
 	if (!length || end_addr > mtd.size)
-- 
2.1.4
