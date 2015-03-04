Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YT6ee-0002BV-2m
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2015 10:35:53 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <bengardiner@nanometrics.ca>
Subject: [RESEND PATCH] ubifs: do not write master node if need recovery
Date: Wed, 4 Mar 2015 10:46:16 +0000
Message-ID: <1425465976-11116-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, hujianyang@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The commits 781c571 ("UBIFS: intialize LPT earlier") and 0980119 ("UBIFS:
fix-up free space earlier") move some initialization before marking the
master node dirty. But the modification changes the conditions of writing
master. 

If unclean umount happens, ubifs may fail when mounting. But trying to
mount it will write new master nodes on the flash. This is useless but
increasing sqnum. So check need_recovery before writing master node, and
don't create new master node if filesystem needs recovery.

The behavour of the bug shows at:
http://lists.infradead.org/pipermail/linux-mtd/2015-February/057712.html

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 93e9465..0b7378a 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1284,7 +1284,7 @@ static int mount_ubifs(struct ubifs_info *c)
 			goto out_lpt;
 	}
 
-	if (!c->ro_mount) {
+	if (!c->ro_mount && !c->need_recovery) {
 		/*
 		 * Set the "dirty" flag so that if we reboot uncleanly we
 		 * will notice this immediately on the next mount.
-- 
1.8.3.4
