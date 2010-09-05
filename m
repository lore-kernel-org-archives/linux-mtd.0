Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsK1g-0000nt-Cy
	for linux-mtd@lists.infradead.org; Sun, 05 Sep 2010 18:33:13 +0000
Received: by eye22 with SMTP id 22so2056198eye.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 05 Sep 2010 11:33:10 -0700 (PDT)
From: Kulikov Vasiliy <segooon@gmail.com>
To: kernel-janitors@vger.kernel.org
Subject: [PATCH 12/14] ubifs: check return code of pnode_lookup
Date: Sun,  5 Sep 2010 22:33:04 +0400
Message-Id: <1283711584-7587-1-git-send-email-segooon@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Vasiliy Kulikov <segooon@gmail.com>,
	linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>,
	Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Vasiliy Kulikov <segooon@gmail.com>

Function pnode_lookup may return ERR_PTR(...). Check for it.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 fs/ubifs/lpt_commit.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index d12535b..5c90dec 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -705,6 +705,9 @@ static int make_tree_dirty(struct ubifs_info *c)
 	struct ubifs_pnode *pnode;
 
 	pnode = pnode_lookup(c, 0);
+	if (IS_ERR(pnode))
+		return PTR_ERR(pnode);
+
 	while (pnode) {
 		do_make_pnode_dirty(c, pnode);
 		pnode = next_pnode_to_dirty(c, pnode);
-- 
1.7.0.4
