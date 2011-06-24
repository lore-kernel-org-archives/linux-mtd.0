Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QaAl7-0000f8-EA
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 18:05:38 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 2/6] nanddump: change default to --bb=skipbad
Date: Fri, 24 Jun 2011 11:03:10 -0700
Message-ID: <1308938594-20486-3-git-send-email-computersforpeace@gmail.com>
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

As promised, we change the default bad block handling method to
--bb=skipbad. This works as a better inverse to nandwrite, since
nandwrite skips bad blocks when writing data.

And of course, we remove the warning messages.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 55c5586..9edfbfd 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -60,9 +60,9 @@ static void display_help(void)
 "-s addr    --startaddress=addr  Start address\n"
 "\n"
 "--bb=METHOD, where METHOD can be `padbad', `dumpbad', or `skipbad':\n"
-"    padbad:  dump flash data, substituting 0xFF for any bad blocks (default)\n"
+"    padbad:  dump flash data, substituting 0xFF for any bad blocks\n"
 "    dumpbad: dump flash data, including any bad blocks\n"
-"    skipbad: dump good data, completely skipping any bad blocks\n"
+"    skipbad: dump good data, completely skipping any bad blocks (default)\n"
 "\n"
 "Note on --oob, --omitoob:\n"
 "  To make nanddump act more like an inverse to nandwrite, we are changing\n"
@@ -105,7 +105,7 @@ static enum {
 	padbad,   // dump flash data, substituting 0xFF for any bad blocks
 	dumpbad,  // dump flash data, including any bad blocks
 	skipbad,  // dump good data, completely skipping any bad blocks
-} bb_method = padbad;
+} bb_method = skipbad;
 
 static void process_options(int argc, char * const argv[])
 {
@@ -229,11 +229,6 @@ static void process_options(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
-	if (bb_default)
-		warnmsg("you did not specify a default bad-block handling\n"
-			"  method. In future versions, the default will change to\n"
-			"  --bb=skipbad. Use \"nanddump --help\" for more information.");
-
 	if (oob_default)
 		warnmsg("in next release, nanddump will not dump OOB\n"
 			"  by default. Use `nanddump --oob' explicitly to ensure\n"
-- 
1.7.0.4
