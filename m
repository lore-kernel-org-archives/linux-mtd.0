Received: from cmccmta1.chinamobile.com ([221.176.66.79])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ft3Ke-0005RG-C3
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2018 04:04:22 +0000
From: Ding Xiang <dingxiang@cmss.chinamobile.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fs: ubifs: remove unneeded semicolon
Date: Fri, 24 Aug 2018 01:15:05 -0400
Message-Id: <1535087705-17637-1-git-send-email-dingxiang@cmss.chinamobile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

delete redundant semicolon

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 fs/ubifs/sb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index bf17f58..d5c55e2 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -603,7 +603,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 		c->key_hash = key_test_hash;
 		c->key_hash_type = UBIFS_KEY_HASH_TEST;
 		break;
-	};
+	}
 
 	c->key_fmt = sup->key_fmt;
 
-- 
1.8.3.1
