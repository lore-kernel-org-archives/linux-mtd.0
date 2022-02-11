Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2443C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Feb 2022 12:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RVtnHTLV5aIL/0A1xqT3Vp8/I27Sn3OY1Hq/zF8Ls9Q=; b=atBp98K2wPHPkb
	OespytUTV53d4GfuYwQ3JBHmaoWQqu8W4ZPvitwhoU2yzkdh+Ig9zQpIleVbqpdLGC4ok8fzxxW9c
	LniLzNH6VRFZcgokL7dR3rpON0xNBeY7ldiVN2BKbIm9KG2YY6xDO7Mry/r9mX0r9au3K00RUIf35
	DjR3uO3+lijOweRB5nvR+O62FLlzGFPA9vPnUG/kxfpkxf56yFGrkRgoFRknAC5PfW/0gc8593mql
	p11AkJGV49s2MYIC221LWtp6TnFkCakMUdyrTHDIoBfyOJkFFFrEo+quYHTQwKktCx+A4L3IpCWFI
	w2ZvBaOXrDEkCMfApASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIUjW-0072gd-Bf; Fri, 11 Feb 2022 12:09:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIUjJ-0072eH-UO
 for linux-mtd@lists.infradead.org; Fri, 11 Feb 2022 12:08:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id j26so4035663wrb.7
 for <linux-mtd@lists.infradead.org>; Fri, 11 Feb 2022 04:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bAuohS2r9a+rHBFH3yY/vSyvPnTGhT8Dt1KFd/tOWeI=;
 b=P45HGFmHAEfQUBc17dQA6o/s45i6unuZR5s340ifEwoZCHFXTa9wDuR69ZBx52vIiN
 EYl7Bt5ZOKRfiKArVUV26ZLXh5KCFYHcH0xA2ynxrxSTdCemcMgNTtMgmMLboFnPuViZ
 N7i3uIYj6QV9YHo1GDsV/eJ53JGEfGmNQ15y28AirhIdb5dljS8FcVap/P6GTYEGT0GN
 HjVT6Jucs4aZlJ2t8GnjqQKM1f8uJ/UFxEtbM2VW4LbBcJnsRXV+qwcUAospcWAmgqUW
 j9jwUjX8mjB1PdQ3xCDbXZVwGrye5JM/pPp6ovxrzHVcCweU6pliKVrtajTecIJL4W81
 t55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bAuohS2r9a+rHBFH3yY/vSyvPnTGhT8Dt1KFd/tOWeI=;
 b=5Eo1KIpuOpkCya31ZbJmnk/z5/nQeRyYOJuxO5Etc0xOoA6n2F0x+kopU+hmC9hOTB
 QNZne+VycSIwiBTgjTNxWtut7g0B2XPJYNSDUIZniz+h/HpJSas/SLBa/IAE5Ff3khSE
 wAZaps+zUwRJNMcWhgFzS5Ym1iWThAUVlEu8foSdv8DAyGt2uEMoMbnhYben1WX+QEYp
 ASpEkGn5bWTb/UJhqtv/Xn2qzaiIyugffgq2DpRiPYvC9/3+CN2LfSHG218SVDCsvSTi
 m8DHSWUo69u0WVzYtwg6Z82vXqOt5QaNAUrIS8rEQmjUNu7HJPXwR6AhtSp3vmay687t
 ug/g==
X-Gm-Message-State: AOAM533NQbJ2Uusd8tD0DV2GFYluQIFCarcAFFFzj7bytIWim6UG69fs
 XM4y0j+qq0w3zs5AQ6SUjiga+Q==
X-Google-Smtp-Source: ABdhPJwVw5S0X2Qt2hPLp4zMzju9cunlPHkSEzWmDwKelbhqMeD+1GpmGTr6gaKuSABzKVvhEa1xxw==
X-Received: by 2002:a5d:6d4b:: with SMTP id k11mr1102228wri.623.1644581328100; 
 Fri, 11 Feb 2022 04:08:48 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id h6sm4095412wmq.26.2022.02.11.04.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:08:47 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: krzysztof.kozlowski@canonical.com, linus.walleij@linaro.org,
 miquel.raynal@bootlin.com, richard@nod.at, robh+dt@kernel.org,
 vigneshr@ti.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3] dt-bindings: mtd: drop mtd/cortina,gemini-flash.txt
Date: Fri, 11 Feb 2022 12:08:42 +0000
Message-Id: <20220211120842.3388592-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_040850_013693_A91922F2 
X-CRM114-Status: GOOD (  14.29  )
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

We add jedec-flash to list of compatible because one board (gemini-dlink-dns-313.dts) needs it.
See commit a10d862e585e ("ARM: dts: Fix the DNS-313 flash compatible")
The flash on the DNS-313 needs to be probed as JEDEC, it does not conform to the common CFI standard.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
Change since v1
- fixed typo in syscon

Change since v2
- Added reason of adding jedec-flash

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
