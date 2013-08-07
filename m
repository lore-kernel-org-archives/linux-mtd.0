Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6xxU-00067x-7E
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 07:15:02 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MR500DT3G4FVLE0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 16:14:39 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 4/7] mtd: r852: Staticize local symbols
Date: Wed, 07 Aug 2013 16:14:38 +0900
Message-id: <004301ce933d$c7644b10$562ce130$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, Jingoo Han <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Maxim Levitsky' <maximlevitsky@gmail.com>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These local symbols are used only in this file.
Fix the following sparse warnings:

drivers/mtd/nand/r852.c:232:6: warning: symbol 'r852_write_buf' was not declared. Should it be static?
drivers/mtd/nand/r852.c:264:6: warning: symbol 'r852_read_buf' was not declared. Should it be static?
drivers/mtd/nand/r852.c:315:6: warning: symbol 'r852_cmdctl' was not declared. Should it be static?
drivers/mtd/nand/r852.c:360:5: warning: symbol 'r852_wait' was not declared. Should it be static?
drivers/mtd/nand/r852.c:389:5: warning: symbol 'r852_ready' was not declared. Should it be static?
drivers/mtd/nand/r852.c:400:6: warning: symbol 'r852_ecc_hwctl' was not declared. Should it be static?
drivers/mtd/nand/r852.c:432:5: warning: symbol 'r852_ecc_calculate' was not declared. Should it be static?
drivers/mtd/nand/r852.c:464:5: warning: symbol 'r852_ecc_correct' was not declared. Should it be static?
drivers/mtd/nand/r852.c:532:6: warning: symbol 'r852_engine_enable' was not declared. Should it be static?
drivers/mtd/nand/r852.c:550:6: warning: symbol 'r852_engine_disable' was not declared. Should it be static?
drivers/mtd/nand/r852.c:560:6: warning: symbol 'r852_card_update_present' was not declared. Should it be static?
drivers/mtd/nand/r852.c:575:6: warning: symbol 'r852_update_card_detect' was not declared. Should it be static?
drivers/mtd/nand/r852.c:589:9: warning: symbol 'r852_media_type_show' was not declared. Should it be static?
drivers/mtd/nand/r852.c:600:1: warning: symbol 'dev_attr_media_type' was not declared. Should it be static?
drivers/mtd/nand/r852.c:604:6: warning: symbol 'r852_update_media_status' was not declared. Should it be static?
drivers/mtd/nand/r852.c:633:5: warning: symbol 'r852_register_nand_device' was not declared. Should it be static?
drivers/mtd/nand/r852.c:671:6: warning: symbol 'r852_unregister_nand_device' was not declared. Should it be static?
drivers/mtd/nand/r852.c:685:6: warning: symbol 'r852_card_detect_work' was not declared. Should it be static?
drivers/mtd/nand/r852.c:824:6: warning: symbol 'r852_probe' was not declared. Should it be static?
drivers/mtd/nand/r852.c:964:6: warning: symbol 'r852_remove' was not declared. Should it be static?
drivers/mtd/nand/r852.c:995:6: warning: symbol 'r852_shutdown' was not declared. Should it be static?

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/r852.c |   44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index ef72884..9dcf02d 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -229,7 +229,7 @@ static void r852_do_dma(struct r852_device *dev, uint8_t *buf, int do_read)
 /*
  * Program data lines of the nand chip to send data to it
  */
-void r852_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
+static void r852_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
 	struct r852_device *dev = r852_get_dev(mtd);
 	uint32_t reg;
@@ -261,7 +261,7 @@ void r852_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 /*
  * Read data lines of the nand chip to retrieve data
  */
-void r852_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
+static void r852_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	struct r852_device *dev = r852_get_dev(mtd);
 	uint32_t reg;
@@ -312,7 +312,7 @@ static uint8_t r852_read_byte(struct mtd_info *mtd)
 /*
  * Control several chip lines & send commands
  */
-void r852_cmdctl(struct mtd_info *mtd, int dat, unsigned int ctrl)
+static void r852_cmdctl(struct mtd_info *mtd, int dat, unsigned int ctrl)
 {
 	struct r852_device *dev = r852_get_dev(mtd);
 
@@ -357,7 +357,7 @@ void r852_cmdctl(struct mtd_info *mtd, int dat, unsigned int ctrl)
  * Wait till card is ready.
  * based on nand_wait, but returns errors on DMA error
  */
-int r852_wait(struct mtd_info *mtd, struct nand_chip *chip)
+static int r852_wait(struct mtd_info *mtd, struct nand_chip *chip)
 {
 	struct r852_device *dev = chip->priv;
 
@@ -386,7 +386,7 @@ int r852_wait(struct mtd_info *mtd, struct nand_chip *chip)
  * Check if card is ready
  */
 
-int r852_ready(struct mtd_info *mtd)
+static int r852_ready(struct mtd_info *mtd)
 {
 	struct r852_device *dev = r852_get_dev(mtd);
 	return !(r852_read_reg(dev, R852_CARD_STA) & R852_CARD_STA_BUSY);
@@ -397,7 +397,7 @@ int r852_ready(struct mtd_info *mtd)
  * Set ECC engine mode
 */
 
-void r852_ecc_hwctl(struct mtd_info *mtd, int mode)
+static void r852_ecc_hwctl(struct mtd_info *mtd, int mode)
 {
 	struct r852_device *dev = r852_get_dev(mtd);
 
@@ -429,7 +429,7 @@ void r852_ecc_hwctl(struct mtd_info *mtd, int mode)
  * Calculate ECC, only used for writes
  */
 
-int r852_ecc_calculate(struct mtd_info *mtd, const uint8_t *dat,
+static int r852_ecc_calculate(struct mtd_info *mtd, const uint8_t *dat,
 							uint8_t *ecc_code)
 {
 	struct r852_device *dev = r852_get_dev(mtd);
@@ -461,7 +461,7 @@ int r852_ecc_calculate(struct mtd_info *mtd, const uint8_t *dat,
  * Correct the data using ECC, hw did almost everything for us
  */
 
-int r852_ecc_correct(struct mtd_info *mtd, uint8_t *dat,
+static int r852_ecc_correct(struct mtd_info *mtd, uint8_t *dat,
 				uint8_t *read_ecc, uint8_t *calc_ecc)
 {
 	uint16_t ecc_reg;
@@ -529,7 +529,7 @@ static int r852_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
  * Start the nand engine
  */
 
-void r852_engine_enable(struct r852_device *dev)
+static void r852_engine_enable(struct r852_device *dev)
 {
 	if (r852_read_reg_dword(dev, R852_HW) & R852_HW_UNKNOWN) {
 		r852_write_reg(dev, R852_CTL, R852_CTL_RESET | R852_CTL_ON);
@@ -547,7 +547,7 @@ void r852_engine_enable(struct r852_device *dev)
  * Stop the nand engine
  */
 
-void r852_engine_disable(struct r852_device *dev)
+static void r852_engine_disable(struct r852_device *dev)
 {
 	r852_write_reg_dword(dev, R852_HW, 0);
 	r852_write_reg(dev, R852_CTL, R852_CTL_RESET);
@@ -557,7 +557,7 @@ void r852_engine_disable(struct r852_device *dev)
  * Test if card is present
  */
 
-void r852_card_update_present(struct r852_device *dev)
+static void r852_card_update_present(struct r852_device *dev)
 {
 	unsigned long flags;
 	uint8_t reg;
@@ -572,7 +572,7 @@ void r852_card_update_present(struct r852_device *dev)
  * Update card detection IRQ state according to current card state
  * which is read in r852_card_update_present
  */
-void r852_update_card_detect(struct r852_device *dev)
+static void r852_update_card_detect(struct r852_device *dev)
 {
 	int card_detect_reg = r852_read_reg(dev, R852_CARD_IRQ_ENABLE);
 	dev->card_unstable = 0;
@@ -586,8 +586,8 @@ void r852_update_card_detect(struct r852_device *dev)
 	r852_write_reg(dev, R852_CARD_IRQ_ENABLE, card_detect_reg);
 }
 
-ssize_t r852_media_type_show(struct device *sys_dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t r852_media_type_show(struct device *sys_dev,
+			struct device_attribute *attr, char *buf)
 {
 	struct mtd_info *mtd = container_of(sys_dev, struct mtd_info, dev);
 	struct r852_device *dev = r852_get_dev(mtd);
@@ -597,11 +597,11 @@ ssize_t r852_media_type_show(struct device *sys_dev,
 	return strlen(data);
 }
 
-DEVICE_ATTR(media_type, S_IRUGO, r852_media_type_show, NULL);
+static DEVICE_ATTR(media_type, S_IRUGO, r852_media_type_show, NULL);
 
 
 /* Detect properties of card in slot */
-void r852_update_media_status(struct r852_device *dev)
+static void r852_update_media_status(struct r852_device *dev)
 {
 	uint8_t reg;
 	unsigned long flags;
@@ -630,7 +630,7 @@ void r852_update_media_status(struct r852_device *dev)
  * Register the nand device
  * Called when the card is detected
  */
-int r852_register_nand_device(struct r852_device *dev)
+static int r852_register_nand_device(struct r852_device *dev)
 {
 	dev->mtd = kzalloc(sizeof(struct mtd_info), GFP_KERNEL);
 
@@ -668,7 +668,7 @@ error1:
  * Unregister the card
  */
 
-void r852_unregister_nand_device(struct r852_device *dev)
+static void r852_unregister_nand_device(struct r852_device *dev)
 {
 	if (!dev->card_registred)
 		return;
@@ -682,7 +682,7 @@ void r852_unregister_nand_device(struct r852_device *dev)
 }
 
 /* Card state updater */
-void r852_card_detect_work(struct work_struct *work)
+static void r852_card_detect_work(struct work_struct *work)
 {
 	struct r852_device *dev =
 		container_of(work, struct r852_device, card_detect_work.work);
@@ -821,7 +821,7 @@ out:
 	return ret;
 }
 
-int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
+static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 {
 	int error;
 	struct nand_chip *chip;
@@ -961,7 +961,7 @@ error1:
 	return error;
 }
 
-void r852_remove(struct pci_dev *pci_dev)
+static void r852_remove(struct pci_dev *pci_dev)
 {
 	struct r852_device *dev = pci_get_drvdata(pci_dev);
 
@@ -992,7 +992,7 @@ void r852_remove(struct pci_dev *pci_dev)
 	pci_disable_device(pci_dev);
 }
 
-void r852_shutdown(struct pci_dev *pci_dev)
+static void r852_shutdown(struct pci_dev *pci_dev)
 {
 	struct r852_device *dev = pci_get_drvdata(pci_dev);
 
-- 
1.7.10.4
