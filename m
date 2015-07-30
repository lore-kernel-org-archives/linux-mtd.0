Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgni-0006Ib-87
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:44 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 21/35] ubifs: disable quota in ubifs_put_super
Date: Thu, 30 Jul 2015 13:48:17 +0800
Message-ID: <1438235311-23788-22-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

We need to disable quota in umounting ubifs. So we have to
disable quota in ubifs_put_super(). But quota disable will
write quota file, and we have to budget for it.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 3609d7b..7031c16 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2027,6 +2027,8 @@ static void ubifs_put_super(struct super_block *sb)
 
 	ubifs_msg(c, "un-mount UBI device %d", c->vi.ubi_num);
 
+	if (!c->ro_mount)
+		dquot_disable(sb, -1, DQUOT_USAGE_ENABLED | DQUOT_LIMITS_ENABLED);
 	/*
 	 * The following asserts are only valid if there has not been a failure
 	 * of the media. For example, there will be dirty inodes if we failed
-- 
1.8.4.2
