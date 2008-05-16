Date: Fri, 16 May 2008 13:45:08 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: dedekind@infradead.org, ext-adrian.hunter@nokia.com
Subject: [RFC][PATCH][MTD][OneNAND] Fix OneNAND byte access
Message-ID: <20080516044508.GA28048@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some upper layer try to read unaligned offset access
So it adjusts the buffer, offset, and count variables

/ # mount -t ubifs ubi0 /mnt
UBIFS: recovery needed
onenand_read_bufferram[528] 0 11	<- Unaligned count
onenand_read_bufferram[514] 91 12	<- Unaligned offset
onenand_read_bufferram[528] 92 11
onenand_read_bufferram[528] 74 17
onenand_read_bufferram[514] 103 17	<- Unaligned offset
onenand_read_bufferram[514] 11 17
onenand_read_bufferram[514] 137 17
onenand_read_bufferram[528] 120 17
onenand_read_bufferram[528] 40 17
onenand_read_bufferram[514] 57 17
onenand_read_bufferram[528] 632 61
onenand_read_bufferram[528] 360 61
onenand_read_bufferram[528] 80 61

It's only optimization at driver level

I think it's the best that it handles at UBIFS itself
e.g., Now it passed down from name handling
If the size of name is odd how about pad it even?

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 5d7965f..49194b6 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -509,9 +509,23 @@ static int onenand_read_bufferram(struct mtd_info *mtd, int area,
 
 	bufferram += onenand_bufferram_offset(mtd, area);
 
+	if (ONENAND_CHECK_BYTE_ACCESS(offset)) {
+		unsigned short word;
+		printk("%s[%d] %d %zd\n", __func__, __LINE__, offset, count);
+
+		/* Align with word(16-bit) size */
+		/* Read word and save byte */
+		word = this->read_word(bufferram + offset - 1);
+		buffer[0] = (word & 0xff00) >> 8;
+		buffer++;
+		offset++;
+		count--;
+	}
+
 	if (ONENAND_CHECK_BYTE_ACCESS(count)) {
 		unsigned short word;
 
+		printk("%s[%d] %d %zd\n", __func__, __LINE__, offset, count);
 		/* Align with word(16-bit) size */
 		count--;
 
