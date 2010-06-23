Received: from smtp.seznam.cz ([77.75.72.43])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORLdp-00033h-9C
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 08:49:06 +0000
Date: Wed, 23 Jun 2010 12:48:58 +0200
From: Ladislav Michl <Ladislav.Michl@seznam.cz>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] flash_eraseall: do not use exit()
Message-ID: <20100623104858.GA2442@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Reply-To: Ladislav Michl <ladis@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ladislav Michl <ladis@linux-mips.org>

Returning from main() instead of using exit() makes code more readable
and smaller.

   text    data     bss     dec     hex filename
   6440     324      68    6832    1ab0 flash_eraseall
   6405     320      68    6793    1a89 flash_eraseall.noexit

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 flash_eraseall.c |   42 ++++++++++++++++--------------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index 531bbe6..db65553 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -51,14 +51,6 @@ static int jffs2;		/* format for jffs2 usage */
 static struct jffs2_unknown_node cleanmarker;
 int target_endian = __BYTE_ORDER;
 
-static void show_progress(mtd_info_t *meminfo, erase_info_t *erase)
-{
-	printf("\rErasing %d Kibyte @ %x -- %2llu %% complete.",
-		meminfo->erasesize / 1024, erase->start,
-		(unsigned long long) erase->start * 100 / meminfo->size);
-	fflush(stdout);
-}
-
 static void display_help(void)
 {
 	printf("Usage: %s [OPTION] MTD_DEVICE\n"
@@ -70,10 +62,8 @@ static void display_help(void)
 			"      --help     display this help and exit\n"
 			"      --version  output version information and exit\n",
 			exe_name);
-	exit(0);
 }
 
-
 static void display_version(void)
 {
 	printf(PROGRAM " " VERSION "\n"
@@ -86,12 +76,22 @@ static void display_version(void)
 			"You may redistribute copies of " PROGRAM "\n"
 			"under the terms of the GNU General Public Licence.\n"
 			"See the file `COPYING' for more information.\n");
-	exit(0);
 }
 
-static void process_options(int argc, char *argv[])
+static void show_progress(mtd_info_t *meminfo, erase_info_t *erase)
+{
+	printf("\rErasing %d Kibyte @ %x -- %2llu %% complete.",
+		meminfo->erasesize / 1024, erase->start,
+		(unsigned long long) erase->start * 100 / meminfo->size);
+	fflush(stdout);
+}
+
+int main(int argc, char *argv[])
 {
-	int error = 0;
+	mtd_info_t meminfo;
+	int fd, error = 0, clmpos = 0, clmlen = 8;
+	erase_info_t erase;
+	int isNAND, bbtest = 1;
 
 	exe_name = argv[0];
 
@@ -119,10 +119,10 @@ static void process_options(int argc, char *argv[])
 				switch (option_index) {
 					case 0:
 						display_help();
-						break;
+						return 0;
 					case 1:
 						display_version();
-						break;
+						return 0;
 				}
 				break;
 			case 'q':
@@ -143,20 +143,10 @@ static void process_options(int argc, char *argv[])
 	if (error) {
 		fprintf(stderr, "Try `%s --help' for more information.\n",
 				exe_name);
-		exit(1);
+		return 1;
 	}
 
 	mtd_device = argv[optind];
-}
-
-int main(int argc, char *argv[])
-{
-	mtd_info_t meminfo;
-	int fd, clmpos = 0, clmlen = 8;
-	erase_info_t erase;
-	int isNAND, bbtest = 1;
-
-	process_options(argc, argv);
 
 	if ((fd = open(mtd_device, O_RDWR)) < 0) {
 		fprintf(stderr, "%s: %s: %s\n", exe_name, mtd_device, strerror(errno));
