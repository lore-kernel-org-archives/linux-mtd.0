Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38977CCA47F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 00:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/bO9Y/vbA9BbE3N20w6oEcXizJucXhDrEes3X7c7yU=; b=Quh2lJt09EGL7j
	avqeuwe5GOqYIEJi8ahbc/Z4TU0xaZavP5urxhdP9tNDCSxYWKmzHVwX9ld3Y+9NlO39VC1EEN/X+
	6iT4HosRRSyGl5ZQIzWCaOznB9Psm/XzR6x3/vNlbrrh+l2V/K5xb4ogCth+u66PFl/XSVj4UwzP4
	WYgpcQgze4SNxkosr9HYQfKvni7IW989NbQR++83qMbqkf46CBC95SDziECQ8JywQd/wiAA7fwSyI
	IXbigthUiv2CkTPMeQuNU2+5W3zkQqPUMQ2DndJmUDFBBQVdf/fxwCZzAOUXQPhsIRp4HH/LrkYZS
	smXsucHRnvYVKgDXUHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyjIV-00A4WD-47; Wed, 08 Jun 2022 00:11:43 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyjIR-00A4TJ-RO
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2022 00:11:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id x62so24963493ede.10
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2022 17:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VT+TJ2YPzEHYu6mfTNmRiV87DaEKHXEmDZv9wBUUtRQ=;
        b=GEglJBzl8OexIR2XmXIjrv+3Sx+kxYIAVp6AdIhzFr16qtQ+Pq/e77w27Y4/CXX4kO
         WAPRijgPiY7bobSDLntH5kMszmjJ2CdgUX7lycTCp+LZ8YiZ6/KiG4O3MI+z0uaXHwM7
         Bi7pcq7N95HyMmluTB2GldmjNdFiKgIMthD3ETU1HChZ2eBi4maTmHluS5SL+qyK0mPn
         l320QhFpBMZc+HR4h0MdMt/XbROcxuW5cZaBZ3/fMSXCkG9RHR4r2DM29tN+0FQc9Sks
         R+atxDxJYOeVjagZqROXp1jtkKIN6JvcMSZJuMQ5oiTdmckizVw5BsIYC9PwOJv0HkV7
         Uw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VT+TJ2YPzEHYu6mfTNmRiV87DaEKHXEmDZv9wBUUtRQ=;
        b=L0QbALJhRC6e5bluOSVa6o9u8Ch/X9kk9xiki4FTjl6pU9+e4yf9wJ0wzW+AHgbQuE
         pFfp8CHjemQYtt2kQOLC/Pnh/pzc8o/LDo3zrsm3Xtr3x11AbFFyolS0+WIDf933JfUQ
         72Y2necc8dJjg6eRT2V5F/abFhy05jnH2yEmYuDhe53YWA7LAeaq5DxJpyiMFI3I5HbO
         Wg0yVRLRKlOw4T28dhDBnN3Dk3LamnUKKQFLtyIGbAz9kpsSUX0RE/LaOMR4Dvj2PwE8
         8vdWUx/eWF50xdSMZ5tcYlG5qaBZ/6bherr/0vnnzcB9tKN8DWTKbehpmnLGX6UrSBud
         VXBQ==
X-Gm-Message-State: AOAM533WFISXywV05vdOvKdiT5VzUyeoVXHrz8FbDfRmFR+/3ijoV+3E
	OBvk63VFDlZLbm6oLIORJIw=
X-Google-Smtp-Source: ABdhPJzPTDrtaU23PFJ1myspJOaO4RQMfMVyIo7KO2l7BrqW0kv/Armfp+wyKBcB7iulRGwDplacOA==
X-Received: by 2002:a05:6402:3207:b0:42d:dba6:8ef0 with SMTP id g7-20020a056402320700b0042ddba68ef0mr36944296eda.410.1654647094506;
        Tue, 07 Jun 2022 17:11:34 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id o19-20020a1709061b1300b006fed85c1a8fsm8434947ejg.202.2022.06.07.17.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 17:11:34 -0700 (PDT)
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
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: mtd: qcom_nandc: document qcom,boot-partitions binding
Date: Wed,  8 Jun 2022 02:10:29 +0200
Message-Id: <20220608001030.18813-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608001030.18813-1-ansuelsmth@gmail.com>
References: <20220608001030.18813-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_171139_923271_3A300C4A 
X-CRM114-Status: GOOD (  12.56  )
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
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 84ad7ff30121..a0914ccb95b0 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -102,6 +102,30 @@ allOf:
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
+
+            Refer to the ipq8064 example on how to use this special binding.
+
 required:
   - compatible
   - reg
@@ -135,6 +159,8 @@ examples:
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
