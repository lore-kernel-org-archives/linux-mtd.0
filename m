Received: from relay03.pair.com ([209.68.5.17])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcaVb-0006rZ-TC
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 06:46:00 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/6] [MTD-UTILS] nanddump: Add Support for Quiet Option
Date: Sun,  7 Sep 2008 23:45:57 -0700
Message-Id: <1220856357-22854-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added support for the '-q,--quiet' option to suppress diagnostic output.
 Made the new option mutually-exclusive with the pretty print option.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
 nanddump.c |   36 ++++++++++++++++++++++++++----------
 1 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index b8332f9..678d684 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -52,6 +52,7 @@ static void display_help (void)
 "-o         --omitoob            Omit oob data\n"
 "-b         --omitbad            Omit bad blocks from the dump\n"
 "-p         --prettyprint        Print nice (hexdump)\n"
+"-q         --quiet              Don't display progress and status messages\n"
 "-s addr    --startaddress=addr  Start address\n"
 	);
 	exit(EXIT_SUCCESS);
@@ -81,6 +82,7 @@ static unsigned long	length;			// dump length
 static const char	*mtddev;		// mtd device name
 static const char	*dumpfile;		// dump file name
 static bool		omitbad = false;
+static bool		quiet = false;		// suppress diagnostic output
 
 static void process_options (int argc, char * const argv[])
 {
@@ -88,7 +90,7 @@ static void process_options (int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "bs:f:il:opn";
+		static const char *short_options = "bs:f:il:opqn";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -100,6 +102,7 @@ static void process_options (int argc, char * const argv[])
 			{"startaddress", required_argument, 0, 's'},
 			{"length", required_argument, 0, 'l'},
 			{"noecc", no_argument, 0, 'n'},
+			{"quiet", no_argument, 0, 'q'},
 			{0, 0, 0, 0},
 		};
 
@@ -144,6 +147,9 @@ static void process_options (int argc, char * const argv[])
 			case 'p':
 				pretty_print = true;
 				break;
+			case 'q':
+				quiet = true;
+				break;
 			case 'n':
 				noecc = true;
 				break;
@@ -153,6 +159,12 @@ static void process_options (int argc, char * const argv[])
 		}
 	}
 
+	if (quiet && pretty_print) {
+		fprintf(stderr, "The quiet and pretty print options are mutually-\n"
+				"exclusive. Choose one or the other.\n");
+		exit(EXIT_FAILURE);
+	}
+
 	if ((argc - optind) != 1 || error)
 		display_help ();
 
@@ -239,10 +251,12 @@ int main(int argc, char * const argv[])
 		/* check if we can read ecc stats */
 		if (!ioctl(fd, ECCGETSTATS, &stat1)) {
 			eccstats = true;
-			fprintf(stderr, "ECC failed: %d\n", stat1.failed);
-			fprintf(stderr, "ECC corrected: %d\n", stat1.corrected);    
-			fprintf(stderr, "Number of bad blocks: %d\n", stat1.badblocks);    
-			fprintf(stderr, "Number of bbt blocks: %d\n", stat1.bbtblocks);    
+			if (!quiet) {
+				fprintf(stderr, "ECC failed: %d\n", stat1.failed);
+				fprintf(stderr, "ECC corrected: %d\n", stat1.corrected);    
+				fprintf(stderr, "Number of bad blocks: %d\n", stat1.badblocks);    
+				fprintf(stderr, "Number of bbt blocks: %d\n", stat1.bbtblocks);    
+			}
 		} else
 			perror("No ECC status information available");
 	}
@@ -266,12 +280,14 @@ int main(int argc, char * const argv[])
 	bs = meminfo.writesize;
 
 	/* Print informative message */
-	fprintf(stderr, "Block size %u, page size %u, OOB size %u\n",
-			meminfo.erasesize, meminfo.writesize, meminfo.oobsize);
-	fprintf(stderr,
-			"Dumping data starting at 0x%08x and ending at 0x%08x...\n",
-			(unsigned int) start_addr, (unsigned int) end_addr);
 
+	if (!quiet) {
+		fprintf(stderr, "Block size %u, page size %u, OOB size %u\n",
+				meminfo.erasesize, meminfo.writesize, meminfo.oobsize);
+		fprintf(stderr,
+				"Dumping data starting at 0x%08x and ending at 0x%08x...\n",
+				(unsigned int) start_addr, (unsigned int) end_addr);
+	}
 	/* Dump the flash contents */
 	for (ofs = start_addr; ofs < end_addr ; ofs+=bs) {
 
-- 
1.6.0.1
