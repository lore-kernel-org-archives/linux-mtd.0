Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DNZ-0001Oj-88
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:13:47 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p38FDhOP017778
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2011 18:13:44 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/6] fs-tests: integck: remove unnecessary check
Date: Fri,  8 Apr 2011 18:16:48 +0300
Message-Id: <1302275810-12632-5-git-send-email-dedekind1@gmail.com>
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

The 'link_new()' function has only one user, and the user checks
that the third 'file' argument is non NULL, so remove this check
from 'link_new()'. Let's be consistent and assume the 3rd argument
is never NULL, just like the first and the second ones.

This is just a minor improvement.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 1801b20..155b619 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -425,8 +425,6 @@ static void link_new(struct dir_info *parent, const char *name,
 	char *path, *target;
 	int ret;
 
-	if (!file)
-		return;
 	entry = file->links;
 	if (!entry)
 		return;
-- 
1.7.2.3
