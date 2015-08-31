Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfO-00042T-1h
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:06 +0000
Received: by pacgr6 with SMTP id gr6so2104599pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:45 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 02/11] flash_{un,}lock: switch to getopt library
Date: Mon, 31 Aug 2015 15:34:23 -0700
Message-Id: <1441060472-82169-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
References: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We will be adding some more flags, so the getopt library can help.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_unlock.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index ee8ac890f61c..777e4375a44d 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -13,6 +13,7 @@
 #define FLASH_UNLOCK 0
 #endif
 
+#include <getopt.h>
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
@@ -35,6 +36,12 @@ static void usage(int status)
 	exit(status);
 }
 
+static const char short_opts[] = "h";
+static const struct option long_opts[] = {
+	{ "help",	no_argument,	0, 'h' },
+	{ NULL,		0,		0, 0 },
+};
+
 int main(int argc, char *argv[])
 {
 	int fd, request;
@@ -43,11 +50,26 @@ int main(int argc, char *argv[])
 	int count;
 	const char *dev;
 
+	for (;;) {
+		int c;
+
+		c = getopt_long(argc, argv, short_opts, long_opts, NULL);
+		if (c == EOF)
+			break;
+
+		switch (c) {
+		case 'h':
+			usage(0);
+			break;
+		default:
+			usage(1);
+			break;
+		}
+	}
+
 	/* Parse command line options */
 	if (argc < 2 || argc > 4)
 		usage(1);
-	if (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help"))
-		usage(0);
 
 	dev = argv[1];
 
-- 
2.5.0.457.gab17608
