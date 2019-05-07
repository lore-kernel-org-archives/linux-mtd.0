Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F95C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:26:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D44720578
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:26:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pko6UxF+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D44720578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oc76lePCqu1FJ+2PfUKeUBgL/UmXqaKXzbMnAFULVq0=; b=pko6UxF+EuCpTU
	kR44tuk7JJs7TCAnmHtuptzlRdWehY8v+rkjPeQ5zVLahDWooVi3odRtXbNXfMLSnP5BbUto7iVrH
	hueGHVMnz8vYijaX6hxWBPUbZOxaaeUWbN7v9CUvmJ8Vo6JuYzh+jd1YMJ4V3zbQkMZ0Zulse3e+U
	uIk4S+KZDQg4zKLWASiBIAWmr6IpqF7kQ2mq1WkE5zhL9HPcHYLihFzfWMioBWnJPoL9IuzXiOkgL
	by5wcoFhsU5TtsL9JteP1jSMozUv4RxEERDMBFE6Wh3Zg0RVLlaLoOIDzdDF8wR38GbohcjDieG6c
	oPzXrPUoQGrkWYMwTO5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNxIe-0003NE-36; Tue, 07 May 2019 10:26:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNxIM-0002vu-7h; Tue, 07 May 2019 10:26:02 +0000
X-UUID: ddb4fefbd4f24709830aa864284e6355-20190507
X-UUID: ddb4fefbd4f24709830aa864284e6355-20190507
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 687659724; Tue, 07 May 2019 02:25:55 -0800
Received: from mtkmbs03n1.mediatek.inc (172.21.101.181) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 May 2019 03:25:54 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs03n1.mediatek.inc (172.21.101.181) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 May 2019 18:25:51 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 7 May 2019 18:25:51 +0800
From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: [PATCH v3 4/4] mtd: rawnand: mtk: Fix wrongly assigned OOB buffer
 pointer issue
Date: Tue, 7 May 2019 18:25:41 +0800
Message-ID: <20190507102541.34341-5-xiaolei.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190507102541.34341-1-xiaolei.li@mediatek.com>
References: <20190507102541.34341-1-xiaolei.li@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_032558_632910_3F9BBAFE 
X-CRM114-Status: GOOD (  10.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

One main goal of the function mtk_nfc_update_ecc_stats is to check
whether sectors are all empty. If they are empty, set these sectors's
data buffer and OOB buffer as 0xff.

But now, the sector OOB buffer pointer is wrongly assigned. We always
do memset from sector 0.

To fix this issue, pass start sector number to make OOB buffer pointer
be properly assigned.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 14a9b8c2a8db..617f9656a045 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -889,19 +889,21 @@ static int mtk_nfc_write_oob_std(struct nand_chip *chip, int page)
 	return mtk_nfc_write_page_raw(chip, NULL, 1, page);
 }
 
-static int mtk_nfc_update_ecc_stats(struct mtd_info *mtd, u8 *buf, u32 sectors)
+static int mtk_nfc_update_ecc_stats(struct mtd_info *mtd, u8 *buf, u32 start,
+				    u32 sectors)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
 	struct mtk_ecc_stats stats;
+	u32 reg_size = mtk_nand->fdm.reg_size;
 	int rc, i;
 
 	rc = nfi_readl(nfc, NFI_STA) & STA_EMP_PAGE;
 	if (rc) {
 		memset(buf, 0xff, sectors * chip->ecc.size);
 		for (i = 0; i < sectors; i++)
-			memset(oob_ptr(chip, i), 0xff, mtk_nand->fdm.reg_size);
+			memset(oob_ptr(chip, start + i), 0xff, reg_size);
 		return 0;
 	}
 
@@ -921,7 +923,7 @@ static int mtk_nfc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	u32 spare = mtk_nand->spare_per_sector;
 	u32 column, sectors, start, end, reg;
 	dma_addr_t addr;
-	int bitflips;
+	int bitflips = 0;
 	size_t len;
 	u8 *buf;
 	int rc;
@@ -988,14 +990,11 @@ static int mtk_nfc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	if (rc < 0) {
 		dev_err(nfc->dev, "subpage done timeout\n");
 		bitflips = -EIO;
-	} else {
-		bitflips = 0;
-		if (!raw) {
-			rc = mtk_ecc_wait_done(nfc->ecc, ECC_DECODE);
-			bitflips = rc < 0 ? -ETIMEDOUT :
-				mtk_nfc_update_ecc_stats(mtd, buf, sectors);
-			mtk_nfc_read_fdm(chip, start, sectors);
-		}
+	} else if (!raw) {
+		rc = mtk_ecc_wait_done(nfc->ecc, ECC_DECODE);
+		bitflips = rc < 0 ? -ETIMEDOUT :
+			mtk_nfc_update_ecc_stats(mtd, buf, start, sectors);
+		mtk_nfc_read_fdm(chip, start, sectors);
 	}
 
 	dma_unmap_single(nfc->dev, addr, len, DMA_FROM_DEVICE);
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
