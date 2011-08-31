Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qyr2R-0006mD-Hm
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 20:05:32 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 09/10] nandwrite: re-implement `--autoplace' option
Date: Wed, 31 Aug 2011 13:00:38 -0700
Message-ID: <1314820839-7107-10-git-send-email-computersforpeace@gmail.com>
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

The restructuring of mtd_write() has allowed us to use `--autoplace'
somewhat successfully; it is supported by the new ioctl(MEMWRITE) as
well as some legacy code utilizing the deprecated ioctl(MEMGETOOBSEL).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   22 ++++++++++++++++++++--
 1 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 45782c7..ca72f16 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -49,6 +49,7 @@ static void display_help(void)
 "Usage: nandwrite [OPTION] MTD_DEVICE [INPUTFILE|-]\n"
 "Writes to the specified MTD device.\n"
 "\n"
+"  -a, --autoplace         Use auto OOB layout\n"
 "  -m, --markbad           Mark blocks bad if write fails\n"
 "  -n, --noecc             Write without ecc\n"
 "  -N, --noskipbad         Write without bad block skipping\n"
@@ -88,6 +89,7 @@ static bool		writeoob = false;
 static bool		onlyoob = false;
 static bool		markbad = false;
 static bool		noecc = false;
+static bool		autoplace = false;
 static bool		noskipbad = false;
 static bool		pad = false;
 static int		blockalign = 1; /* default to using actual block size */
@@ -98,7 +100,7 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "b:mnNoOpqs:";
+		static const char *short_options = "b:mnNoOpqs:a";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -111,6 +113,7 @@ static void process_options(int argc, char * const argv[])
 			{"pad", no_argument, 0, 'p'},
 			{"quiet", no_argument, 0, 'q'},
 			{"start", required_argument, 0, 's'},
+			{"autoplace", no_argument, 0, 'a'},
 			{0, 0, 0, 0},
 		};
 
@@ -159,6 +162,9 @@ static void process_options(int argc, char * const argv[])
 			case 'b':
 				blockalign = atoi(optarg);
 				break;
+			case 'a':
+				autoplace = true;
+				break;
 			case '?':
 				error++;
 				break;
@@ -173,6 +179,9 @@ static void process_options(int argc, char * const argv[])
 		errmsg_die("Can't specify negative blockalign with option -b:"
 				" %d", blockalign);
 
+	if (autoplace && noecc)
+		errmsg_die("Autoplacement and no-ECC are mutually exclusive");
+
 	argc -= optind;
 	argv += optind;
 
@@ -229,6 +238,7 @@ int main(int argc, char * const argv[])
 	unsigned char *oobbuf = NULL;
 	libmtd_t mtd_desc;
 	int ebsize_aligned;
+	uint8_t write_mode;
 
 	process_options(argc, argv);
 
@@ -265,6 +275,14 @@ int main(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
+	/* Select OOB write mode */
+	if (noecc)
+		write_mode = MTD_OPS_RAW;
+	else if (autoplace)
+		write_mode = MTD_OPS_AUTO_OOB;
+	else
+		write_mode = MTD_OPS_PLACE_OOB;
+
 	if (noecc)  {
 		ret = ioctl(fd, MTDFILEMODE, MTD_FILE_MODE_RAW);
 		if (ret) {
@@ -492,7 +510,7 @@ int main(int argc, char * const argv[])
 				onlyoob ? 0 : mtd.min_io_size,
 				writeoob ? oobbuf : NULL,
 				writeoob ? mtd.oob_size : 0,
-				noecc ? MTD_OPS_RAW : MTD_OPS_PLACE_OOB);
+				write_mode);
 		if (ret) {
 			int i;
 			if (errno != EIO) {
-- 
1.7.5.4
