Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsU9e-0001KF-Vq
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 11:17:04 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, yangds.fnst@cn.fujitsu.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 06/11] ubifs: keep scan buffer in ubifs_info
Date: Sat, 31 Oct 2015 12:15:55 +0100
Message-Id: <1446290160-30696-7-git-send-email-richard@nod.at>
In-Reply-To: <1446290160-30696-1-git-send-email-richard@nod.at>
References: <1446290160-30696-1-git-send-email-richard@nod.at>
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
index 3696f1a..d2ddd0a 100644
--- a/ubifs-utils/include/ubifs.h
+++ b/ubifs-utils/include/ubifs.h
@@ -320,6 +320,7 @@ enum {
  * @vi: UBI volume information
  *
  * @gc_lnum: LEB number used for garbage collection
+ * @sbuf: a buffer of LEB size used by GC and replay for scanning
  * @rp_size: reserved pool size
  *
  * @space_bits: number of bits needed to record free or dirty space
@@ -398,6 +399,7 @@ struct ubifs_info
 	struct ubi_vol_info vi;
 
 	int gc_lnum;
+	void *sbuf;
 	long long rp_size;
 
 	int space_bits;
diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
index 68c2895..c8e3439 100644
--- a/ubifs-utils/ubifs_dump/ubifs_dump.c
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -994,6 +994,7 @@ static int dump()
 		err = -ENOMEM;
 		goto out;
 	}
+	c->sbuf = leb_buf;
 
 	err = dump_master();
 	if (err)
-- 
2.5.0
