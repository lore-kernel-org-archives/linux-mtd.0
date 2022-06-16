Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76610C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 00:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/C/D9p1kUd67bCSxmFhmwOy+3bgus6N0bqPVsQ1SbU=; b=cTtL52mQsnBYfo
	JzNEvAzDRksQQQFVbKISxrupCWVyhXYT7LeWO9tnwhIehTO5E96/1LN6yIvjgjT4BTXxUDBptJzb5
	eFeOZEwjPpFtkA9Qm8YBnRycgWqJrBdzfUrbKQgB6kTcmkh52KU9Q5pob78UBnY33//qsYDlByyDu
	kfgB/chw3dg3LQyWFb1EV2sFOvfFtpY7ohRaAaR9r+IFxSPI1dGM3OVJbgUb/5bfnfv7UCImqYspP
	6eCiEQbenM218KWmQpuOtHpgQGMcSBNex3+c8iExA6/3Rw0BylZnC3mKthqQ6H2MJD6W5URkqQ1M/
	S2obsDSL7cjY2oeTdtgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1dDz-00H6WV-7j; Thu, 16 Jun 2022 00:19:03 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1dDn-00H6NA-6P
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 00:18:52 +0000
Received: by mail-ej1-x635.google.com with SMTP id n10so26258027ejk.5
        for <linux-mtd@lists.infradead.org>; Wed, 15 Jun 2022 17:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uWi4nF3LCftLqINeiaIVVz1nfL07lMarTNt9vrQsNMw=;
        b=PQ8nC5MVuAQT7r6QqDlFmyFHetwIZW8peR92ySiznfAD+szpx2xul39fjQAQ2Ed1m9
         +vObU6FawxJDctyqr1bXpTNoFTG3avWjYpijMddHnWck1MpAkBxSCnXsKWeEytgw4i1H
         E2WLbzluS/warij6VGMOWWl4T3JIhRoZUxNzYcpzZXB5V0JRy8Ui22PtXNG1VL8CR1bY
         ZTDNbdM1BzsNAYXzkQXS6HdMEAwx99VXLRsc9lQVatqAQpWK9k8+sS1t6n4fb+Ztydmc
         edVVwVDtjK8w8sJ90P7BesMfDBI9tOEEPhGz0bS+hMtzdNEcZ3ZZQFy4N5SK7kIMs5sI
         jIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uWi4nF3LCftLqINeiaIVVz1nfL07lMarTNt9vrQsNMw=;
        b=Wv4Bf9oL8tYKSFjw0pf3I1HJ6UJCz/iq0MFGh+xPigXF/t8tR+pAFRIYvoOSrW/e5c
         7xxKQhWTewM4vocTS4kKXXts7RhXwKvkPvpVL47nxHKErKNaf6fjztDKtunCtQNTmhNQ
         Ep/fsy3x4ImXmrRcnpFca/VuuC4yX9F90SXXCkM1FAq7dH9lORWZlc2zsJ5+YHOqdbCC
         B9rXppKWUyu75MMgUzFrEPtk7lQk/huByOKYt65w8IRcPkP4h2r0a2jB1QlNRoZRUBkY
         C5L1OwapRtsRtCY11rRcRpdcU7ulcFtzHYkUFiu+zmQVecrlds4BZ220ijLQSSpb3Yi1
         BVcQ==
X-Gm-Message-State: AJIora9UvhudcdSoJGc/eDIAYA6nggeKqqVISn0hB6DGXdl3cp7gx+5v
	NboKdDqUVvRqdY5ZeeH7li4=
X-Google-Smtp-Source: AGRyM1syMaFxhp8KJsk5hEzbDcVwz8aS0zK3BKaXWDAcVtdl18qMKw9nEQga6PpeIIGwYvmzKUqgOQ==
X-Received: by 2002:a17:907:968b:b0:70f:30b7:9324 with SMTP id hd11-20020a170907968b00b0070f30b79324mr2189545ejc.19.1655338725705;
        Wed, 15 Jun 2022 17:18:45 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id y11-20020a056402270b00b0042e1cbc4471sm542546edd.3.2022.06.15.17.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:18:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 3/3] dt-bindings: mtd: qcom_nandc: document qcom,boot-partitions binding
Date: Thu, 16 Jun 2022 02:18:35 +0200
Message-Id: <20220616001835.24393-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616001835.24393-1-ansuelsmth@gmail.com>
References: <20220616001835.24393-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_171851_291571_20522ED1 
X-CRM114-Status: GOOD (  12.68  )
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

Document new qcom,boot-partition binding used to apply special
read/write layout to boot partitions.

QCOM apply a special layout where spare data is not protected
by ECC for some special pages (used for boot partition). Add
Documentation on how to declare these special pages.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 84ad7ff30121..482a2c068740 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -102,6 +102,31 @@ allOf:
             - const: rx
             - const: cmd
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq806x-nand
+
+    then:
+      properties:
+        qcom,boot-partitions:
+          $ref: /schemas/types.yaml#/definitions/uint32-matrix
+          items:
+            items:
+              - description: offset
+              - description: size
+          description:
+            Boot partition use a different layout where the 4 bytes of spare
+            data are not protected by ECC. Use this to declare these special
+            partitions by defining first the offset and then the size.
+
+            It's in the form of <offset1 size1 offset2 size2 offset3 ...>
+            and should be declared in ascending order.
+
+            Refer to the ipq8064 example on how to use this special binding.
+
 required:
   - compatible
   - reg
@@ -135,6 +160,8 @@ examples:
         nand-ecc-strength = <4>;
         nand-bus-width = <8>;
 
+        qcom,boot-partitions = <0x0 0x58a0000>;
+
         partitions {
           compatible = "fixed-partitions";
           #address-cells = <1>;
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
