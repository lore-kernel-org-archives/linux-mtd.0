Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmF3-0002kO-PU
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:35 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 24/39] ubifs: write quota back in ubifs_sync
Date: Tue, 15 Sep 2015 17:02:19 +0800
Message-ID: <1442307754-13233-25-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Call dquot_writeback_dquots to write quota back in ubifs_sync

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Reviewed-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 5a22595..2b07709 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -462,6 +462,8 @@ static int ubifs_sync_fs(struct super_block *sb, int wait)
 	if (!wait)
 		return 0;
 
+	dquot_writeback_dquots(sb, -1);
+
 	/*
 	 * Synchronize write buffers, because 'ubifs_run_commit()' does not
 	 * do this if it waits for an already running commit.
-- 
1.8.4.2
