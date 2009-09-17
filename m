Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MoFyR-0008Tc-Nf
	for linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 12:20:36 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx06.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n8HCJvnT027881
	for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2009 15:20:14 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <Adrian.Hunter@nokia.com>
Subject: [PATCH 5/5] UBIFS: fix debugging dump
Date: Thu, 17 Sep 2009 15:19:56 +0300
Message-Id: <1253189996-14191-6-git-send-email-dedekind@infradead.org>
In-Reply-To: <1253189996-14191-1-git-send-email-dedekind@infradead.org>
References: <1253189996-14191-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

In 'dbg_check_space_info()' we want to dump current lprops statistics,
but actually dump old statistics. Fix this.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index fd3f07e..dbc093a 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -1005,8 +1005,10 @@ out:
 	ubifs_msg("saved lprops statistics dump");
 	dbg_dump_lstats(&d->saved_lst);
 	ubifs_get_lp_stats(c, &lst);
+
 	ubifs_msg("current lprops statistics dump");
-	dbg_dump_lstats(&d->saved_lst);
+	dbg_dump_lstats(&lst);
+
 	spin_lock(&c->space_lock);
 	dbg_dump_budg(c);
 	spin_unlock(&c->space_lock);
-- 
1.6.2.5
