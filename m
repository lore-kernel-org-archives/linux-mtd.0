Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqdQm-0007BT-Ja
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 10:23:56 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Yuanjie.Huang@windriver.com, raj.khem@gmail.com,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 1/5] Fix alignment trap triggered by NEON instructions
Date: Wed, 22 Mar 2017 11:22:53 +0100
Message-Id: <20170322102257.7605-2-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
References: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Yuanjie Huang <Yuanjie.Huang@windriver.com>

NEON instruction VLD1.64 was used to copy 64 bits data after type
casting, and they will trigger alignment trap.
This patch uses memcpy to avoid alignment problem.

Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 ubifs-utils/mkfs.ubifs/key.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/key.h b/ubifs-utils/mkfs.ubifs/key.h
index 39379fd..118858b 100644
--- a/ubifs-utils/mkfs.ubifs/key.h
+++ b/ubifs-utils/mkfs.ubifs/key.h
@@ -159,10 +159,12 @@ static inline void data_key_init(union ubifs_key *key, ino_t inum,
  */
 static inline void key_write(const union ubifs_key *from, void *to)
 {
-	union ubifs_key *t = to;
+	__le32 x[2];
 
-	t->j32[0] = cpu_to_le32(from->u32[0]);
-	t->j32[1] = cpu_to_le32(from->u32[1]);
+	x[0] = cpu_to_le32(from->u32[0]);
+	x[1] = cpu_to_le32(from->u32[1]);
+
+	memcpy(to, &x, 8);
 	memset(to + 8, 0, UBIFS_MAX_KEY_LEN - 8);
 }
 
@@ -174,10 +176,12 @@ static inline void key_write(const union ubifs_key *from, void *to)
  */
 static inline void key_write_idx(const union ubifs_key *from, void *to)
 {
-	union ubifs_key *t = to;
+	__le32 x[2];
+
+	x[0] = cpu_to_le32(from->u32[0]);
+	x[1] = cpu_to_le32(from->u32[1]);
 
-	t->j32[0] = cpu_to_le32(from->u32[0]);
-	t->j32[1] = cpu_to_le32(from->u32[1]);
+	memcpy(to, &x, 8);
 }
 
 /**
-- 
2.10.2
