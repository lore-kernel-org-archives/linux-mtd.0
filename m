Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QWGfx-00066K-H9
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2011 23:36:11 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 3/6] nanddump: deprecation messages for old BB options
Date: Mon, 13 Jun 2011 16:32:00 -0700
Message-ID: <1308007923-6820-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1308007923-6820-1-git-send-email-computersforpeace@gmail.com>
References: <1308007923-6820-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--omitbad and --noskipbad will soon be replaced by --bb=omitbad and
--bb=dumpbad. Please plan to migrate to the new usage shortly.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index a945081..4f28e33 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -54,17 +54,21 @@ static void display_help(void)
 "                                    skipbad\n"
 "                                    omitbad\n"
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
+"Deprecated options:\n"
+"The following options are being replaced by --bb=METHOD flags.\n"
+"Do not continue to use these options.\n"
+"-b         --omitbad            Omit bad blocks from the dump\n"
+"-N         --noskipbad          Read without bad block skipping\n"
+"\n"
 "Notes on --bb=omitbad and --bb=skipbad:\n"
 "  With either option, we stop dumping data when we encounter a bad block\n"
 "  and resume dumping at the next good block. However, with `omitbad', we\n"
@@ -171,6 +175,9 @@ static void process_options(int argc, char * const argv[])
 				if (bb_default) {
 					bb_default = false;
 					bb_method = omitbad;
+					fprintf(stderr, "Warning: --omitbad is being deprecated in favor of --bb=omitbad.\n"
+							"         --omitbad will not be available in future releases.\n"
+							"         Please update your usage accordingly.\n");
 				} else {
 					error++;
 				}
@@ -209,6 +216,9 @@ static void process_options(int argc, char * const argv[])
 				if (bb_default) {
 					bb_default = false;
 					bb_method = dumpbad;
+					fprintf(stderr, "Warning: --noskipbad is being deprecated in favor of --bb=dumpbad.\n"
+							"         --noskipbad will not be available in future releases.\n"
+							"         Please update your usage accordingly.\n");
 				} else {
 					error++;
 				}
-- 
1.7.0.4
