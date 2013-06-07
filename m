Received: from mail-bk0-x22a.google.com ([2a00:1450:4008:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UkmFM-0008I4-1E
 for linux-mtd@lists.infradead.org; Fri, 07 Jun 2013 02:17:44 +0000
Received: by mail-bk0-f42.google.com with SMTP id jk13so1996685bkc.29
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2013 19:17:22 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 7 Jun 2013 10:17:22 +0800
Message-ID: <CAPgLHd_=Y=YwCWSFjcacJ14yKUidmmJTHnKKibU6haoBUeNacA@mail.gmail.com>
Subject: [PATCH] UBIFS: fix error return code in ubifs_remount_rw() and
 ubifs_fill_super()
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dedekind1@gmail.com, adrian.hunter@intel.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return -ENOMEM in the kmalloc() and d_make_root() error handling
case instead of 0, as done elsewhere in those functions.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 fs/ubifs/super.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index f21acf0..673b4bc 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1629,8 +1629,10 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	}
 
 	c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ, GFP_KERNEL);
-	if (!c->write_reserve_buf)
+	if (!c->write_reserve_buf) {
+		err = -ENOMEM;
 		goto out;
+	}
 
 	err = ubifs_lpt_init(c, 0, 1);
 	if (err)
@@ -2063,8 +2065,10 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	}
 
 	sb->s_root = d_make_root(root);
-	if (!sb->s_root)
+	if (!sb->s_root) {
+		err = -ENOMEM;
 		goto out_umount;
+	}
 
 	mutex_unlock(&c->umount_mutex);
 	return 0;
