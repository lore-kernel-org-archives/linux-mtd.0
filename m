Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140DCC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=keKdyRHdq87O0kYVDCh8b0vx8IwSLzQYiPe9wsWLqf0=; b=m3AyX0x/jgtEIJ
	+tkX2y/gyv9ENxHtfnpMcxmnZwGx5P1Nf6NyTbGVnPYrIRyYk1NfjxZ4OFkterrSEfhpsSyIgiaaD
	ikfeCEj8UpKB5yy/0jzKrnBZJuK+Jv5QPWe9EOhHvslZG4MNf7pd5QnX+1jM+K29jaQHUsQDS5MVL
	vDPLudFY1mNk4HLreY5PHUez8p/RbNpV/oTHckN9GpFxzIz4xEEW7ZCWYd/jHmRm/VG6Hp5bb6k6g
	Dxr+xzi/XyBKkYH7EnpPzWX+La7VreP2FJaFcI7REPYxmj986z3/R9Utcr1DzjLpm7XmuwUJPAEnp
	RYEVoKbxKuaIFYK/KQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDAzW-00H1TY-F5; Thu, 27 Jan 2022 20:03:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDAzI-00H1OF-1M
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 20:03:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 c190-20020a1c9ac7000000b0035081bc722dso2562568wme.5
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2022 12:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dnjZ8liPA7/h3/BthPRXMHnMC8m+sC0gjHgL+cd4U/I=;
 b=31Il6k2wbhFteM2EahuPKQvm/lr9RvdgDCD6s5QLGsl0LmNRIE6h5kcrTp7O0AfYNF
 C9ltMr2PWZmeJ6i2zzhfwKrcFiUjKRhshqt/Z+8D5bNHMaGpvZA6T9tr6OB9EEIHS+60
 /eG6IodF90L95zkJ3sJDfyI1flgCXQAehkPNbnTQ0WSr6E24FiDRtjGVQ6DnS5gndVLd
 alPMfVm+NbqF3rCQKcrQrk3gOu6QjMIh/KNtMkgWyQTl9kzXO72F68YaJSLpFWf8LzWF
 Q+mWdcKxfIDKCab0wNy1Cwvhru/oKi76xXPJ0UMKlilm16suruJ1LVBW4PCZ/4rY5Cw2
 N5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dnjZ8liPA7/h3/BthPRXMHnMC8m+sC0gjHgL+cd4U/I=;
 b=IrfT2Nk8B4RAxfe4AK4tUcf53Qv8PokMMqJyrhF0BEF6bjUoLz8wOMgzReJCCc5tv8
 QHbawUcBjeEIMDs3W5SJcJQA80rN16Kss8PLPr4Mk2qP0GSHnPcH9X8g6/4pxGSjbIDc
 CiT25dU+pHbi+PluBJBNiGCV5u7KbGXl4VMvzdT4ouPajFr6q67P+OZGJKhb9vltM6t0
 ZflMx84XGjzXD6GRBXh8v78dPrTHRFmB6F0Q2dhrVb6B2Q3b+Iz535gUnsl6tJH4Aez3
 g1Ec+SQyROzwOQxbaj78BppafKqQg2HwdP/LJNVTHhWbbVykjXvA23gTkXJ1FFbs7Rm1
 tm6w==
X-Gm-Message-State: AOAM530HF/4j1b89UbCuM1vxjGDI/Pvf970uvXxtgIIgOE2GVIbMpNpB
 WsziD9CW1jMavTi2ZnZPIouzLmAkAhAHtA==
X-Google-Smtp-Source: ABdhPJxIUkgCivPsX6P4xZCeLOZ1heJIgNFK8ZctU0b8awNySJplRGbBoHfb06LcKnNkxi1FdrJdtw==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr13053351wmi.90.1643313798177; 
 Thu, 27 Jan 2022 12:03:18 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x6sm3328301wrn.18.2022.01.27.12.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:03:17 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: linus.walleij@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 robh+dt@kernel.org, vigneshr@ti.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] dt-bindings: mtd: drop mtd/cortina,gemini-flash.txt
Date: Thu, 27 Jan 2022 20:03:10 +0000
Message-Id: <20220127200310.4150981-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_120320_185358_6A8E884B 
X-CRM114-Status: GOOD (  13.14  )
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

Drop mtd/cortina,gemini-flash.txt since it is nearly already handled by
Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../bindings/mtd/cortina,gemini-flash.txt     | 24 -------------------
 .../devicetree/bindings/mtd/mtd-physmap.yaml  | 18 +++++++++++++-
 2 files changed, 17 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt

diff --git a/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt b/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
deleted file mode 100644
index efa5b2aba829..000000000000
--- a/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Flash device on Cortina Systems Gemini SoC
-
-This flash is regular CFI compatible (Intel or AMD extended) flash chips with
-some special bits that can be controlled by the machine's system controller.
-
-Required properties:
-- compatible : must be "cortina,gemini-flash", "cfi-flash";
-- reg : memory address for the flash chip
-- syscon : must be a phandle to the system controller
-- bank-width : width in bytes of flash interface, should be <2>
-
-For the rest of the properties, see mtd-physmap.yaml.
-
-The device tree may optionally contain sub-nodes describing partitions of the
-address space. See partition.txt for more detail.
-
-Example:
-
-flash@30000000 {
-	compatible = "cortina,gemini-flash", "cfi-flash";
-	reg = <0x30000000 0x01000000>;
-	syscon = <&syscon>;
-	bank-width = <2>;
-};
diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index f827984936f6..5b4440e005bc 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -44,7 +44,9 @@ properties:
               - numonyx,js28f128
               - sst,sst39vf320
               - xlnx,xps-mch-emc-2.00.a
-          - const: cfi-flash
+          - enum:
+              - cfi-flash
+              - jedec-flash
       - items:
           - enum:
               - cypress,cy7c1019dv33-10zsxi
@@ -127,6 +129,20 @@ required:
   - compatible
   - reg
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: cortina,gemini-flash
+then:
+  properties:
+    syscon:
+      $ref: /schemas/types.yaml#/definitions/phandle
+      description:
+        Phandle to the syscom controller
+  required:
+    - syscon
+
 # FIXME: A parent bus may define timing properties
 additionalProperties: true
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
