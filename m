Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6u-0002S3-H4
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:08 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wE3028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/30] UBIFS: dump stack when pnode or nnode reading fails
Date: Thu,  9 Jun 2011 12:04:43 +0300
Message-Id: <1307610310-28691-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When we fail to read a pnode or nnode - print stacktrace if debugging is enabled.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/lpt.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index ef5155e..04713cd 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1247,6 +1247,7 @@ int ubifs_read_nnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 
 out:
 	ubifs_err("error %d reading nnode at %d:%d", err, lnum, offs);
+	dbg_dump_stack();
 	kfree(nnode);
 	return err;
 }
@@ -1312,6 +1313,7 @@ static int read_pnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 out:
 	ubifs_err("error %d reading pnode at %d:%d", err, lnum, offs);
 	dbg_dump_pnode(c, pnode, parent, iip);
+	dbg_dump_stack();
 	dbg_msg("calc num: %d", calc_pnode_num_from_parent(c, parent, iip));
 	kfree(pnode);
 	return err;
-- 
1.7.2.3
