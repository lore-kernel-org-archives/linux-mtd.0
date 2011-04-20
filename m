Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCUS2-000632-Mj
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:07 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmUx009491
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:59 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 31/35] fs-tests: integck: remove symlinks memory leaks
Date: Wed, 20 Apr 2011 13:19:04 +0300
Message-Id: <1303294748-5492-32-git-send-email-dedekind1@gmail.com>
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

When we create a symlink we also allocate a symlink_info structure
and the target path name. But when we remove a symlink - we do not
delete that memory. This patch fixes the issue.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 96937ff..94ffeb8 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1898,6 +1898,8 @@ static int symlink_remove(struct symlink_info *symlink)
 	}
 
 	remove_dir_entry(symlink->entry);
+	free(symlink->target_pathname);
+	free(symlink);
 	free(path);
 	return 0;
 }
-- 
1.7.2.3
