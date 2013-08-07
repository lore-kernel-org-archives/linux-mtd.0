Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6xzP-0006Bi-Gz
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 07:17:01 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MR5002I6G7OCKA0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 16:16:36 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
References: 
In-reply-to: 
Subject: [PATCH 5/7] mtd: spear_smi: add missing __iomem annotation
Date: Wed, 07 Aug 2013 16:16:36 +0900
Message-id: <004501ce933e$0d7267e0$285737a0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: Jingoo Han <jg1.han@samsung.com>, linux-mtd@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@st.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added missing __iomem annotation in order to fix the following
sparse warnings:

drivers/mtd/devices/spear_smi.c:566:13: warning: incorrect type in assignment (different address spaces)
drivers/mtd/devices/spear_smi.c:566:13:    expected void *src
drivers/mtd/devices/spear_smi.c:566:13:    got void [noderef] <asn:2>*
drivers/mtd/devices/spear_smi.c:586:9: warning: incorrect type in argument 2 (different address spaces)
drivers/mtd/devices/spear_smi.c:586:9:    expected void const volatile [noderef] <asn:2>*<noident>
drivers/mtd/devices/spear_smi.c:586:9:    got unsigned char [usertype] *<noident>
drivers/mtd/devices/spear_smi.c:659:14: warning: incorrect type in assignment (different address spaces)
drivers/mtd/devices/spear_smi.c:659:14:    expected void *dest
drivers/mtd/devices/spear_smi.c:659:14:    got void [noderef] <asn:2>*
drivers/mtd/devices/spear_smi.c:620:9: warning: incorrect type in argument 1 (different address spaces)
drivers/mtd/devices/spear_smi.c:620:9:    expected void volatile [noderef] <asn:2>*<noident>
drivers/mtd/devices/spear_smi.c:620:9:    got void *dest
drivers/mtd/devices/spear_smi.c:620:9: warning: incorrect type in argument 1 (different address spaces)
drivers/mtd/devices/spear_smi.c:620:9:    expected void volatile [noderef] <asn:2>*<noident>
drivers/mtd/devices/spear_smi.c:620:9:    got void *dest
drivers/mtd/devices/spear_smi.c:620:9: warning: incorrect type in argument 1 (different address spaces)
drivers/mtd/devices/spear_smi.c:620:9:    expected void volatile [noderef] <asn:2>*<noident>
drivers/mtd/devices/spear_smi.c:620:9:    got void *dest

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/devices/spear_smi.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 092bb68..4238214 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -550,7 +550,7 @@ static int spear_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 {
 	struct spear_snor_flash *flash = get_flash_data(mtd);
 	struct spear_smi *dev = mtd->priv;
-	void *src;
+	void __iomem *src;
 	u32 ctrlreg1, val;
 	int ret;
 
@@ -583,7 +583,7 @@ static int spear_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	writel(val, dev->io_base + SMI_CR1);
 
-	memcpy_fromio(buf, (u8 *)src, len);
+	memcpy_fromio(buf, src, len);
 
 	/* restore ctrl reg1 */
 	writel(ctrlreg1, dev->io_base + SMI_CR1);
@@ -596,7 +596,7 @@ static int spear_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 }
 
 static inline int spear_smi_cpy_toio(struct spear_smi *dev, u32 bank,
-		void *dest, const void *src, size_t len)
+		void __iomem *dest, const void *src, size_t len)
 {
 	int ret;
 	u32 ctrlreg1;
@@ -643,7 +643,7 @@ static int spear_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 {
 	struct spear_snor_flash *flash = get_flash_data(mtd);
 	struct spear_smi *dev = mtd->priv;
-	void *dest;
+	void __iomem *dest;
 	u32 page_offset, page_size;
 	int ret;
 
-- 
1.7.10.4
