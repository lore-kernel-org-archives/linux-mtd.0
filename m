Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwBB-0001wk-R6
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:50:56 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 33/38] ubifs: keep scan buffer in ubifs_info
Date: Mon, 21 Dec 2015 16:41:56 +0800
Message-ID: <1450687321-12381-34-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

From: David Gstir <david@sigma-star.at>

Like in der kernel's UBIFS code, we keep a single scan buffer in the ubifs_info
struct for all scan-related functions to use.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/include/ubifs.h         | 2 ++
 ubifs-utils/ubifs_dump/ubifs_dump.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/ubifs-utils/include/ubifs.h b/ubifs-utils/include/ubifs.h
index 1678663..4a3212f 100644
--- a/ubifs-utils/include/ubifs.h
+++ b/ubifs-utils/include/ubifs.h
@@ -329,6 +329,7 @@ enum {
  * @vi: UBI volume information
  *
  * @gc_lnum: LEB number used for garbage collection
+ * @sbuf: a buffer of LEB size used by GC and replay for scanning
  * @rp_size: reserved pool size
  *
  * @space_bits: number of bits needed to record free or dirty space
@@ -407,6 +408,7 @@ struct ubifs_info
 	struct ubi_vol_info vi;
 
 	int gc_lnum;
+	void *sbuf;
 	long long rp_size;
 
 	int space_bits;
diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
index fe2aaf4..4cbf755 100644
--- a/ubifs-utils/ubifs_dump/ubifs_dump.c
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -991,6 +991,7 @@ static int dump()
 		err = -ENOMEM;
 		goto out;
 	}
+	c->sbuf = leb_buf;
 
 	err = dump_master();
 	if (err)
-- 
1.8.4.2
