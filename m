Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2Ydk-0005VR-Lr
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 09:19:22 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: andrea.adami@gmail.com,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH] mtd-utils: common.h: fix prompt function
Date: Wed, 19 Sep 2018 11:18:17 +0200
Message-Id: <20180919091817.19581-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The prompt() function is intended to query a yes/no reply from a command
line user by reading in an entire line of text using getline() and checking
the first character. If the line is empty, a default value is returned.

First of all, this patch replaces the usage of getline() with fgets() to
avoid compilation problems on some smaller C libraries, like klibc, that
do not have a getline() implementation. Since we now have a static line
length, this may however break some build setups that input lengthy
giberish instead of a simple 'y' or 'n'.

Second, this patch fixes a more severe bug in prompt(), replacing a 'while'
keyword with the 'if' that was most likely intended. In the old version, if
getline() reported an error, it would print an error message inside a while
loop, immediately followed by a break and then march on and process the
erroneous input instead of using the default value as printed to stdout.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 include/common.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/common.h b/include/common.h
index 2ce5d22..ece2287 100644
--- a/include/common.h
+++ b/include/common.h
@@ -141,15 +141,14 @@ extern "C" {
  */
 static inline bool prompt(const char *msg, bool def)
 {
-	char *line = NULL;
-	size_t len;
 	bool ret = def;
+	char line[64];
 
 	do {
 		normsg_cont("%s (%c/%c) ", msg, def ? 'Y' : 'y', def ? 'n' : 'N');
 		fflush(stdout);
 
-		while (getline(&line, &len, stdin) == -1) {
+		if (fgets(line, sizeof(line), stdin) == NULL) {
 			printf("failed to read prompt; assuming '%s'\n",
 				def ? "yes" : "no");
 			break;
@@ -169,8 +168,6 @@ static inline bool prompt(const char *msg, bool def)
 		break;
 	} while (1);
 
-	free(line);
-
 	return ret;
 }
 
-- 
2.17.1
