Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eD7XJ-0002Am-0V
 for linux-mtd@lists.infradead.org; Fri, 10 Nov 2017 11:31:51 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: ukleinek@debian.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH] ubi-utils: ubicrc32: process command line arguments first
Date: Fri, 10 Nov 2017 12:30:32 +0100
Message-Id: <20171110113032.1758-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When a command line option is used (e.g. --version), the tool
tries to open it as a file first, then *uppon success* attempts
to process the command line options (including what it assumed
to be an input file) which is obviously broken.

This patch moves command line processing first and then attempts
to open *the first unprocessed* argument.

Reported-by: Uwe Kleine-König <ukleinek@debian.org>
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 ubi-utils/ubicrc32.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/ubi-utils/ubicrc32.c b/ubi-utils/ubicrc32.c
index 0ea255d..885f348 100644
--- a/ubi-utils/ubicrc32.c
+++ b/ubi-utils/ubicrc32.c
@@ -89,19 +89,18 @@ int main(int argc, char * const argv[])
 	int err = 0;
 	uint32_t crc = UBI_CRC32_INIT;
 	char buf[BUFSIZE];
-	FILE *fp;
-
-	if (argc > 1) {
-		fp = fopen(argv[1], "r");
-		if (!fp)
-			return sys_errmsg("cannot open \"%s\"", argv[1]);
-	} else
-		fp = stdin;
+	FILE *fp = stdin;
 
 	err = parse_opt(argc, argv);
 	if (err)
 		return err;
 
+	if (optind < argc) {
+		fp = fopen(argv[optind], "r");
+		if (!fp)
+			return sys_errmsg("cannot open \"%s\"", argv[1]);
+	}
+
 	while (!feof(fp)) {
 		size_t read;
 
-- 
2.13.6
