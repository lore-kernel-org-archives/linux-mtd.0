Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q46zQ-00014R-M7
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 07:35:53 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2S7Zow1029283
	for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2011 10:35:51 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/4] UBIFS: fix oops on error path in read_pnode
Date: Mon, 28 Mar 2011 10:38:34 +0300
Message-Id: <1301297914-14712-4-git-send-email-dedekind1@gmail.com>
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

Thanks to coverity which spotted that UBIFS will oops if 'kmalloc()'
in 'read_pnode()' fails and we dereference a NULL 'pnode' pointer
when we 'goto out'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/lpt.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 72775d3..ef5155e 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1270,10 +1270,9 @@ static int read_pnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 	lnum = branch->lnum;
 	offs = branch->offs;
 	pnode = kzalloc(sizeof(struct ubifs_pnode), GFP_NOFS);
-	if (!pnode) {
-		err = -ENOMEM;
-		goto out;
-	}
+	if (!pnode)
+		return -ENOMEM;
+
 	if (lnum == 0) {
 		/*
 		 * This pnode was not written which just means that the LEB
-- 
1.7.2.3
