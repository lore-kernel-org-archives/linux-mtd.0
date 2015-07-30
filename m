Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnk-0006Ib-M6
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:46 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 23/35] ubifs: set/clear MS_RDONLY properly in ubifs_remount
Date: Thu, 30 Jul 2015 13:48:19 +0800
Message-ID: <1438235311-23788-24-git-send-email-yangds.fnst@cn.fujitsu.com>
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

We need to set or clear MS_RDONLY in remounting.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 9fdfd69..6ed35e2 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1953,6 +1953,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		 */
 		err = dbg_check_space_info(c);
 	}
+	c->vfs_sb->s_flags &= ~MS_RDONLY;
 
 	mutex_unlock(&c->umount_mutex);
 	return err;
@@ -2019,6 +2020,7 @@ static void ubifs_remount_ro(struct ubifs_info *c)
 	err = dbg_check_space_info(c);
 	if (err)
 		ubifs_ro_mode(c, err);
+	c->vfs_sb->s_flags |= MS_RDONLY;
 	mutex_unlock(&c->umount_mutex);
 }
 
-- 
1.8.4.2
