Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZ3Bj-00085Y-UD
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2011 15:48:32 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 2/7] nanddump: remove --skipbad, leaving --bb=skipbad
Date: Tue, 21 Jun 2011 08:46:36 -0700
Message-ID: <1308671201-18197-3-git-send-email-computersforpeace@gmail.com>
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

We are moving to unify bad block handling methods under the --bb=METHOD
option. Since --skipbad has not been included in a mtd-utils release yet,
we can safely replace it without a deprecation and phase-out period.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 07fd050..28862a9 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -57,7 +57,6 @@ static void display_help(void)
 "-b         --omitbad            Omit bad blocks from the dump\n"
 "-c         --canonicalprint     Print canonical Hex+ASCII dump\n"
 "-f file    --file=file          Dump to file\n"
-"-k         --skipbad            Skip over bad blocks (see below)\n"
 "-l length  --length=length      Length\n"
 "-n         --noecc              Read without error correction\n"
 "-N         --noskipbad          Read without bad block skipping\n"
@@ -119,7 +118,7 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "bs:f:l:opqnNcak";
+		static const char *short_options = "bs:f:l:opqnNca";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -134,7 +133,6 @@ static void process_options(int argc, char * const argv[])
 			{"length", required_argument, 0, 'l'},
 			{"noecc", no_argument, 0, 'n'},
 			{"noskipbad", no_argument, 0, 'N'},
-			{"skipbad", no_argument, 0, 'k'},
 			{"quiet", no_argument, 0, 'q'},
 			{0, 0, 0, 0},
 		};
@@ -217,15 +215,6 @@ static void process_options(int argc, char * const argv[])
 					error++;
 				}
 				break;
-			case 'k':
-				/* Check if bb_method was already set explicitly */
-				if (bb_default) {
-					bb_default = false;
-					bb_method = skipbad;
-				} else {
-					error++;
-				}
-				break;
 			case '?':
 				error++;
 				break;
-- 
1.7.0.4
