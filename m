Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QaAky-0000f8-M9
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 18:05:29 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 1/6] nanddump: kill --omitbad, --noskipbad
Date: Fri, 24 Jun 2011 11:03:09 -0700
Message-ID: <1308938594-20486-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1308938594-20486-1-git-send-email-computersforpeace@gmail.com>
References: <1308938594-20486-1-git-send-email-computersforpeace@gmail.com>
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

As mentioned previously, we are killing --omitbad in favor of the new
--bb=skipbad option, which functions fairly similarly. Also, --noskipbad
has become --bb=noskipbad, so remove the old `-N' and `--noskipbad' flags.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   46 +---------------------------------------------
 1 files changed, 1 insertions(+), 45 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 0367d83..55c5586 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -64,21 +64,6 @@ static void display_help(void)
 "    dumpbad: dump flash data, including any bad blocks\n"
 "    skipbad: dump good data, completely skipping any bad blocks\n"
 "\n"
-"Deprecated options:\n"
-"The following options are being replaced by --bb=METHOD flags or being\n"
-"removed entirely. Do not continue to use these options.\n"
-"-b         --omitbad            Omit bad blocks from the dump (DEPRECATED)\n"
-"-N         --noskipbad          Read without bad block skipping\n"
-"\n"
-"Notes on --omitbad and --bb=skipbad:\n"
-"* `omitbad' and `skipbad' are very similar; we are deprecating `--omitbad'\n"
-"  in favor of `--bb=skipbad'.\n"
-"* With either option, we stop dumping data when we encounter a bad block\n"
-"  and resume dumping at the next good block. However, with `omitbad', we\n"
-"  count the bad block as part of the total dump length, whereas with\n"
-"  `skipbad', the bad block is skipped, that is, not counted toward the\n"
-"  total dump length.\n"
-"\n"
 "Note on --oob, --omitoob:\n"
 "  To make nanddump act more like an inverse to nandwrite, we are changing\n"
 "  the default OOB behavior. In the next release, nanddump will not dump\n"
@@ -120,7 +105,6 @@ static enum {
 	padbad,   // dump flash data, substituting 0xFF for any bad blocks
 	dumpbad,  // dump flash data, including any bad blocks
 	skipbad,  // dump good data, completely skipping any bad blocks
-	omitbad   // dump flash data, substituting nothing for any bad blocks (DEPRECATED)
 } bb_method = padbad;
 
 static void process_options(int argc, char * const argv[])
@@ -130,7 +114,7 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "bs:f:l:opqnNca";
+		static const char *short_options = "s:f:l:opqnca";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -141,11 +125,9 @@ static void process_options(int argc, char * const argv[])
 			{"file", required_argument, 0, 'f'},
 			{"prettyprint", no_argument, 0, 'p'},
 			{"omitoob", no_argument, 0, 'o'},
-			{"omitbad", no_argument, 0, 'b'}, //DEPRECATED
 			{"startaddress", required_argument, 0, 's'},
 			{"length", required_argument, 0, 'l'},
 			{"noecc", no_argument, 0, 'n'},
-			{"noskipbad", no_argument, 0, 'N'},
 			{"quiet", no_argument, 0, 'q'},
 			{0, 0, 0, 0},
 		};
@@ -187,18 +169,6 @@ static void process_options(int argc, char * const argv[])
 						break;
 				}
 				break;
-			case 'b':
-				/* Check if bb_method was already set explicitly */
-				if (bb_default) {
-					bb_default = false;
-					bb_method = omitbad;
-					warnmsg("--omitbad is being deprecated in favor of --bb=skipbad.\n"
-						"  --omitbad will not be available in future releases.\n"
-						"  Please update your usage accordingly.");
-				} else {
-					error++;
-				}
-				break;
 			case 's':
 				start_addr = simple_strtoll(optarg, &error);
 				break;
@@ -233,18 +203,6 @@ static void process_options(int argc, char * const argv[])
 			case 'n':
 				noecc = true;
 				break;
-			case 'N':
-				/* Check if bb_method was already set explicitly */
-				if (bb_default) {
-					bb_default = false;
-					bb_method = dumpbad;
-					warnmsg("--noskipbad is being deprecated in favor of --bb=dumpbad.\n"
-						"  --noskipbad will not be available in future releases.\n"
-						"  Please update your usage accordingly.");
-				} else {
-					error++;
-				}
-				break;
 			case '?':
 				error++;
 				break;
@@ -499,8 +457,6 @@ int main(int argc, char * const argv[])
 					end_addr = mtd.size;
 				continue;
 			}
-			if (bb_method == omitbad)
-				continue;
 			memset(readbuf, 0xff, bs);
 		} else {
 			/* Read page data and exit on failure */
-- 
1.7.0.4
