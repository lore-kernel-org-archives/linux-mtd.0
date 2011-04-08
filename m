Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DNY-0001Oh-PL
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:13:47 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p38FDhL9017801
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2011 18:13:43 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/6] fs-tests: integck: do not cast void pointers
Date: Fri,  8 Apr 2011 18:16:46 +0300
Message-Id: <1302275810-12632-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302275810-12632-1-git-send-email-dedekind1@gmail.com>
References: <1302275810-12632-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

The malloc function returns 'void *', so it is not necessary to
cast it when assigning. This is just a small clean-up patch.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index a3f4130..b53f11d 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -153,7 +153,7 @@ static char *copy_string(const char *s)
 
 	if (!s)
 		return NULL;
-	str = (char *) malloc(strlen(s) + 1);
+	str = malloc(strlen(s) + 1);
 	CHECK(str != NULL);
 	strcpy(str, s);
 	return str;
@@ -171,7 +171,7 @@ static char *cat_strings(const char *a, const char *b)
 	if (!a && !b)
 		return NULL;
 	sz = strlen(a) + strlen(b) + 1;
-	str = (char *) malloc(sz);
+	str = malloc(sz);
 	CHECK(str != NULL);
 	strcpy(str, a);
 	strcat(str, b);
@@ -206,7 +206,7 @@ static char *cat_paths(const char *a, const char *b)
 		return cat_strings(a, b + 1);
 
 	sz = na + nb + 2;
-	str = (char *) malloc(sz);
+	str = malloc(sz);
 	CHECK(str != NULL);
 	strcpy(str, a);
 	strcat(str, "/");
@@ -1286,7 +1286,7 @@ static void dir_check(struct dir_info *dir)
 	/* Create an array of entries */
 	sz = sizeof(struct dir_entry_info *);
 	n = dir->number_of_entries;
-	entry_array = (struct dir_entry_info **) malloc(sz * n);
+	entry_array = malloc(sz * n);
 	CHECK(entry_array != NULL);
 
 	entry = dir->first;
-- 
1.7.2.3
