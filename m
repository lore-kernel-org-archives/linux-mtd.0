Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q46zQ-00014Q-M8
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 07:35:53 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2S7Zo8L029275
	for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2011 10:35:50 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/4] UBIFS: do not read flash unnecessarily
Date: Mon, 28 Mar 2011 10:38:33 +0300
Message-Id: <1301297914-14712-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1301297914-14712-1-git-send-email-dedekind1@gmail.com>
References: <1301297914-14712-1-git-send-email-dedekind1@gmail.com>
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

This fix makes the 'dbg_check_old_index()' function return
immediately if debugging is disabled, instead of executing
incorrect 'goto out' which causes UBIFS to:

1. Allocate memory
2. Read the flash

On every commit. OK, we do not commit that often, but it is
still silly to do unneeded I/O anyway.

Credits to coverity for spotting this silly issue.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: stable@kernel.org
---
 fs/ubifs/commit.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index b148fbc..1bd01de 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -577,7 +577,7 @@ int dbg_check_old_index(struct ubifs_info *c, struct ubifs_zbranch *zroot)
 	size_t sz;
 
 	if (!(ubifs_chk_flags & UBIFS_CHK_OLD_IDX))
-		goto out;
+		return 0;
 
 	INIT_LIST_HEAD(&list);
 
-- 
1.7.2.3
