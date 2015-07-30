Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnc-0006IZ-MU
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:38 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 13/35] ubifs: fix a typo in comment of ubifs_budget_req
Date: Thu, 30 Jul 2015 13:48:09 +0800
Message-ID: <1438235311-23788-14-git-send-email-yangds.fnst@cn.fujitsu.com>
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

s/now/how

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/ubifs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 216ba87..3b5e932 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -858,9 +858,9 @@ struct ubifs_compressor {
  * @mod_dent: non-zero if the operation removes or modifies an existing
  *            directory entry
  * @new_ino: non-zero if the operation adds a new inode
- * @new_ino_d: now much data newly created inode contains
+ * @new_ino_d: how much data newly created inode contains
  * @dirtied_ino: how many inodes the operation makes dirty
- * @dirtied_ino_d: now much data dirtied inode contains
+ * @dirtied_ino_d: how much data dirtied inode contains
  * @idx_growth: how much the index will supposedly grow
  * @data_growth: how much new data the operation will supposedly add
  * @dd_growth: how much data that makes other data dirty the operation will
-- 
1.8.4.2
