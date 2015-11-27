Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a2J8b-0003yr-FQ
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2015 13:32:41 +0000
From: <panxuesong@huawei.com>
To: <linux-mtd@lists.infradead.org>
CC: <zhihui.gao@huawei.com>, <chenjie6@huawei.com>, panxuesong
 <panxuesong@huawei.com>, <stable@vger.kernel.org>
Subject: [PATCH] jffs2: fix double free jffs2_sb_info when jffs2_parse_options
 failed
Date: Fri, 27 Nov 2015 21:15:30 +0800
Message-ID: <1448630130-8640-1-git-send-email-panxuesong@huawei.com>
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

From: panxuesong <panxuesong@huawei.com>

When mount jffs2 passing a invalid argument, such as "compr=xxx". 
In jffs2_fill_super , function jffs2_parse_options will return failed 
and then will free jffs2_sb_info for the first time.

While jffs2_fill_super failed, would call jffs2_kill_sb, 
which will free jffs2_sb_info for the second time.

static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
{
	......
	ret = jffs2_parse_options(c, data);
	if (ret) {
		kfree(c);
		return -EINVAL;
	}

	......
}

static void jffs2_kill_sb(struct super_block *sb)
{
	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
	if (!(sb->s_flags & MS_RDONLY))
		jffs2_stop_garbage_collect_thread(c);
	kill_mtd_super(sb);
	kfree(c);
}

Cc: <stable@vger.kernel.org>
Signed-off-by: Pan Xuesong <panxuesong@huawei.com>

---
 fs/jffs2/super.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index d86c5e3..20b4d84 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -286,7 +286,6 @@ static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
 
 	ret = jffs2_parse_options(c, data);
 	if (ret) {
-		kfree(c);
 		return -EINVAL;
 	}
 
-- 
1.8.0
