Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QaAlC-0000f8-EN
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 18:05:44 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 3/6] nanddump: change -o to mean --oob, not --omitoob
Date: Fri, 24 Jun 2011 11:03:11 -0700
Message-ID: <1308938594-20486-4-git-send-email-computersforpeace@gmail.com>
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

As warned earlier, we are changing the meaning of `nanddump -o' to
mirror the usage in nandwrite, where -o means to include OOB (i.e.,
`nandwrite -o' writes data to both in-band and out-of-band areas, so
`nanddump -o' should dump data from both in-band and out-of-band areas).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 9edfbfd..adf268b 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -53,8 +53,8 @@ static void display_help(void)
 "-f file    --file=file          Dump to file\n"
 "-l length  --length=length      Length\n"
 "-n         --noecc              Read without error correction\n"
-"-o         --omitoob            Omit OOB data (default in next release)\n"
-"           --oob                Dump OOB data (current default)\n"
+"           --omitoob            Omit OOB data (default in next release)\n"
+"-o         --oob                Dump OOB data (current default)\n"
 "-p         --prettyprint        Print nice (hexdump)\n"
 "-q         --quiet              Don't display progress and status messages\n"
 "-s addr    --startaddress=addr  Start address\n"
@@ -119,12 +119,12 @@ static void process_options(int argc, char * const argv[])
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
 			{"bb", required_argument, 0, 0},
-			{"oob", no_argument, 0, 0},
+			{"omitoob", no_argument, 0, 0},
 			{"forcebinary", no_argument, 0, 'a'},
 			{"canonicalprint", no_argument, 0, 'c'},
 			{"file", required_argument, 0, 'f'},
+			{"oob", no_argument, 0, 'o'},
 			{"prettyprint", no_argument, 0, 'p'},
-			{"omitoob", no_argument, 0, 'o'},
 			{"startaddress", required_argument, 0, 's'},
 			{"length", required_argument, 0, 'l'},
 			{"noecc", no_argument, 0, 'n'},
@@ -159,10 +159,10 @@ static void process_options(int argc, char * const argv[])
 							error++;
 						bb_default = false;
 						break;
-					case 3: /* --oob */
+					case 3: /* --omitoob */
 						if (oob_default) {
 							oob_default = false;
-							omitoob = false;
+							omitoob = true;
 						} else {
 							errmsg_die("--oob and --oomitoob are mutually exclusive");
 						}
@@ -184,7 +184,7 @@ static void process_options(int argc, char * const argv[])
 			case 'o':
 				if (oob_default) {
 					oob_default = false;
-					omitoob = true;
+					omitoob = false;
 				} else {
 					errmsg_die("--oob and --oomitoob are mutually exclusive");
 				}
-- 
1.7.0.4
