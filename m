Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qyr2D-0006mD-1C
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 20:05:17 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 08/10] nandwrite: kill `--raw' option
Date: Wed, 31 Aug 2011 13:00:37 -0700
Message-ID: <1314820839-7107-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: b35362@freescale.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The `--raw' option has lost all usefulness as it overlapped with several
other OOB modes. I cannot even figure out what it was actually intended
to do, but I'm sure its functionality fits somewhere in the
MTD_OPS_{AUTO_OOB,PLACE_OOB,RAW} options, which are mostly implemented
in libmtd's mtd_write().

I don't think users need a warning for this one, unless someone can tell
me what it actually was supposed to have done in the first place.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 920863f..45782c7 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -54,7 +54,6 @@ static void display_help(void)
 "  -N, --noskipbad         Write without bad block skipping\n"
 "  -o, --oob               Image contains oob data\n"
 "  -O, --onlyoob           Image contains oob data and only write the oob part\n"
-"  -r, --raw               Image contains the raw oob data dumped by nanddump\n"
 "  -s addr, --start=addr   Set start address (default is 0)\n"
 "  -p, --pad               Pad to page size\n"
 "  -b, --blockalign=1|2|4  Set multiple of eraseblocks to align to\n"
@@ -86,7 +85,6 @@ static const char	*mtd_device, *img;
 static long long	mtdoffset = 0;
 static bool		quiet = false;
 static bool		writeoob = false;
-static bool		rawoob = false;
 static bool		onlyoob = false;
 static bool		markbad = false;
 static bool		noecc = false;
@@ -100,7 +98,7 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "b:mnNoOpqrs:";
+		static const char *short_options = "b:mnNoOpqs:";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -112,7 +110,6 @@ static void process_options(int argc, char * const argv[])
 			{"onlyoob", no_argument, 0, 'O'},
 			{"pad", no_argument, 0, 'p'},
 			{"quiet", no_argument, 0, 'q'},
-			{"raw", no_argument, 0, 'r'},
 			{"start", required_argument, 0, 's'},
 			{0, 0, 0, 0},
 		};
@@ -156,10 +153,6 @@ static void process_options(int argc, char * const argv[])
 			case 'p':
 				pad = true;
 				break;
-			case 'r':
-				rawoob = true;
-				writeoob = true;
-				break;
 			case 's':
 				mtdoffset = simple_strtoll(optarg, &error);
 				break;
-- 
1.7.5.4
