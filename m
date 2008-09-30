Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZrf-0005FE-Az
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:41:47 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: fix commentary
Date: Tue, 30 Sep 2008 12:19:09 +0300
Message-Id: <1222766358-21886-14-git-send-email-dedekind@infradead.org>
In-Reply-To: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
References: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Znode may refer both data nodes and indexing nodes

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/ubifs.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c3ac5a8..49b06c9 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -707,8 +707,8 @@ struct ubifs_jhead {
  * struct ubifs_zbranch - key/coordinate/length branch stored in znodes.
  * @key: key
  * @znode: znode address in memory
- * @lnum: LEB number of the indexing node
- * @offs: offset of the indexing node within @lnum
+ * @lnum: LEB number of the target node (indexing node or data node)
+ * @offs: target node offset within @lnum
  * @len: target node length
  */
 struct ubifs_zbranch {
-- 
1.5.4.1
