Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZro-0005H1-Oh
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:41:57 +0000
Received: from mgw-mx03.nokia.com (mgw-mx03.nokia.com [192.100.122.230])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m8U7frjI009906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2008 10:41:54 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: use an IS_ERR test rather than a NULL test
Date: Tue, 30 Sep 2008 12:19:00 +0300
Message-Id: <1222766358-21886-5-git-send-email-dedekind@infradead.org>
In-Reply-To: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
References: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julien Brunel <brunel@diku.dk>

In case of error, the function kthread_create returns an ERR pointer,
but never returns a NULL pointer. So a NULL test that comes before an
IS_ERR test should be deleted.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@match_bad_null_test@
expression x, E;
statement S1,S2;
@@
x = kthread_create(...)
... when != x = E
* if (x == NULL)
S1 else S2
// </smpl>

Signed-off-by: Julien Brunel <brunel@diku.dk>
Signed-off-by: Julia Lawall <julia@diku.dk>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 667c72d..d87b0cf 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1032,8 +1032,6 @@ static int mount_ubifs(struct ubifs_info *c)
 
 		/* Create background thread */
 		c->bgt = kthread_create(ubifs_bg_thread, c, c->bgt_name);
-		if (!c->bgt)
-			c->bgt = ERR_PTR(-EINVAL);
 		if (IS_ERR(c->bgt)) {
 			err = PTR_ERR(c->bgt);
 			c->bgt = NULL;
@@ -1347,8 +1345,6 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 
 	/* Create background thread */
 	c->bgt = kthread_create(ubifs_bg_thread, c, c->bgt_name);
-	if (!c->bgt)
-		c->bgt = ERR_PTR(-EINVAL);
 	if (IS_ERR(c->bgt)) {
 		err = PTR_ERR(c->bgt);
 		c->bgt = NULL;
-- 
1.5.4.1
