Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211FFC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 04:13:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E02207B7
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 04:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E02207B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D2ekN6p27bMTRFmIXBotzRIfBhTXIsmRZKET0ExIzEM=; b=Fb95fnGnBF7GzO+xfuLvQL+oF
	AqOKe0Bn4rV1eXw4tLeCyiWo/4+yag7pK54CHBpHAL7WGxmZFUMg4teiS/gmM2uPeiIJ79B62EtWD
	JLC4xf7sq3kkVmlMrrd72gHIWEJSOMpAMOvVOU2oyqDBsxtU9nIQVzCbyWQk3EhLOW4OOp0rZZ2Dt
	3rSu4igATJRkjqM75aUKwDtf68ougSKzbDK++efuh+/+6Ya8uCK4kI4qoiyWDSSpLOjGK9CH2DaiB
	zCNiunHN7XEf1F/4j9s+po00xwYv4YNswTibDp6d8U2BQYuMRDh2oPweek8LO8nHWx0MO6gy55nPE
	XA3rPYqsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwHDq-0002O7-JT; Mon, 04 Jan 2021 04:11:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwHDk-0002Md-B2
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 04:11:54 +0000
Received: by mail-pl1-x633.google.com with SMTP id x12so13812119plr.10
 for <linux-mtd@lists.infradead.org>; Sun, 03 Jan 2021 20:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PHjS6xkWESihBsNq4qcCg6QnCMAV/jOfgOFiTrhYkeg=;
 b=ojLWO8FyubFM7XkK10yDB4nf18PdsRA4j20KJpqb7sZyXWBg+Imh2CYq1b2xz2HiuT
 pReMw2wYur8JpJQYL4tJZqrUTASGmB6XC4V+I1s7MKoGrrbwGMgOSNtlgIWGj/yJJyUf
 NCVvFeHp0W6pdtplPyMByVXjznPFk7LAX6Y23L1M8ad+7XUk1dZyIcJOoyvLim0JPmM0
 VS2CQ883Y7pKt0PiFN+ot1HpxB7FgzCrrTsgzMCQbxGBeJjLg/j2RiXaf/0MqaZBQq43
 /xFPn4ZNQ/dPunceMZ8nJo8xYzagA694x+bmAv/HGxH044bWMSWOju1iJfhNlX5PKS1d
 e9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PHjS6xkWESihBsNq4qcCg6QnCMAV/jOfgOFiTrhYkeg=;
 b=kAxMHctOzyQcY6Rus3rxMK7aQAex8gpciWnCkvw33OA8OtLmTSXeCqA3P1Y4mD2Pmu
 4Z8Ga/0QAexHhfJTYvH63SagNoPPRwZKv8C++f4qKIk56vPAYvSLCHdbIUjjh5htLc2P
 PpeiZxMWfll9u4qsu28fnA2ECFD1oFm+vWt61gWly2yxcXgxqv2/YHJDJyR5FO2wFRt8
 HsMdl0Thv+DKQYT2JYerQG9wLTOj935hsQA6660Qb06pSOQKbVZYQy32sm/AsjLYBafU
 5ZOdXLa4o70t8eU83fWZNIWn8Etwlb0Qee8i99lXo034zcHj8WNl79X9LOzco3iCBywB
 tinw==
X-Gm-Message-State: AOAM532Ei7ri7kDzNhNjFlPxDqjDzLHfS6068i4DAbDhYh1Iw2VRP7y0
 MaRLojZGDECYbE7vWCyT+7nm
X-Google-Smtp-Source: ABdhPJz0Oi/0MPLCjlzMY+GUjSg/QOVFyyIvUbsJ6BWQbQmvlVxkdTnsbTINJ0kBmzF60etyR05xSw==
X-Received: by 2002:a17:902:9a44:b029:da:3d4f:abe1 with SMTP id
 x4-20020a1709029a44b02900da3d4fabe1mr70159622plv.16.1609733510263; 
 Sun, 03 Jan 2021 20:11:50 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
 by smtp.gmail.com with ESMTPSA id x22sm54899930pfc.19.2021.01.03.20.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 20:11:49 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v4 1/4] dt-bindings: mtd: partitions: Add binding for Qcom
 SMEM parser
Date: Mon,  4 Jan 2021 09:41:34 +0530
Message-Id: <20210104041137.113075-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
References: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_231152_520752_B5B10B41 
X-CRM114-Status: GOOD (  12.21  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add YAML binding for Qualcomm Shared Memory (SMEM) Flash partition
parser.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../mtd/partitions/qcom,smem-part.yaml        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
new file mode 100644
index 000000000000..cf3f8c1e035d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/qcom,smem-part.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SMEM NAND flash partition parser binding
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+  The Qualcomm SoCs supporting the NAND controller interface features a Shared
+  Memory (SMEM) based partition table scheme. The maximum partitions supported
+  varies between partition table revisions. V3 supports maximum 16 partitions
+  and V4 supports 48 partitions.
+
+properties:
+  compatible:
+    const: qcom,smem-part
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    flash {
+        partitions {
+            compatible = "qcom,smem-part";
+        };
+    };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
