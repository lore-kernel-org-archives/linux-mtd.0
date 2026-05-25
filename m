Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A26CD5BC9
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2026 22:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FweHruR1iMbiw6O2j9jzUrgo2V88BKRRVsujVsv+BMw=; b=bzZZTbQrcuBB36
	r6XcDuKmtQh7x6N7hymbP1T3iHEUx7NxLwvo1AX5+Xz1XH+JtfbIgjad3sjBHVisZ6gN5Hg3Uxdb4
	S1HqLQnTMdUaaoRFPpLy8Uedk7sezqFq6aBqO+ulhLclyvLLTIzOJ+q9x/nxAiXgd9nfcM1TNLax/
	B1pBfQcNQcKyexEAyRN7n/RcIaYmUlrHIeEqcP5knnzy+ODYOyV0fSZauLMJMAgu5QiDTYNzmnIEC
	HY6ar3k9/QsI4nyI9jHpocZdDo0neKi9pjmP1r+vaTkdMn+SBMG+eKl6b+Wun5+38vecXIWnnBfZL
	X5ucDfsikBhBhdGCyqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRdPx-00000000Xq5-3FPd;
	Mon, 25 May 2026 22:05:01 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRdPv-00000000XpD-2KBt
	for linux-mtd@lists.infradead.org;
	Mon, 25 May 2026 22:05:01 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-83d31ac4017so4903219b3a.3
        for <linux-mtd@lists.infradead.org>; Mon, 25 May 2026 15:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779746698; x=1780351498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBQlDE/oPG8Oa8LMhICFf6T3R2ocVR1ZCsXAU07kKso=;
        b=rdpkB13emBb+/STsmaHWl4EGRKX6coRDty8JtqAiT/W977MTasEEpc98JSky0cGwHL
         LwlobbqY7U6fsC5GYPzCGvpWrMehASaGOJBrOiep2FK5z68LP6QtitXRn+OU1AN+SbCJ
         b+Wir56D8G4zOOBTMN5RmAOrglvZICrBJ5rAB3stgbJW9tJ1kGt24S+YxZX1vsMhdxiq
         B8Z0lBxuOupc5hHLrWs8+40Xb+d7y5u7nykW0cuWQwSpMMclbx49MVVd24878EkkZTZC
         z+r2NjTJFHtX1C8buLCT5ACIIz3l2L/KyrVQIPo47o9R4GZTHpxAHOCPMLScMUoJmFRt
         LfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779746698; x=1780351498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBQlDE/oPG8Oa8LMhICFf6T3R2ocVR1ZCsXAU07kKso=;
        b=jQOUBtJ1xco+xldF3ur5LvjLbMGpn+XBI8M3erYDoD3z3vp2QkF7U8URu8QHMd2XIU
         b6zgBw/hDSxnENwfGgiSBGxTydUwnTQDOifloTKj2unLsU+lHPrRAJfGugx4JQY84wLP
         hpT2h809JuM7WLORjtrKgDRxz1Vi0Cgd8gGJSXD32DyhWiTPzMXTWz7XKAt/TE2hVOc8
         FXSxLbapXS5nJMZtQVUGUOtT63DE7TZGTwDnH4sl5UGuSOJULtYhuuVN+5Tj1wZSE2z/
         VeLpbLVLtjpK1q1T/ghQnlUZLU0RJIv1lNykYbqcw/5LuAyG2G7dEdgIxo/l3ugTRahY
         RFaA==
X-Gm-Message-State: AOJu0Yy9I1upwv5DAp2WqjXGFhDsprFdg68tmJvfuYaNVj98z0pv2P06
	tbsayRZ/qM229NtYbmjgA8EW0YtXDaitem8m8cFNSceh1QZQqYpTSxqCcdjdyA==
X-Gm-Gg: Acq92OG9oVpGZ+XgSU4dF71u1lUlMpb4NOOiNPaGrZKGMlzStbGna91iS/rhNxniqKs
	2kJ3FaLKwJul26cEB2P/Sk0/uepASuuCD5btmIBMA+KN5t6TpkKBJe1MWohHt591hOvHKk2uyRv
	j8FN/UopJUyWjM7B4mOQYDBIrANGWmtezOmI0AsnoE4kdjPtUWw6L4W7LHxSNgGjlSY28BI2+4S
	Rhz6pYDGe5E42EiwdQ9qFBBh2jGMjGsQv46+hwUsuKgyMgoDnWcJBr9tbYynd7olE5/TnU6xFfS
	4/BmKxsCNEJVQNkW8OPOzXN3DN9pOXG9sdo7G4UFg3Y3HjIs2NlcmP8GgmVIhE+hwg7GbYzMZV/
	b8QHLad38Hhs9GnZwLygo5T6TltGFXFG0sQ8kD42ClvtlVfGCVHf9jsaY1vmh0Il93kh3daHJbb
	/4zQQpBcKq3iR3UZ+v06aolVHC0RpMyLsE83+DxgM8gP6PEbKwX00KHdn1ZpHwYMao0WOh0hKVe
	T2W29eiT2FeKmFd30MnlK9C7mVaM0FCjubOFRNwc63glw==
X-Received: by 2002:a05:6a00:808b:b0:824:afe1:f7e3 with SMTP id d2e1a72fcca58-8415f5d1d8emr15278895b3a.15.1779746697873;
        Mon, 25 May 2026 15:04:57 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b0963asm10065750b3a.25.2026.05.25.15.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 15:04:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	linusw@kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM NAND CONTROLLER DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: qcom: embed nand_controller into qcom_nand_controller
Date: Mon, 25 May 2026 15:04:40 -0700
Message-ID: <20260525220440.94639-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_150459_598640_7479FCAA 
X-CRM114-Status: GOOD (  15.03  )
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

The qcom_nand_controller had a struct nand_controller *controller
pointer that was assigned to (struct nand_controller *)&nandc[1],
with the allocation oversized by sizeof(*controller) to make room.
get_qcom_nand_controller() then walked backwards from chip->controller
using sizeof()-based arithmetic to recover the enclosing nandc.

Embed the nand_controller directly into qcom_nand_controller and use
container_of() in get_qcom_nand_controller(). The header now needs
the full rawnand.h definition rather than a forward declaration.

Assisted-by: Claude:Opus-4.7
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c    | 16 ++++++----------
 include/linux/mtd/nand-qpic-common.h |  4 +++-
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index b7e79b76654d..4b80ce084d9a 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -128,8 +128,8 @@ static struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
 static struct qcom_nand_controller *
 get_qcom_nand_controller(struct nand_chip *chip)
 {
-	return (struct qcom_nand_controller *)
-		((u8 *)chip->controller - sizeof(struct qcom_nand_controller));
+	return container_of(chip->controller, struct qcom_nand_controller,
+			    controller);
 }
 
 static u32 nandc_read(struct qcom_nand_controller *nandc, int offset)
@@ -2034,8 +2034,8 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(nandc->controller);
-	nandc->controller->ops = &qcom_nandc_ops;
+	nand_controller_init(&nandc->controller);
+	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
 	if (!nandc->props->nandc_part_of_qpic)
@@ -2175,7 +2175,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	chip->legacy.block_bad		= qcom_nandc_block_bad;
 	chip->legacy.block_markbad	= qcom_nandc_block_markbad;
 
-	chip->controller = nandc->controller;
+	chip->controller = &nandc->controller;
 	chip->options |= NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA |
 			 NAND_SKIP_BBTSCAN;
 
@@ -2256,21 +2256,17 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
 static int qcom_nandc_probe(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc;
-	struct nand_controller *controller;
 	const void *dev_data;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc) + sizeof(*controller),
-			     GFP_KERNEL);
+	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
 	if (!nandc)
 		return -ENOMEM;
-	controller = (struct nand_controller *)&nandc[1];
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;
-	nandc->controller = controller;
 
 	dev_data = of_device_get_match_data(dev);
 	if (!dev_data) {
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index e8201d1b7cf9..006ca8c978a9 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -9,6 +9,8 @@
 #ifndef __MTD_NAND_QPIC_COMMON_H__
 #define __MTD_NAND_QPIC_COMMON_H__
 
+#include <linux/mtd/rawnand.h>
+
 /* NANDc reg offsets */
 #define	NAND_FLASH_CMD			0x00
 #define	NAND_ADDR0			0x04
@@ -394,7 +396,7 @@ struct qcom_nand_controller {
 
 	const struct qcom_nandc_props *props;
 
-	struct nand_controller *controller;
+	struct nand_controller controller;
 	struct qpic_spi_nand *qspi;
 	struct list_head host_list;
 
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
