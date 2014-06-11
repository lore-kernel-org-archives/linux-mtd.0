Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuYS2-00018d-BQ
 for linux-mtd@lists.infradead.org; Wed, 11 Jun 2014 02:39:49 +0000
Message-ID: <5397C135.9070607@huawei.com>
Date: Wed, 11 Jun 2014 10:38:45 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/4] UBIFS: Add missing error handling in
 create_default_filesystem()
References: <5397C0E7.9070602@huawei.com>
In-Reply-To: <5397C0E7.9070602@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the end of create_default_filesystem(), we need to check
the return value of ubifs_write_node() to ensure if we have
successfully written the cs_node.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 fs/ubifs/sb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 4c37607..7ba1378 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -332,6 +332,8 @@ static int create_default_filesystem(struct ubifs_info *c)
 	cs->ch.node_type = UBIFS_CS_NODE;
 	err = ubifs_write_node(c, cs, UBIFS_CS_NODE_SZ, UBIFS_LOG_LNUM, 0);
 	kfree(cs);
+	if (err)
+		return err;

 	ubifs_msg("default file-system created");
 	return 0;
-- 
1.8.1.4
