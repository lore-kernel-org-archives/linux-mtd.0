Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E773DD3EE84
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oBc+tG2YOokOM7V54KK61omxh6Ewe2t1FmQXyGDewpg=; b=wttkC3M8KuVbN4
	4TmSlWm85Dt7prrp9ZkteBnji9/Hxs4sBVmQPUQyoCv1Fln8b+3aaZuv33X/0hXO+K8lB9sbXMgA8
	IXLatVXBOitoe/cRO4U0xMHzqGHc3WqndQmCBZSRXUrpnB0XcwxSO+7MkU6m/U+s0ZgDR15ie4fwm
	jTXjNU3WU+Sx5vqQdmThsITEf/c+7RgNMOuRYkL7InB+VK4tDi177IimSwSjcTmEO4RfWJNDjcZPe
	mFGQ+ByzST6ilASi/AzwumfaO9+hplbbo5eCFaFlHL30n7XqC07c06hDJXP9zc6LKYHhj3ve+/wdY
	oNOmmkKXWseFyYGHTaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixSq-00000007RQL-4AdJ;
	Thu, 22 Jan 2026 16:23:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixSj-00000007RO5-3pWd
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 16:23:19 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so10968865ad.2
        for <linux-mtd@lists.infradead.org>; Thu, 22 Jan 2026 08:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769098992; x=1769703792; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HYUcCmx/AcBg489DGzSQvd0/EvrM4b4ill5j+7RWL6A=;
        b=fBZVNp7EMHjdJSi1MtT9YWnLYpTKfLd+NytWt1ybOh/oQm0KYfc6RiBIcyTed2xwE/
         cQNASFYHaxc4Wb/Z06L2dy+aTpvk6Osij6dyVC/mCNyWnGmYpFv4/XojaL70x9kLhdKP
         FXm6EqnL2EIa3yvJmfLI5dtnIi4nVrvrAPH8+QbJwQ+GqFi/oItJnPi+2cNUogcYx+Au
         KeTe5C7Fi6B10TW/vhQWWSZIEsCnrZ+pwlYFQIudo3VypFRN+/gmi0WLUSGXYUpnRNZM
         dwqXU4GmMQ/MgIbPeeb5j7uFGpbTPlSbWuCULs47RqbxqYCwM5XAePTknNuZ2XMLY5kr
         yzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769098992; x=1769703792;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYUcCmx/AcBg489DGzSQvd0/EvrM4b4ill5j+7RWL6A=;
        b=OaPyEYQ9n9N32R94w1SxpUTS7D6QztF7LU/sm8Bv/0U/DN3tIPb7BGqQVigmB/SmrD
         W1OMRHbw0t2NjzWPkVaa/KYEvAbukOWb1+3YSxw38A5FSzsq6nENmqho1/jaedUqgk7p
         ZR9iTyNqP/zl1d9iHZb13tlrpAxCWzily+RVrwwvLqkuZJk/J93+YYKcxlUTL1xheBIx
         V1I7egZIe2XdMaJdsjTEaP0pvz6Z0KF4mOTIsxVbfV+SWKsWj2D+D60RZk5ccm/eB3/p
         zR/Gm+yZ/lyjmN8K/DrOYDxOhtyQ8a4O1dm0btuY9TWuy4OI9KxfxJWllCHL2kdfA6U3
         52PQ==
X-Gm-Message-State: AOJu0YxxgZtCsVMThfYgGuYkl03LOT9mJn8QsdY9AvOE44C0fBljO89I
	ofi7HUtDzBI04bb4ABcuO+BMXF9XMdtXO4YrNGx8yokBkbUte6BA3SXKL9MlpA==
X-Gm-Gg: AZuq6aI9+NP30lOSo8HCeTokisn3Klb0eGyHuBAiMco4eZa4KTAUxg8iKMmRznc22gl
	5HIhjtNMRNC0S82K0O4HR7SQNaYaLOyE8a72sA7iwxnguvW8C6C3aukWl2/XqZPDpxazseLB2Y+
	CwIvqor6rh8HCb5NMbF4Lkf70NNEpMGk76I9/AGbC7kWvKXfRFL5wx+finXuY4hpwbN7hi8PUNV
	LwILl9EvI98lyF96UMj/zy56rTKreDVveSeX8PbMkn5yQz8fVnuk6cXxFqT4EbUEK4wP7MpuvF3
	LyQAkxUCd3zabfc7fzbTwLM5MkEZ9JowHofKq5XMAtEItLJ7GtXdDrcCvuNOu0nJ9Tx1JPcviCc
	IwVde1DXdU/RE2ATReUkNl/RY8r901ACUmSXdKl6YO3/lDFfU78htsX8QlVqU2T3nwxmmHphl4M
	4awlREPKOKftrYLp8HAH36oNhezZyXtwS40FQ=
X-Received: by 2002:a17:903:2448:b0:295:592f:94a3 with SMTP id d9443c01a7336-2a76b067a21mr87014795ad.48.1769098991638;
        Thu, 22 Jan 2026 08:23:11 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.66.50])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a76c5f4fb0sm82145295ad.45.2026.01.22.08.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 08:23:11 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Thu, 22 Jan 2026 16:23:04 +0000
Subject: [PATCH] dt-bindings: mtd: st,spear600-smi: convert to DT schema
MIME-Version: 1.0
Message-Id: <20260122-spear-v1-1-fd44bc79695b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOdOcmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMj3eKC1MQi3VRTS8uUZJNU81RjIyWg2oKi1LTMCrA50bG1tQDcbad
 GVwAAAA==
X-Change-ID: 20260122-spear-e599dc4e7e32
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_082313_968683_592BB5B5 
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

Convert STMicroelectronics SPEAr600 Serial Memory Interface (SMI)
Controller binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../devicetree/bindings/mtd/spear_smi.txt          | 29 ---------
 .../devicetree/bindings/mtd/st,spear600-smi.yaml   | 72 ++++++++++++++++++++++
 2 files changed, 72 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/spear_smi.txt b/Documentation/devicetree/bindings/mtd/spear_smi.txt
deleted file mode 100644
index c41873e92d26..000000000000
--- a/Documentation/devicetree/bindings/mtd/spear_smi.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* SPEAr SMI
-
-Required properties:
-- compatible : "st,spear600-smi"
-- reg : Address range of the mtd chip
-- #address-cells, #size-cells : Must be present if the device has sub-nodes
-  representing partitions.
-- interrupts: Should contain the STMMAC interrupts
-- clock-rate : Functional clock rate of SMI in Hz
-
-Optional properties:
-- st,smi-fast-mode : Flash supports read in fast mode
-
-Example:
-
-	smi: flash@fc000000 {
-		compatible = "st,spear600-smi";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		reg = <0xfc000000 0x1000>;
-		interrupt-parent = <&vic1>;
-		interrupts = <12>;
-		clock-rate = <50000000>;	/* 50MHz */
-
-		flash@f8000000 {
-			st,smi-fast-mode;
-			...
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml b/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
new file mode 100644
index 000000000000..8fe27aae7527
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/st,spear600-smi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics SPEAr600 Serial Memory Interface (SMI) Controller
+
+maintainers:
+  - Richard Weinberger <richard@nod.at>
+
+description:
+  The SPEAr600 Serial Memory Interface (SMI) is a dedicated serial flash
+  controller supporting up to four chip selects for serial NOR flashes
+  connected in parallel. The controller is memory-mapped and the attached
+  flash devices appear in the CPU address space.The driver
+  (drivers/mtd/devices/spear_smi.c) probes the attached flashes
+  dynamically by sending commands (e.g., RDID) to each bank.
+  Flash sub nodes describe the memory range and optional per-flash
+  properties.
+
+allOf:
+  - $ref: mtd.yaml#
+
+properties:
+  compatible:
+    const: st,spear600-smi
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
+    const: 1
+
+  clock-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Functional clock rate of the SMI controller in Hz.
+
+  st,smi-fast-mode:
+    type: boolean
+    description: Indicates that the attached flash supports fast read mode.
+
+required:
+  - compatible
+  - reg
+  - clock-rate
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    flash@fc000000 {
+        compatible = "st,spear600-smi";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0xfc000000 0x1000>;
+        interrupt-parent = <&vic1>;
+        interrupts = <12>;
+        clock-rate = <50000000>;  /* 50 MHz */
+
+        flash@f8000000 {
+            reg = <0xfc000000 0x1000>;
+            st,smi-fast-mode;
+        };
+    };
+...

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20260122-spear-e599dc4e7e32

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
