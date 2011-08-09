Received: from na3sys009aog107.obsmtp.com ([74.125.149.197])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QqtMp-0000T4-Gs
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 20:57:40 +0000
Received: by mail-vw0-f53.google.com with SMTP id 13so415050vws.12
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Aug 2011 13:57:37 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] nandtest: report estimated BER
Date: Tue,  9 Aug 2011 16:57:29 -0400
Message-Id: <c1dd282881d83603b3f9d7ccc8f51ebe98e7d294.1312922073.git.bengardiner@nanometrics.ca>
In-Reply-To: <e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
References: <e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
In-Reply-To: <cover.1312922073.git.bengardiner@nanometrics.ca>
References: <cover.1312922073.git.bengardiner@nanometrics.ca>
Cc: Ben Gardiner <bengardiner@nanometrics.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nandtest program will excercise every block on a given mtd device by
writing to it and monitoring the ECC corrections and failures.

Augment this utility to report an estimate of the program-disturb raw BER
based on the writesize, eccsize, number of passes and ecc corrections stat.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

---

This estimate relies on the eccbytes field of the now deprecated struct
nand_ecclayout_user. Since I found it useful I thought I should propose
the change anyways. I'm open to modifications to retrieve 'eccbytes' the
right way.
---
 nandtest.c |   25 ++++++++++++++++++++++++-
 1 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index dc28d09..35e3e94 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -4,6 +4,7 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <limits.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -32,7 +33,8 @@ void usage(void)
 }
 
 struct mtd_info_user meminfo;
-struct mtd_ecc_stats oldstats, newstats;
+struct mtd_ecc_stats origstats, oldstats, newstats;
+struct nand_ecclayout_user ecclayout;
 int fd;
 int markbad=0;
 int seed;
@@ -126,6 +128,16 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 	return 0;
 }
 
+void report_raw_ber(unsigned long len)
+{
+	unsigned long corrections = newstats.corrected - origstats.corrected;
+	long double rate = (long double) corrections;
+	rate /= (long double) len;
+	rate /= CHAR_BIT;
+
+	printf("%lu bit corrections in %lu bytes. Estimated program-disturb raw BER: %Lg\n",
+			corrections, len, rate);
+}
 
 /*
  * Main program
@@ -204,6 +216,12 @@ int main(int argc, char **argv)
 		exit(1);
 	}
 
+	if (ioctl(fd, ECCGETLAYOUT, &ecclayout)) {
+		perror("ECCGETLAYOUT");
+		close(fd);
+		exit(1);
+	}
+
 	if (length == -1)
 		length = meminfo.size;
 
@@ -243,6 +261,8 @@ int main(int argc, char **argv)
 	printf("Bad blocks     : %d\n", oldstats.badblocks);
 	printf("BBT blocks     : %d\n", oldstats.bbtblocks);
 
+	origstats = oldstats;
+
 	for (pass = 0; pass < nr_passes; pass++) {
 		loff_t test_ofs;
 
@@ -281,6 +301,9 @@ int main(int argc, char **argv)
 		}
 		printf("\nFinished pass %d successfully\n", pass+1);
 	}
+
+	report_raw_ber(length * (meminfo.erasesize + meminfo.erasesize/meminfo.writesize * ecclayout.eccbytes) *(unsigned long)nr_passes);
+
 	/* Return happy */
 	return 0;
 }
-- 
1.7.3.5
