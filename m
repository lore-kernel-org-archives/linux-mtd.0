Received: from mail-db5eur01on0105.outbound.protection.outlook.com
 ([104.47.2.105] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byevV-0007Yz-C2
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 13:04:36 +0000
From: <marcin.krzeminski@nokia.com>
To: <linux-mtd@lists.infradead.org>
CC: <rfsw-patches@mlist.nokia.com>, <cyrille.pitchen@atmel.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <marek.vasut@gmail.com>
Subject: [PATCH 2/3] mtd: spi-nor: Implement die erase command logic
Date: Mon, 24 Oct 2016 15:03:33 +0200
Message-ID: <1477314214-17718-3-git-send-email-marcin.krzeminski@nokia.com>
In-Reply-To: <1477314214-17718-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1477314214-17718-1-git-send-email-marcin.krzeminski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

This commit implements die erase logic.
Sector at a time procedure is moved to function,
then erase algorithm will try to use die erase cmd
if size and address cover one or more dies.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 90 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 78 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3afe207..17bbec0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -360,6 +360,29 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 	return nor->write_reg(nor, nor->erase_opcode, buf, nor->addr_width);
 }
 
+static inline int spi_nor_sector_at_time_erase(struct mtd_info *mtd, u32 addr, u32 len)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	int ret = 0;
+
+	while (len) {
+		write_enable(nor);
+
+		ret = spi_nor_erase_sector(nor, addr);
+		if (ret)
+			return ret;
+
+		addr += mtd->erasesize;
+		len -= mtd->erasesize;
+
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
 /*
  * Erase an address range on the nor chip.  The address range may extend
  * one or more erase sectors.  Return an error is there is a problem erasing.
@@ -367,9 +390,11 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	u32 addr, len;
+	u32 addr, len, die_no, die_size;
 	uint32_t rem;
 	int ret;
+	unsigned long timeout;
+	u8 die_erase = nor->die_cnt && SNOR_F_DIE_ERASE;
 
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
 			(long long)instr->len);
@@ -386,7 +411,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		return ret;
 
 	/* whole-chip erase? */
-	if (len == mtd->size) {
+	if (len == mtd->size && !die_erase) {
 		unsigned long timeout;
 
 		write_enable(nor);
@@ -416,17 +441,58 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 	/* "sector"-at-a-time erase */
 	} else {
-		while (len) {
-			write_enable(nor);
-
-			ret = spi_nor_erase_sector(nor, addr);
-			if (ret)
+		if (die_erase) {
+			die_size = div_u64_rem(mtd->size, nor->die_cnt, &rem);
+			if (rem) {
+				ret = -EINVAL;
 				goto erase_err;
-
-			addr += mtd->erasesize;
-			len -= mtd->erasesize;
-
-			ret = spi_nor_wait_till_ready(nor);
+			}
+			while (len) {
+				die_no = div_u64_rem(addr, die_size, &rem);
+
+				/* Check if address is aligned to die begin*/
+				if (!rem) {
+					/* die erase? */
+					if (len >= die_size) {
+						ret = spi_nor_die_erase(nor, addr);
+						if (ret)
+							goto erase_err;
+
+						len -= die_size;
+						addr += die_size;
+
+						timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
+								CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
+								(unsigned long)(die_size / SZ_2M));
+						ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
+						if (ret)
+							goto erase_err;
+					} else {
+						ret = spi_nor_sector_at_time_erase(mtd, addr, len);
+						if (ret)
+							goto erase_err;
+						len = 0;
+					}
+				} else {
+					/* check if end address cover at least one die */
+					if (div64_ul(addr + len, die_size) > ++die_no) {
+						/* align to next die */
+						rem = die_size - rem;
+						ret = spi_nor_sector_at_time_erase(mtd, addr, rem);
+						if (ret)
+							goto erase_err;
+						len -= rem;
+						addr += rem;
+					} else {
+						ret = spi_nor_sector_at_time_erase(mtd, addr, len);
+						if (ret)
+							goto erase_err;
+						len = 0;
+					}
+				}
+			}
+		} else {
+			ret = spi_nor_sector_at_time_erase(mtd, addr, len);
 			if (ret)
 				goto erase_err;
 		}
-- 
2.7.4
