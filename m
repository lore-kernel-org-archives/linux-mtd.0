Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZ3Bx-00085Y-M7
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2011 15:48:46 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 3/7] nanddump: deprecation messages for old BB
 options
Date: Tue, 21 Jun 2011 08:46:37 -0700
Message-ID: <1308671201-18197-4-git-send-email-computersforpeace@gmail.com>
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

--omitbad and --noskipbad will soon be replaced by --bb=omitbad and
--bb=dumpbad. Please plan to migrate to the new usage shortly.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 28862a9..d9f24a1 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -54,17 +54,21 @@ static void display_help(void)
 "                                    skipbad\n"
 "                                    omitbad (DEPRECATED)\n"
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
 "* `omitbad' and `skipbad' are very similar; we are deprecating `omitbad'\n"
 "  in favor of `skipbad'.\n"
@@ -173,6 +177,9 @@ static void process_options(int argc, char * const argv[])
 				if (bb_default) {
 					bb_default = false;
 					bb_method = omitbad;
+					fprintf(stderr, "Warning: --omitbad is being deprecated in favor of --bb=omitbad.\n"
+							"         --omitbad will not be available in future releases.\n"
+							"         Please update your usage accordingly.\n");
 				} else {
 					error++;
 				}
@@ -211,6 +218,9 @@ static void process_options(int argc, char * const argv[])
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
