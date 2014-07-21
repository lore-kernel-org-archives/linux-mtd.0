Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9KV7-0008OM-MZ
 for linux-mtd@lists.infradead.org; Mon, 21 Jul 2014 20:48:02 +0000
From: Jonas Gorski <jogo@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd: simple_map: make NO_XIP actually prevent unaligned
 accesses
Date: Mon, 21 Jul 2014 22:47:26 +0200
Message-Id: <1405975648-25375-2-git-send-email-jogo@openwrt.org>
In-Reply-To: <1405975648-25375-1-git-send-email-jogo@openwrt.org>
References: <1405975648-25375-1-git-send-email-jogo@openwrt.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 Gregory Fong <gregory.0xf0@gmail.com>, Maxime Bizon <mbizon@freebox.fr>,
 Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some mapping drivers set the map->phys pointer to NO_XIP intending to
mean "no unaligned accesses" (see also the DT property of physmap_of).
But simple mapping read_from/write_to still just call memcpy, which will
do unaligned reads/writes at least on mips.

To work around this, make the inline version check for NO_XIP and do a byte
wise copy if "to" or "from" is unaligned.

Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
 include/linux/mtd/map.h | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 5f487d7..92a8a0a 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -435,15 +435,35 @@ static inline void inline_map_write(struct map_info *map, const map_word datum,
 
 static inline void inline_map_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
 {
-	if (map->cached)
+	if (map->cached) {
 		memcpy(to, (char *)map->cached + from, len);
-	else
+	} else if (map->phys != NO_XIP ||
+		   (IS_ALIGNED((unsigned long)to, sizeof(long)) &&
+		    IS_ALIGNED((unsigned long)map->virt + from,
+			       sizeof(long)))) {
 		memcpy_fromio(to, map->virt + from, len);
+	} else {
+		void __iomem *src = map->virt + from;
+		char *dst = (char *)to;
+
+		while (len--)
+			*dst++ = readb(src++);
+	}
 }
 
 static inline void inline_map_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
 {
-	memcpy_toio(map->virt + to, from, len);
+	if (map->phys != NO_XIP ||
+	    (IS_ALIGNED((unsigned long)map->virt + to, sizeof(long)) &&
+	     IS_ALIGNED((unsigned long)from, sizeof(long)))) {
+		memcpy_toio(map->virt + to, from, len);
+	} else {
+		char *src = (char *)from;
+		void __iomem *dst = map->virt + to;
+
+		while (len--)
+			writeb(*src++, dst++);
+	}
 }
 
 #ifdef CONFIG_MTD_COMPLEX_MAPPINGS
-- 
2.0.0
