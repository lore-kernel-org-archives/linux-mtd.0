Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dR49b-0004no-T3
 for linux-mtd@lists.infradead.org; Fri, 30 Jun 2017 22:12:45 +0000
Received: by mail-pf0-x232.google.com with SMTP id s66so73086794pfs.1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2017 15:12:23 -0700 (PDT)
From: Harpreet Eli Sangha <harpreet@nestlabs.com>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at
Subject: [PATCH] mtd-utils: tests: Add Erased Pages Bit Flip Test
Date: Fri, 30 Jun 2017 15:12:18 -0700
Message-Id: <20170630221218.25687-1-harpreet@nestlabs.com>
In-Reply-To: <CAOMZO5C-KMf_DDe2iQATi05AD0dMEV_yqig5Cx7LemkfEAi+UQ@mail.gmail.com>
References: <CAOMZO5C-KMf_DDe2iQATi05AD0dMEV_yqig5Cx7LemkfEAi+UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Harpreet \"Eli\" Sangha" <harpreet@nestlabs.com>

Bit flip detection for written and erased pages tend to have different
implementations. Where written pages are detected and corrected using
ECC, erased pages are typically detected by ensuring that the number of
zeros is less than a specified threshold.

As such, it's necessary to have the 'nandbiterrs' test support the
testing of written and erased pages. Bit flips in erased pages are
emulated by rewriting the page in raw mode, to prevent the use of ECC.

Signed-off-by: Harpreet Eli Sangha <harpreet@nestlabs.com>
---
 tests/mtd-tests/nandbiterrs.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/tests/mtd-tests/nandbiterrs.c b/tests/mtd-tests/nandbiterrs.c
index de9d0dd..200fe1c 100644
--- a/tests/mtd-tests/nandbiterrs.c
+++ b/tests/mtd-tests/nandbiterrs.c
@@ -62,6 +62,7 @@
 #define KEEP_CONTENTS 0x01
 #define MODE_INCREMENTAL 0x02
 #define MODE_OVERWRITE 0x04
+#define PAGE_ERASED 0x08
 
 static int peb = -1, page = -1, max_overwrite = -1, seed = -1;
 static const char *mtddev;
@@ -77,6 +78,7 @@ static const struct option options[] = {
 	{ "peb", required_argument, NULL, 'b' },
 	{ "page", required_argument, NULL, 'p' },
 	{ "seed", required_argument, NULL, 's' },
+	{ "erased", no_argument, NULL, 'e' },
 	{ "writes", required_argument, NULL, 'w' },
 	{ "incremental", no_argument, NULL, 'i' },
 	{ "overwrite", no_argument, NULL, 'o' },
@@ -92,7 +94,8 @@ static void usage(int status)
 	"  -k, --keep          Restore existing contents after test\n"
 	"  -b, --peb <num>     Use this physical erase block\n"
 	"  -p, --page <num>    Use this page within the erase block\n"
-	"  -s, --seed <num>    Specify seed for PRNG\n\n"
+	"  -s, --seed <num>    Specify seed for PRNG\n"
+	"  -e, --erased        Test erased pages instead of written pages\n\n"
 	"Options controling test mode:\n"
 	"  -i, --incremental   Manually insert bit errors until ECC fails\n"
 	"  -o, --overwrite     Rewrite page until bits flip and ECC fails\n\n"
@@ -121,7 +124,7 @@ static void process_options(int argc, char **argv)
 	int c;
 
 	while (1) {
-		c = getopt_long(argc, argv, "hkb:p:s:iow:", options, NULL);
+		c = getopt_long(argc, argv, "hkb:p:s:eiow:", options, NULL);
 		if (c == -1)
 			break;
 
@@ -169,6 +172,9 @@ static void process_options(int argc, char **argv)
 			if (page < 0)
 				goto failarg;
 			break;
+		case 'e':
+			flags |= PAGE_ERASED;
+			break;
 		case 'h':
 			usage(EXIT_SUCCESS);
 		default:
@@ -224,17 +230,39 @@ static unsigned char hash(unsigned int offset)
 	return c;
 }
 
+static void init_buffer(void)
+{
+	unsigned int i;
+
+	if (flags & PAGE_ERASED) {
+		memset(wbuffer, 0xff, pagesize);
+	} else {
+		for (i = 0; i < pagesize; ++i)
+			wbuffer[i] = hash(i+seed);
+	}
+}
+
 static int write_page(void)
 {
+	int raw = flags & PAGE_ERASED;
 	int err;
 
+	if (raw && ioctl(fd, MTDFILEMODE, MTD_FILE_MODE_RAW) != 0)
+		goto fail_mode;
+
 	err = mtd_write(mtd_desc, &mtd, fd, peb, page*pagesize,
 					wbuffer, pagesize, NULL, 0, 0);
 
 	if (err)
 		fprintf(stderr, "Failed to write page %d in block %d\n", peb, page);
 
+	if (raw && ioctl(fd, MTDFILEMODE, MTD_FILE_MODE_NORMAL) != 0)
+		goto fail_mode;
+
 	return err;
+fail_mode:
+	perror("MTDFILEMODE");
+	return -1;
 }
 
 static int rewrite_page(void)
@@ -285,10 +313,11 @@ failstats:
 
 static int verify_page(void)
 {
+	int erased = flags & PAGE_ERASED;
 	unsigned int i, errs = 0;
 
 	for (i = 0; i < pagesize; ++i) {
-		if (rbuffer[i] != hash(i+seed))
+		if (rbuffer[i] != (erased ? 0xff : hash(i+seed)))
 			++errs;
 	}
 
@@ -321,13 +350,12 @@ static int insert_biterror(void)
  * errors into the page, while verifying each step. */
 static int incremental_errors_test(void)
 {
-	unsigned int i, errs_per_subpage = 0;
+	unsigned int errs_per_subpage = 0;
 	int count = 0;
 
 	puts("incremental biterrors test");
 
-	for (i = 0; i < pagesize; ++i)
-		wbuffer[i] = hash(i+seed);
+	init_buffer();
 
 	if (write_page() != 0)
 		return -1;
@@ -372,8 +400,7 @@ static int overwrite_test(void)
 
 	puts("overwrite biterrors test");
 
-	for (i = 0; i < pagesize; ++i)
-		wbuffer[i] = hash(i+seed);
+	init_buffer();
 
 	if (write_page() != 0)
 		return -1;
-- 
2.13.2.725.g09c95d1e9-goog
