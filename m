Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZ3B9-00083Z-9v
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2011 15:47:56 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 1/7] nanddump: add --bb=METHOD option
Date: Tue, 21 Jun 2011 08:46:35 -0700
Message-ID: <1308671201-18197-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1308671201-18197-1-git-send-email-computersforpeace@gmail.com>
References: <1308671201-18197-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have too many separate bad block handling methods:
 --omitbad
 --noskipbad
 --skipbad
On top of these, we have the default option: that bad blocks are
replaced with 0xFF.

These options will be unified under --bb=METHOD. The end goal will be
something like:

----------------------------------------------------------------------------------------------
Old option     New option     Comment
----------------------------------------------------------------------------------------------
<default>      --bb=padbad    dump flash data, substituting 0xFF for any bad blocks
--noskipbad    --bb=dumpbad   dump flash data, including any bad blocks
--skipbad      --bb=skipbad   dump good data, completely skipping any bad blocks (new default)
--omitbad      --bb=omitbad   dump flash data, substituting nothing for any bad blocks (DEPRECTATED)

The BB options are all mutually exclusive, so we check that we do not
have more than one BB option explicitly enabled on the command line.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   87 +++++++++++++++++++++++++++++++++++++++++------------------
 1 files changed, 60 insertions(+), 27 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index c9d7e8b..07fd050 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -47,6 +47,12 @@ static void display_help(void)
 "\n"
 "           --help               Display this help and exit\n"
 "           --version            Output version information and exit\n"
+"           --bb=METHOD          Choose a bad block handling method.\n"
+"                                METHOD can be:\n"
+"                                    padbad (default)\n"
+"                                    dumpbad\n"
+"                                    skipbad\n"
+"                                    omitbad (DEPRECATED)\n"
 "-a         --forcebinary        Force printing of binary data to tty\n"
 "-b         --omitbad            Omit bad blocks from the dump\n"
 "-c         --canonicalprint     Print canonical Hex+ASCII dump\n"
@@ -60,11 +66,13 @@ static void display_help(void)
 "-q         --quiet              Don't display progress and status messages\n"
 "-s addr    --startaddress=addr  Start address\n"
 "\n"
-"Notes on --omitbad and --skipbad:\n"
-"  With either option, we stop dumping data when we encounter a bad block\n"
-"  and resume dumping at the next good block. However, with --omitbad, we\n"
+"Notes on --bb=omitbad and --bb=skipbad:\n"
+"* `omitbad' and `skipbad' are very similar; we are deprecating `omitbad'\n"
+"  in favor of `skipbad'.\n"
+"* With either option, we stop dumping data when we encounter a bad block\n"
+"  and resume dumping at the next good block. However, with `omitbad', we\n"
 "  count the bad block as part of the total dump length, whereas with\n"
-"  --skipbad, the bad block is 'skipped,' that is, not counted toward the\n"
+"  `skipbad', the bad block is skipped, that is, not counted toward the\n"
 "  total dump length.\n",
 	PROGRAM_NAME);
 	exit(EXIT_SUCCESS);
@@ -88,21 +96,26 @@ static void display_version(void)
 
 static bool			pretty_print = false;	// print nice
 static bool			noecc = false;		// don't error correct
-static bool			noskipbad = false;	// don't skip bad blocks
 static bool			omitoob = false;	// omit oob data
 static long long		start_addr;		// start address
 static long long		length;			// dump length
 static const char		*mtddev;		// mtd device name
 static const char		*dumpfile;		// dump file name
-static bool			omitbad = false;
 static bool			quiet = false;		// suppress diagnostic output
 static bool			canonical = false;	// print nice + ascii
 static bool			forcebinary = false;	// force printing binary to tty
-static bool			skipbad = false;	// skip over bad blocks
+
+static enum {
+	padbad,   // dump flash data, substituting 0xFF for any bad blocks
+	dumpbad,  // dump flash data, including any bad blocks
+	skipbad,  // dump good data, completely skipping any bad blocks
+	omitbad   // dump flash data, substituting nothing for any bad blocks (DEPRECATED)
+} bb_method = padbad;
 
 static void process_options(int argc, char * const argv[])
 {
 	int error = 0;
+	bool bb_default = true;
 
 	for (;;) {
 		int option_index = 0;
@@ -110,12 +123,13 @@ static void process_options(int argc, char * const argv[])
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
+			{"bb", required_argument, 0, 0},
 			{"forcebinary", no_argument, 0, 'a'},
 			{"canonicalprint", no_argument, 0, 'c'},
 			{"file", required_argument, 0, 'f'},
 			{"prettyprint", no_argument, 0, 'p'},
 			{"omitoob", no_argument, 0, 'o'},
-			{"omitbad", no_argument, 0, 'b'},
+			{"omitbad", no_argument, 0, 'b'}, //DEPRECATED
 			{"startaddress", required_argument, 0, 's'},
 			{"length", required_argument, 0, 'l'},
 			{"noecc", no_argument, 0, 'n'},
@@ -140,10 +154,30 @@ static void process_options(int argc, char * const argv[])
 					case 1:
 						display_version();
 						break;
+					case 2:
+						/* Handle --bb=METHOD */
+						if (!strcmp(optarg, "padbad"))
+							bb_method = padbad;
+						else if (!strcmp(optarg, "dumpbad"))
+							bb_method = dumpbad;
+						else if (!strcmp(optarg, "skipbad"))
+							bb_method = skipbad;
+						else if (!strcmp(optarg, "omitbad"))
+							bb_method = omitbad;
+						else
+							error++;
+						bb_default = false;
+						break;
 				}
 				break;
 			case 'b':
-				omitbad = true;
+				/* Check if bb_method was already set explicitly */
+				if (bb_default) {
+					bb_default = false;
+					bb_method = omitbad;
+				} else {
+					error++;
+				}
 				break;
 			case 's':
 				start_addr = simple_strtoll(optarg, &error);
@@ -175,10 +209,22 @@ static void process_options(int argc, char * const argv[])
 				noecc = true;
 				break;
 			case 'N':
-				noskipbad = true;
+				/* Check if bb_method was already set explicitly */
+				if (bb_default) {
+					bb_default = false;
+					bb_method = dumpbad;
+				} else {
+					error++;
+				}
 				break;
 			case 'k':
-				skipbad = true;
+				/* Check if bb_method was already set explicitly */
+				if (bb_default) {
+					bb_default = false;
+					bb_method = skipbad;
+				} else {
+					error++;
+				}
 				break;
 			case '?':
 				error++;
@@ -206,19 +252,6 @@ static void process_options(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
-	if (noskipbad && skipbad) {
-		fprintf(stderr, "The noskipbad and skipbad options are "
-				"mutually-exclusive.\n"
-				"Choose one or the other.\n");
-		exit(EXIT_FAILURE);
-	}
-
-	if (omitbad && skipbad) {
-		fprintf(stderr, "The omitbad and skipbad options are mutually-"
-				"exclusive.\nChoose one or the other.\n");
-		exit(EXIT_FAILURE);
-	}
-
 	if ((argc - optind) != 1 || error)
 		display_help();
 
@@ -416,7 +449,7 @@ int main(int argc, char * const argv[])
 	/* Dump the flash contents */
 	for (ofs = start_addr; ofs < end_addr; ofs += bs) {
 		/* Check for bad block */
-		if (noskipbad) {
+		if (bb_method == dumpbad) {
 			badblock = 0;
 		} else if (blockstart != (ofs & (~mtd.eb_size + 1)) ||
 				firstblock) {
@@ -430,14 +463,14 @@ int main(int argc, char * const argv[])
 
 		if (badblock) {
 			/* skip bad block, increase end_addr */
-			if (skipbad) {
+			if (bb_method == skipbad) {
 				end_addr += mtd.eb_size;
 				ofs += mtd.eb_size - bs;
 				if (end_addr > mtd.size)
 					end_addr = mtd.size;
 				continue;
 			}
-			if (omitbad)
+			if (bb_method == omitbad)
 				continue;
 			memset(readbuf, 0xff, bs);
 		} else {
-- 
1.7.0.4
