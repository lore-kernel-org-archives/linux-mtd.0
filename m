Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T5yWD-0003T0-ID
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 12:34:14 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/3] UBIFS: use __aligned() attribute
Date: Mon, 27 Aug 2012 15:34:18 +0300
Message-Id: <1346070860-17573-1-git-send-email-dedekind1@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

.. instead of __attribute__((aligned())).

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/commit.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 8eda717..e0adbb0 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -514,7 +514,7 @@ struct idx_node {
 	struct list_head list;
 	int iip;
 	union ubifs_key upper_key;
-	struct ubifs_idx_node idx __attribute__((aligned(8)));
+	struct ubifs_idx_node idx __aligned(8)
 };
 
 /**
-- 
1.7.10.4
