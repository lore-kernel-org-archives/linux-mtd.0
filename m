Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZQdt-00051H-ES
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 16:51:07 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v3 3/7] nanddump: update help message for BB method
 changes
Date: Wed, 22 Jun 2011 09:49:19 -0700
Message-ID: <1308761363-16512-4-git-send-email-computersforpeace@gmail.com>
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

--noskipbad will soon be replaced by --bb=dumpbad, and --omitbad is being
removed entirely in favor of --bb=skipbad.

This patch adds warnings when using inappropriate configurations and adds
info to the help message. Please plan to migrate to the new usages shortly.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   32 +++++++++++++++++++++++++-------
 1 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index d2e2e8f..103ad06 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -47,23 +47,35 @@ static void display_help(void)
 "\n"
 "           --help               Display this help and exit\n"
 "           --version            Output version information and exit\n"
+"           --bb=METHOD          Choose bad block handling method (see below).\n"
 "-a         --forcebinary        Force printing of binary data to tty\n"
-"-b         --omitbad            Omit bad blocks from the dump\n"
 "-c         --canonicalprint     Print canonical Hex+ASCII dump\n"
 "-f file    --file=file          Dump to file\n"
 "-l length  --length=length      Length\n"
 "-n         --noecc              Read without error correction\n"
-"-N         --noskipbad          Read without bad block skipping\n"
 "-o         --omitoob            Omit oob data\n"
 "-p         --prettyprint        Print nice (hexdump)\n"
 "-q         --quiet              Don't display progress and status messages\n"
 "-s addr    --startaddress=addr  Start address\n"
 "\n"
-"Notes on --omitbad and --skipbad:\n"
-"  With either option, we stop dumping data when we encounter a bad block\n"
-"  and resume dumping at the next good block. However, with --omitbad, we\n"
+"--bb=METHOD, where METHOD can be `padbad', `dumpbad', or `skipbad':\n"
+"    padbad:  dump flash data, substituting 0xFF for any bad blocks (default)\n"
+"    dumpbad: dump flash data, including any bad blocks\n"
+"    skipbad: dump good data, completely skipping any bad blocks\n"
+"\n"
+"Deprecated options:\n"
+"The following options are being replaced by --bb=METHOD flags or being\n"
+"removed entirely. Do not continue to use these options.\n"
+"-b         --omitbad            Omit bad blocks from the dump (DEPRECATED)\n"
+"-N         --noskipbad          Read without bad block skipping\n"
+"\n"
+"Notes on --omitbad and --bb=skipbad:\n"
+"* `omitbad' and `skipbad' are very similar; we are deprecating `--omitbad'\n"
+"  in favor of `--bb=skipbad'.\n"
+"* With either option, we stop dumping data when we encounter a bad block\n"
+"  and resume dumping at the next good block. However, with `omitbad', we\n"
 "  count the bad block as part of the total dump length, whereas with\n"
-"  --skipbad, the bad block is 'skipped,' that is, not counted toward the\n"
+"  `skipbad', the bad block is skipped, that is, not counted toward the\n"
 "  total dump length.\n",
 	PROGRAM_NAME);
 	exit(EXIT_SUCCESS);
@@ -120,7 +132,7 @@ static void process_options(int argc, char * const argv[])
 			{"file", required_argument, 0, 'f'},
 			{"prettyprint", no_argument, 0, 'p'},
 			{"omitoob", no_argument, 0, 'o'},
-			{"omitbad", no_argument, 0, 'b'},
+			{"omitbad", no_argument, 0, 'b'}, //DEPRECATED
 			{"startaddress", required_argument, 0, 's'},
 			{"length", required_argument, 0, 'l'},
 			{"noecc", no_argument, 0, 'n'},
@@ -163,6 +175,9 @@ static void process_options(int argc, char * const argv[])
 				if (bb_default) {
 					bb_default = false;
 					bb_method = omitbad;
+					warnmsg("--omitbad is being deprecated in favor of --bb=skipbad.\n"
+						"  --omitbad will not be available in future releases.\n"
+						"  Please update your usage accordingly.");
 				} else {
 					error++;
 				}
@@ -201,6 +216,9 @@ static void process_options(int argc, char * const argv[])
 				if (bb_default) {
 					bb_default = false;
 					bb_method = dumpbad;
+					warnmsg("--noskipbad is being deprecated in favor of --bb=dumpbad.\n"
+						"  --noskipbad will not be available in future releases.\n"
+						"  Please update your usage accordingly.");
 				} else {
 					error++;
 				}
-- 
1.7.0.4
