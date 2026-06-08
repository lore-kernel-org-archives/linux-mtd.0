Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E1ACD8CAC
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2026 13:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4QiJsRF1PxFnR3RJ3mlQv13U3lZwDwDTK3VJQeicLw=; b=QZexeMVsvMeprE
	2MTmZo96u3Gggs4Vg2el4DngA/mf/WpZrXgTfN+AcXR7AwdvtzK0Al6WBGZhSE7S9uvgRZk78etN5
	t+Gl4uWFP1YSoqyhYpWg7znFbp4xY9NiSn5nXHCbFjbJlzyNNsSCK0oXB9JBeweVgCWhdgu3EFx36
	1uPOgTc8YAHSpvyUEAZ1/g1Ik0/wq1oOgt+KCDVsRTufnbRJXlmT/hBNppFkItHQy52RyWW/vsMeI
	GzKP4R8MBi5adPuQOLTrzn9dMWPlJUDkKBdieEGWg0BSzxVOp2EvTfrOOwjBfuNbfg2WzEZcdpM3y
	HXi0yvwmp1v7ibA9jZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZuR-00000003bVo-49xK;
	Mon, 08 Jun 2026 13:20:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZuP-00000003bTv-0VXY
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jun 2026 13:20:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45ef616daf6so3922716f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2026 06:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924851; x=1781529651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PL7471kdmSWyPmgK4b9+x0sJCZApJQ6JQDBnuoCpSUU=;
        b=CI17+ocNl87yrqbXLLgCsY10m2xiG+ogCDXpphJg28dO+z+zZm8lASxQv+qYQE63jl
         yAp2iT5pFrW1V+Cf5ntzZgD4FonzJg7G5yXAhKEdgCYbJ+jQ0faePX2cLS8LiqnPRyR3
         SQHt1e6EEZF2hD4u5sj0Q/8SvXhdbVKXiBmopNoffbZpsPyuZznWu9fhwZagAOTnAO+P
         txkcQKpLzQuKi0qR1OHs5bnqFv+44uFihxlQpj3nYNK6mOTpemOBy7dawF4Nruha1XHG
         RD73gnboo753OLn5FC2jfeCy+ZqJUbWwD/j4VtQA4Q1xXtMNxCoRoHkj6NXoQVekm16+
         7QOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924851; x=1781529651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PL7471kdmSWyPmgK4b9+x0sJCZApJQ6JQDBnuoCpSUU=;
        b=JyGKXk+9ZCi+Byk8Ii9Qr8aKkELUoLbHpeRxiHbY2Egk7EBS+Yz6OMkYaNM1otNuyF
         B1g0an2ziDq6WppD/7EWuXetmdtogCd5ZESfxUBGkJx2AQ3GekjNcSpKihW1ySawX2nd
         Sac8ClNHjk/HCeDWmOnkWbf6UxiEejOe30HHp8NDiEjltBtuZ3ORYRfBBvDa355KT+x4
         k58Oj1/2coLeFasndUJmdlDwtdg0TqaPRJofU04ZcNSlCJOCZrskoYikV/3UtnCV40+p
         yyb3ycIYkFI/mct/AtzsetCCgjCVKdzXrH2Txn5teWoSA3FyJGQktmUQxvKKwZ5Q4+4S
         A5ew==
X-Forwarded-Encrypted: i=1; AFNElJ9Zbx4HzgPQ/qEDGqAQSl6fgfA0u7M5dtMehhNaQ2eQ2cgvodiwTQXgkHAP2SS43X5hj9sDNhuZDeo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxT4QO3NxcgbB2WVqgoi0Ak1ncg7w6nrKdulR8kNyW7M153QtuZ
	zkBfmrJMJd2xCqo/lkxI5/AxJ8rYO/pafyDqjZu2oud2Dvsle14zzyHjNyAITUd+oHs=
X-Gm-Gg: Acq92OEOPH7d9cSmJF0evahN9xyqqYw2jk+x02P8TcQSSg2S3cCOPVggWHQfl05WEZu
	HboLWdRA7xxp/9OHanXBAm1o6YcHZGyN90ZN5bKUIcUFi4jVNlvduc9p6okrRCbctkYM0hrLVqG
	xyRMMXPulMENqt01joA5wEXN9wKRFDue4sMJ+TQEa3ad0fzJ44yEUd2Oo/Xe12cpAhbsYQaJ2I5
	Hf4OBJxRBCP7tGpXuqtolD65aBueQXJzFYhbvvqSa10sthP2yZGjHsMEPCAQIChv5oOxpfBGj57
	alMZpf6JvJ5pRL/CtjbrUwIAwzgxDuw1NNz3kjCqihf3SR6/gSBgy9CRK16RWuSlYXq+ZL1Ru5O
	hd0ZOKq1M34XHLvCgOH9VntdebKh7IpVF6c1253KfGnCXw1yUnBhiGkI00zm4zLHNX8uor6sot2
	l7SOgwcolX+hvxrYHxJbJ2ReykmQGyEoit0mHiWNKdzjzynbI=
X-Received: by 2002:a05:6000:713:b0:460:1a52:8a13 with SMTP id ffacd0b85a97d-460301825femr23864909f8f.0.1780924851118;
        Mon, 08 Jun 2026 06:20:51 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:50 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:25 +0200
Subject: [PATCH 4/4] mtd: rawnand: qcom: Add MDM9607 compatible
MIME-Version: 1.0
Message-Id: <20260608-qcom-nandc-mdm9607-v1-4-4639a0492274@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062053_178898_EF0DB772 
X-CRM114-Status: GOOD (  11.45  )
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

MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
is missing the rest of the hardware changes in QPIC v2. Add the new
qcom,mdm9607-nand compatible and set it to use has_onfi_read_op without
also setting qpic_version2.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 9217e8de5512..d7642db2e2df 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2381,6 +2381,15 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
 	.bam_offset = 0x30000,
 };
 
+static const struct qcom_nandc_props mdm9607_nandc_props = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.supports_bam = true,
+	.nandc_part_of_qpic = true,
+	.has_onfi_read_op = true,
+	.dev_cmd_reg_start = 0x7000,
+	.bam_offset = 0x30000,
+};
+
 static const struct qcom_nandc_props sdx55_nandc_props = {
 	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
 	.supports_bam = true,
@@ -2412,6 +2421,10 @@ static const struct of_device_id qcom_nandc_of_match[] = {
 		.compatible = "qcom,ipq8074-nand",
 		.data = &ipq8074_nandc_props,
 	},
+	{
+		.compatible = "qcom,mdm9607-nand",
+		.data = &mdm9607_nandc_props,
+	},
 	{
 		.compatible = "qcom,sdx55-nand",
 		.data = &sdx55_nandc_props,

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
