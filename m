Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00F3E82CA1
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e+LhvnSe8zJVxfE9izp9wsPYYz8W7+UUlW/1Q1WRmu4=; b=Pvs661L2vzPYpS
	JbI0OZwamh1N8A0wPv4cqFRJI2UhSiL8tgtszWBgp8KhFg1hnYR+YDZ1fc7a9TxoXStJ0edFd8s0q
	NfRpGPxqXmxZ7iPvm4ahCHGLK7eCu53WeMRHNpR7KXrtOC5pWB6wUNTFegi3Nk2m7cn6ehKFqrO5k
	Vc96kvy3LmWzdiMi3zf4UfVgjymGiaElxr6GDlDoU1pUeA113BIHPLMTJTs1AyM7QiA5UiokSXYK8
	KYTV6hpsBE3c73Qg6Nz21XMhho98YZ0RuoUsH3FE3u+8Oj0yVfMaeM+v4XN9D281qS0/MIhDBqx7c
	XlcmaAHOh5mIrr88OJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlYv4-001YCu-2h;
	Wed, 27 Sep 2023 18:05:54 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlYv1-001YCK-2g
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 18:05:53 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-79fb64b5265so301757239f.1
        for <linux-mtd@lists.infradead.org>; Wed, 27 Sep 2023 11:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695837950; x=1696442750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4GrqlkQ0I1JKG3CG9kC5zFGUFrlkl3FrQ5k9bmVUJsY=;
        b=TSPN9hF+bOPasEoxK+A6AfowywTWehBLKeHwAAqTPNX29YxncTVAEJ/VVy/gwaIifM
         HopPfyIr8bpaI+Ie/SCnaPeQ2y7qVjIhPK0UQDilf9OmxpuC8CUC/xt1SYb2RNnaIhOu
         rQbdEBifxfiym3Y0uxr9X247RsUlVooMkycfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695837950; x=1696442750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GrqlkQ0I1JKG3CG9kC5zFGUFrlkl3FrQ5k9bmVUJsY=;
        b=l5QdOHk7ilwCb3ld399//08xdXr7gTkqOcMxvs3n452Q667nKUe54ljyHV+JAsmFTv
         GA1hvtp8RWSoQfzgAEzLVyyqmE0Xk0ZPCmnVMfkvBJCPEsUb85Im737wiHFOnNlplHKh
         nxOA6riTQFaG7ID84yOWIqy/VOt5ZeO9NmGf2OdUD8CM2aHyS7YnL6yIEDxBnthlfxGs
         FpffFGbfl2O7woAlUWGNLw3FvaBuypS5yrgiiGnayq3xFTALhaYzSH/5yX9VsyEVoeYw
         Wk1jeVjrstR1+5v8DvAUWabeSXDaZ3CB1WmKYRtqLTeAEsKnY6rwbNeby4M8rm2NkWjI
         Mt1Q==
X-Gm-Message-State: AOJu0YyZO2qGvHPBO45RkDuEBU9QG0PpsF0D/z7DGIuSsomm8bsMOiKs
	qdJQA+vytvt/nBZn5U7QJ/nGjf6BBDKIJ3w7cNc=
X-Google-Smtp-Source: AGHT+IEaajljv/uey+1Fqd1NIa3A9BpHMaQNWVA3f2Xydq8XNThDYOjFx6Y3UKwlj27CGNI0r8qbOQ==
X-Received: by 2002:a6b:ea10:0:b0:795:13ea:477a with SMTP id m16-20020a6bea10000000b0079513ea477amr2843824ioc.8.1695837950050;
        Wed, 27 Sep 2023 11:05:50 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:5d4f:fe51:5575:6f76])
        by smtp.gmail.com with ESMTPSA id b17-20020a05663801b100b00439fa6ff6a9sm4032583jaq.70.2023.09.27.11.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 11:05:49 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Rob Herring <robh@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nick Terrell <terrelln@fb.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] dt-bindings: mtd: fixed-partitions: Add compression property
Date: Wed, 27 Sep 2023 12:05:43 -0600
Message-ID: <20230927180545.3522628-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_110551_920126_57BD0EAF 
X-CRM114-Status: GOOD (  12.09  )
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

Sometimes the contents of a partition are compressed. Add a property to
express this and define the algorithm used.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v4:
- Add an example

Changes in v3:
- Just add a compression property for now

Changes in v2:
- Use "binman" for compatible instead of "u-boot,binman"
- Significantly rework the patch
- Use make dt_binding_check DT_SCHEMA_FILES=Documentation/../partitions

 .../mtd/partitions/fixed-partitions.yaml      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index 331e564f29dc..058253d6d889 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -29,6 +29,24 @@ properties:
 
   "#size-cells": true
 
+  compression:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Compression algorithm used to store the data in this partition, chosen
+      from a list of well-known algorithms.
+
+      The contents are compressed using this algorithm.
+
+    enum:
+      - none
+      - bzip2
+      - gzip
+      - lzop
+      - lz4
+      - lzma
+      - xz
+      - zstd
+
 patternProperties:
   "@[0-9a-f]+$":
     $ref: partition.yaml#
@@ -64,6 +82,7 @@ examples:
 
         uimage@100000 {
             reg = <0x0100000 0x200000>;
+            compress = "lzma";
         };
     };
 
-- 
2.42.0.515.g380fc7ccd1-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
