Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9X-0002qt-4h
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:43:55 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 08/25] ubifs: fix a typo in comment of ubifs_budget_req
Date: Tue, 21 Jul 2015 16:37:39 +0800
Message-ID: <1437467876-22106-9-git-send-email-yangds.fnst@cn.fujitsu.com>
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
 fs/ubifs/ubifs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index de75902..6ef2415 100644
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
