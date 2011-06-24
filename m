Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QaAlR-0000f8-Qq
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 18:05:58 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 4/6] nanddump: default to NOT dumping OOB data
Date: Fri, 24 Jun 2011 11:03:12 -0700
Message-ID: <1308938594-20486-5-git-send-email-computersforpeace@gmail.com>
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

Since nandwrite doesn't write OOB data by default, we don't dump OOB data
by default, in order to be a more proper inverse function.

Remove the warnings and change the default.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   20 ++++----------------
 1 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index adf268b..54198ae 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -53,8 +53,8 @@ static void display_help(void)
 "-f file    --file=file          Dump to file\n"
 "-l length  --length=length      Length\n"
 "-n         --noecc              Read without error correction\n"
-"           --omitoob            Omit OOB data (default in next release)\n"
-"-o         --oob                Dump OOB data (current default)\n"
+"           --omitoob            Omit OOB data (default)\n"
+"-o         --oob                Dump OOB data\n"
 "-p         --prettyprint        Print nice (hexdump)\n"
 "-q         --quiet              Don't display progress and status messages\n"
 "-s addr    --startaddress=addr  Start address\n"
@@ -62,14 +62,7 @@ static void display_help(void)
 "--bb=METHOD, where METHOD can be `padbad', `dumpbad', or `skipbad':\n"
 "    padbad:  dump flash data, substituting 0xFF for any bad blocks\n"
 "    dumpbad: dump flash data, including any bad blocks\n"
-"    skipbad: dump good data, completely skipping any bad blocks (default)\n"
-"\n"
-"Note on --oob, --omitoob:\n"
-"  To make nanddump act more like an inverse to nandwrite, we are changing\n"
-"  the default OOB behavior. In the next release, nanddump will not dump\n"
-"  OOB data by default. We will leave both the `--omitoob' and `--oob'\n"
-"  options, but to mirror nandwrite, the short option `-o' will then stand\n"
-"  for `--oob', not `--omitoob'. Please adjust your usage accordingly.\n",
+"    skipbad: dump good data, completely skipping any bad blocks (default)\n",
 	PROGRAM_NAME);
 	exit(EXIT_SUCCESS);
 }
@@ -92,7 +85,7 @@ static void display_version(void)
 
 static bool			pretty_print = false;	// print nice
 static bool			noecc = false;		// don't error correct
-static bool			omitoob = false;	// omit oob data
+static bool			omitoob = true;		// omit oob data
 static long long		start_addr;		// start address
 static long long		length;			// dump length
 static const char		*mtddev;		// mtd device name
@@ -229,11 +222,6 @@ static void process_options(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
-	if (oob_default)
-		warnmsg("in next release, nanddump will not dump OOB\n"
-			"  by default. Use `nanddump --oob' explicitly to ensure\n"
-			"  it is dumped.");
-
 	if ((argc - optind) != 1 || error)
 		display_help();
 
-- 
1.7.0.4
