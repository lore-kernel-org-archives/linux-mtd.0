Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURz-00069r-W2
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:12 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmWu009496
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:58 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 28/35] fs-tests: integck: fix memory leak in dir_new
Date: Wed, 20 Apr 2011 13:19:01 +0300
Message-Id: <1303294748-5492-29-git-send-email-dedekind1@gmail.com>
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

Do not initialize dir->name because add_dir_entry already does
this for us, so we leak the memory.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index d2db320..666bc70 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -473,7 +473,6 @@ static int dir_new(struct dir_info *parent, const char *name)
 	free(path);
 
 	dir = zalloc(sizeof(struct dir_info));
-	dir->name = dup_string(name);
 	dir->parent = parent;
 	if (parent)
 		add_dir_entry(parent, 'd', name, dir);
-- 
1.7.2.3
