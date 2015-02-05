Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJJE2-0003CH-JI
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 09:59:55 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <richard@nod.at>
Subject: [RFC PATCH] ubifs: do not write master node if recovery needed
Date: Thu, 5 Feb 2015 09:54:40 +0000
Message-ID: <1423130080-79705-2-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1423130080-79705-1-git-send-email-shengyong1@huawei.com>
References: <1423130080-79705-1-git-send-email-shengyong1@huawei.com>
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

If unclean umount happens, ubifs may fail when mounting. Trying to mount
it will write new master nodes on the flash. This is useless but wasting
space and increasing sqnum. So check need_recovery before writing master
node, and don't create new master node if filesystem needs recovery.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index e642067..17e3016 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1287,7 +1287,7 @@ static int mount_ubifs(struct ubifs_info *c)
 			goto out_lpt;
 	}
 
-	if (!c->ro_mount) {
+	if (!c->ro_mount && !c->need_recovery) {
 		/*
 		 * Set the "dirty" flag so that if we reboot uncleanly we
 		 * will notice this immediately on the next mount.
-- 
1.8.3.4
