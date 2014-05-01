Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wfnkx-0002u9-GO
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:20 +0000
Received: by mail-wi0-f176.google.com with SMTP id f8so407228wiw.15
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:57 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 24/47] mtd: nand: stm_nand_bch: check erased page for zeros
Date: Thu,  1 May 2014 10:56:31 +0100
Message-Id: <1398938214-17847-25-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Detect an erased page, tolerating and correcting up to a specified number
of bits at '0'. Downgrade uncorrectable ECC error for an erased page,
tolerating 'sectors_per_page' bits at '0'.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 6d7ab79..2ff72c9 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -486,6 +486,33 @@ static uint8_t bch_erase_block(struct nandi_controller *nandi,
 }
 
 /*
+ * Detect an erased page, tolerating and correcting up to a specified number of
+ * bits at '0'.  (For many devices, it is now deemed within spec for an erased
+ * page to include a number of bits at '0', either as a result of read-disturb
+ * behaviour or 'stuck-at-zero' failures.)  Returns the number of corrected
+ * bits, or a '-1' if we have exceeded the maximum number of bits at '0' (likely
+ * to be a genuine uncorrectable ECC error).  In the latter case, the data must
+ * be returned unmodified, in accordance with the MTD API.
+ */
+static int check_erased_page(uint8_t *data, uint32_t page_size, int max_zeros)
+{
+	uint8_t *b = data;
+	int zeros = 0;
+	int i;
+
+	for (i = 0; i < page_size; i++) {
+		zeros += hweight8(~*b++);
+		if (zeros > max_zeros)
+			return -1;
+	}
+
+	if (zeros)
+		memset(data, 0xff, page_size);
+
+	return zeros;
+}
+
+/*
  * Initialisation
  */
 static int bch_check_compatibility(struct nandi_controller *nandi,
-- 
1.8.3.2
