Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDC3CE9D5A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1v40vxIS85pCl0D3/Z6PbwBt3B8xy+3w0XHpe8FmsgE=; b=FUksdSJ3jGw3iE
	O7ZnKZcIahM2g0kAPNahxzWvwAYdK+z0v5k18gICMylPBINQzbS6LVUcaYJTEtRWnL93/LEFXYdkb
	pASIwoI6OxpA6YR4UQ3Fm+suUidJucMuL8BNI+J7aldSzHr0BInMQm5JdLQSTZSeBQ6dInfKTF/gg
	wELwgqPbflBaBnuo2r2O+op137CwRuefWhDiKKqi8CHkTiRgqKqtq5laJlF8skJ8D8BE+vs3tYfxO
	VriHmzz382I7w1x1V41vWr3EmQpm++ErC/eY4frW59XCm/OO+6ls0y//MzoJauGPzUMLgrFYghJTy
	dWgMo5EkrJo9qHTNzVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8wW-0000000DP5H-292T;
	Tue, 06 Jan 2026 15:25:56 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8wT-0000000DP43-1hVQ
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jan 2026 15:25:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so1081243b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jan 2026 07:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767713150; x=1768317950; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtdXmTl9NRpLLoEu93y7W7YPxZRLcRxHS6BPm4Q5c0o=;
        b=dGHbNhiS5rZMt1yqmv4JURLU2/LJuVk1+CZwl4Rj3FiTVYOauVL+7do3k/2f3cAQDB
         V2nkKGsx1VryhY7Wbwy35QxGLJnRccb7+rTIT8uexKdtMGQYOaXEUG3tqH9yMqj+RolQ
         kH9A/g8y3rGS6yZR+cIQkYWH9cLC2B20Fchp8N4MZ1GnoKL8jD/TVz2xxZwjbNTCGtTi
         cnUFFEU95T06d3SeQXYlHuyTIbiOIm9G9OJv4XHrYENXwNetc152FIG+a1DVSkzIVZc4
         YD2KGsiw028h5UsLG0T1BTxLDHXikNwyFGDzTAmVK9yGv+/jaSHCMbzZdnQqlo/IGhF0
         A0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713150; x=1768317950;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtdXmTl9NRpLLoEu93y7W7YPxZRLcRxHS6BPm4Q5c0o=;
        b=vrXtjcO828Kis+jznB5ePj6kYPbTFTd56eGTugO0JaxOkIEnRGsr7MHVuQxb88ch2z
         BtaATc0ZcSLHvGUa+h8cbrSFSeHtyLioObR+OkZSEVmfqni+tJ7J8Tr2cCFqbuc+BLTy
         Vd4zpedFt98gm+kGhi4jSRjLNrV5GKp0fy5B7S3F4gzVOnghXfEvYYlcmDose1A7VoXg
         Fulkg8/NgguJGixeo99P4zs/4MTFJ8lZcSrd3sEOdKiQqN+dOwWCOBwuoPJQKJDBKbE3
         fBMOKEVkpEdktHqFeWfCmL0sEooj38lPlFU9A/KbGdkDvcMn7hMBMTs1Ka1ALUNW5Dd7
         esZA==
X-Gm-Message-State: AOJu0YxYID0L8x8yXIkXKsJ0/8tYoou8MlnHChZv7/69x+nODvkC4Hqd
	yaL8NhT7SWAvEJbg6qnD6zO+1uD/BzDgoGVgxqm+MyHkyuTx6+rU11bH
X-Gm-Gg: AY/fxX6XcTPtod/PoGhUTbK9jSZGoibSHlpz86SjNka5wXMcNRcIoKCP+E06UAo0APC
	iPIuq3jgFNUaSD/ytp+umKPHrPKcxBILx6kWunqqlLYV/PTkjJugKI+Nl1cB/QbjQcrP9Bdi3DK
	3/gO/p5297xlpJKNgihzbOAM/Bar68MAhTHBt5xXxW/Dl2AOMv+EyI9XBndg4xYkKxSrWlxwtXd
	yWeVCP3KwVAMGj28nwixJ/zHduiVLZBB7d9XoS20UXakYsJ0peETYlPMo2d3FeJDTSRg2DyRKMY
	WnEIbNM9pG3NpYG66ba5k7VWdrthUStHP3aF5Vy/fctcrN26tvlnr5sdy3pT0JuOi+s4MDQNPb+
	itjKUjXmJ9cRe1BckZNrue66FsBYoUxCT0Wle5lzvZMR4tFGY3e3+Ed6aGcl5Uh/lpSQdFQ5L4M
	EIutuvDdNdbTUu31sAc06rEsD3BZNB+Q5+MBH7JA==
X-Google-Smtp-Source: AGHT+IFdf/FdCRxMGmLvrAXo1i5iIX1Eb7ltcmx8n4wRRcmotOUjW0iOFXIRwmsPQLkT4On14GhzVg==
X-Received: by 2002:a05:6a00:439b:b0:7b7:5066:7f9 with SMTP id d2e1a72fcca58-81880494b45mr3168256b3a.7.1767713149800;
        Tue, 06 Jan 2026 07:25:49 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.181.106.200])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-819bb0de2d2sm2529469b3a.27.2026.01.06.07.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:25:49 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 06 Jan 2026 15:25:43 +0000
Subject: [PATCH v2] dt-bindings: mtd: st,spi-fsm: convert to DT schema
MIME-Version: 1.0
Message-Id: <20260106-st-fsm-v2-1-7e0a2e18127a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHYpXWkC/zXMywqDMBCF4VeRWTclk0tvq75HcWGTUQcaLYmEF
 sm7Nwpd/ofDt0KiyJTg1qwQKXPieaqhDg24sZsGEuxrg5LKotIo0iL6FMTFPLXRFs9SW6jnd6S
 ePzv0aGuPnJY5fnc347ZuxEmitH8io0Dh0furts4RmfsQOn4d3RygLaX8AC7tPnycAAAA
X-Change-ID: 20251231-st-fsm-84b343517035
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Angus Clark <angus.clark@st.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_072553_488116_1168782E 
X-CRM114-Status: GOOD (  16.74  )
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
to DT Schema.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
Changes in v2:
- Modify commit message.
- Remove "pinctrl-0" from properties.
- Delete maintainers list and add "Angus Clark" to maintainers.
- Link to v1: https://lore.kernel.org/r/20260105-st-fsm-v1-1-d1dd935ccee4@gmail.com
---
 .../devicetree/bindings/mtd/st,spi-fsm.yaml        | 68 ++++++++++++++++++++++
 Documentation/devicetree/bindings/mtd/st-fsm.txt   | 25 --------
 2 files changed, 68 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/st,spi-fsm.yaml b/Documentation/devicetree/bindings/mtd/st,spi-fsm.yaml
new file mode 100644
index 000000000000..77099dc0fe53
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/st,spi-fsm.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/st,spi-fsm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics SPI FSM Serial NOR Flash Controller
+
+maintainers:
+  - Angus Clark <angus.clark@st.com>
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
