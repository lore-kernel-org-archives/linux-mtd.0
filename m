Received: from monster.nessie.de ([84.200.20.120])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqS7f-0004sZ-0C
	for linux-mtd@lists.infradead.org; Wed, 23 Sep 2009 13:43:12 +0000
Received: from nautilus.home (localhost.localdomain [127.0.0.1])
	by monster.nessie.de (Postfix) with ESMTP id E3D9E2188B5E
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Sep 2009 13:01:36 +0000 (GMT)
From: Michael Roth <mroth@nessie.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubiformat,
	ubinize: fix more 64-bit image sequence number confusion
Date: Wed, 23 Sep 2009 15:01:26 +0200
Message-Id: <1253710887-16731-2-git-send-email-mroth@nessie.de>
In-Reply-To: <1253710887-16731-1-git-send-email-mroth@nessie.de>
References: <1253710887-16731-1-git-send-email-mroth@nessie.de>
Cc: Michael Roth <mroth@nessie.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The sequence number is only 32 bit as the strtoul() function.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 ubi-utils/src/ubiformat.c |    2 +-
 ubi-utils/src/ubinize.c   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 345593c..bed0339 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -134,7 +134,7 @@ static int parse_opt(int argc, char * const argv[])
 	while (1) {
 		int key;
 		char *endp;
-		unsigned long long image_seq;
+		unsigned long int image_seq;
 
 		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:", long_options, NULL);
 		if (key == -1)
diff --git a/ubi-utils/src/ubinize.c b/ubi-utils/src/ubinize.c
index dd8d3ed..a46833c 100644
--- a/ubi-utils/src/ubinize.c
+++ b/ubi-utils/src/ubinize.c
@@ -161,7 +161,7 @@ static int parse_opt(int argc, char * const argv[])
 	while (1) {
 		int key;
 		char *endp;
-		unsigned long long image_seq;
+		unsigned long int image_seq;
 
 		key = getopt_long(argc, argv, "o:p:m:s:O:e:x:Q:vhV", long_options, NULL);
 		if (key == -1)
-- 
1.6.3.3
