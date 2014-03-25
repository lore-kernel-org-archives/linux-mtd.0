Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbz-00029K-J3
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:32 +0000
Received: by mail-wi0-f169.google.com with SMTP id hm4so3171526wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:21:09 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 27/47] mtd: nand: stm_nand_bch: write IBBT to Flash
Date: Tue, 25 Mar 2014 08:19:44 +0000
Message-Id: <1395735604-26706-28-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Write BBT contents to the first page of a specified block, then
update the IBBT header and write it to last page of the same block.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 2d03113..76ed99b 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -541,6 +541,35 @@ static void bch_fill_ibbt_header(struct nandi_controller *nandi,
 	memcpy(ibbt_header->author, author, sizeof(author));
 }
 
+/* Write IBBT to Flash */
+static int bch_write_bbt_data(struct nandi_controller *nandi,
+			      struct nandi_bbt_info *bbt_info,
+			      uint32_t block, int bak, uint8_t vers)
+{
+	uint32_t page_size = nandi->info.mtd.writesize;
+	uint32_t block_size = nandi->info.mtd.erasesize;
+	struct nand_ibbt_bch_header *ibbt_header =
+		(struct nand_ibbt_bch_header *)nandi->page_buf;
+	loff_t offs;
+
+	nandi->cached_page = -1;
+
+	/* Write BBT contents to first page of block */
+	offs = (loff_t)block << nandi->block_shift;
+	if (bch_write_page(nandi, offs, bbt_info->bbt) & NAND_STATUS_FAIL)
+		return 1;
+
+	/* Update IBBT header and write to last page of block */
+	memset(ibbt_header, 0xff, nandi->info.mtd.writesize);
+	bch_fill_ibbt_header(nandi, ibbt_header, bak, vers);
+	offs += block_size - page_size;
+	if (bch_write_page(nandi, offs, (uint8_t *)ibbt_header) &
+	    NAND_STATUS_FAIL)
+		return 1;
+
+	return 0;
+}
+
 /* Scan block for IBBT signature */
 static int bch_find_ibbt_sig(struct nandi_controller *nandi,
 			     uint32_t block, int *bak, uint8_t *vers,
-- 
1.8.3.2
