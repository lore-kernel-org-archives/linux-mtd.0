Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180EDCCFA01
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 21:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2FwHbGawt5VmRMJypG9DeA8xRQSNt6qNZvglDcxOrI=; b=NpAlihhIq9CDTT
	I3no5gHAPCfNguMgXkZvgHFwQlm1QsTq4EsWjOQNsfa9H6BFoW7AcbidyJ9lTiHKmrCj1e3m20Nt3
	42WrjqP4lowF5zH1x8W0mp5Th8mlyPm1I60m/TRgb5/jubobdA0IkzyJ2cZ6Rtn5QlhugjYIX400X
	OpfP3HxC8+KWFoqdOk2lxF5OrvU8Q5AQcz4AfSFspQvATD4j4xoy/o6U8fvH7nwBr7QnKz0bNmFBF
	GbMokwALhhA4Qod1UL6sbJSlDw3YQZ9ju1LK869HtZXdEjv6lbNHDQd7uUEzngM6BpBJrYCrFVZsI
	ZlaCxwNI63RilYDcV8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stZqb-00000006bIF-1cIz;
	Wed, 25 Sep 2024 21:46:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stZqY-00000006bFv-1XK5
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 21:46:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3780c8d689aso149859f8f.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 14:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727300813; x=1727905613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9nJBatBeRhZqG9r4m0SatNAaTtD+mKgW27WzTrnpaU=;
        b=fPcf8fln6Kr7CGoQHZvxE1Wb6TQhpGEd2cJJeAPZUPnu/FwNWHGDvpy3ndAERa/tAH
         JCvTuA3kCp63iz5mA//PlPHKlod68NV8kSdT2RXJbFzdZ+49Gvhb93hdGRI1r1VcudGQ
         jSSgDJLuy12ip6fowBbESn+29Cklaz/Bx8h0NiXjqdOEAAdWT5K0zzIdAnI/8yvgovBD
         8RucsDTbxRaxbHvDs1jLAPlvxhqsSu/C3eOd0TB1VYf1ZXLfLU4JOzTTTm+IVfxH8B9d
         4QoambRtt1PsB57o1iOFHN7BLHrtLRShgKFoofNvw2uOpn7zaL/Kn5M7yJcj3jEdNm44
         H+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727300813; x=1727905613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9nJBatBeRhZqG9r4m0SatNAaTtD+mKgW27WzTrnpaU=;
        b=xGQ25gcol4pyvLJbXyrMHDRsG3E6GFTdi1p6ZMjezOjip9+1DWi6/IlyiiIHhir5CI
         Zn7z7E/Zz+8PTXYdX0xewS8p9/NVKb0o0LHM1HTO3DFCEV6FkuRoyMe3wVs8yDExuIkH
         TeGBq/4HtzZLb3L1sVBkWTlheKlMm2LVbd2ZZdSztRnAx0VJpBG0wS+bew95PZDZ35VZ
         yyCpp8ZGb5l47l2PVPCNtzBbE3vHFUZ2PosKTj/E6fbMOLVBhShhk5iYozwzKzg9QTch
         rJOaE4Ym0RS+F9ll2kA6bJ108qjvOTZjmZJdpRy65ZA+yAk1EhfQhKWQVjRuveE3pkft
         XRjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPXy2pBF67z7zhRGYjBDQI4PH5uF1dH1WgbJrZ1J2jCiR1ks4ZgXLTYmcGt4QLevmm3nM7krOyaMU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl7mJ7R7t+t/LUWBTiI00/OeyPwiati7eeVp2lPxxzD6t11glE
	inTHdS5TKTQoOXQGZm/KSJ2/pDWgN+WG47PDjT1DC5HAdlQsursY
X-Google-Smtp-Source: AGHT+IGZAeyKrzKHwOIGMyU2gN/Hnw0mA0ZY+Q9ejwmwD5hxO/FVKoUk2mqdLL+JRkRUMynqLB4o7Q==
X-Received: by 2002:a05:6000:120a:b0:374:c847:852 with SMTP id ffacd0b85a97d-37cc247944dmr2442137f8f.29.1727300810823;
        Wed, 25 Sep 2024 14:46:50 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e96a1f2aasm28802565e9.45.2024.09.25.14.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:46:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Simon Glass <sjg@chromium.org>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Li Lingfeng <lilingfeng3@huawei.com>,
	Christian Heusel <christian@heusel.eu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [RFC PATCH v2 5/5] dt-bindings: mmc: Document support for partition table in mmc-card
Date: Wed, 25 Sep 2024 23:45:25 +0200
Message-ID: <20240925214544.6114-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925214544.6114-1-ansuelsmth@gmail.com>
References: <20240925214544.6114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_144654_440005_7194558D 
X-CRM114-Status: GOOD (  19.26  )
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

Document support for defining a partition table in the mmc-card node.

This is needed if the eMMC doesn't have a partition table written and
the bootloader of the device load data by using absolute offset of the
block device. This is common on embedded device that have eMMC installed
to save space and have non removable block devices.

If an OF partition table is detected, any partition table written in the
eMMC will be ignored and won't be parsed.

eMMC provide a generic disk for user data and if supported (JEDEC 4.4+)
also provide two additional disk ("boot0" and "boot1") for special usage
of boot operation where normally is stored the bootloader or boot info.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml     | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index fd347126449a..58b6593a0f60 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -13,6 +13,10 @@ description: |
   This documents describes the devicetree bindings for a mmc-host controller
   child node describing a mmc-card / an eMMC.
 
+  It's possible to define a fixed partition table for an eMMC for the user
+  partition and one of the 2 boot partition (boot0/boot1) if supported by the
+  eMMC.
+
 properties:
   compatible:
     const: mmc-card
@@ -26,6 +30,30 @@ properties:
       Use this to indicate that the mmc-card has a broken hpi
       implementation, and that hpi should not be used.
 
+  "#address-cells":
+    const: 0
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^partitions(-boot[01])?$":
+    $ref: /schemas/block/partitions/partitions.yaml
+
+    patternProperties:
+      "^partition@[0-9a-f]+$":
+        $ref: /schemas/block/partitions/partition.yaml
+
+        properties:
+          reg:
+            multipleOf: 512
+
+        required:
+          - reg
+          - label
+
+        unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -42,6 +70,35 @@ examples:
             compatible = "mmc-card";
             reg = <0>;
             broken-hpi;
+
+            #address-cells = <0>;
+            #size-cells = <0>;
+
+            partitions {
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partition@0 {
+                    label = "kernel"; /* Kernel */
+                    reg = <0x0 0x2000000>; /* 32 MB */
+                };
+
+                partition@2000000 {
+                    label = "rootfs";
+                    reg = <0x2000000 0x40000000>; /* 1GB */
+                };
+            };
+
+            partitions-boot0 {
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partition@0 {
+                    label = "bl";
+                    reg = <0x0 0x2000000>; /* 32MB */
+                    read-only;
+                };
+            };
         };
     };
 
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
