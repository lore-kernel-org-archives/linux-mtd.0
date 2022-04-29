Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C020EC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 21:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfrqJBA+R/MFpYHpmns+Rc2kX600Ar0ceV5LDA6gFL4=; b=xDneFXxuThyP+H
	33IWgFtaLkeL5MkV0bE4fCtcAAvK1o+WYY+rS08idlxNz3iUPq4om/hZMOVlvFCG/MhFjNWCsGnyv
	ZlUzIUE8sfPHVsJRsTRjceb+njcwiLUSPSmZNefmkhjBZ7r1XFhhGdorSpr4udy9+aYMN2vg9CgrP
	XLvPr4erSVP4ard79WeDDwPaHrO2oiFXgX0ogFuWZwXkuEh0p89NElruciM/KfKQVqlnbZc+Lp99S
	HH6jl28US7nfTF1OoHC9gHWYrNtVAz8MiKZiBYxbpjgl1BcwUAzmOn3igQVQul+HXFSsANETjaA7Z
	13kBZi8RBoXxGvz62EAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkY1P-00Cm9v-8B; Fri, 29 Apr 2022 21:19:27 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkY1H-00Cm6r-8d
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 21:19:21 +0000
Received: by mail-ej1-x62d.google.com with SMTP id m20so17636062ejj.10
 for <linux-mtd@lists.infradead.org>; Fri, 29 Apr 2022 14:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gyPvT6DKhtv2LPGNMnZpj5WqaEJs4Q758Rx/bvZztkE=;
 b=K3IcMyLBnInq9tUXoAQmLRUn1n0CcUvwxaNSopGX4VEgfzz8O0/XMIsrlCdyXQFbuv
 i2EzK7Mdscn59II/wyTd12IcePJebAc+XAiW5eFGoT+dPynWOjM0P7FLsQpXr1RxEQZu
 6K6+ucWpN34OaMyZlRB1QmAcT6ekPsHvfQb03RzCKy1PEfJzLYlzGCIYuiupLtcYG4Gr
 LH+wJanQC4gj1TIPGX8oxglqFpSYwJq169oMaf1lp/Z9KUGJXrBEv1qtid1ZlFHcI3h3
 JALgObBe9GLtLhUrgbQHIjliMjQmyJ8JQI9yMf5zWrAe/4C/pMk1djaSF9eTIGnFX6qK
 bhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gyPvT6DKhtv2LPGNMnZpj5WqaEJs4Q758Rx/bvZztkE=;
 b=idkR4VLHJGhtEkw8KypFQugpX9LB8I+hngHW+c4/KLH65mY8uNWPaerZRmCvPnM95b
 8nv7L8/xz5rXtfdZnxE6fV+0s0O2G1tWrZweqVveeOlBmtDXQgRWgSju1INzjNSE2bmX
 R6zhjSHpFWovrVZ5A65ret0N9OZ4HUnoYoyRElmczRDmXnWgfsYZFKQfomFbSqXX/JAz
 Xiwg4G0FKhFuXtpFJNlZsEX/rarn46Pg1U4e9Y6tshXxWEihUoJZ9eX/jbT+mATMfd2R
 vlN4PZmNSwFX2vsmw/wj8Wz9XeUPleVd/n9ZLZ8DkvZA4Ufsq31aD843y5yjQOCHt3bT
 vzzg==
X-Gm-Message-State: AOAM531Dd9LXqVyYR60jxLiXfHML77sS4hULUHpgYLlzPrhjg57kQfsv
 2Oq88jh6cwpAKcTV2cWB54Y=
X-Google-Smtp-Source: ABdhPJzPoQ/CPHg7g31DTKdKA5Cdrb5zHLXus8chii2zzudP/i37wdo/X/9NgP9i4O2ifmgOFtzLhg==
X-Received: by 2002:a17:907:1c87:b0:6f0:29ea:cc01 with SMTP id
 nb7-20020a1709071c8700b006f029eacc01mr1139319ejc.671.1651267157597; 
 Fri, 29 Apr 2022 14:19:17 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 hx14-20020a170906846e00b006f3ef214db6sm990143ejc.28.2022.04.29.14.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 14:19:17 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] dt-bindings: mtd: qcom_nandc: document qcom,
 boot_pages binding
Date: Fri, 29 Apr 2022 23:16:30 +0200
Message-Id: <20220429211630.7812-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429211630.7812-1-ansuelsmth@gmail.com>
References: <20220429211630.7812-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_141919_337501_7C20520A 
X-CRM114-Status: GOOD (  14.32  )
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

Document new qcom,boot_pages binding used to apply special
read/write configuration to boot pages.

QCOM apply a special configuration where spare data is not protected
by ECC for some special pages (used for boot partition). Add
Documentation on how to declare these special pages.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml         | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 84ad7ff30121..ef243109689d 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -78,6 +78,17 @@ allOf:
             Must contain the ADM data type CRCI block instance number
             specified for the NAND controller on the given platform
 
+        qcom,boot_pages:
+          $ref: /schemas/types.yaml#/definitions/uint32-array
+          description:
+            Some special page used by boot partition have spare data
+            not protected by ECC. Use this to declare these special page
+            by defining first the offset and then the size.
+
+            It's in the form of <offset1 size1 offset2 size2 offset3 ...>
+
+            Refer to the ipq8064 example on how to use this special binding.
+
   - if:
       properties:
         compatible:
@@ -135,6 +146,8 @@ examples:
         nand-ecc-strength = <4>;
         nand-bus-width = <8>;
 
+        qcom,boot_pages = <0x0 0x58a0000>;
+
         partitions {
           compatible = "fixed-partitions";
           #address-cells = <1>;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
