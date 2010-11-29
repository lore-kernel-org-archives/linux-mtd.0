Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMygt-0004mW-0z
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 08:02:28 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/8] nanddump: change "unsigned" to "signed"
Date: Mon, 29 Nov 2010 00:01:58 -0800
Message-ID: <1291017722-23985-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
References: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For consistency between nanddump and nandwrite and in order to provide
better means for checking for negative inputs, the "offset" and "length"
types in nanddump should be changed to signed integer types. This also
solves a signed/unsigned comparison warning.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 14a8816..b0dd7dc 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -82,8 +82,8 @@ static bool			pretty_print = false;	// print nice
 static bool			noecc = false;		// don't error correct
 static bool			noskipbad = false;	// don't skip bad blocks
 static bool			omitoob = false;	// omit oob data
-static unsigned long long	start_addr;		// start address
-static unsigned long long	length;			// dump length
+static long long		start_addr;		// start address
+static long long		length;			// dump length
 static const char		*mtddev;		// mtd device name
 static const char		*dumpfile;		// dump file name
 static bool			omitbad = false;
@@ -136,7 +136,7 @@ static void process_options(int argc, char * const argv[])
 				omitbad = true;
 				break;
 			case 's':
-				start_addr = simple_strtoull(optarg, &error);
+				start_addr = simple_strtoll(optarg, &error);
 				break;
 			case 'f':
 				if (!(dumpfile = strdup(optarg))) {
@@ -145,7 +145,7 @@ static void process_options(int argc, char * const argv[])
 				}
 				break;
 			case 'l':
-				length = simple_strtoull(optarg, &error);
+				length = simple_strtoll(optarg, &error);
 				break;
 			case 'o':
 				omitoob = true;
@@ -273,8 +273,8 @@ nil:
  */
 int main(int argc, char * const argv[])
 {
-	unsigned long long ofs, end_addr = 0;
-	unsigned long long blockstart = 1;
+	long long ofs, end_addr = 0;
+	long long blockstart = 1;
 	int ret, i, fd, ofd = 0, bs, badblock = 0;
 	struct mtd_dev_info mtd;
 	char pretty_buf[PRETTY_BUF_LEN];
-- 
1.7.0.4
