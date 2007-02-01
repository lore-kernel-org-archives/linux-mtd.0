Received: from [210.94.41.89] (helo=july7)
	by pentafluge.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1HCR57-0007w2-GC
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 01:49:46 +0000
From: "Kyungmin Park" <kmpark@infradead.org>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] OneNAND: Reduce internal bufferram operation
Date: Thu, 1 Feb 2007 10:49:39 +0900
Message-ID: <005501c745a3$3fea1640$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] OneNAND: Reduce internal bufferram operation

It use blockpage instead of a pair (block, page). It can also cover a small
chunk access. 0x00, 0x20, 0x40 and so on.

And in JFFS2 behavior, sometimes it reads two pages alternatively.
e.g., It first reads A page, B page and A page.
So we check another bufferram to find requested page.

Any comments are welcome.

Thank you,
Kyungmin Park

--

diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
index 67efbc7..5c0d55f 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -577,19 +577,22 @@ static int onenand_write_bufferram(struct mtd_info
*mtd, int area,
 static int onenand_check_bufferram(struct mtd_info *mtd, loff_t addr)
 {
 	struct onenand_chip *this = mtd->priv;
-	int block, page;
-	int i;
+	int blockpage;
+	unsigned int i;
 
-	block = (int) (addr >> this->erase_shift);
-	page = (int) (addr >> this->page_shift) & this->page_mask;
+	blockpage = (int) (addr >> this->page_shift);
 
+	/* Is there valid data? */
 	i = ONENAND_CURRENT_BUFFERRAM(this);
+	if (this->bufferram[i].blockpage == blockpage)
+		return 1;
 
-	/* Is there valid data? */
-	if (this->bufferram[i].block == block &&
-	    this->bufferram[i].page == page &&
-	    this->bufferram[i].valid)
+	/* Check another BufferRAM */
+	i = ONENAND_NEXT_BUFFERRAM(this);
+	if (this->bufferram[i].blockpage == blockpage) {
+		ONENAND_SET_NEXT_BUFFERRAM(this);
 		return 1;
+	}
 
 	return 0;
 }
@@ -602,30 +605,26 @@ static int onenand_check_bufferram(struct mtd_info
*mtd, loff_t addr)
  *
  * Update BufferRAM information
  */
-static int onenand_update_bufferram(struct mtd_info *mtd, loff_t addr,
+static void onenand_update_bufferram(struct mtd_info *mtd, loff_t addr,
 		int valid)
 {
 	struct onenand_chip *this = mtd->priv;
-	int block, page;
-	int i;
+	int blockpage;
+	unsigned int i;
 
-	block = (int) (addr >> this->erase_shift);
-	page = (int) (addr >> this->page_shift) & this->page_mask;
+	blockpage = (int) (addr >> this->page_shift);
 
-	/* Invalidate BufferRAM */
-	for (i = 0; i < MAX_BUFFERRAM; i++) {
-		if (this->bufferram[i].block == block &&
-		    this->bufferram[i].page == page)
-			this->bufferram[i].valid = 0;
-	}
+	/* Invalidate another BufferRAM */
+	i = ONENAND_NEXT_BUFFERRAM(this);
+	if (this->bufferram[i].blockpage == blockpage)
+		this->bufferram[i].blockpage = -1;
 
 	/* Update BufferRAM */
 	i = ONENAND_CURRENT_BUFFERRAM(this);
-	this->bufferram[i].block = block;
-	this->bufferram[i].page = page;
-	this->bufferram[i].valid = valid;
-
-	return 0;
+	if (valid)
+		this->bufferram[i].blockpage = blockpage;
+	else
+		this->bufferram[i].blockpage = -1;
 }
 
 /**
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index a5e6c4b..543fa20 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -42,14 +42,10 @@ typedef enum {
 
 /**
  * struct onenand_bufferram - OneNAND BufferRAM Data
- * @block:		block address in BufferRAM
- * @page:		page address in BufferRAM
- * @valid:		valid flag
+ * @blockpage:		block & page address in BufferRAM
  */
 struct onenand_bufferram {
-	int block;
-	int page;
-	int valid;
+	int		blockpage;
 };
 
 /**
