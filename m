Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D114EEB64DA
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZfsSYPOZBdEKHU+JGGg7FUU+6hqwH9mC1mArQH3hhc=; b=lawwcJJ8hbp5rI
	Gj26wRW3fSJx2ICgxAfPP0hXqk/ItGHoWXp+fWJ1ASvpAsTsA619avpGihX0NrWuYq7OK7G+jRZ4W
	GFBxRrFIqCqQo7Ku3HD27+e/mpyXGoEGBj8dvkd6fA9PHehXxZoU0qczug2y9DKrn2jlzRlUXhbL1
	DCY/E5HmObo+SEPGTlKQUvypP4WbCs1TBuSz5Pl2MmrxtbrEmQWLQFC8h82Tmb/ZyKtZIlmDEYN5u
	Gp84sasXsJgkqwGwy8vPHbAedPLmK4DeO8ccrLBB2NosX8UkVxf+5oyLkbVR08NbScU2Ejsi3yUSD
	3PyGVsZNFPuzc/kTXwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL31Z-00BzCw-0O;
	Sun, 16 Jul 2023 14:47:02 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL30u-00ByjI-1Y;
	Sun, 16 Jul 2023 14:46:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0632AC000A;
	Sun, 16 Jul 2023 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689518778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6owno9qOThgiGr+4NHYDITELS29nNv7WqBjQPHp5Vo=;
	b=FgAKA6KbY1/ct2f7PoA/oORAPlQ9ma/DzQWjacoY075gvGKXlT/puGS9W2sdNLf1oC8kwh
	tx7BEOqmbqd14iWAqK6JnhILuyo7zn41gVMH6p8HaUfZTkQcgJWODTk91P1RICKWisH/tB
	0oiuq7ur3ZRFxZWdy/EltGS50y5UPpw1Anz+ZuWGAf8oOlOwwCtnhx3rMjSFefbzLut+iG
	BbIw/NT7tVs3CySGxriCGh/0nD7zfJIszEimHYa43aCcprrop0rVs86VH9lXxws8GrvqB1
	0uKxceqDRZkgSE4tbYtEW+i9OwLDR6DBNoh2/bfDO/NKmLhXxLA2Jt7GcuAOLw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 4/8] mtd: rawnand: qcom: Fix the spacing
Date: Sun, 16 Jul 2023 16:46:08 +0200
Message-Id: <20230716144612.32132-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-1-miquel.raynal@bootlin.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_074620_921771_D3E2C7E2 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix following checkpatch warning:
	"CHECK: Please don't use multiple blank lines"
	"CHECK: Please use a blank line after
		function/struct/union/enum declarations"

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 54a7b49bda87..554cca3801da 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1997,7 +1997,6 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
 			oob_size = ecc->bytes;
 		}
 
-
 		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size,
 			       i == (ecc->steps - 1) ? NAND_BAM_NO_EOT : 0);
 
@@ -2373,6 +2372,7 @@ qcom_nandc_calc_ecc_bytes(int step_size, int strength)
 {
 	return strength == 4 ? 12 : 16;
 }
+
 NAND_ECC_CAPS_SINGLE(qcom_nandc_ecc_caps, qcom_nandc_calc_ecc_bytes,
 		     NANDC_STEP_SIZE, 4, 8);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
