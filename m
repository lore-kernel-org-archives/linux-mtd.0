Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B085C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnLBLb4s0iq952WDHuVQkJAsLbTELcIs2MLMYLwWWxk=; b=DefZ7gGQjWktQ7
	yN/KS3rbdk82jvVfEhD71/cSo3FdwvsB0AQgLTR9HhFhKzSGtHH8hf7NcX9kleGPFP5W9hh74TKv3
	rmCLlGKKETpvm4SfcHVl87Zd0uLqVEt1gzMzq19vebMNioEPttzoLTLh7aqzq83t2TF0Q4JGKUWs4
	5xfVbAIAXZmi5R7e03e/XtDzTBCi4CU0vCnr6FvNBANahjH2rUuv0Q7FZq2Pw7p4m189dUCofPi7N
	wA5hAQHY20hPYefeZQq9vtWLMQ5ZGzvIignbxT9fFP4NsLFD9EI0ojH7+PjqDBmWqO2N6Ur++xxaE
	0EvNfy4WHKrYLovklZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nluib-006Zq0-Ik; Tue, 03 May 2022 15:45:41 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nluiW-006Zn2-1U
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 15:45:38 +0000
Received: by mail-ed1-x534.google.com with SMTP id b24so20324116edu.10
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2022 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S2tw9LJk+d2FPX5CW//2TgutvMaT3ZAnSGVaZGs0cVc=;
 b=dTJu+AA18pGDu+Mgrone8iJ6Z5vFaP/hKQ8qJv5XDiiu1KshAcRfRm1fj1TNKMUBJT
 9ElyDG+MwSx8JE84tlJ9mjm70uLNRC02R891DmUZjV0Kxn5fS+n7EYN51GITLL5dkVuC
 vxPWvd1K+x397FdQyz6N56FjkiorFYzmzEy55u9R70soQiG7Q1u+1/sJN/Yk1FbM2BvP
 6uOcMgkpMJI6TLULOw9vyrs0mooGDkPpAZH2LQGf8ZSl7uW4tGgtxLm/nknqDPbinTNy
 eNfz0qEEe2/fYEzO5N9D6aNU4TNzp8h9/It3hnOMxuvrk1xQ/2kaev5wFhjqdTDLwd/H
 Myqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S2tw9LJk+d2FPX5CW//2TgutvMaT3ZAnSGVaZGs0cVc=;
 b=Uo8KvbOOkuWmSSI1c648E7HiHI7XtKzhMEB2svs134RkuETjrMWx45oqPukioEr6Ia
 sPlYoZxfXnprP6RiJrK6tZ0PeeDS0ZlRv3PteEMoD1D5LJAwWdntaAPSIyxQxCVNhrlu
 3jlQCp47D6NKG0KFtwdhDtua8aSt5t+EEHS39zAhLdc6hQuu3wWklMc166QzZo6wY0Qw
 Vk3eer7j+eFwdfb4JHTB2avZmZyt05x/TSyM+1cltwV6htSFtrgRVM32fLniLlTYRNHw
 ZWDyWt7Qya6JIGe5YnHlYyiSj1gdwimRp877hMekDAFtSYjcEVAR0w+ee1TGGA8EmDy3
 UgMQ==
X-Gm-Message-State: AOAM53021fPodlDr2wofQcv3FFcDOHyeiGYvwM592NNm0Q8cnwj2wZTK
 SBuQT71qhVGY1BnAFczvlAA=
X-Google-Smtp-Source: ABdhPJw71h8u7bNYCJUDffMoU514rCTVKO4FY77cSkL3yVy0Qw21I63fWcfq/vLCAnTa/czwvXfPXQ==
X-Received: by 2002:aa7:dcd5:0:b0:425:e49f:db86 with SMTP id
 w21-20020aa7dcd5000000b00425e49fdb86mr18498439edu.202.1651592731707; 
 Tue, 03 May 2022 08:45:31 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 zp26-20020a17090684fa00b006f3ef214e62sm4723961ejb.200.2022.05.03.08.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 08:45:31 -0700 (PDT)
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
Subject: [PATCH v2 2/2] dt-bindings: mtd: qcom_nandc: document qcom,
 boot-pages binding
Date: Tue,  3 May 2022 17:43:53 +0200
Message-Id: <20220503154353.4367-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503154353.4367-1-ansuelsmth@gmail.com>
References: <20220503154353.4367-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_084536_136706_8B772F6F 
X-CRM114-Status: GOOD (  13.64  )
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
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 84ad7ff30121..fafeca0cafff 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -102,6 +102,26 @@ allOf:
             - const: rx
             - const: cmd
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8074-nand
+
+    then:
+      properties:
+        qcom,boot-pages:
+          $ref: /schemas/types.yaml#/definitions/uint32-matrix
+          description:
+            Some special page used by boot partition have spare data
+            not protected by ECC. Use this to declare these special page
+            by defining first the offset and then the size.
+
+            It's in the form of <offset1 size1 offset2 size2 offset3 ...>
+
+            Refer to the ipq8064 example on how to use this special binding.
+
 required:
   - compatible
   - reg
@@ -135,6 +155,8 @@ examples:
         nand-ecc-strength = <4>;
         nand-bus-width = <8>;
 
+        qcom,boot-pages = <0x0 0x58a0000>;
+
         partitions {
           compatible = "fixed-partitions";
           #address-cells = <1>;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
