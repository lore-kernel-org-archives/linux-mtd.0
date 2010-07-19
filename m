Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OauDk-0005FE-U6
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2010 17:33:41 +0000
From: "Brian Norris" <norris@broadcom.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 3/6] mtd-utils/nanddump.c: Add canonical (hex+ascii)
 flag
Date: Mon, 19 Jul 2010 10:33:15 -0700
Message-ID: <1279560796-6388-2-git-send-email-norris@broadcom.com>
In-Reply-To: <1279437819.16247.19.camel@localhost.localdomain>
References: <1279437819.16247.19.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added the "-c" or "--canonicalprint" flag (modelled off 'hexdump -C')
so that users can choose to print ASCII output next to the prettyprint
output. This is really an extension to the prettyprint option, so the two
options do not conflict if they are both included in the same execution.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 nanddump.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index eccb651..cd018c6 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -45,6 +45,7 @@ static void display_help (void)
 "\n"
 "           --help               Display this help and exit\n"
 "           --version            Output version information and exit\n"
+"-c         --canonicalprint     Print canonical Hex+ASCII dump\n"
 "-f file    --file=file          Dump to file\n"
 "-i         --ignoreerrors       Ignore errors\n"
 "-l length  --length=length      Length\n"
@@ -74,7 +75,7 @@ static void display_version (void)
 // Option variables
 
 static bool		ignoreerrors = false;	// ignore errors
-static bool		pretty_print = false;	// print nice in ascii
+static bool		pretty_print = false;	// print nice
 static bool		noecc = false;		// don't error correct
 static bool		omitoob = false;	// omit oob data
 static unsigned long	start_addr;		// start address
@@ -83,7 +84,7 @@ static const char	*mtddev;		// mtd device name
 static const char	*dumpfile;		// dump file name
 static bool		omitbad = false;
 static bool		quiet = false;		// suppress diagnostic output
-static bool		canonical = false;
+static bool		canonical = false;	// print nice + ascii
 
 static void process_options (int argc, char * const argv[])
 {
@@ -91,10 +92,11 @@ static void process_options (int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "bs:f:il:opqn";
+		static const char *short_options = "bs:f:il:opqnc";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
+			{"canonicalprint", no_argument, 0, 'c'},
 			{"file", required_argument, 0, 'f'},
 			{"ignoreerrors", no_argument, 0, 'i'},
 			{"prettyprint", no_argument, 0, 'p'},
@@ -145,6 +147,8 @@ static void process_options (int argc, char * const argv[])
 			case 'o':
 				omitoob = true;
 				break;
+			case 'c':
+				canonical = true;
 			case 'p':
 				pretty_print = true;
 				break;
-- 
1.7.0.4
