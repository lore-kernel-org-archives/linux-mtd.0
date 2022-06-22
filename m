Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55896C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jun 2022 01:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bk/2SacHsxpWmV+mB112M3NuJHAANj1TMMq3gw5Qfbk=; b=HNIYBfoSm+4Dev
	u8bn+rTMLwR52igb6EpsyE/hHCcf09BJLYy8Rn4x8eBHmsiQdxyA3+VopTMv2aLZjtMEM/tb5XkEh
	28n0USVpfr6ON4mF8UM2TLPTsxgNBhXOV6V4ilcvk5bsLO4NuT+R5GB/LrL3fc5uS1+hG2rSS68q/
	gjbfgxJq5NyW/oyxkPukfVEdCz/a6EG55TkkHz9HNHU4T0b4E7JaUsA19mjxJWwJg48p/qYA7jgf5
	ZUQ5R1quJecQMwVqx6zHPYvcsHqNH7IwQTcMC9ap8fYIIQCLGnFIHnCJT45Yu1TqqDtRwnMC5wpbZ
	c3no4EDCRPQH73UxJoIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3oti-007wwu-Vv; Wed, 22 Jun 2022 01:11:11 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3otd-007wtL-Om
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2022 01:11:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id j24so494040wrb.11
        for <linux-mtd@lists.infradead.org>; Tue, 21 Jun 2022 18:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YC/BC0ut4zFCpXZBrPnkhMqs1FiO6H+QzVtgFYbz5nU=;
        b=GvYFWsppXKJZ2uIo+QFSC7fjqDtt18IMKsg0aScb6ff04JS2hKbjmefTxEgOGHM9OL
         sRnrg7Ks8/0zgG4fiH/iC0j6FhVoDi+rI0CpD5L3stBpqsIvoZw/vX49Tw6NGPYvry2z
         EUlh0DgLtjSehF+050c5bG/0QsXwphOaZOi+0lRC0cs/khAm1XkV2SE5jOphomRJ47FW
         sUFJebvmlWt3zIOkHaGYoaxvKuJEtLV8fGS9VYNCpHR6BwYQAhU6Y/iGUVWlX9C/OE0C
         JBmTEFBznGUbYTQyWwBLRSsffCOECWJfgYNSnt/hYcVnCDHP9+bLNRRZ7h9RABTWl2W1
         AiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YC/BC0ut4zFCpXZBrPnkhMqs1FiO6H+QzVtgFYbz5nU=;
        b=Lfgbr3///VoYhF9tiuM6+Cz8GDxfU9Qu8Blq/FFHWUFLYJk10rBK1chLgPQFCGNQKM
         ORnXVC1fu/3m7g5XgFE6/DZm6slQW1p49Cay2qQNw/X7VznkXFuyCKu7FXRR5RivNWAJ
         86wT+wkjmAZk5wIrRiJG/CGlodxfGR6nWrdf1w/9D02Nveu7EXj7xGmlEoZmsKS/6RR8
         LMwGLlgju9BN3zP6+g3NJwbXE9kxuan4BuIxhwDDdBAPabo/lXprsMg8/ZrqexeTsu4r
         37rMGa9o4goflpy7k2GjBjeOPnT+AeE5ycUj8Z7cB6FWW80eq69u/wN77LufW7E7BscI
         Fexw==
X-Gm-Message-State: AJIora/tCFOCqZO9ls4dbQD//im3BnVzOZMFE6rVigiRZqYCk939vojr
	WStc/Cw4I7bnALuA9v07wDI=
X-Google-Smtp-Source: AGRyM1tyijALZnxpm5d/xI5wzVlJ8yVf04+msGCD9rlWW03RO2oTzb/ITlZlh57VeVaFdApA4JYt0g==
X-Received: by 2002:adf:e6d2:0:b0:21b:9580:8d8b with SMTP id y18-20020adfe6d2000000b0021b95808d8bmr670736wrm.120.1655860263863;
        Tue, 21 Jun 2022 18:11:03 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id x13-20020adfdd8d000000b0021b81855c1csm16560086wrl.27.2022.06.21.18.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 18:11:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jens Axboe <axboe@kernel.dk>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?=EF=BF=BDecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Subject: [PATCH v6 2/3] dt-bindings: mtd: partitions: add additional example for qcom,smem-part
Date: Wed, 22 Jun 2022 03:06:27 +0200
Message-Id: <20220622010628.30414-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622010628.30414-1-ansuelsmth@gmail.com>
References: <20220622010628.30414-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_181105_870174_9AE9095D 
X-CRM114-Status: GOOD (  11.30  )
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

Add additional example for qcom,smem-part to declare a dynamic
partition to provide NVMEM cells for the commonly ART partition
provided by this parser.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../mtd/partitions/qcom,smem-part.yaml        | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
index cf3f8c1e035d..dc07909af023 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -19,6 +19,10 @@ properties:
   compatible:
     const: qcom,smem-part
 
+patternProperties:
+  "^partition-[0-9a-z]+$":
+    $ref: partition.yaml#
+
 required:
   - compatible
 
@@ -31,3 +35,26 @@ examples:
             compatible = "qcom,smem-part";
         };
     };
+
+  - |
+    /* Example declaring dynamic partition */
+    flash {
+      partitions {
+        compatible = "qcom,smem-part";
+
+        partition-art {
+          compatible = "nvmem-cells";
+          #address-cells = <1>;
+          #size-cells = <1>;
+          label = "0:art";
+
+          macaddr_art_0: macaddr@0 {
+            reg = <0x0 0x6>;
+          };
+
+          macaddr_art_6: macaddr@6 {
+            reg = <0x6 0x6>;
+          };
+        };
+      };
+    };
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
