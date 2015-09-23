Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZekJP-0008Nx-Cf
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2015 13:42:20 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [Resend PATCH 2/2] UBIFS: print verbose message when rescanning a
 corrupted node
Date: Wed, 23 Sep 2015 09:11:40 +0000
Message-ID: <1442999500-5343-3-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1442999500-5343-1-git-send-email-shengyong1@huawei.com>
References: <1442999500-5343-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a trivial fix of showing verbose message when leb-recovery detects
a corrupted node, which is not the last one in the LEB. Rescan expects to
show more detail of the corrupted node.

Reviewed-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/recovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 695fc71..2a1f0bc 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -789,7 +789,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 corrupted_rescan:
 	/* Re-scan the corrupted data with verbose messages */
 	ubifs_err(c, "corruption %d", ret);
-	ubifs_scan_a_node(c, buf, len, lnum, offs, 1);
+	ubifs_scan_a_node(c, buf, len, lnum, offs, 0);
 corrupted:
 	ubifs_scanned_corruption(c, lnum, offs, buf);
 	err = -EUCLEAN;
-- 
1.9.1
