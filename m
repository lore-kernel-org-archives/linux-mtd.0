Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCUS4-00063r-CJ
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmsE009503
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:16:01 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 35/35] fs-tests: integck: assume that the parent is present in
	new_dir
Date: Wed, 20 Apr 2011 13:19:08 +0300
Message-Id: <1303294748-5492-36-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
References: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
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

We always pass non-NULL 'parent' argument to 'new_dir()', so no need to
test it for NULL.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 310e228..9cb0403 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -455,6 +455,8 @@ static int dir_new(struct dir_info *parent, const char *name)
 	struct dir_info *dir;
 	char *path;
 
+	assert(parent);
+
 	path = dir_path(parent, name);
 	if (mkdir(path, 0777) != 0) {
 		if (errno == ENOSPC) {
@@ -469,8 +471,7 @@ static int dir_new(struct dir_info *parent, const char *name)
 	free(path);
 
 	dir = zalloc(sizeof(struct dir_info));
-	if (parent)
-		add_dir_entry(parent, 'd', name, dir);
+	add_dir_entry(parent, 'd', name, dir);
 	return 0;
 }
 
-- 
1.7.2.3
