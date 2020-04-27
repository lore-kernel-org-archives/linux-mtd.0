Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEA9C54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:28:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B852064A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EVPMVxZW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B852064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SHTrjblSHBsFePcdqZ0CoNWGCepx/AOYK/YlOZ9rrE=; b=EVPMVxZWCGN9RG
	3T8zvzDwLDzeiCjh+EWRf6Ja2K4Mp07fTExO3W81Ju+BTGq1fCHZw4/2a0VI2BT9Yjcmds3TLVIZ/
	pR4GlzVDMS6OJV+rGmq1ppNRFMvi8RN+TabMOlcdxorJzddEbRSVKoXTZJwtoH7+/JKm9DKNZEbgG
	LGSs43s5nqE7o2ofwAj1NpQd0JHNOYmSPro7dk0ypxIT3hUwVS9Xyptf3T5ti4+zABea8SgAOSPi4
	u3YUX6JAvSXbFMxh8Y7dCnTyF/A2LZ+hYKt6E/ilBCwZPT7rnADFJCu9+hzFY0hcAz5SI73LhDAtP
	urTyoi3chvfVjuYaW+cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSz7p-0006hz-3b; Mon, 27 Apr 2020 08:28:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSz0P-0006Er-2K
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 08:20:50 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8E80E2A0B53;
 Mon, 27 Apr 2020 09:20:41 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 17/17] mtd: rawnand: s/uint{8,16,32}_t/u{8,16,32}/
Date: Mon, 27 Apr 2020 10:20:28 +0200
Message-Id: <20200427082028.394719-19-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200427082028.394719-1-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_012045_241682_6E3AC26F 
X-CRM114-Status: GOOD (  14.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace uint{8,16,32}_t by u{8,16,32} to make checkpatch happy.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 955dc78c57be..658c95804297 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -151,7 +151,7 @@ struct cafe_priv {
 	struct pci_dev *pdev;
 	void __iomem *mmio;
 	struct rs_control *rs;
-	uint32_t ctl2;
+	u32 ctl2;
 	bool usedma;
 	dma_addr_t dmaaddr;
 	unsigned char *dmabuf;
@@ -224,7 +224,7 @@ static irqreturn_t cafe_nand_interrupt(int irq, void *id)
 	struct mtd_info *mtd = id;
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
-	uint32_t irqs = cafe_readl(cafe, NAND_IRQ);
+	u32 irqs = cafe_readl(cafe, NAND_IRQ);
 	cafe_writel(cafe,
 		    irqs & ~(CAFE_NAND_IRQ_CMD_DONE | CAFE_NAND_IRQ_DMA_DONE),
 		    NAND_IRQ);
@@ -255,7 +255,7 @@ static int cafe_nand_read_oob(struct nand_chip *chip, int page)
  * The hw generator calculates the error syndrome automatically. Therefore
  * we need a special oob layout and handling.
  */
-static int cafe_nand_read_page(struct nand_chip *chip, uint8_t *buf,
+static int cafe_nand_read_page(struct nand_chip *chip, u8 *buf,
 			       int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -283,8 +283,8 @@ static int cafe_nand_read_page(struct nand_chip *chip, uint8_t *buf,
 		int i, n;
 
 		for (i=0; i<8; i+=2) {
-			uint32_t tmp = cafe_readl(cafe, NAND_ECC_SYN_REG(i));
-			uint16_t idx;
+			u32 tmp = cafe_readl(cafe, NAND_ECC_SYN_REG(i));
+			u16 idx;
 
 			idx = FIELD_GET(CAFE_NAND_ECC_SYN_FIELD(i), tmp);
 			syn[i] = cafe->rs->codec->index_of[idx];
@@ -380,11 +380,11 @@ static const struct mtd_ooblayout_ops cafe_ooblayout_ops = {
 
 /* Ick. The BBT code really ought to be able to work this bit out
    for itself from the above, at least for the 2KiB case */
-static uint8_t cafe_bbt_pattern_2048[] = { 'B', 'b', 't', '0' };
-static uint8_t cafe_mirror_pattern_2048[] = { '1', 't', 'b', 'B' };
+static u8 cafe_bbt_pattern_2048[] = { 'B', 'b', 't', '0' };
+static u8 cafe_mirror_pattern_2048[] = { '1', 't', 'b', 'B' };
 
-static uint8_t cafe_bbt_pattern_512[] = { 0xBB };
-static uint8_t cafe_mirror_pattern_512[] = { 0xBC };
+static u8 cafe_bbt_pattern_512[] = { 0xBB };
+static u8 cafe_mirror_pattern_512[] = { 0xBC };
 
 
 static struct nand_bbt_descr cafe_bbt_main_descr_2048 = {
@@ -429,7 +429,7 @@ static struct nand_bbt_descr cafe_bbt_mirror_descr_512 = {
 
 
 static int cafe_nand_write_page(struct nand_chip *chip,
-				const uint8_t *buf, int oob_required,
+				const u8 *buf, int oob_required,
 				int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
