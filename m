Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09E7C79FA3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jan 2026 16:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l+58452cteURF8OtQdXIZufqJ7ca2/Di7uxb6w43zeA=; b=ics05rhN6+rRMl
	ndgvRMQtU9jekKIYhb0x8mBrmtzJ6VdwnrtO22CIHnYx6At1ak2v7JyO502bHI7g2BI7mfXQl+JjJ
	32KoaDBqIBRyvb0cZofx/GiVWOyu5tR+Lah/us/W46q2dwwkJLeFMnM/QgNe9myj7JeYfrkkTkIQh
	DQUyqtkcaeodBsq5hmgryFsHz6JzJSt++aBXQ0AKkj8TtiM10N9GfJoIZCoWdJlYqOWtGKXq/S7bS
	U/D3fEEvb502LYZeU2fbNluBoBwr0xcPnOnQcw5k4sVWQLlQYafQWXT0XUi8jlwJvxFwRMnbX/flr
	b0NUB3wkNTbCVeZ1v2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcn7s-0000000BhZ4-06Qw;
	Mon, 05 Jan 2026 16:08:12 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcn7o-0000000BhYh-3HCW
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jan 2026 16:08:10 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0a95200e8so483785ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 05 Jan 2026 08:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767629287; x=1768234087; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4aPx9Ksdn2f1hkjywQffSfK3dmxxEtjfJVrjCoq+cE=;
        b=jzexV1le7yYqUikgghUPdIJqOO795s80PoAoJT7ANNP8UEt2c15qMTkoFLrQKaRbwC
         nwDjnw6MprZbQNfGWemIxbUcuDw+mZ+WrR3/CJvhy9pi8FRl2nBKNVaSGHf8IuOPlnDB
         UjezZMpxL5sIlkjgZSQeJ2XWbDaurQeQvzjADZqO4PB39Uh/Jm7HwG0V+zUrghuKKEZi
         PvLt/3ZxRTaKliW9D4VyI0BN2CnDfJzc14gtTwuWD9X42hjz9e9bHGdK8lOhqFaqhPAu
         sw6JcEjoZahMuDk1vjdyILzgsF9v6/3ysCpWL6zanKhTFKLEKlxwoKpgPbG1o8sTEXoP
         PLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767629287; x=1768234087;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4aPx9Ksdn2f1hkjywQffSfK3dmxxEtjfJVrjCoq+cE=;
        b=Wy+QnNv0rQNhOwZRPC+Xu1t/NCpqTcvnMoxXwTa1q90CWIeCFl1D4wefYy4AOdYW56
         vDgdznn3wDz2o65zLpywlQShbcie+xLjUOy8bGBfy516ka9CiudLfAi5g/fZASXSzUwG
         feL0cZ0FFwl5IH67nOOTyB9nB1lAB7zEeLoK6J/MA0ZKVwlsKR+uuBOc78OC8B0lw8tx
         Y9Z4nRTszHkxfKmdS1z34Jj4tcnsXY6Ahfy66nG3PZyTrr5pv3qjjZXR7SPDB5z7WfkJ
         5Elmolvl3RzUHA3vChMCUw/KgcOSsLxBY15FgCWLdpvRXt3pqk2/En+uMuKvp80S5MBj
         uIBA==
X-Gm-Message-State: AOJu0YygroJlK41NTXIWP5Uxcx7KTt7Z8YJcyN0gqZjZWxHEj7P08UP4
	hH7oJkeXfcx2jmO594xWSGfxdeoN+W15Y+n06H03R/eDUoy3ERGDKckhZrZs7g==
X-Gm-Gg: AY/fxX7nID/2wuhn4Z9uS/bXm62Ciqj2VIwtvSudcpJANaHxq4sg0N+M88EgiSmu06Z
	mJZ4J7vCHTj9N8fioTpK/WGv9JVGX/eInocrmzy2ClRC3IQycUZ/vlX3z3+VBKqbddmiOD8YZ83
	9ksxbrDKLDR9tfD1FjAdrQsNwxKBezO5TJnA8wj5OOpfS8PlHbZY9GiuhIdsLaQ9DJbmqLwfWKG
	aQijRx49Fgbui9eCyt7i0aIsjWpt/jjw17/Eb/dCNta3OqfDPCoK4dN5hyZ2kJxslQ2YxEw1FDt
	yMsOKo9ihePVzB/WvUpoExSzqpHgHOD2c/JsLTOk+jRyxYnBECHQ6c1s5acv4d3Auo5onc+PN5S
	6u/u72Wg9Ggci7rUp1pzPRg4oOpkxjWJibqkFtU927bapEVldd48EMa9sPmj84PvXl1bL0R7iZu
	UOAHI/XVrbo8sqKK+g4b3lJVKarj04AxaSq9FKYQ==
X-Google-Smtp-Source: AGHT+IHmTtNImRFcMTd9bEdO5bmpDmbMDapPG+W7jQiu3FXqxaDNoVVpZNJnkHcYnELInEv2WJGx3w==
X-Received: by 2002:a17:902:dac3:b0:2a1:2ebc:e633 with SMTP id d9443c01a7336-2a3e2c921e2mr2509815ad.4.1767629287115;
        Mon, 05 Jan 2026 08:08:07 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.181.104.101])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a3e2b6991dsm2066095ad.48.2026.01.05.08.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 08:08:06 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Mon, 05 Jan 2026 16:07:59 +0000
Subject: [PATCH] dt-bindings: mtd: st,spi-fsm: convert to DT schema
MIME-Version: 1.0
Message-Id: <20260105-st-fsm-v1-1-d1dd935ccee4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN7hW2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI2ND3eIS3bTiXF0LkyRjE2NTQ3MDY1MloOKCotS0zAqwQdGxtbUAZIF
 QwVgAAAA=
X-Change-ID: 20251231-st-fsm-84b343517035
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_080808_898664_A672879F 
X-CRM114-Status: GOOD (  15.46  )
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

Convert STMicroelectronics SPI FSM Serial NOR Flash Controller binding
to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../devicetree/bindings/mtd/st,spi-fsm.yaml        | 72 ++++++++++++++++++++++
 Documentation/devicetree/bindings/mtd/st-fsm.txt   | 25 --------
 2 files changed, 72 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/st,spi-fsm.yaml b/Documentation/devicetree/bindings/mtd/st,spi-fsm.yaml
new file mode 100644
index 000000000000..f374c6aaa185
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/st,spi-fsm.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/st,spi-fsm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics SPI FSM Serial NOR Flash Controller
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Richard Weinberger <richard@nod.at>
+
+description:
+  The STMicroelectronics Fast Sequence Mode (FSM) controller is a dedicated
+  hardware accelerator integrated in older STiH4xx/STiDxxx set-top box SoCs
+  (such as STiH407, STiH416, STiD127). It connects directly to a single
+  external serial flash device used as the primary boot device. The FSM
+  executes hard-coded or configurable instruction sequences in hardware,
+  providing low-latency reads suitable for execute-in-place (XIP) boot
+  and high read bandwidth.
+
+properties:
+  compatible:
+    const: st,spi-fsm
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: spi-fsm
+
+  interrupts:
+    maxItems: 1
+
+  pinctrl-0:
+    maxItems: 1
+
+  st,syscfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the system configuration registers used for boot-device selection.
+
+  st,boot-device-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Offset of the boot-device register within the st,syscfg node.
+
+  st,boot-device-spi:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Expected boot-device value when booting from this SPI controller.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - pinctrl-0
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    spifsm@fe902000 {
+        compatible = "st,spi-fsm";
+        reg = <0xfe902000 0x1000>;
+        reg-names = "spi-fsm";
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-0 = <&pinctrl_fsm>;
+        st,syscfg = <&syscfg_rear>;
+        st,boot-device-reg = <0x958>;
+        st,boot-device-spi = <0x1a>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/mtd/st-fsm.txt b/Documentation/devicetree/bindings/mtd/st-fsm.txt
deleted file mode 100644
index 54cef9ef3083..000000000000
--- a/Documentation/devicetree/bindings/mtd/st-fsm.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* ST-Microelectronics SPI FSM Serial (NOR) Flash Controller
-
-Required properties:
-  - compatible : Should be "st,spi-fsm"
-  - reg        : Contains register's location and length.
-  - reg-names  : Should contain the reg names "spi-fsm"
-  - interrupts : The interrupt number
-  - pinctrl-0  : Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
-
-Optional properties:
-  - st,syscfg          : Phandle to boot-device system configuration registers
-  - st,boot-device-reg : Address of the aforementioned boot-device register(s)
-  - st,boot-device-spi : Expected boot-device value if booted via this device
-
-Example:
-	spifsm: spifsm@fe902000{
-	        compatible         = "st,spi-fsm";
-	        reg                =  <0xfe902000 0x1000>;
-	        reg-names          = "spi-fsm";
-	        pinctrl-0          = <&pinctrl_fsm>;
-		st,syscfg	   = <&syscfg_rear>;
-	        st,boot-device-reg = <0x958>;
-	        st,boot-device-spi = <0x1a>;
-	};
-

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251231-st-fsm-84b343517035

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
