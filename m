Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrxJ5-0003O6-Uu
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 00:12:36 +0000
Received: by pacfv9 with SMTP id fv9so57379847pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2015 17:12:12 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [mtd-utils PATCH] nandtest: support hex/dec/oct for --offset and
 --length
Date: Thu, 29 Oct 2015 17:12:01 -0700
Message-Id: <1446163921-115867-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These two options are handled inconsistently, which caused an
unnecessary amount of head scratching. Let's just use the simple helpers
too, so we get the error handling right.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandtest.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index 08053876506a..2ef7cc824d59 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -15,6 +15,7 @@
 
 #include <asm/types.h>
 #include "mtd/mtd-user.h"
+#include "common.h"
 
 void usage(int status)
 {
@@ -154,6 +155,7 @@ int main(int argc, char **argv)
 	int keep_contents = 0;
 	uint32_t offset = 0;
 	uint32_t length = -1;
+	int error = 0;
 
 	seed = time(NULL);
 
@@ -205,17 +207,19 @@ int main(int argc, char **argv)
 			break;
 
 		case 'o':
-			offset = atol(optarg);
+			offset = simple_strtoul(optarg, &error);
 			break;
 
 		case 'l':
-			length = strtol(optarg, NULL, 0);
+			length = simple_strtoul(optarg, &error);
 			break;
 
 		}
 	}
 	if (argc - optind != 1)
 		usage(1);
+	if (error)
+		errmsg_die("Try --help for more information");
 
 	fd = open(argv[optind], O_RDWR);
 	if (fd < 0) {
-- 
2.6.0.rc2.230.g3dd15c0
