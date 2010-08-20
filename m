Received: from eddie.linux-mips.org ([78.24.191.182] helo=cvs.linux-mips.org)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmPNY-0006Mf-JS
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 11:03:24 +0000
Received: (from localhost user: 'ladis' uid#521 fake: STDIN
	(ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
	id S1491059Ab0HTLDQ (ORCPT <rfc822;linux-mtd@lists.infradead.org>);
	Fri, 20 Aug 2010 13:03:16 +0200
Date: Fri, 20 Aug 2010 15:03:13 +0200
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v3] Fix mtd-utils bugs
Message-ID: <20100820130313.GA3558@localhost.localdomain>
References: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
	<20100623151622.GA2771@localhost.localdomain>
	<1282282168.2183.2.camel@brekeke>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1282282168.2183.2.camel@brekeke>
Cc: "Stanley.Miao" <stanley.miao@windriver.com>, linux-mtd@lists.infradead.org,
	joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 20, 2010 at 08:29:28AM +0300, Artem Bityutskiy wrote:
> On Wed, 2010-06-23 at 17:16 +0200, Ladislav Michl wrote:
> > On Sun, Jun 20, 2010 at 08:22:57PM +0800, Stanley.Miao wrote:
> > > Changes from V2:
> > > 1, Get the linux version via uname() according to Joakim Tjernlund.
> > > 2, Set the default version the latest version according to Joakim Tjernlund.
> > > 
> > > The "struct nand_oobinfo" is able to record only 32 ECC code positions,which
> > > is not enough for many big NAND chips. Therefore, this structure is replaced
> > > by "struct nand_ecclayout" in linux kernel from the version 2.6.17.
> > > Consequently, the ioctl command changed from MEMGETOOBSEL to ECCGETLAYOUT.
> > > 
> > > Now update nandwrite to use the new ioctl command ECCGETLAYOUT. In order to
> > > keep compatible with the old linux kernel, a linux version detection function
> > > is added.
> > > 
> > > YAFFS and JFFS2 has updated and we don't need the arguments "forcelegacy",
> > > "forcejffs2", "forceyaffs" anymore. Now clean them up. 
> > 
> > Tested with linux-2.6.32 (flash_eraseall -j finaly works now)
> > 
> > Tested-by: Ladislav Michl <ladis@linux-mips.org>
> > 
> > As a special bonus, here is simple patch on top of your patchset making
> > flash_eraseall smaller:
> > 
> 
> FYI, this patch is still sitting in my mailbox and waiting - Stanley's
> stuff was not merged, and this patch depends on that. So, if you can
> make it to be independent, please, re-send. Stanley said he'd re-send
> the patch.

Here it is based on the top of current git. Updated only, compile tested only...

Returning from main() instead of using exit() makes code more readable
and smaller (ARM EABI binary sizes)

   text    data     bss     dec     hex filename
  28882     436      44   29362    72b2 flash_eraseall
  28827     432      44   29303    7277 flash_eraseall.noexit

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 flash_eraseall.c |  193 +++++++++++++++++++++++++------------------------------
 1 file changed, 89 insertions(+), 104 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index a2a6b0a..5740719 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -47,24 +47,107 @@
 static const char *exe_name;
 static const char *mtd_device;
 static int quiet;		/* true -- don't output progress */
-static int jffs2;		// format for jffs2 usage
+static int jffs2;		/* format for jffs2 usage */
 
-static void process_options (int argc, char *argv[]);
-void show_progress (struct mtd_dev_info *mtd, uint64_t start);
-static void display_help (void);
-static void display_version (void);
 static struct jffs2_unknown_node cleanmarker;
 int target_endian = __BYTE_ORDER;
 
+static void show_progress (struct mtd_dev_info *mtd, uint64_t start)
+{
+	printf("\rErasing %d Kibyte @ %llx -- %2llu %% complete.",
+		mtd->eb_size / 1024, (unsigned long long)start,
+		(unsigned long long) start * 100 / mtd->size);
+	fflush(stdout);
+}
+
+static void display_help (void)
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
+
+static void display_version (void)
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
 int main (int argc, char *argv[])
 {
 	libmtd_t mtd_desc;
 	struct mtd_dev_info mtd;
 	int fd, clmpos = 0, clmlen = 8, eb;
 	int isNAND, bbtest = 1;
+	int error = 0;
 	uint64_t offset = 0;
 
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
 
 	mtd_desc = libmtd_open();
 	if (mtd_desc == NULL) {
@@ -191,101 +274,3 @@ int main (int argc, char *argv[])
 	return 0;
 }
 
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
-void show_progress (struct mtd_dev_info *mtd, uint64_t start)
-{
-	printf("\rErasing %d Kibyte @ %llx -- %2llu %% complete.",
-		mtd->eb_size / 1024, (unsigned long long)start,
-		(unsigned long long) start * 100 / mtd->size);
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
