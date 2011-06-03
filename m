Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QSZ4V-0003ZH-Bb
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 18:26:12 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 1/2] nanddump: add --skipbad option for bad blocks
Date: Fri, 3 Jun 2011 11:25:00 -0700
Message-ID: <1307125501-32558-1-git-send-email-computersforpeace@gmail.com>
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

This patch adds a new option "--skipbad" to nanddump. It is subtly
different than "--omitbad". The following description was included in
the help message to attempt to clarify the differences.

 Notes on --omitbad and --skipbad:
   With either option, we stop dumping data when we encounter a bad block
   and resume dumping at the next good block. However, with --omitbad, we
   count the bad block as part of the total dump length, whereas with
   --skipbad, the bad block is 'skipped,' that is, not counted toward the
   total dump length.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   38 ++++++++++++++++++++++++++++++++++++--
 1 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 214fb12..78ea22e 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -50,6 +50,7 @@ static void display_help(void)
 "-a         --forcebinary        Force printing of binary data to tty\n"
 "-c         --canonicalprint     Print canonical Hex+ASCII dump\n"
 "-f file    --file=file          Dump to file\n"
+"-k         --skipbad            Skip over bad blocks (see below)\n"
 "-l length  --length=length      Length\n"
 "-n         --noecc              Read without error correction\n"
 "-N         --noskipbad          Read without bad block skipping\n"
@@ -57,7 +58,14 @@ static void display_help(void)
 "-b         --omitbad            Omit bad blocks from the dump\n"
 "-p         --prettyprint        Print nice (hexdump)\n"
 "-q         --quiet              Don't display progress and status messages\n"
-"-s addr    --startaddress=addr  Start address\n",
+"-s addr    --startaddress=addr  Start address\n"
+"\n"
+"Notes on --omitbad and --skipbad:\n"
+"  With either option, we stop dumping data when we encounter a bad block\n"
+"  and resume dumping at the next good block. However, with --omitbad, we\n"
+"  count the bad block as part of the total dump length, whereas with\n"
+"  --skipbad, the bad block is 'skipped,' that is, not counted toward the\n"
+"  total dump length.\n",
 	PROGRAM_NAME);
 	exit(EXIT_SUCCESS);
 }
@@ -90,6 +98,7 @@ static bool			omitbad = false;
 static bool			quiet = false;		// suppress diagnostic output
 static bool			canonical = false;	// print nice + ascii
 static bool			forcebinary = false;	// force printing binary to tty
+static bool			skipbad = false;	// skip over bad blocks
 
 static void process_options(int argc, char * const argv[])
 {
@@ -97,7 +106,7 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "bs:f:l:opqnNca";
+		static const char *short_options = "bs:f:l:opqnNcak";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -111,6 +120,7 @@ static void process_options(int argc, char * const argv[])
 			{"length", required_argument, 0, 'l'},
 			{"noecc", no_argument, 0, 'n'},
 			{"noskipbad", no_argument, 0, 'N'},
+			{"skipbad", no_argument, 0, 'k'},
 			{"quiet", no_argument, 0, 'q'},
 			{0, 0, 0, 0},
 		};
@@ -167,6 +177,9 @@ static void process_options(int argc, char * const argv[])
 			case 'N':
 				noskipbad = true;
 				break;
+			case 'k':
+				skipbad = true;
+				break;
 			case '?':
 				error++;
 				break;
@@ -193,6 +206,19 @@ static void process_options(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
+	if (noskipbad && skipbad) {
+		fprintf(stderr, "The noskipbad and skipbad options are "
+				"mutually-exclusive.\n"
+				"Choose one or the other.\n");
+		exit(EXIT_FAILURE);
+	}
+
+	if (omitbad && skipbad) {
+		fprintf(stderr, "The omitbad and skipbad options are mutually-"
+				"exclusive.\nChoose one or the other.\n");
+		exit(EXIT_FAILURE);
+	}
+
 	if ((argc - optind) != 1 || error)
 		display_help();
 
@@ -403,6 +429,14 @@ int main(int argc, char * const argv[])
 		}
 
 		if (badblock) {
+			/* skip bad block, increase end_addr */
+			if (skipbad) {
+				end_addr += mtd.eb_size;
+				ofs += mtd.eb_size - bs;
+				if (end_addr > mtd.size)
+					end_addr = mtd.size;
+				continue;
+			}
 			if (omitbad)
 				continue;
 			memset(readbuf, 0xff, bs);
-- 
1.7.0.4
