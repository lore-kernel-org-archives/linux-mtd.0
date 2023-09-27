Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D512BE82CB0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zQ4/JohAj4GayP1RIZU9vc4RpWoZDTC2O/gOnbSbRNM=; b=qU8NPHUEg6MSpa
	5+zXSsGcjToM9h+6cHnukVrV1LHVWa1K8WU7fLHX7j/O0fLQHbZwvDgjBRLH2MLDegwBp1fl3guLw
	Gwu2u8c0Qge1/1/qfbA4J4tS9qHzKpGL0j9CqQtAn+FE2dfxHWJa1N0VrAfaazR0QsWlp858re6v4
	esl9lt+tD8tOxfPfk/usLyYutxNpS58eTLqaUK+TTIPxYg1KP6+pamHqrz9B2Y9MQw8LQ95OwnQDZ
	7ZdiGGEZyvIJgO5ZBrfoJI+wfv87uDqgrwvWNOsoZJeC+PfyGDtojjL9lAhwyLwq5BBdRQj3V8yLb
	pKyQPb4wgIZYQ31Tez5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXhD-001S1Z-0J;
	Wed, 27 Sep 2023 16:47:31 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXhA-001S04-1g
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 16:47:29 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-351437112c1so20221715ab.3
        for <linux-mtd@lists.infradead.org>; Wed, 27 Sep 2023 09:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695833246; x=1696438046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xi0NPAXOKB2g4KhPtyHEVHOc+BFF5U0uejfT8FKn0j4=;
        b=myFsiZMEEVMSoSpoemEqNX4I338xXDql0WJCRw8xYPegvnAhv3ChwFwJJ1rZ9FuezZ
         5uz42NCqucXsEjYYGadgxKnNFu/fmkSa7KOWg2BXKBqBxmPMDrGSGDnD6GIgMhZPNFQw
         qNshhruwtCAAHsN7O4bGral1wdZMcQTWjWXuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695833246; x=1696438046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xi0NPAXOKB2g4KhPtyHEVHOc+BFF5U0uejfT8FKn0j4=;
        b=gwDA6D76948mcGkFButR8wqziYcnLk8hMfnaQN5r2OJksnhlKjMDsc1vNN8yFHGqtd
         9JonQzvtC7ylOwsBuB9v4d1FPkJ9LsgqXXlzxdyNhketFp51YknMKYoHjlI/dpYgsWRg
         W/MUrpaYWUnDc2bNSVzByjSdDS0iNCgdvHaLuwls0zduyUGO4hp5hRwT6mVIQ5jtEvEU
         T6yfiTyCsybgsSfTTY0QKt7ilfx+zomyS9RGhmHw7gBkzDZm92GUgoMU3CUN2/IDl0tJ
         JptvHqilcrnHm5da404FnZIV2xPLkIJjA/h4gWhilG/dIfpSAI5/uNmX8wk8cFhVqPvt
         DFbw==
X-Gm-Message-State: AOJu0Yzy1LcsKFpOTbjIuzABCHeySfFBG4Uk0SnMMm4H2RT93vxqNVX1
	wMAB1yFsvh3zJLTDj/Gpl4mRbw==
X-Google-Smtp-Source: AGHT+IH+JcaNhVNz7FfFGoWF8iw2OSTtskunRegjjj1eGuC9QOYwU8eTORJoA1lvodxfPDArPEpPZw==
X-Received: by 2002:a05:6e02:12c5:b0:34c:ecc8:98e7 with SMTP id i5-20020a056e0212c500b0034cecc898e7mr3216823ilm.9.1695833246163;
        Wed, 27 Sep 2023 09:47:26 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:5d4f:fe51:5575:6f76])
        by smtp.gmail.com with ESMTPSA id ei25-20020a05663829b900b00439eda8c1c1sm3980500jab.111.2023.09.27.09.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:47:25 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
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
Subject: [PATCH v3] dt-bindings: mtd: fixed-partitions: Add compression property
Date: Wed, 27 Sep 2023 10:46:51 -0600
Message-ID: <20230927164654.3397353-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_094728_563121_1D8E2157 
X-CRM114-Status: GOOD (  11.38  )
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

Changes in v3:
- Just add a compression property for now

Changes in v2:
- Use "binman" for compatible instead of "u-boot,binman"
- Significantly rework the patch
- Use make dt_binding_check DT_SCHEMA_FILES=Documentation/../partitions

 .../mtd/partitions/fixed-partitions.yaml       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index 331e564f29dc..13ff313cabda 100644
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
-- 
2.42.0.515.g380fc7ccd1-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
