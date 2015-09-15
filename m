Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmF4-0002nf-W5
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:36 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 26/39] ubifs: suspend & resume quota properly in
 ubifs_remount
Date: Tue, 15 Sep 2015 17:02:21 +0800
Message-ID: <1442307754-13233-27-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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
Reviewed-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 59cdfc2..cc2988f 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2014,11 +2014,17 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 		err = ubifs_remount_rw(c);
 		if (err)
 			return err;
+		err = dquot_resume(sb, -1);
+		if (err)
+			return err;
 	} else if (!c->ro_mount && (*flags & MS_RDONLY)) {
 		if (c->ro_error) {
 			ubifs_msg(c, "cannot re-mount R/O due to prior errors");
 			return -EROFS;
 		}
+		err = dquot_suspend(sb, -1);
+		if (err)
+			return err;
 		ubifs_remount_ro(c);
 	}
 
-- 
1.8.4.2
