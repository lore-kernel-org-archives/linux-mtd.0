Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137AAC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MXslLH6yJaFTSp1DMtLWz5qyL98rC+CQyzvN+4eojlo=; b=3ve94usVk6fs9I
	y1kzikWtcC6iyJIng95yljrlHAsHs3uBklgfIGt/9FEWDclbdS47T7sg3UzTA99z5bmKQ0XarvUji
	TLsoUT0TFzoJ0yHUTK6D1uktUDZaIzJiRjJbpVQlzgpbpkTQ0A82Vy64Nr6uypDadNQzARoTn4O3q
	B28plFHxBXmovaWw+KNqLq81XMFaiVr7ZPAFWgfb4sJkDT6CAQAZTsf7q3z/ICsf7QVOl9uib00iS
	8yRoUY1iFr8fyzEjiCkkcwI1ZuOFlF9rEuKQTuqvUuC0A6xgTotNg5izI0f563JIrUJDi6vdbk0wL
	vwdkvAqX27eZvZUgNjNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nERkL-008QtI-SK; Mon, 31 Jan 2022 08:09:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nERkI-008Qqi-5l
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 08:09:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id v123so9586988wme.2
 for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2022 00:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jGYF3pbw01XqjiiSW32sevD0apLMvUfMvdKL2Bcj/k8=;
 b=JFGHp0YQp3Rgy5f+zViTTGyeENCxz6NzmcXxWaDXUYapSJVcZTZckMMM67RtFhoX1e
 KhPrcI9Aho3ufBQwefRQQcsSqAeIYLTbZ9U+Cb+tkiZIUPc92y0/BX7SGkLXsXVRIrlf
 ZNWsVFQUH21ib8wy4+eeCVBeZlhl/xxWGzr58mdpBIGsaez/6ikqM0jkG7yFNLpqNfy5
 E2MaYt83Ep+IJ/e+7WwBAbin4GmG+K6U0LcQYfd2dHwt0t6dubHSqvi8Qf0JDEsLCPL2
 UUvykSoMk5oszhOe5uC3rz0coPqk5SBrVEVv73FJpwNcKt6EdfkLHoTkeeRYKbCgDbDQ
 486A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jGYF3pbw01XqjiiSW32sevD0apLMvUfMvdKL2Bcj/k8=;
 b=ASa799u1P/Ez9fN6Kk1imWg2r4ct9jtF2GarCNx3+2ujZbyI1Jy1KevyK+OkZ79apW
 VR4HJ7nghYNgac2Muj3v6QTnTU4+WUA7X9lE1jdWwp5v0vy592so4gNMgtkK1WbcOV2T
 YqOJ5dZdtKvFxIjh0+vpOYVbniTO2dCgqPABiDtmn6DfddfHduY0vFM8Pm/fCk/IRUla
 /0EGl/SpsUr4a3EEBjQIWAk+fU2ZllBff5i8j5x01v1Ey+/jIEyE6KXE6lvkU9zkATtQ
 L8zaIHNV2An5J4u7H5aRNHRasXw8Y8duIlriah+qHgRwIpy4V4amdqprcU0MFBatT4t9
 xTbA==
X-Gm-Message-State: AOAM531vE8YYS3W383KkFzWgBN8uu8UkBP2KnOembL7HBoue6ODiPXEk
 OAU39Q9bPEZVTj49rnAGkVGzrw==
X-Google-Smtp-Source: ABdhPJwFgwJSsT6nbgtuR53NdNa+vE/ZtKlTCkZ5BtezvM8OIfeMxhM3bWBO65XrV0Z/IsgK7fxb4Q==
X-Received: by 2002:a05:600c:3b9c:: with SMTP id
 n28mr25437325wms.128.1643616544178; 
 Mon, 31 Jan 2022 00:09:04 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id m12sm12978806wrp.61.2022.01.31.00.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 00:09:03 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: linus.walleij@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 robh+dt@kernel.org, vigneshr@ti.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2] dt-bindings: mtd: drop mtd/cortina,gemini-flash.txt
Date: Mon, 31 Jan 2022 08:08:58 +0000
Message-Id: <20220131080858.1777518-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_000906_274034_AD9541E3 
X-CRM114-Status: GOOD (  13.81  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
Change since v1:
- fixed typo on syscon

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
index f827984936f6..82eb4e0f453b 100644
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
+        Phandle to the syscon controller
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
