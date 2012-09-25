Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGM1b-000690-UX
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 03:41:33 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so1915646pad.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 20:41:31 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/9] mtd: nand: add generic READ ID length calculation
 functions
Date: Mon, 24 Sep 2012 20:40:52 -0700
Message-Id: <1348544455-17656-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
References: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
Cc: Angus Clark <angus.clark@st.com>, Mike Dunn <mikedunn@newsguy.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When decoding the extended ID bytes of a NAND chip, we have to calculate the ID
length according to some heuristic patterns (e.g., Does the ID wrap around?
Does it end in trailing zeros?). Currently, these heuristics are built into
complicated if/else blocks that can be hard to understand.

Now, these checks can be done generically in a function, making them more
robust and reusable. In fact, this sort of calculation is needed in future
additions to nand_base.c. And with this advancement, we get the added benefit
of a more readable "extended ID decode".

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 72 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 380f783..fd5c307 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2862,6 +2862,65 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /*
+ * nand_id_has_period - Check if an ID string has a given wraparound period
+ * @id_data: the ID string
+ * @arrlen: the length of the @id_data array
+ * @period: the period of repitition
+ *
+ * Check if an ID string is repeated within a given sequence of bytes at
+ * specific repetition interval period (e.g., {0x20,0x01,0x7F,0x20} has a
+ * period of 2). This is a helper function for nand_id_len(). Returns non-zero
+ * if the repetition has a period of @period; otherwise, returns zero.
+ */
+static int nand_id_has_period(u8 *id_data, int arrlen, int period)
+{
+	int i, j;
+	for (i = 0; i < period; i++)
+		for (j = i + period; j < arrlen; j += period)
+			if (id_data[i] != id_data[j])
+				return 0;
+	return 1;
+}
+
+/*
+ * nand_id_len - Get the length of an ID string returned by CMD_READID
+ * @id_data: the ID string
+ * @arrlen: the length of the @id_data array
+
+ * Returns the length of the ID string, according to known wraparound/trailing
+ * zero patterns. If no pattern exists, returns the length of the array.
+ */
+static int nand_id_len(u8 *id_data, int arrlen)
+{
+	int last_nonzero, period;
+
+	/* Find last non-zero byte */
+	for (last_nonzero = arrlen - 1; last_nonzero >= 0; last_nonzero--)
+		if (id_data[last_nonzero])
+			break;
+
+	/* All zeros */
+	if (last_nonzero < 0)
+		return 0;
+
+	/* Calculate wraparound period */
+	for (period = 1; period < arrlen; period++)
+		if (nand_id_has_period(id_data, arrlen, period))
+			break;
+
+	/* There's a repeated pattern */
+	if (period < arrlen)
+		return period;
+
+	/* There are trailing zeros */
+	if (last_nonzero < arrlen - 1)
+		return last_nonzero + 1;
+
+	/* No pattern detected */
+	return arrlen;
+}
+
+/*
  * Many new NAND share similar device ID codes, which represent the size of the
  * chip. The rest of the parameters must be decoded according to generic or
  * manufacturer-specific "extended ID" decoding patterns.
@@ -2869,24 +2928,23 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 				u8 id_data[8], int *busw)
 {
-	int extid;
+	int extid, id_len;
 	/* The 3rd id byte holds MLC / multichip data */
 	chip->cellinfo = id_data[2];
 	/* The 4th id byte is the important one */
 	extid = id_data[3];
 
+	id_len = nand_id_len(id_data, 8);
+
 	/*
 	 * Field definitions are in the following datasheets:
 	 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
 	 * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
 	 *
-	 * Check for wraparound + Samsung ID + nonzero 6th byte
-	 * to decide what to do.
+	 * Check for ID length + Samsung ID to decide what to do.
 	 */
-	if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
-			id_data[0] == NAND_MFR_SAMSUNG &&
-			(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
-			id_data[5] != 0x00) {
+	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
+			(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
 		/* Calc pagesize */
 		mtd->writesize = 2048 << (extid & 0x03);
 		extid >>= 2;
-- 
1.7.11.3
