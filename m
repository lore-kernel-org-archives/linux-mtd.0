Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9d-0002qj-TB
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:44:03 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 17/25] ubifs: suspend & resume quota properly in ubifs_remount
Date: Tue, 21 Jul 2015 16:37:48 +0800
Message-ID: <1437467876-22106-18-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b8cc291..0638436 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2125,6 +2125,7 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 			ubifs_msg(c, "cannot re-mount R/W - UBI volume is R/O");
 			return -EROFS;
 		}
+		dquot_resume(sb, -1);
 		err = ubifs_remount_rw(c);
 		if (err)
 			return err;
@@ -2133,6 +2134,7 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 			ubifs_msg(c, "cannot re-mount R/O due to prior errors");
 			return -EROFS;
 		}
+		dquot_suspend(sb, -1);
 		ubifs_remount_ro(c);
 	}
 
-- 
1.8.4.2
