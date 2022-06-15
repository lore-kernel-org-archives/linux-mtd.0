Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25A0CCA480
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 01:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJdURueZz0BN9MxBsEpxWkIij3E1GJ6G6/5h0RodaY8=; b=dTeWW+7zWfYllm
	eLhOTpT9psxYTy3Zv9Oimr8BzVCCCwER3m0de0F9OkePkdDhU+z3uqJjRzhB/7r1Jd0aiV4J9H2s6
	JwQ9pJkHgg7AyfVcaItLcqtjFufatyikbOr4FQ0mgUjPSNjhhUngm+VMabGCAeWqnDGTNGkjz9IGo
	G3Ws2d0uPDcgGfAqa+1+6wOlERIAmCuRpTc1P80pwJCczdb/1QRY003EVzOksaMXU6F4EEAPjUTQI
	MUyQeRNUQFNlbBqBGAxxYOmi0pqYsFvzT/oUzp8C+c5HySenoMFVsbt976AFl09g5yZnESfWedPX4
	wUYSkIcnKGo2AFMALr1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1HOR-00ByRV-FU; Wed, 15 Jun 2022 01:00:23 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1HOO-00ByPb-5C
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 01:00:21 +0000
Received: by mail-wr1-x430.google.com with SMTP id m24so13266973wrb.10
        for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2022 18:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WkTfkEtdvoDFhLpzjBZDOf9aoOpbPYXE7T/CHrXeHMg=;
        b=IGxma2NKikLDsbYCdhTSaETNNjbqTomFUuGFHKt1wFmj6T+VLPgokRIY87z4s/a1FO
         TG6MFCvgRXODC6bJa+55TLNfqooWkAN3CCFFYbNhCfH4ST4TcfDeupYU9hyrMemqZYPB
         og10GrfehnJXbj/Ru5OTYIeb0gOSXJXpYVSrrG8p1XDf6bYv0MOsVeUIwp1s8HlSo5mB
         UIVFNlhJY5/7d5b4uCEY8eu7rZ7ASHJ3NHYD9l5xOtDoR9ApPgefaFg70rmaFuBZuZRX
         OsqQvYBP7UzmsA80JSjcKP4DLEZqArOjlEw+Yv/r2vWU5Xr/N7EO/252fgom4dTuXsuP
         80fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WkTfkEtdvoDFhLpzjBZDOf9aoOpbPYXE7T/CHrXeHMg=;
        b=uAPbtEDPZcGyaTjgTur6+QfzvRPYW+lNH3G6d3r6jAbabTmKwIeHVPAhuCXDE152b6
         GLUNX+Ymwfv4ScXGqvyKpye+7xSXigWR21Df+9ZyXT9BAsF4rK0dloiC2L5Ck0oSVoX5
         ZOCKcYm72s4ZrnoqXrH109ye21Wne/OkvEhXcbvivE76nHb6NBhqmNv+OxpgJNIYsHKr
         qEAzjri09QcECSAh3nwGN49ylgp/pBpkJ6DPFuyPMGRj506xWTEwdfoODfKij1L3xwWk
         kZuDbStRJstn2TYYdlC7TwjR2l1xxNFkNqhzsdv28pXIRePe5bMjjK+eaoz6f/InSgHa
         gfuw==
X-Gm-Message-State: AJIora/8qfB53ooI3sbI5qaRMdexnUn0pdNGoi+F0TWzujJxISRK34Oj
	ZBW94qZ9uoPJP+nL/dOdt3Y=
X-Google-Smtp-Source: AGRyM1u8w9uNDVwTTjicqnuRA4u5EELuTRh3kWuA+S9ngbbi41XTiT5CMhb2JGf4b9wfYfqxhEX7Pg==
X-Received: by 2002:adf:f252:0:b0:210:2a67:2d9 with SMTP id b18-20020adff252000000b002102a6702d9mr6953243wrp.17.1655254818201;
        Tue, 14 Jun 2022 18:00:18 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id g10-20020a5d698a000000b0021020517639sm12890265wru.102.2022.06.14.18.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 18:00:15 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v7 3/3] dt-bindings: mtd: qcom_nandc: document qcom,boot-partitions binding
Date: Wed, 15 Jun 2022 02:06:12 +0200
Message-Id: <20220615000612.3119-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615000612.3119-1-ansuelsmth@gmail.com>
References: <20220615000612.3119-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_180020_237281_482B603B 
X-CRM114-Status: GOOD (  12.81  )
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

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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
