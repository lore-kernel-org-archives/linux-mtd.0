Received: from secvs01.rockwellcollins.com ([205.175.225.240])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddcFY-00072P-IO
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 13:02:47 +0000
From: Matt Weber <matthew.weber@rockwellcollins.com>
To: linux-mtd@lists.infradead.org
Cc: sgtandel <sanjay.tandel@rockwellcollins.com>,
 Matt Weber <matthew.weber@rockwellcollins.com>
Subject: [PATCH] map-ram chip driver: 16-bit block transfer
Date: Fri,  4 Aug 2017 08:02:20 -0500
Message-Id: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: sgtandel <sanjay.tandel@rockwellcollins.com>

This patch adds 16-bit I/O memory write function (map_copy_to16) in map-ram
driver. map-ram driver's block write function(i.e map_copy_to) uses
memcpy_toio() function for block transfer. memcpy_toio() is limited to do
single byte write, irrespective of bankwidth. Therefore,
added map_copy_to16() function to be used by map-ram driver for block
transfers for chips that only supports word(16-bit) transfers. map-ram
driver's single entity read/write functions (such as map_read and
map_write) use bankwidth property(provided by DTS entry) and calls
appropriate readb/readw/readq function. For block write, there was no such
implementation found in map-ram driver. So map_copy_to() calls memcpy_toio
(which in turn calls writeb) for all block write, irrespective of
bankwidth. So wrong or corrupted data might be written into flash memory in
case chips that does not support 8-bit write. This patch adds a condition
in block write function (map_copy_to) to call map_copy_to16(), if bankwidth
is 2. This patch also adds map_copy_from16() function to be used for 16-bit
block read operation. map-ram driver's block read function
(i.e map_copy_from) uses memcpy_fromio() function for all block read,
irrespective of bankwidth. memcpy_fromio is limited to do single byte read.
Therefore, Added map_copy_from16() function to be used by map-ram driver
for block read for chips that only supports word(16-bit) transfers.
map-ram driver's single entity read/write functions (such as map_read and
map_write) already use bankwidth property(provided by DTS entry) and calls
appropriate readb/readw/readq function. For block read, there was no such
implementation found in map-ram driver. So map_copy_from() calls
memcpy_fromio() (which in turn calls writeb) for all block write,
irrespective of bankwidth. This patch adds a condition in block read
function (i.e map_copy_from) to call map_copy_from16(), if bankwidth is 2.

Signed-off-by: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 include/linux/mtd/map.h | 62 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 3aa56e3..3d7a296 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -449,17 +449,77 @@ static inline void inline_map_write(struct map_info *map, const map_word datum,
 	mb();
 }
 
+static void map_copy_from16(void *to, void __iomem *from, size_t count)
+{
+	const unsigned char *t = to;
+
+	if (!(IS_ALIGNED((u32)from, sizeof(u16)))) {
+		from = (void __iomem *)ALIGN((u32)from, sizeof(u16))
+							- sizeof(u16);
+		*(u8 *)t = (u8)((readw(from) & 0xff00) >> 8);
+		count--;
+		t++;
+		from += 2;
+	}
+	while (count >= 2) {
+		*(u16 *)t = readw(from);
+		count -= 2;
+		t += 2;
+		from += 2;
+	};
+	while (count > 0) {
+		*(u8 *)t = (u8)(readw(from) & 0x00ff);
+		count--;
+		t++;
+		from++;
+	}
+}
+
 static inline void inline_map_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
 {
 	if (map->cached)
 		memcpy(to, (char *)map->cached + from, len);
+	else if (map_bankwidth_is_2(map))
+		map_copy_from16(to, map->virt + from, len);
 	else
 		memcpy_fromio(to, map->virt + from, len);
 }
 
+static void map_copy_to16(void __iomem *to, const void *from, size_t count)
+{
+	const unsigned char *f = from;
+	u16 d;
+
+	if (!(IS_ALIGNED((u32)to, sizeof(u16)))) {
+		to = (void __iomem *)ALIGN((u32)to, sizeof(u16))
+							- sizeof(u16);
+		d = (readw(to) & 0x00ff) | ((u16)(*(const u8 *)f) << 8);
+		writew(d, to);
+		count--;
+		to += 2;
+		f++;
+	}
+	while (count >= 2) {
+		writew(*(const u16 *)f, to);
+		count -= 2;
+		to += 2;
+		f += 2;
+	};
+	while (count > 0) {
+		d = (readw(to) & 0xff00) | (u16)(*(const u8 *)f);
+		writew(d, to);
+		count--;
+		to++;
+		f++;
+	}
+}
+
 static inline void inline_map_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
 {
-	memcpy_toio(map->virt + to, from, len);
+	if (map_bankwidth_is_2(map))
+		map_copy_to16(map->virt + to, from, len);
+	else
+		memcpy_toio(map->virt + to, from, len);
 }
 
 #ifdef CONFIG_MTD_COMPLEX_MAPPINGS
-- 
1.9.1
