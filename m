Received: from relay1.mentorg.com ([192.94.38.131])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U0xaz-00052Y-Lh
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2013 17:06:43 +0000
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: map: BUG() in non handled cases
Date: Thu, 31 Jan 2013 21:06:34 +0400
Message-ID: <1359651994-27363-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Several map-related functions look like a serie of ifs, checking
widths of map. Those functions do not have any handling for default
case. Instead of fiddling with uninitialized_var in those functions,
let's just add a (correct) BUG() to the default case on those maps. This
will also allow us to catch potential errors in maps setup in future.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 include/linux/mtd/map.h |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index f6eb433..1d6ef97 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -328,7 +328,7 @@ static inline int map_word_bitsset(struct map_info *map, map_word val1, map_word
 
 static inline map_word map_word_load(struct map_info *map, const void *ptr)
 {
-	map_word r = {{0} };
+	map_word r;
 
 	if (map_bankwidth_is_1(map))
 		r.x[0] = *(unsigned char *)ptr;
@@ -342,6 +342,8 @@ static inline map_word map_word_load(struct map_info *map, const void *ptr)
 #endif
 	else if (map_bankwidth_is_large(map))
 		memcpy(r.x, ptr, map->bankwidth);
+	else
+		BUG();
 
 	return r;
 }
@@ -391,7 +393,7 @@ static inline map_word map_word_ff(struct map_info *map)
 
 static inline map_word inline_map_read(struct map_info *map, unsigned long ofs)
 {
-	map_word uninitialized_var(r);
+	map_word r;
 
 	if (map_bankwidth_is_1(map))
 		r.x[0] = __raw_readb(map->virt + ofs);
@@ -425,6 +427,8 @@ static inline void inline_map_write(struct map_info *map, const map_word datum,
 #endif
 	else if (map_bankwidth_is_large(map))
 		memcpy_toio(map->virt+ofs, datum.x, map->bankwidth);
+	else
+		BUG();
 	mb();
 }
 
-- 
1.7.10.4
