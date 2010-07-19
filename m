Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OauDk-0005FD-Ty
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2010 17:33:41 +0000
From: "Brian Norris" <norris@broadcom.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 6/6] mtd-utils/nanddump.c: Add "forcebinary" flag
Date: Mon, 19 Jul 2010 10:33:16 -0700
Message-ID: <1279560796-6388-3-git-send-email-norris@broadcom.com>
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

Restrict binary dumping so that by default, binary garbage is not
printed directly to a terminal. Output redicted to files or piped to
other commands should not be affected (as judged by "isatty(ofd)").
A new flag "-a" or "--forcebinary" is included so that users can
override this behavior if necessary.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 nanddump.c |   22 +++++++++++++++++++++-
 1 files changed, 21 insertions(+), 1 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index cd018c6..acfdb33 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -45,6 +45,7 @@ static void display_help (void)
 "\n"
 "           --help               Display this help and exit\n"
 "           --version            Output version information and exit\n"
+"-a         --forcebinary        Force printing of binary data to tty\n"
 "-c         --canonicalprint     Print canonical Hex+ASCII dump\n"
 "-f file    --file=file          Dump to file\n"
 "-i         --ignoreerrors       Ignore errors\n"
@@ -85,6 +86,7 @@ static const char	*dumpfile;		// dump file name
 static bool		omitbad = false;
 static bool		quiet = false;		// suppress diagnostic output
 static bool		canonical = false;	// print nice + ascii
+static bool		forcebinary = false;	// force printing binary to tty
 
 static void process_options (int argc, char * const argv[])
 {
@@ -92,10 +94,11 @@ static void process_options (int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "bs:f:il:opqnc";
+		static const char *short_options = "bs:f:il:opqnca";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
+			{"forcebinary", no_argument, 0, 'a'},
 			{"canonicalprint", no_argument, 0, 'c'},
 			{"file", required_argument, 0, 'f'},
 			{"ignoreerrors", no_argument, 0, 'i'},
@@ -147,6 +150,9 @@ static void process_options (int argc, char * const argv[])
 			case 'o':
 				omitoob = true;
 				break;
+			case 'a':
+				forcebinary = true;
+				break;
 			case 'c':
 				canonical = true;
 			case 'p':
@@ -170,6 +176,13 @@ static void process_options (int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
+	if (forcebinary && pretty_print) {
+		fprintf(stderr, "The forcebinary and pretty print options are\n"
+				"mutually-exclusive. Choose one or the "
+				"other.\n");
+		exit(EXIT_FAILURE);
+	}
+
 	if ((argc - optind) != 1 || error)
 		display_help ();
 
@@ -355,6 +368,13 @@ int main(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
+	if (!pretty_print && !forcebinary && isatty(ofd)) {
+		fprintf(stderr, "Not printing binary garbage to tty. Use '-a'\n"
+				"or '--forcebinary' to override.\n");
+		close(fd);
+		exit(EXIT_FAILURE);
+	}
+
 	/* Initialize start/end addresses and block size */
 	if (length)
 		end_addr = start_addr + length;
-- 
1.7.0.4
