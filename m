Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCUS1-00062V-QT
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:02 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFnWm009518
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:58 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 27/35] fs-tests: integck: fix memory lead in dir_remove
Date: Wed, 20 Apr 2011 13:19:00 +0300
Message-Id: <1303294748-5492-28-git-send-email-dedekind1@gmail.com>
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

When removing a directory and freeing corresponding 'dir_info' object -
do not forget to free directory name as well.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 79c1020..d2db320 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -517,6 +517,7 @@ static int dir_remove(struct dir_info *dir)
 	/* Remove entry from parent directory */
 	remove_dir_entry(dir->entry);
 	free(path);
+	free(dir->name);
 	free(dir);
 	return 0;
 }
-- 
1.7.2.3
