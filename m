Received: from relay01.pair.com ([209.68.5.15])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcaVN-0005sh-LF
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 06:45:45 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] [MTD-UTILS] nanddump: Use Boolean Mnemonics from stdbool.h
Date: Sun,  7 Sep 2008 23:45:43 -0700
Message-Id: <1220856343-22799-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added include directive for stdbool.h and leveraged where appropriate
to improve code readability by making variable intent and usage more
explicit.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
 nanddump.c |   35 ++++++++++++++++++-----------------
 1 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 168fbbb..44a1014 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -17,6 +17,7 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -69,15 +70,15 @@ static void display_version (void)
 
 // Option variables
 
-static int		ignoreerrors;	// ignore errors
-static int		pretty_print;	// print nice in ascii
-static int		noecc;		// don't error correct
-static int		omitoob;	// omit oob data
-static unsigned long	start_addr;	// start address
-static unsigned long	length;		// dump length
-static const char	*mtddev;	// mtd device name
-static const char	*dumpfile;	// dump file name
-static int		omitbad;
+static bool		ignoreerrors = false;	// ignore errors
+static bool		pretty_print = false;	// print nice in ascii
+static bool		noecc = false;		// don't error correct
+static bool		omitoob = false;	// omit oob data
+static unsigned long	start_addr;		// start address
+static unsigned long	length;			// dump length
+static const char	*mtddev;		// mtd device name
+static const char	*dumpfile;		// dump file name
+static bool		omitbad = false;
 
 static void process_options (int argc, char * const argv[])
 {
@@ -118,7 +119,7 @@ static void process_options (int argc, char * const argv[])
 				}
 				break;
 			case 'b':
-				omitbad = 1;
+				omitbad = true;
 				break;
 			case 's':
 				start_addr = strtol(optarg, NULL, 0);
@@ -130,22 +131,22 @@ static void process_options (int argc, char * const argv[])
 				}
 				break;
 			case 'i':
-				ignoreerrors = 1;
+				ignoreerrors = true;
 				break;
 			case 'l':
 				length = strtol(optarg, NULL, 0);
 				break;
 			case 'o':
-				omitoob = 1;
+				omitoob = true;
 				break;
 			case 'p':
-				pretty_print = 1;
+				pretty_print = true;
 				break;
 			case 'n':
-				noecc = 1;
+				noecc = true;
 				break;
 			case '?':
-				error = 1;
+				error++;
 				break;
 		}
 	}
@@ -176,7 +177,7 @@ int main(int argc, char * const argv[])
 	int oobinfochanged = 0 ;
 	struct nand_oobinfo old_oobinfo;
 	struct mtd_ecc_stats stat1, stat2;
-	int eccstats = 0;
+	bool eccstats = false;
 
 	process_options(argc, argv);
 
@@ -235,7 +236,7 @@ int main(int argc, char * const argv[])
 
 		/* check if we can read ecc stats */
 		if (!ioctl(fd, ECCGETSTATS, &stat1)) {
-			eccstats = 1;
+			eccstats = true;
 			fprintf(stderr, "ECC failed: %d\n", stat1.failed);
 			fprintf(stderr, "ECC corrected: %d\n", stat1.corrected);    
 			fprintf(stderr, "Number of bad blocks: %d\n", stat1.badblocks);    
-- 
1.6.0.1
