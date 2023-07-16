Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8DAEB64DA
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulHdkMweaG4rnuBS61JqgPxjNSBq5OsZwkOvOcTKICI=; b=OU1Z4h31Duwe4j
	dbIgkSH+XirxTEvIf3xoVpdYMcjRVSQeKAQfzS8LjDwP4VhMFnq0/KmI7CQYBt76aLc+avAOMtrgQ
	ikcJ0WZJq9M1cedfppcBLCbADFJTY8UQBoyGiS5XlJWwGPkXDpc2jMyq0ZJAtVqJr1ulS6aqIELp8
	tXTQvkaVooLG3zlhh/p1vuo0eNbkHBNlgdhlSo3p1q87hOSkdN3EMPXG+TwqlE3kH3bngetHXOWEA
	YEXVOmUofsB/UpKy1C5QlB1ckiDbxKyztVzdJgGu38oOmgzC1D2+nq9OAWtrnDicDT9je2reB7u/3
	1ReRSwjLlH5bGWCOB02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL326-00BzS6-0H;
	Sun, 16 Jul 2023 14:47:34 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL30u-00Byil-0J;
	Sun, 16 Jul 2023 14:46:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 166D8C0008;
	Sun, 16 Jul 2023 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689518777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t2G+ox9+G8XYIaOfEhNEucNj0OJXSmOpBnF9VIF8kAg=;
	b=MsFpCeAvy00TrIFn32DXVYTXK5YJWWfewbML4SoWQnyMO210+zRPtDwuTutNUy8jUb/HJX
	J+7Rkn7cP1sdgtoeKmHlgopi7Qyr35jOKYhHMX6BvGy7jxqw+6EDqt7Ej58iLfXZRbQrXH
	QeKTr6HQTw+zrF/P7Cd8u8bCtx6QQ9wVQJTyCgPk2ETaQq1KkOBvB1qw9s8rOouWIGA52w
	YEkNqGkJS8GM4K6yyitmj+esyqQyrTzEzr70Gxj8UrNNMHdpxqJwpm9m75cw0WwMJCHepu
	n2Uj8XIE+GQwg1Q0QOu8+KjvddDq3byTYGce9/uIN8IEKIBNtKoSjUpyJ1RtWQ==
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
Subject: [PATCH 3/8] mtd: rawnand: qcom: Fix alignment with open parenthesis
Date: Sun, 16 Jul 2023 16:46:07 +0200
Message-Id: <20230716144612.32132-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-1-miquel.raynal@bootlin.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_074620_421425_906FA9B4 
X-CRM114-Status: GOOD (  10.31  )
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

Fix the following checkpatch warning:
    	"CHECK: Alignment should match open parenthesis"

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 0136df01738e..54a7b49bda87 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2348,7 +2348,7 @@ static int qcom_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
 }
 
 static int qcom_nand_ooblayout_free(struct mtd_info *mtd, int section,
-				     struct mtd_oob_region *oobregion)
+				    struct mtd_oob_region *oobregion)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
@@ -2593,7 +2593,7 @@ static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, u8 cmd,
 /* NAND framework ->exec_op() hooks and related helpers */
 static void qcom_parse_instructions(struct nand_chip *chip,
 				    const struct nand_subop *subop,
-					struct qcom_op *q_op)
+				    struct qcom_op *q_op)
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	const struct nand_op_instr *instr = NULL;
@@ -3089,19 +3089,17 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 	 */
 	nandc->buf_size = 532;
 
-	nandc->data_buffer = devm_kzalloc(nandc->dev, nandc->buf_size,
-					GFP_KERNEL);
+	nandc->data_buffer = devm_kzalloc(nandc->dev, nandc->buf_size, GFP_KERNEL);
 	if (!nandc->data_buffer)
 		return -ENOMEM;
 
-	nandc->regs = devm_kzalloc(nandc->dev, sizeof(*nandc->regs),
-					GFP_KERNEL);
+	nandc->regs = devm_kzalloc(nandc->dev, sizeof(*nandc->regs), GFP_KERNEL);
 	if (!nandc->regs)
 		return -ENOMEM;
 
-	nandc->reg_read_buf = devm_kcalloc(nandc->dev,
-				MAX_REG_RD, sizeof(*nandc->reg_read_buf),
-				GFP_KERNEL);
+	nandc->reg_read_buf = devm_kcalloc(nandc->dev, MAX_REG_RD,
+					   sizeof(*nandc->reg_read_buf),
+					   GFP_KERNEL);
 	if (!nandc->reg_read_buf)
 		return -ENOMEM;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
