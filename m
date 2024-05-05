Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B039C4345F
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2024 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=docA3Ol1ZEwAPt7MMMGroyZtaYmNLz9MrRzN6GTQbK4=; b=B3cf/1HekXiQAg
	Yf9BFsa20SyRrvI/51UdSF2Yuj8IBOpbC8lItRo06zMOSdJLqa3sxjJq4VvW5jYgwDa11eM3ZVSPz
	DsyNSopnlR52bIAOk5ors7wdUXfBITmJ4QY+j1nDV5UZ3JkSH1Ug1XrvJznXASZIBMtLk89Mpcxty
	UIABpXE3Wgz7ge1uj2nl0pRxCpoqqzGh3sLXd3As0qvMe5XlNjGBMlJYl2vOHeGx+ngyYFkYTbb3Y
	PYMNebHTTow/6vxeEIHZDoOccKYDfPT0fNdvFiShx61rh4LGVYnINdyoZAnAL6JET0yNja4ZRqaPl
	hcXHZY3P5VM7h+Oi+LGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3XVu-00000003toJ-3Bjl;
	Sun, 05 May 2024 08:46:30 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3XVp-00000003tmj-38Ov
	for linux-mtd@lists.infradead.org;
	Sun, 05 May 2024 08:46:28 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-34e28e32ea4so788880f8f.2
        for <linux-mtd@lists.infradead.org>; Sun, 05 May 2024 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714898783; x=1715503583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rvqUn0JVMmaEtYEVilljD5LiJGeISCvOsUZtPDUnlA=;
        b=SX65ruOLz67GVQanenWE2fq1ONk5MLkFnhYCcCmZjtrxAtYED6/G1sbMhr/3x5YTu3
         lFqwegMldTJtDEIxE4fCklw8HTGK8Hzw+29kyNDo6PeLcVAadA+m8pt17rmz/h65JZ3X
         bSRvacQiJjq/vwzRgfk0RG84b2KX0WaujbgdkGJagXoPNv0gNiFZtdNNDRf11nnen5dl
         P7fQpmjbCyOu7e+Yf5YU1mnezttyojCgjnGcHmLp5pgZmQPTojO2jDAbZupha49yPFx7
         IBAq6xXVJDJTO2YN+sKnW4d1ok0RDsrUZHYlfT/ajTH2hS1XhONFo9yCwTV0MWVcHDZ/
         Uhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714898783; x=1715503583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rvqUn0JVMmaEtYEVilljD5LiJGeISCvOsUZtPDUnlA=;
        b=pNM+64UiHe4AhXqobPCqMw+eJqSEw+2OMWvf6TRtpr5GCL7t1P9OxTeQ8s6ucn4cHD
         NHtiIARtjHaLyI0ihGuf0VfAl3fuwdZEQgbQOQQ/DSVYLFFRkHourkEcjCHa1FgXmXUL
         5Yk3S0VRZHEABI9RZ/4lL/x4D/0TJOkJT0lsjATiGbLJ184pbmL5NvHHir/NtfG7aV7x
         dVuYVsehP4vMnS0XqfsTWLqs6cVT5Z8ObQfpTWtQqsa7Qcl4YVkTtYGY60iurF2etnFZ
         FL4zV8CU1KFZlyIw1enlLwtE4Lm6v11mURHcewFtUzObzuKifuQQam8kbmEwj8En8OBz
         x4Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWQfeDX/cWr3ef/kWuyHAICVnW8qu6cRNg8t314VBMmYwoAqifnNlFs1sPQapa6mUMwPKr2JSqqLyrM8RsC0I3xQGhcBfmXRT7bZtV4ZQ==
X-Gm-Message-State: AOJu0YxMTcO4NM+IWroN6nol+KprOhMiFw8i76MQS5OXReRRxxs9c/Cx
	wDK3u1+RD1KU7BLnoDD15Rh0qdwm25yg3tkB6EnI7+J6bV2mswiT/4jcpDLWJW4=
X-Google-Smtp-Source: AGHT+IEAIRhFGaEyDg154ublccIoPbU+wBOiO4gHoxXjddQxdSA8q12a5Tt5YvOHYA6M/h8U+EvPGQ==
X-Received: by 2002:a5d:55ca:0:b0:34d:aaca:2f6f with SMTP id i10-20020a5d55ca000000b0034daaca2f6fmr4816765wrw.69.1714898782639;
        Sun, 05 May 2024 01:46:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c4e9400b0041b5500e438sm11840163wmq.23.2024.05.05.01.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 01:46:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Shijie Qin <shijie.qin@nxp.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: Use full path to other schemas
Date: Sun,  5 May 2024 10:46:18 +0200
Message-ID: <20240505084618.135705-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_014625_819767_6CAC8DA2 
X-CRM114-Status: GOOD (  11.08  )
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

When referencing other schema, it is preferred to use an absolute path
(/schemas/....), which allows also an seamless move of particular schema
out of Linux kernel to dtschema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Rob, maybe you can take it directly? Should apply cleanly on your tree.
---
 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 2 +-
 Documentation/devicetree/bindings/media/amphion,vpu.yaml    | 2 +-
 Documentation/devicetree/bindings/mtd/mtd.yaml              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 5b1769c19b17..418c168b223b 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -784,7 +784,7 @@ patternProperties:
       gpio-2: GPIO4
 
     allOf:
-      - $ref: ../pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
 
     properties:
       drive-open-drain: true
diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
index c0d83d755239..9801de3ed84e 100644
--- a/Documentation/devicetree/bindings/media/amphion,vpu.yaml
+++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
@@ -44,7 +44,7 @@ patternProperties:
     description:
       Each vpu encoder or decoder correspond a MU, which used for communication
       between driver and firmware. Implement via mailbox on driver.
-    $ref: ../mailbox/fsl,mu.yaml#
+    $ref: /schemas/mailbox/fsl,mu.yaml#
 
 
   "^vpu-core@[0-9a-f]+$":
diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index ee442ecb11cd..bbb56216a4e2 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -48,8 +48,8 @@ patternProperties:
     type: object
 
     allOf:
-      - $ref: ../nvmem/nvmem.yaml#
-      - $ref: ../nvmem/nvmem-deprecated-cells.yaml#
+      - $ref: /schemas/nvmem/nvmem.yaml#
+      - $ref: /schemas/nvmem/nvmem-deprecated-cells.yaml#
 
     unevaluatedProperties: false
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
