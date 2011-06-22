Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZQdk-00051H-GL
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 16:50:57 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v3 1/7] nanddump: add --bb=METHOD option
Date: Wed, 22 Jun 2011 09:49:17 -0700
Message-ID: <1308761363-16512-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
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
--omitbad      N/A            very similar to `skipbad' (DEPRECTATED)

The BB options are all mutually exclusive, so we check that we do not
have more than one BB option explicitly enabled on the command line by
tracking whether or not a BB method has been set by the user.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   67 ++++++++++++++++++++++++++++++++++++++++-------------------
 1 files changed, 45 insertions(+), 22 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index c9d7e8b..08f8964 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -88,21 +88,26 @@ static void display_version(void)
 
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
@@ -110,6 +115,7 @@ static void process_options(int argc, char * const argv[])
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
+			{"bb", required_argument, 0, 0},
 			{"forcebinary", no_argument, 0, 'a'},
 			{"canonicalprint", no_argument, 0, 'c'},
 			{"file", required_argument, 0, 'f'},
@@ -140,10 +146,28 @@ static void process_options(int argc, char * const argv[])
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
@@ -175,10 +199,22 @@ static void process_options(int argc, char * const argv[])
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
@@ -206,19 +242,6 @@ static void process_options(int argc, char * const argv[])
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
 
@@ -416,7 +439,7 @@ int main(int argc, char * const argv[])
 	/* Dump the flash contents */
 	for (ofs = start_addr; ofs < end_addr; ofs += bs) {
 		/* Check for bad block */
-		if (noskipbad) {
+		if (bb_method == dumpbad) {
 			badblock = 0;
 		} else if (blockstart != (ofs & (~mtd.eb_size + 1)) ||
 				firstblock) {
@@ -430,14 +453,14 @@ int main(int argc, char * const argv[])
 
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
