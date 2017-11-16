Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eFG2P-0002I8-VJ
 for linux-mtd@lists.infradead.org; Thu, 16 Nov 2017 09:00:47 +0000
Received: by mail-yw0-x244.google.com with SMTP id k191so10369336ywe.1
 for <linux-mtd@lists.infradead.org>; Thu, 16 Nov 2017 01:00:24 -0800 (PST)
MIME-Version: 1.0
From: Rock Lee <rockdotlee@gmail.com>
Date: Thu, 16 Nov 2017 17:00:23 +0800
Message-ID: <CAL-1w2uRAccC60=asBxZNMQmEfmXVjgJLah7Tmvif=pp5HWnBA@mail.gmail.com>
Subject: [PATCH 1/2] libscan: fix a comment typo in libscan.h
To: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Rock Lee <rockdotlee@gmail.com>
---
 include/libscan.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/libscan.h b/include/libscan.h
index a2b8657..8401601 100644
--- a/include/libscan.h
+++ b/include/libscan.h
@@ -68,7 +68,7 @@ enum
  * @corrupted_cnt: count of eraseblocks with corrupted erase counter header
  * @alien_cnt: count of eraseblock containing non-ubi data
  * @bad_cnt: count of bad eraseblocks
- * @bad_cnt: count of non-bad eraseblocks
+ * @good_cnt: count of non-bad eraseblocks
  * @vid_hdr_offs: volume ID header offset from the found EC headers (%-1 means
  *                undefined)
  * @data_offs: data offset from the found EC headers (%-1 means undefined)
-- 
1.9.1
