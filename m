Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QWGfx-00066J-Gt
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2011 23:36:10 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 2/6] nanddump: remove --skipbad, leaving --bb=skipbad
Date: Mon, 13 Jun 2011 16:31:59 -0700
Message-ID: <1308007923-6820-2-git-send-email-computersforpeace@gmail.com>
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

We are moving to unify bad block handling methods under the --bb=METHOD
option. Since --skipbad has not been included in a mtd-utils release yet,
we can safely replace it without a deprecation and phase-out period.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index c3771c5..a945081 100644
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
@@ -117,7 +116,7 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "bs:f:l:opqnNcak";
+		static const char *short_options = "bs:f:l:opqnNca";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -132,7 +131,6 @@ static void process_options(int argc, char * const argv[])
 			{"length", required_argument, 0, 'l'},
 			{"noecc", no_argument, 0, 'n'},
 			{"noskipbad", no_argument, 0, 'N'},
-			{"skipbad", no_argument, 0, 'k'},
 			{"quiet", no_argument, 0, 'q'},
 			{0, 0, 0, 0},
 		};
@@ -215,15 +213,6 @@ static void process_options(int argc, char * const argv[])
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
