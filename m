Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZ3Cw-0008BZ-A9
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2011 15:49:47 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 7/7] nanddump: document, warn about future default --omitoob
Date: Tue, 21 Jun 2011 08:46:41 -0700
Message-ID: <1308671201-18197-8-git-send-email-computersforpeace@gmail.com>
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

To work as a proper inverse to nandwrite, nanddump must not dump OOB data by
default. This patch prints a warning regarding the future change. We also
suggest using the new flag, `--oob', for transitioning the next release
with new default behavior.

Note that we are changing `-o' to mean `--oob' in the next release,
similar to `nandwrite -o'.  This is a break from previous behavior.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 feature-removal-schedule.txt |   11 +++++++++++
 nanddump.c                   |   36 ++++++++++++++++++++++++++++++------
 2 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index b1bc3e4..8ddd3c5 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -65,3 +65,14 @@ Transition summary table:
  --omitbad      N/A                        very similar to `skipbad', will be removed soon
 
 ---------------------------
+
+5. nanddump will not dump OOB by default, kill `--omitoob'
+
+In 1.4.6, nanddump will not dump OOB by default. To dump OOB, you will have to
+explicitly use the option `--oob'. For now, there is simply a warning every
+time you use nanddump without explicitly choosing `--oob' or `--omitoob'.
+
+Note that `-o' will no longer stand for `--omitoob'. To unify with nandwrite,
+it will stand for `--oob' (Dump OOB data).
+
+---------------------------
diff --git a/nanddump.c b/nanddump.c
index 7941aa2..2955db4 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -58,8 +58,8 @@ static void display_help(void)
 "-f file    --file=file          Dump to file\n"
 "-l length  --length=length      Length\n"
 "-n         --noecc              Read without error correction\n"
-"-o         --omitoob            Omit oob data\n"
-"           --oob                Dump OOB data\n"
+"-o         --omitoob            Omit OOB data (default in next release)\n"
+"           --oob                Dump OOB data (current default)\n"
 "-p         --prettyprint        Print nice (hexdump)\n"
 "-q         --quiet              Don't display progress and status messages\n"
 "-s addr    --startaddress=addr  Start address\n"
@@ -77,7 +77,14 @@ static void display_help(void)
 "  and resume dumping at the next good block. However, with `omitbad', we\n"
 "  count the bad block as part of the total dump length, whereas with\n"
 "  `skipbad', the bad block is skipped, that is, not counted toward the\n"
-"  total dump length.\n",
+"  total dump length.\n"
+"\n"
+"Note on --oob, --omitoob:\n"
+"  To make nanddump act more like an inverse to nandwrite, we are changing\n"
+"  the default OOB behavior. In the next release, nanddump will not dump\n"
+"  OOB data by default. Then, we will kill the `--omitbad' option. The\n"
+"  short option `-o' will then stand for `--oob', not `--omitoob'. Please\n"
+"  adjust your usage accordingly.\n",
 	PROGRAM_NAME);
 	exit(EXIT_SUCCESS);
 }
@@ -119,7 +126,7 @@ static enum {
 static void process_options(int argc, char * const argv[])
 {
 	int error = 0;
-	bool bb_default = true;
+	bool bb_default = true, oob_default = true;
 
 	for (;;) {
 		int option_index = 0;
@@ -173,7 +180,13 @@ static void process_options(int argc, char * const argv[])
 						bb_default = false;
 						break;
 					case 3: /* --oob */
-						omitoob = false;
+						if (oob_default) {
+							oob_default = false;
+							omitoob = false;
+						} else {
+							fprintf(stderr, "Error: --oob and --oomitoob are mutually exclusive\n");
+							error++;
+						}
 						break;
 				}
 				break;
@@ -202,7 +215,13 @@ static void process_options(int argc, char * const argv[])
 				length = simple_strtoll(optarg, &error);
 				break;
 			case 'o':
-				omitoob = true;
+				if (oob_default) {
+					oob_default = false;
+					omitoob = true;
+				} else {
+					fprintf(stderr, "Error: --oob and --oomitoob are mutually exclusive\n");
+					error++;
+				}
 				break;
 			case 'a':
 				forcebinary = true;
@@ -261,6 +280,11 @@ static void process_options(int argc, char * const argv[])
 				"  method. In future versions, the default will change to\n"
 				"  --bb=skipbad. Use \"nanddump --help\" for more information.\n");
 
+	if (oob_default)
+		fprintf(stderr, "Warning: in next release, nanddump will not dump OOB\n"
+				"  by default. Use `nanddump --oob' explicitly to ensure\n"
+				"  it is dumped.\n");
+
 	if ((argc - optind) != 1 || error)
 		display_help();
 
-- 
1.7.0.4
