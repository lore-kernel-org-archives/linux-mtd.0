Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E02DE94120
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Dec 2025 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4r714l59bJMkDYRVJavj4MeNLW853Z2D/8RLWLtbLHw=; b=XKJaXgXwECTwcF
	FY95GOpXCXBzbFHmdyIaFd7x7vSD5t2qV3z9flL3TtDnbNFcR2gDEJlNnITn/prmBgMzBBSbdTpRb
	Ymmk2POP5TOzyzqe8gMEB1u89FM4Okt7mzdYK0HZcqsuDPdmN5QZoWeMw/wNiFfHbOGwSUUiz377n
	xojqRHXaVXTwSXu22s6u++grrsZIvDfKh100yhxXG53t1wDIKTCtCp1WhFBIUb5ZvYCM+G6dw2ew2
	fvmTAPstyzIvBRX1LYazglJ5yrVzxa2l9P/7tP0myByxuMT+hcnbTFnjORCMqaBU7JUB7czz2CgcT
	NopXQRC1NH7Fl1Nczt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaU1w-00000004VeM-3q6x;
	Tue, 30 Dec 2025 07:20:32 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaU1t-00000004Vdm-3QWr
	for linux-mtd@lists.infradead.org;
	Tue, 30 Dec 2025 07:20:31 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a09757004cso124960395ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 29 Dec 2025 23:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767079229; x=1767684029; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=78T8V8yZoQxIZHXRATvOJSkSFUGy++WxZ8EC1YewaNc=;
        b=guXdiM4c106shTwCyda0XZvm8KM6LArPC4zCBLycVUHjOfZ+1BKq52bQDgKXp3Ouvr
         vyS2iUQzf2EdOkS+3PDMdLz6hmLLn5/47kOL598o4gTLEbdNlnq/x8nh8AWl5BY6Pgy+
         Ln6ITBEE4lNIuSazMv/+auyeSvtFFoGtHKXZsyNhV1sNq0XAgeSJHMI/PfvuiD3Vur7L
         g+rqCNAC171QGy0oXRn7gmH8plTZHkoXrIQj5Hr5m3xBrUhQJFyXFbewrmyv6vNtMZT0
         0yXfTtGKw6K/BDp1Rp+AC0gRihvV6tlxIjCCKpmcAGlSX3snIxfkjtKSRpJpou4RGnZ9
         zCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767079229; x=1767684029;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78T8V8yZoQxIZHXRATvOJSkSFUGy++WxZ8EC1YewaNc=;
        b=lRdjX27ItsrddW3C+XiKrzzZhoZZ0tDgnh4vGsqMHnGD84rWGui/y0LnbI9fdpUplX
         r+n/sQ+SdNE1HeJRpCLTb/fC+Vd2S41XkOrILvPdSGJdTn9kgAyufWzt4VyGusvX3S8p
         R4HX5/EusFdr/YqH46kNl4Z6Yt+rrq3YA87LACCd2XOY9BNDbO2m3uPh6iZxqYK8HGo6
         RCepgoKCqM/I4JY+0kUGJ3yD4sv6DNRqni8wlZpWAyNj2u+MBRomDHOtDgrbQUg6gTYV
         RNCXXBJEeJOnzpSxB39pjky0luV5YlDQEl8BrX+R5SxUBNIneZouPG5I/mYwXId0DskR
         N4Sw==
X-Gm-Message-State: AOJu0YyJTLqzykimeN57f0K3vozZVz9wZ0gwcsRCYS0ZesZeqqWemCWL
	okcYexcBnkJw4jWwlGB9qVStM6V2nT8NzhfVXfzFtbF3NJPSmra9pGDd
X-Gm-Gg: AY/fxX4cOxYKH7iJJfvy7m7ftX3keiaKQIQkWRbIAkescA+2z6SqfGdyY0L+OsCL2l0
	vtX35LQgB71WtHHknc85I6ISMRs5l9+P9ovNlWMg4diYFn3/TRlfDs4Oze2ZbkjbTgJSYZprtkj
	y9BCwhQE/HfE/l4NS0hffMUxotAd7bhK+F8CplpDFOjJdUYQrl0TkEje5MP4AfFFqZ/TaVHr2tb
	woweK6Bzs99DMRlErorrBz0vck8BHvJ2MelHpIGziET0pLKKGegvUTZW0NUmz8vmQvghOJ1Hh0r
	/8T/DWGy8ZgCK2ZJX0OhLAcon8lOSRHxmQ8kYEIBC0Ka3kcunyAr7lvMd5zfOacdECXYu3TnRBG
	Xu5NPABSc5OUcnAkjHyyRl7n3aVNGZ06AeiVD6/XjtdZiaBr/StZuYLhDSXJdftQi51e0qkEQpq
	gY6hJEOj8oHj8uacuj7Ldz2y1cmXbYk8y4Sl9qMy8MaRdcbcHo
X-Google-Smtp-Source: AGHT+IFTApw/6+M7axi8xYhv03Mos5hLL2HTDOB45Tj3e7a7Pu9784iRBt6MXPy1SUWFshRW2OcM0Q==
X-Received: by 2002:a17:902:e846:b0:2a0:9656:a218 with SMTP id d9443c01a7336-2a2f2a3587emr269192385ad.28.1767079228812;
        Mon, 29 Dec 2025 23:20:28 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.181.105.188])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d74ba5sm286929325ad.89.2025.12.29.23.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 23:20:28 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 30 Dec 2025 07:20:21 +0000
Subject: [PATCH] dt-bindings: mtd: nand-micronix: convert to DT schema
MIME-Version: 1.0
Message-Id: <20251230-macronix-v1-1-ff2aaab43644@gmail.com>
X-B4-Tracking: v=1; b=H4sIADR9U2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNL3dzE5KL8vMwK3WTLFIskY6NkA4PkNCWg8oKi1LTMCrBR0bG1tQB
 pt4HrWgAAAA==
X-Change-ID: 20251229-macronix-c9d8b32c00cf
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_232029_867051_D0506B9E 
X-CRM114-Status: GOOD (  16.14  )
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

Convert Macronix NAND Randomizer OTP Enable Property binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../devicetree/bindings/mtd/nand-macronix.txt      | 27 --------------
 .../devicetree/bindings/mtd/nand-macronix.yaml     | 41 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-macronix.txt b/Documentation/devicetree/bindings/mtd/nand-macronix.txt
deleted file mode 100644
index ffab28a2c4d1..000000000000
--- a/Documentation/devicetree/bindings/mtd/nand-macronix.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Macronix NANDs Device Tree Bindings
------------------------------------
-
-Macronix NANDs support randomizer operation for scrambling user data,
-which can be enabled with a SET_FEATURE. The penalty when using the
-randomizer are subpage accesses prohibited and more time period needed
-for program operation, i.e., tPROG 300us to 340us (randomizer enabled).
-Enabling the randomizer is a one time persistent and non reversible
-operation.
-
-For more high-reliability concern, if subpage write is not available
-with hardware ECC and not enabled at UBI level, then enabling the
-randomizer is recommended by default by adding a new specific property
-in children nodes.
-
-Required NAND chip properties in children mode:
-- randomizer enable: should be "mxic,enable-randomizer-otp"
-
-Example:
-
-	nand: nand-controller@unit-address {
-
-		nand@0 {
-			reg = <0>;
-			mxic,enable-randomizer-otp;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mtd/nand-macronix.yaml b/Documentation/devicetree/bindings/mtd/nand-macronix.yaml
new file mode 100644
index 000000000000..10f1d58adcef
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nand-macronix.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nand-macronix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Macronix NAND Randomizer OTP Enable Property
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Richard Weinberger <richard@nod.at>
+
+description:
+  Macronix NAND chips support an optional one-time programmable (OTP)
+  data randomizer that scrambles user data to improve reliability.
+  Enabling it is irreversible, prohibits subpage accesses, and slightly
+  increases program time. This property requests the driver to enable
+  the randomizer if not already set.
+
+properties:
+  mxic,enable-randomizer-otp:
+    type: boolean
+    description:
+      Presence of this property indicates that the data randomizer should
+      be enabled in OTP mode on the NAND chip.
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+            mxic,enable-randomizer-otp;
+        };
+    };
+
+...

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251229-macronix-c9d8b32c00cf

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
