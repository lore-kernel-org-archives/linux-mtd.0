Received: from mail-yh0-f49.google.com ([209.85.213.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhgzG-00006f-TN
 for linux-mtd@lists.infradead.org; Tue, 06 May 2014 15:08:55 +0000
Received: by mail-yh0-f49.google.com with SMTP id c41so774207yho.8
 for <linux-mtd@lists.infradead.org>; Tue, 06 May 2014 08:08:33 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2] nandtest: Introduce multiple reads & check iterations
Date: Tue,  6 May 2014 12:07:49 -0300
Message-Id: <1399388869-5815-2-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1399388869-5815-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1399388869-5815-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Huang Shijie <b32955@freescale.com>, Pekon Gupta <pekon@ti.com>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current nandtest performs a simple test which consists of:

  1. erase block
  2. write data
  3. read and verify

In order to improve the nandtest strength, this commit adds a new parameter
to increase the number of "read and verify" iterations. In other words,
the test now consists of:

  1. erase block
  2. write data
  3. read and verify (N times)

This seem to apply more pressure on a NAND driver's ECC engine and has been
used to discover stability problems with an old OMAP2.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 nandtest.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index 31301d6..8ea39d3 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -24,6 +24,7 @@ void usage(int status)
 		"  -m, --markbad        Mark blocks bad if they appear so\n"
 		"  -s, --seed           Supply random seed\n"
 		"  -p, --passes         Number of passes\n"
+		"  -r, --reads          Read & check iterations per pass (default=4)\n"
 		"  -o, --offset         Start offset on flash\n"
 		"  -l, --length         Length of flash to test\n"
 		"  -k, --keep           Restore existing contents after test\n",
@@ -37,14 +38,11 @@ int fd;
 int markbad=0;
 int seed;
 
-void read_and_compare(loff_t ofs, unsigned char *data, unsigned char *rbuf)
+int read_and_compare(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 {
 	ssize_t len;
 	int i;
 
-	printf("\r%08x: reading...", (unsigned)ofs);
-	fflush(stdout);
-
 	len = pread(fd, rbuf, meminfo.erasesize, ofs);
 	if (len < meminfo.erasesize) {
 		printf("\n");
@@ -84,14 +82,16 @@ void read_and_compare(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 				printf("Byte 0x%x is %02x should be %02x\n",
 				       i, rbuf[i], data[i]);
 		}
-		exit(1);
+		return 1;
 	}
+	return 0;
 }
 
-int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
+int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf, int nr_reads)
 {
 	struct erase_info_user er;
 	ssize_t len;
+	int i, read_errs = 0;
 
 	printf("\r%08x: erasing... ", (unsigned)ofs);
 	fflush(stdout);
@@ -127,7 +127,16 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 		exit(1);
 	}
 
-	read_and_compare(ofs, data, rbuf);
+	for (i=1; i<=nr_reads; i++) {
+		printf("\r%08x: reading (%d of %d)...", (unsigned)ofs, i, nr_reads);
+		fflush(stdout);
+		if (read_and_compare(ofs, data, rbuf))
+			read_errs++;
+	}
+	if (read_errs) {
+		fprintf(stderr, "read/check %d of %d failed. seed %d\n", read_errs, nr_reads, seed);
+		return 1;
+	}
 	return 0;
 }
 
@@ -141,6 +150,7 @@ int main(int argc, char **argv)
 	unsigned char *wbuf, *rbuf, *kbuf;
 	int pass;
 	int nr_passes = 1;
+	int nr_reads = 4;
 	int keep_contents = 0;
 	uint32_t offset = 0;
 	uint32_t length = -1;
@@ -148,7 +158,7 @@ int main(int argc, char **argv)
 	seed = time(NULL);
 
 	for (;;) {
-		static const char short_options[] = "hkl:mo:p:s:";
+		static const char short_options[] = "hkl:mo:p:r:s:";
 		static const struct option long_options[] = {
 			{ "help", no_argument, 0, 'h' },
 			{ "markbad", no_argument, 0, 'm' },
@@ -156,6 +166,7 @@ int main(int argc, char **argv)
 			{ "passes", required_argument, 0, 'p' },
 			{ "offset", required_argument, 0, 'o' },
 			{ "length", required_argument, 0, 'l' },
+			{ "reads", optional_argument, 0, 'r' },
 			{ "keep", no_argument, 0, 'k' },
 			{0, 0, 0, 0},
 		};
@@ -189,6 +200,10 @@ int main(int argc, char **argv)
 			nr_passes = atol(optarg);
 			break;
 
+		case 'r':
+			nr_reads = atol(optarg);
+			break;
+
 		case 'o':
 			offset = atol(optarg);
 			break;
@@ -286,10 +301,10 @@ int main(int argc, char **argv)
 					exit(1);
 				}
 			}
-			if (erase_and_write(test_ofs, wbuf, rbuf))
+			if (erase_and_write(test_ofs, wbuf, rbuf, nr_reads))
 				continue;
 			if (keep_contents)
-				erase_and_write(test_ofs, kbuf, rbuf);
+				erase_and_write(test_ofs, kbuf, rbuf, 1);
 		}
 		printf("\nFinished pass %d successfully\n", pass+1);
 	}
-- 
1.9.1
