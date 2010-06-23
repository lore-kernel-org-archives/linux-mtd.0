Received: from [77.75.72.43] (helo=smtp.seznam.cz)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORPod-0007a7-AQ
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 13:16:33 +0000
Date: Wed, 23 Jun 2010 17:16:22 +0200
From: Ladislav Michl <Ladislav.Michl@seznam.cz>
To: "Stanley.Miao" <stanley.miao@windriver.com>
Subject: Re: [PATCH v3] Fix mtd-utils bugs
Message-ID: <20100623151622.GA2771@localhost.localdomain>
References: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
	joakim.tjernlund@transmode.se
Reply-To: Ladislav Michl <ladis@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 20, 2010 at 08:22:57PM +0800, Stanley.Miao wrote:
> Changes from V2:
> 1, Get the linux version via uname() according to Joakim Tjernlund.
> 2, Set the default version the latest version according to Joakim Tjernlund.
> 
> The "struct nand_oobinfo" is able to record only 32 ECC code positions,which
> is not enough for many big NAND chips. Therefore, this structure is replaced
> by "struct nand_ecclayout" in linux kernel from the version 2.6.17.
> Consequently, the ioctl command changed from MEMGETOOBSEL to ECCGETLAYOUT.
> 
> Now update nandwrite to use the new ioctl command ECCGETLAYOUT. In order to
> keep compatible with the old linux kernel, a linux version detection function
> is added.
> 
> YAFFS and JFFS2 has updated and we don't need the arguments "forcelegacy",
> "forcejffs2", "forceyaffs" anymore. Now clean them up. 

Tested with linux-2.6.32 (flash_eraseall -j finaly works now)

Tested-by: Ladislav Michl <ladis@linux-mips.org>

As a special bonus, here is simple patch on top of your patchset making
flash_eraseall smaller:

From: Ladislav Michl <ladis@linux-mips.org>

Returning from main() instead of using exit() makes code more readable
and smaller (ARM EABI binary sizes)

   text    data     bss     dec     hex filename
  10345     372      44   10761    2a09 flash_eraseall
  10286     368      44   10698    29ca flash_eraseall.noexit

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 flash_eraseall.c |  197 ++++++++++++++++++++++++-------------------------------
 1 file changed, 89 insertions(+), 108 deletions(-)

--- a/flash_eraseall.c	2010-06-23 13:10:00.000000000 +0200
+++ b/flash_eraseall.c	2010-06-23 13:30:31.000000000 +0200
@@ -49,15 +49,45 @@
 static const char *exe_name;
 static const char *mtd_device;
 static int quiet;		/* true -- don't output progress */
-static int jffs2;		// format for jffs2 usage
-
-static void process_options (int argc, char *argv[]);
-void show_progress (mtd_info_t *meminfo, erase_info_t *erase);
-static void display_help (void);
-static void display_version (void);
+static int jffs2;		/* format for jffs2 usage */
 static struct jffs2_unknown_node cleanmarker;
 int target_endian = __BYTE_ORDER;
 
+static void show_progress(mtd_info_t *meminfo, erase_info_t *erase)
+{
+	printf("\rErasing %d Kibyte @ %x -- %2llu %% complete.",
+		meminfo->erasesize / 1024, erase->start,
+		(unsigned long long) erase->start * 100 / meminfo->size);
+	fflush(stdout);
+}
+
+static void display_help(void)
+{
+	printf("Usage: %s [OPTION] MTD_DEVICE\n"
+			"Erases all of the specified MTD device.\n"
+			"\n"
+			"  -j, --jffs2    format the device for jffs2\n"
+			"  -q, --quiet    don't display progress messages\n"
+			"      --silent   same as --quiet\n"
+			"      --help     display this help and exit\n"
+			"      --version  output version information and exit\n",
+			exe_name);
+}
+
+static void display_version(void)
+{
+	printf(PROGRAM " " VERSION "\n"
+			"\n"
+			"Copyright (C) 2000 Arcom Control Systems Ltd\n"
+			"\n"
+			PROGRAM " comes with NO WARRANTY\n"
+			"to the extent permitted by law.\n"
+			"\n"
+			"You may redistribute copies of " PROGRAM "\n"
+			"under the terms of the GNU General Public Licence.\n"
+			"See the file `COPYING' for more information.\n");
+}
+
 static int get_linux_version(void)
 {
 	int a, b, c, ret, err = 0;
@@ -80,23 +110,73 @@
 	return LINUX_VERSION(a, b, c);
 }
 
-int main (int argc, char *argv[])
+int main(int argc, char *argv[])
 {
 	mtd_info_t meminfo;
 	int fd;
 	erase_info_t erase;
 	int isNAND, bbtest = 1;
+	int error = 0;
 	unsigned char oobbuf[128];
 	memset(oobbuf, 0xFF, 128);
 
-	process_options(argc, argv);
+	exe_name = argv[0];
+	for (;;) {
+		int option_index = 0;
+		static const char *short_options = "jq";
+		static const struct option long_options[] = {
+			{"help", no_argument, 0, 0},
+			{"version", no_argument, 0, 0},
+			{"jffs2", no_argument, 0, 'j'},
+			{"quiet", no_argument, 0, 'q'},
+			{"silent", no_argument, 0, 'q'},
+
+			{0, 0, 0, 0},
+		};
+
+		int c = getopt_long(argc, argv, short_options,
+				long_options, &option_index);
+		if (c == EOF)
+			break;
+
+		switch (c) {
+		case 0:
+			switch (option_index) {
+			case 0:
+				display_help();
+				return 0;
+			case 1:
+				display_version();
+				return 0;
+			}
+			break;
+		case 'q':
+			quiet = 1;
+			break;
+		case 'j':
+			jffs2 = 1;
+			break;
+		case '?':
+			error = 1;
+			break;
+		}
+	}
+	if (optind == argc) {
+		fprintf(stderr, "%s: no MTD device specified\n", exe_name);
+		error = 1;
+	}
+	if (error) {
+		fprintf(stderr, "Try `%s --help' for more information.\n",
+				exe_name);
+		return 1;
+	}
+	mtd_device = argv[optind];
 
 	if ((fd = open(mtd_device, O_RDWR)) < 0) {
 		fprintf(stderr, "%s: %s: %s\n", exe_name, mtd_device, strerror(errno));
 		return 1;
 	}
 
-
 	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
 		fprintf(stderr, "%s: %s: unable to get MTD device info\n", exe_name, mtd_device);
 		return 1;
@@ -213,102 +293,3 @@
 
 	return 0;
 }
-
-
-void process_options (int argc, char *argv[])
-{
-	int error = 0;
-
-	exe_name = argv[0];
-
-	for (;;) {
-		int option_index = 0;
-		static const char *short_options = "jq";
-		static const struct option long_options[] = {
-			{"help", no_argument, 0, 0},
-			{"version", no_argument, 0, 0},
-			{"jffs2", no_argument, 0, 'j'},
-			{"quiet", no_argument, 0, 'q'},
-			{"silent", no_argument, 0, 'q'},
-
-			{0, 0, 0, 0},
-		};
-
-		int c = getopt_long(argc, argv, short_options,
-				long_options, &option_index);
-		if (c == EOF) {
-			break;
-		}
-
-		switch (c) {
-			case 0:
-				switch (option_index) {
-					case 0:
-						display_help();
-						break;
-					case 1:
-						display_version();
-						break;
-				}
-				break;
-			case 'q':
-				quiet = 1;
-				break;
-			case 'j':
-				jffs2 = 1;
-				break;
-			case '?':
-				error = 1;
-				break;
-		}
-	}
-	if (optind == argc) {
-		fprintf(stderr, "%s: no MTD device specified\n", exe_name);
-		error = 1;
-	}
-	if (error) {
-		fprintf(stderr, "Try `%s --help' for more information.\n",
-				exe_name);
-		exit(1);
-	}
-
-	mtd_device = argv[optind];
-}
-
-void show_progress (mtd_info_t *meminfo, erase_info_t *erase)
-{
-	printf("\rErasing %d Kibyte @ %x -- %2llu %% complete.",
-		meminfo->erasesize / 1024, erase->start,
-		(unsigned long long) erase->start * 100 / meminfo->size);
-	fflush(stdout);
-}
-
-void display_help (void)
-{
-	printf("Usage: %s [OPTION] MTD_DEVICE\n"
-			"Erases all of the specified MTD device.\n"
-			"\n"
-			"  -j, --jffs2    format the device for jffs2\n"
-			"  -q, --quiet    don't display progress messages\n"
-			"      --silent   same as --quiet\n"
-			"      --help     display this help and exit\n"
-			"      --version  output version information and exit\n",
-			exe_name);
-	exit(0);
-}
-
-
-void display_version (void)
-{
-	printf(PROGRAM " " VERSION "\n"
-			"\n"
-			"Copyright (C) 2000 Arcom Control Systems Ltd\n"
-			"\n"
-			PROGRAM " comes with NO WARRANTY\n"
-			"to the extent permitted by law.\n"
-			"\n"
-			"You may redistribute copies of " PROGRAM "\n"
-			"under the terms of the GNU General Public Licence.\n"
-			"See the file `COPYING' for more information.\n");
-	exit(0);
-}
