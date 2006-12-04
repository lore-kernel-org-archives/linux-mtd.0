Received: from smtpoutuk02.marconi.com ([128.87.251.113])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gr9eK-0003l1-Ca
	for linux-mtd@lists.infradead.org; Mon, 04 Dec 2006 03:58:12 -0500
Received: from cvhpmailhost.marconicomms.com
	(89.0.11.103.dynamic.barak-online.net [89.0.11.103])
	by smtpoutuk02.marconi.com (8.12.11.20060614/8.12.11) with ESMTP id
	kB48w1YG007940
	for <linux-mtd@lists.infradead.org>; Mon, 4 Dec 2006 08:58:01 GMT
	(envelope-from andreas.engel@marconi.com)
Received: from debk1357.de.marconicomms.com (unknown [128.87.2.227])
	by gw1000.de.marconicomms.com (Postfix) with ESMTP id 308D74A8A1
	for <linux-mtd@lists.infradead.org>;
	Mon,  4 Dec 2006 09:58:01 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by debk1357.de.marconicomms.com (Postfix) with ESMTP id 023687EC58
	for <linux-mtd@lists.infradead.org>;
	Mon,  4 Dec 2006 09:58:00 +0100 (CET)
Message-ID: <4573E318.4040604@marconi.com>
Date: Mon, 04 Dec 2006 09:58:00 +0100
From: Andreas Engel <andreas.engel@marconi.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH][MTD-UTILS] flashcp.c: Add new option -f/--full
Content-Type: multipart/mixed; boundary="------------020801060609020603000907"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020801060609020603000907
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This patch adds the option -f/--full which erases the whole flash
partition instead of just the sectors necessary for writing the file.
This might come in handy when copying filesystem images.

Signed-off-by: Andreas Engel <andreas.engel@ericsson.com>



--------------020801060609020603000907
Content-Type: text/x-patch;
 name="flashcp.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="flashcp.patch"

diff --git a/flashcp.c b/flashcp.c
index 64b2eca..ef51d37 100644
--- a/flashcp.c
+++ b/flashcp.c
@@ -71,6 +71,7 @@ typedef int bool;
 #define FLAG_HELP		0x02
 #define FLAG_FILENAME	0x04
 #define FLAG_DEVICE		0x08
+#define FLAG_FULLERASE	0x10
 
 /* error levels */
 #define LOG_NORMAL	1
@@ -99,6 +100,7 @@ static void showusage (const char *progn
 			"\n"
 			"   -h | --help      Show this help message\n"
 			"   -v | --verbose   Show progress reports\n"
+                        "   -f | --full      Erase whole partition\n"
 			"   <filename>       File which you want to copy to flash\n"
 			"   <device>         Flash device to write to (e.g. /dev/mtd0, /dev/mtd1, etc.)\n"
 			"\n",
@@ -184,10 +186,11 @@ int main (int argc,char *argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "hv";
+		static const char *short_options = "hvf";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 'h'},
 			{"verbose", no_argument, 0, 'v'},
+                        {"full", no_argument, 0, 'f'},
 			{0, 0, 0, 0},
 		};
 
@@ -206,6 +209,10 @@ int main (int argc,char *argv[])
 				flags |= FLAG_VERBOSE;
 				DEBUG("Got FLAG_VERBOSE\n");
 				break;
+			case 'f':
+				flags |= FLAG_FULLERASE;
+				DEBUG("Got FLAG_FULLERASE\n");
+				break;
 			default:
 				DEBUG("Unknown parameter: %s\n",argv[option_index]);
 				showusage (progname,true);
@@ -257,8 +264,10 @@ int main (int argc,char *argv[])
 #warning "Check for smaller erase regions"
 
 	erase.start = 0;
-	erase.length = filestat.st_size & ~(mtd.erasesize - 1);
-	if (filestat.st_size % mtd.erasesize) erase.length += mtd.erasesize;
+	erase.length = (flags & FLAG_FULLERASE) ? mtd.size : filestat.st_size;
+        if (erase.length % mtd.erasesize)
+        	erase.length = (erase.length & ~(mtd.erasesize - 1)) + mtd.erasesize;
+
 	if (flags & FLAG_VERBOSE)
 	{
 		/* if the user wants verbose output, erase 1 block at a time and show him/her what's going on */
@@ -388,4 +397,3 @@ int main (int argc,char *argv[])
 
 	exit (EXIT_SUCCESS);
 }
-

--------------020801060609020603000907--
