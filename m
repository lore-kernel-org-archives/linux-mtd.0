Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B42C04E69
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2iy3YKtseP4UsJVsu5U9gJLFS6CutCKD8G12jJe80Q=; b=DM5oT6/VK3R3oI
	3YxqNnaIsF3TG1OBpRWFewPsPSJkYGMLj32FQNkrZ87e5rOECTry76pe2H1qNARdJPhtXXFyXhqDo
	OA9YRuExd7QkoJi0SS8cJcmWXV6KGGB3Lg1wqtlM6zs4fjJpdWEK1kwytI8/v/a+AhwpjcGRJlgKw
	5BeSjmV8tZHQnckdkzUx8kvBocANNORKoOLjqTanUud3DsIaJNMotcY9Ql1jQrqNKdcGP7BMHY8zN
	Qakx6UKor0h9lHrK3M3z47nFMjMpUqqbZuZpdKWNHv6hGvjCb2kG0OWm+VeyuDZE535FqQelpf4XR
	MZuXWyMLpal/noBjUEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLI7-00EOuM-1q;
	Sat, 05 Aug 2023 17:42:15 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLI4-00EOtN-0e
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 17:42:13 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68783b2e40bso2162177b3a.3
        for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2023 10:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257330; x=1691862130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXEH8Wa3ojD+esCQhV22he8Pc5JwMdbmIGFKAtqq3lU=;
        b=i9tbqf5TzsxdR8yFifphKZWnrPl1Ckv74LxFEHOMpMMvv5kdJzVDtoDtExAZ7t0N9t
         KzG638x7INF+Mac7aTRK4k7wN2umrVA+od63KF/I/lzeYFvljlGw64ocISCIS3r2OxqU
         nZAjyQ2VCY15S2Va+1eFSMG3rK0RbgmLaFC6VJLxa9rODoISrce5p32Kr4G1cn85p6Qi
         8twOkwW0nP5ucMoTQ59lLnVlpkxHcIHdLd3FseL8GOWelgkX3m7jrUKqdPWMMkrakER+
         vlUgPoF/zCoAbcvoiUdWHiNlMnFtN33kkQarBJtlyWG/av+eu8MN5H6qne6JGZb0ElWK
         F0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257330; x=1691862130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXEH8Wa3ojD+esCQhV22he8Pc5JwMdbmIGFKAtqq3lU=;
        b=Cx0CHNiDw1V6Vachg2x+GI/yTUY4TltT2EORRNDrGmXxON2Rf4+XhQRRU/eBy6cnOD
         V9giByjuOi0TvccBkD70eZ+0eIgVNaxTAZ+aAyO7eQy8BisA3Ni1xitB3nEQVcWXleLF
         gjsYIfxBNqksm3CbRScCQrsTTkqoVDL1a8Q02d/MiDiaJo4bPYzwYXUNGph+SkLsuHMB
         4wK3QTTngrkhyalRy1tKCP9e/BP+k7CRFBBEmv3U2JDBHsWDNi+z5P4/d5QsGxMPLEAi
         yeiq2tf50ui0bxchcOWtOjedPrBiACybuR1fZgWq1poITIRF0b6x+Jh23e6E8KrJAjHL
         NWPg==
X-Gm-Message-State: AOJu0Yym43U0TxOLYUS8B1JjOrh+QQwRgjmSFI9ROe6y+611VLX28jCm
	LvFbPXzNZSdexoE1uP+p2nEOEP6woXEhLtWvsQ==
X-Google-Smtp-Source: AGHT+IEQZKy6eZ9zB73Nlmrdh8OA6cfrfr262pAHVYOI+3rkx6/lhGQc0+CoG0aVyM/nTPlKCjypgA==
X-Received: by 2002:a05:6a00:1501:b0:675:ef91:7922 with SMTP id q1-20020a056a00150100b00675ef917922mr4571732pfu.4.1691257330155;
        Sat, 05 Aug 2023 10:42:10 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:09 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdalam@quicinc.com,
	quic_srichara@quicinc.com,
	dan.carpenter@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 02/10] mtd: rawnand: qcom: Rename variables in qcom_op_cmd_mapping()
Date: Sat,  5 Aug 2023 23:11:38 +0530
Message-Id: <20230805174146.57006-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104212_239968_E777FD7A 
X-CRM114-Status: GOOD (  12.25  )
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

qcom_op_cmd_mapping() function accepts opcode and returns the corresponding
command register. So let's rename the local variables and parameters to
reflect the same.

Reported-by: Miquel Raynal <miquel.raynal@bootlin.com>
Closes: https://lore.kernel.org/all/20230804190750.3367a044@xps-13/
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index b6751fb17587..be428b80a39b 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2555,39 +2555,39 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	return 0;
 }
 
-static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, u8 cmd,
+static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, u8 opcode,
 			       struct qcom_op *q_op)
 {
-	int ret;
+	int cmd;
 
-	switch (cmd) {
+	switch (opcode) {
 	case NAND_CMD_RESET:
-		ret = OP_RESET_DEVICE;
+		cmd = OP_RESET_DEVICE;
 		break;
 	case NAND_CMD_READID:
-		ret = OP_FETCH_ID;
+		cmd = OP_FETCH_ID;
 		break;
 	case NAND_CMD_PARAM:
 		if (nandc->props->qpic_v2)
-			ret = OP_PAGE_READ_ONFI_READ;
+			cmd = OP_PAGE_READ_ONFI_READ;
 		else
-			ret = OP_PAGE_READ;
+			cmd = OP_PAGE_READ;
 		break;
 	case NAND_CMD_ERASE1:
 	case NAND_CMD_ERASE2:
-		ret = OP_BLOCK_ERASE;
+		cmd = OP_BLOCK_ERASE;
 		break;
 	case NAND_CMD_STATUS:
-		ret = OP_CHECK_STATUS;
+		cmd = OP_CHECK_STATUS;
 		break;
 	case NAND_CMD_PAGEPROG:
-		ret = OP_PROGRAM_PAGE;
+		cmd = OP_PROGRAM_PAGE;
 		q_op->flag = OP_PROGRAM_PAGE;
 		nandc->exec_opwrite = true;
 		break;
 	}
 
-	return ret;
+	return cmd;
 }
 
 /* NAND framework ->exec_op() hooks and related helpers */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
