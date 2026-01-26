Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A84ECF65DB
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jan 2026 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xfwcegbXNwHMRBJfopuYLtnZ6lnL7biun0WIOrpBfoE=; b=V82GIIRO2ZmrhO
	SqaALVBkDxzE+0+0HAS0VL7gwUcfjVfp2+HhXMIXFA9t2iWSobFn8FvQHf1aBmxkByULZhYbIR7Y4
	bcCOMyKeYroywNsefu7m+KGNKHGAN3VurBo6oHWc6zLsmKl+7xs5nPP5OfptzTA6JEJbPnecerjlq
	urQzNlRSX/tGdokqt6NkVYz1IdFZ1XsPCRQ5iW74qcFVFnZ/++iaXMJS+Ufw0WH2b4ZVIHHcHTsrc
	NYVYVnUaHncwFF0S3NiuAVEcPXUKX5sA4kOhmsBuNpX4u3998LWZIcVd+EauJ+TxAQIRdLbsnaCcz
	D1HfuVoDH6KBl9DpmvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKTK-0000000COEJ-3ZUL;
	Mon, 26 Jan 2026 11:09:30 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKTI-0000000CODX-3Oqz
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jan 2026 11:09:30 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-81f4e36512aso4296721b3a.3
        for <linux-mtd@lists.infradead.org>; Mon, 26 Jan 2026 03:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769425767; x=1770030567; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=67m4LZM7BNmUt9VQQdT7oliQJgO7RfphJV9m4Mf+Fmc=;
        b=ctCWM13/MkuPnE6TqbJ1e11sRKXP7KVnULs3dryyFk/3BYBWVxZTWL0NP909H+7ONL
         v0UkJ7mCEwhUz6o3DU8kPT7VoNv9ie5oFlTWCN2yUg8IsADLAhx36jahZKjta3xtOpwr
         Kvq5s1bJbHPy63Bf1IZ0pJs/TRdZJ1aGWrJ7gF+4YZAPNmQVmLaxKFYC9Rm1pcp1AP3r
         HisdVdc54JQJFQHok0bNwaox+XMAlrvqQ78IFQZICPMpK4zDuAZ8TsHN7N1/FJxw6O/4
         1eorPRZFN8uP4UweVrwuA8ta2093NFrOiJT9b7e7XQ0lTMx4cvDeZlI8zynVlGsEYLsm
         Sh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425767; x=1770030567;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67m4LZM7BNmUt9VQQdT7oliQJgO7RfphJV9m4Mf+Fmc=;
        b=hISHm8iu6s33oFrAsF6LTD/T/hIu4JRolGhhwTmy2bnBaDSgVhokGIkSIYoLttOzm+
         TiycgP492jbIOzh/jNoOtYnCHeKzBTcKdh8R+gc9lr6duqCnaA2eGAo2JIaa9FWmj1kv
         sm510WcOabgVZUX7OiVm9W/CriyQxnqJba4gUu940w3dTjvC7aO+X0A4ptZ4I+Dopasb
         Kk2QOfKNtatGyZ8RGMIIr2vD3j+0Oyyp/QmCheMjhg3LpZcwCR0DrjzfHVkSN08fdaTF
         FQk8sT1PDU/fUrA9EVsGTzWH0tiP0Fz15Nr4sM5DPoCzkh29onO3GTlzimZOghk0rwS8
         Ik7w==
X-Gm-Message-State: AOJu0YzGTS8CN7Vu+1fm0YUuu9Nr+S7aUr4XHhKrbb+eX1g+/CZFxv+2
	fNd5+DkK24zQUE+mhXBWaPaIQY7gNwEl49djPc7SVCy40/cWRWN8xXuhuhLH8R7I
X-Gm-Gg: AZuq6aJTFVzaibWZw8uyebGOiCjNH54ctBMFrI7nxfwEiaSMxMRVydeIcm12SmgFbWy
	eIumWVaSmY7o4Ptib+htdYok3KmIXdG7MMf+N9J4nA/zBE2iUVYjB+pbwNY8XF55ACCHEDV9rAS
	x8Me9k2c/mCkG8Xcb10KYKStjAJNu3ffg9gckRxjuns8qIplnEYiR9yGCEcd8sRuXshJX1Le/Aw
	xTSqeXHn9IqtT9a5gmy8fOHqQsr6NeYdD+8X9unTP4rgPUJdk/FaaKZvKQq1DxSu6M8tg0WgN3A
	PUXr383TRdUWU3uvzQMKktmlul2Q01S9ev84mNIC6Vej33TAZrVXjy7vuCRJQnPEx0qg/aj/v0f
	y5KPDDaipVZRtHDWlUXSq8itXpHd28pDn2nD3byrygGUSUfahHW4eosRXVKCMKWrn0yCTrNWda9
	Fyql4lx4o8McSb9KtHcuQNuwE7mP5Z/8rHVy6Rpmr0L6pWdr4=
X-Received: by 2002:a05:6a00:1988:b0:81f:61d2:84a7 with SMTP id d2e1a72fcca58-823412d51d0mr3824832b3a.59.1769425767323;
        Mon, 26 Jan 2026 03:09:27 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.70.239])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1682394b3a.63.2026.01.26.03.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:09:26 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Mon, 26 Jan 2026 11:09:20 +0000
Subject: [PATCH] dt-bindings: mtd: mxic,multi-itfc-v009-nand-controller:
 convert to DT schema
MIME-Version: 1.0
Message-Id: <20260126-mxic-nand-v1-1-557df4a0dfa7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF9Ld2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMj3dyKzGTdvMS8FF1zEyNDC2NDI9NUA2MloPqCotS0zAqwWdGxtbU
 AG98tDlsAAAA=
X-Change-ID: 20260122-mxic-nand-742183125e03
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_030928_862244_EA46AD41 
X-CRM114-Status: GOOD (  15.65  )
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

Convert Macronix Raw NAND Controller Device Tree binding to DT Schema.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../mtd/mxic,multi-itfc-v009-nand-controller.yaml  | 79 ++++++++++++++++++++++
 .../devicetree/bindings/mtd/mxic-nand.txt          | 36 ----------
 2 files changed, 79 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml
new file mode 100644
index 000000000000..97baac8b405a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/mxic,multi-itfc-v009-nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Macronix Raw NAND Controller
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Richard Weinberger <richard@nod.at>
+
+description:
+  The Macronix Multi-Interface Raw NAND Controller is a versatile flash
+  memory controller for embedding in SoCs, capable of interfacing with
+  various NAND devices. It requires dedicated clock inputs for core, data
+  transmit, and delayed transmit paths along with register space and an
+  interrupt line for operation.
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    const: mxic,multi-itfc-v009-nand-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ps
+      - const: send
+      - const: send_dly
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    nand-controller@43c30000 {
+        compatible = "mxic,multi-itfc-v009-nand-controller";
+        reg = <0x43c30000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 0x1d IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+        clock-names = "ps", "send", "send_dly";
+
+        nand@0 {
+            reg = <0>;
+            nand-ecc-mode = "soft";
+            nand-ecc-algo = "bch";
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
deleted file mode 100644
index 46c55295a3e6..000000000000
--- a/Documentation/devicetree/bindings/mtd/mxic-nand.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Macronix Raw NAND Controller Device Tree Bindings
--------------------------------------------------
-
-Required properties:
-- compatible: should be "mxic,multi-itfc-v009-nand-controller"
-- reg: should contain 1 entry for the registers
-- #address-cells: should be set to 1
-- #size-cells: should be set to 0
-- interrupts: interrupt line connected to this raw NAND controller
-- clock-names: should contain "ps", "send" and "send_dly"
-- clocks: should contain 3 phandles for the "ps", "send" and
-	 "send_dly" clocks
-
-Children nodes:
-- children nodes represent the available NAND chips.
-
-See Documentation/devicetree/bindings/mtd/nand-controller.yaml
-for more details on generic bindings.
-
-Example:
-
-	nand: nand-controller@43c30000 {
-		compatible = "mxic,multi-itfc-v009-nand-controller";
-		reg = <0x43c30000 0x10000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		interrupts = <GIC_SPI 0x1d IRQ_TYPE_EDGE_RISING>;
-		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
-		clock-names = "send", "send_dly", "ps";
-
-		nand@0 {
-			reg = <0>;
-			nand-ecc-mode = "soft";
-			nand-ecc-algo = "bch";
-		};
-	};

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20260122-mxic-nand-742183125e03

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
