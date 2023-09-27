Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1599E82CD3
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 20:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWFjZE6BoLYHn6T5EUbghPBicVq9TKgfphaajZJyb0g=; b=jtIlhYuRlk5IiV
	6z9Bs/RTkWG27tkzG/YQn8siKar4oltmYaUYLZE/S59q8rNqFs04aXtuSK77/Jakh5lB3w5sdDpKr
	vtbkH+dQMI2MUsvIVWofy1D3EfX3AXZH0yX9YPtEanMlEJ8bDXrvfMuUrGhW5jlZzZQ5qzLvdpBPH
	hqPGW6vfVCgJnPQR+2NV2MGaIohPl6ygOGv4oj7KY0BTVeuYJZxq6p/fGg6ckqsr0T0jLmlfs0K8h
	Dy6gNJGRV5zgoLUm92QvWhJ7tIjhwYKQtTy1ozV7Y1Nu0Lf5lobErTJvxPtpujHfv+UCfxdZdM3I0
	qj1rS6niEHtWtKPfjMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlb21-001iu9-19;
	Wed, 27 Sep 2023 20:21:13 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlb1y-001itS-2r
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 20:21:12 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-79fb78e297bso306775539f.0
        for <linux-mtd@lists.infradead.org>; Wed, 27 Sep 2023 13:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695846070; x=1696450870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kq9WoSgqEviF42jhwFTI980vH31ePAvDcikVyQPxtc=;
        b=DH4o0yqoQUnpjnH8a2GiADM4IulsGpITQczKANA2q1ggr8YE5PFcpoyQ/dwLvfNpFy
         7DghiJZT/EEkLXmDyfkRm/LjlAQAHwHgUvpEU0FiIZ+EKpP/az7h3QpBD1RI+wMGHly1
         AkTWeYLF8BxvJBxgck2waAZTIeWKvfyvEpxx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846070; x=1696450870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kq9WoSgqEviF42jhwFTI980vH31ePAvDcikVyQPxtc=;
        b=u1l1anLeA4dDzKp5d5pd65I0aAE3Lt/oi1/OISolZEee6/zjiSL9iSQg+RGqw5O+dc
         yES3kYUb1vGV8IZhsSXIYyXW8HLwN6pjfT/iraqLdeweFi6XbqMohi0DCLk623PKWYJ5
         +OyRsmQT1Py1XziaiMoixKbFBILsGaSLuAnxF2W98u6TMaY61siKrYu7VhAOoze6QCdm
         tRs7j+GISn+MSjtuXOOk/+LCpnAPcxmoxIkGo9huMOzYQp8qbaPqPOO+BlEv+dzMd+il
         95iTtrwgEOA9Zp8AwIrnXt1VT02tcOsPyAZ7eIseJRGdYbr7LwhBstuL4aabF3e4P+Yc
         yyKA==
X-Gm-Message-State: AOJu0YwRUNqoSoIhka1Aa7acoTFovAajn4wwpGxiKb9cADeHcQ/j4S+/
	WOg7bPXxErGZigiYt5L/CBGOng==
X-Google-Smtp-Source: AGHT+IFhPJEncrLdXnOVjxjuTHH/e94XYzo89HB1tZ1pWdiwxx4ZhAkrwcRurxLK1zLwja0dnf6dQQ==
X-Received: by 2002:a5e:a610:0:b0:795:16b8:85fc with SMTP id q16-20020a5ea610000000b0079516b885fcmr2995614ioi.0.1695846069701;
        Wed, 27 Sep 2023 13:21:09 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:5d4f:fe51:5575:6f76])
        by smtp.gmail.com with ESMTPSA id ei15-20020a05663829af00b0042fec8620e4sm4113299jab.57.2023.09.27.13.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 13:21:09 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: mtd: binman-partition: Add binman labels
Date: Wed, 27 Sep 2023 14:20:52 -0600
Message-ID: <20230927202057.3676497-2-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230927202057.3676497-1-sjg@chromium.org>
References: <20230927202057.3676497-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_132110_927116_7CC385DF 
X-CRM114-Status: GOOD (  15.44  )
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

Add two labels for binman entries, as a starting point for the schema.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 .../mtd/partitions/binman-partition.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
new file mode 100644
index 000000000000..6ee832cb4c4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Google LLC
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/binman-partition.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binman partition
+
+maintainers:
+  - Simon Glass <sjg@chromium.org>
+
+select: false
+
+description: |
+  This corresponds to a binman 'entry'. It is a single partition which holds
+  data of a defined type.
+
+allOf:
+  - $ref: /schemas/mtd/partitions/partition.yaml#
+
+properties:
+  label:
+    items:
+      enum:
+        - u-boot       # u-boot.bin from U-Boot projec6t
+        - atf-bl31     # bl31.bin or bl31.elf from TF-A project
+
+additionalProperties: false
+
+examples:
+  - |
+    partitions {
+        compatible = "binman", "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition-u-boot@100000 {
+            label = "u-boot";
+            reg = <0x100000 0xf00000>;
+        };
+
+        partition-atf-bl31t@200000 {
+            label = "atf-bl31";
+            reg = <0x200000 0x100000>;
+        };
+    };
-- 
2.42.0.515.g380fc7ccd1-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
