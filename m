Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmF1-0002nf-OJ
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:32 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 21/39] ubifs: introduce i_dquot to ubifs_inode
Date: Tue, 15 Sep 2015 17:02:16 +0800
Message-ID: <1442307754-13233-22-git-send-email-yangds.fnst@cn.fujitsu.com>
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

This commit introduce i_dquot field to ubifs_inode,
this field will be used later to support quota in ubifs.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/ubifs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 4215c33..99cf10c 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -418,6 +418,9 @@ struct ubifs_inode {
 	loff_t synced_i_size;
 	loff_t ui_size;
 	int flags;
+#ifdef CONFIG_QUOTA
+	struct dquot *i_dquot[MAXQUOTAS];
+#endif
 	pgoff_t last_page_read;
 	pgoff_t read_in_a_row;
 	int data_len;
-- 
1.8.4.2
