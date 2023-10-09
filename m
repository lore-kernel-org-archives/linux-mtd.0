Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1462CD6138
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 20:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7BAJ+1QeJm13lo+1b4SWuronzDIKC7otb4BxdaPdhA=; b=SyXwVTH5FaxWfZ
	dHLTgaN3YdUw+Dq6g3DNtpVUQRWgzv/SXq8QbXDuzx1hudLgHOGmRe70o3GhrhdKzW5+4RJa9k9lO
	Qk5tu19tDyk8lzhXpaY9ZuKSjG+ybaGdP414kU11WnvnS6gySJv2TPmEOOyi27UhptpPqpaBdjVZ1
	9rkAdChyp6UUNiSDY2l0INZVltedYnrjPSj5kYfgM3JS7z6WnMQrQGEjup+H9i3aMbRnwdJ0/VVcY
	waz20vmDi/4cv3A+jFogaUvd+zzVqvwK36g1idqIY74i4p49oDDtmL8ZXBs9IPptMFrUf3JqcqYdi
	s9Q0zw+4SQqrt2WcAbSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwa4-00BY7a-2Q;
	Mon, 09 Oct 2023 20:10:20 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwa1-00BY4x-0O
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 20:10:19 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-79fe87cd74eso219203339f.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2023 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696882215; x=1697487015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3GY1i1RwOxFPsx3r0WAP41F76rpcBgk99acMMB0WNM=;
        b=SWa/rh9Q2j8qa3iM6dJmnmEnTgM5NI9wKX/c3ir9+2BBD8S4NxYCOMh0lm27vdHyzV
         6DrgHAFnRHYQlBz3LaHpUMuFp9mheD88bTwTOVXbs2gcFnSOn9EW+TahbOAnBi2jhkQQ
         l2V/FHYeSZgK9F0VoLFCumLTZYir7/jwBa5ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696882215; x=1697487015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3GY1i1RwOxFPsx3r0WAP41F76rpcBgk99acMMB0WNM=;
        b=jUWo16AmmaLH0qRXUOsSkY1Tmvf/U5NK3fr4V6n9t8dfQncvpvJcSYE81VrMKbvTma
         8/L/P+Y710eIXpyyZbYkdgrJ0GgXhCmm8h5r+4SXEDGLPlfGS1tgWLq0yBmm8UhSusAl
         zhJ0ta6nLmqjxM/3bSZwrYY2KL8WqMORxoB7OKagXtp9N8MTDbAvXwXAMM+v98Mb0H04
         HaN/jpbr5Vl12Ak+KQiAsIwdKPmgS2MrxVaDHmwnxc8+w4n/hUmrX1nAWAzuKxs2sb3z
         fP0BTqEaeA1rjg1JNFpUTv6RuCdwmVBlJfCPByEkwU6OUlH4pQbejvnrb03W0i/28EtJ
         alSg==
X-Gm-Message-State: AOJu0Yzh4HeuehabBOte8NzLndvMc30gIoCXwIm5hWVywil+tZYxuWJC
	tNzZbw55hhVJYL5bjmt+lSRXKw==
X-Google-Smtp-Source: AGHT+IGRVDl2QlAkPNETkpq0SUkGBPU/UdXTV3AM7x9Hs22e2Z60hPdHjcDCo4XmjZUSi77IkFoEjw==
X-Received: by 2002:a05:6602:220e:b0:786:f352:e3d4 with SMTP id n14-20020a056602220e00b00786f352e3d4mr19797645ion.7.1696882215555;
        Mon, 09 Oct 2023 13:10:15 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:138c:cf57:c18d:20f5])
        by smtp.gmail.com with ESMTPSA id q21-20020a02a315000000b0042b2df337ccsm2215294jai.76.2023.10.09.13.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:10:15 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: mtd: binman-partition: Add binman compatibles
Date: Mon,  9 Oct 2023 14:10:00 -0600
Message-ID: <20231009201005.1964794-2-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231009201005.1964794-1-sjg@chromium.org>
References: <20231009201005.1964794-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_131017_159829_BE9F3033 
X-CRM114-Status: GOOD (  16.58  )
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

Add two compatible for binman entries, as a starting point for the
schema.

Note that, after discussion on v2, we decided to keep the existing
meaning of label so as not to require changes to existing userspace
software when moving to use binman nodes to specify the firmware
layout.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Drop fixed-partitions from the example
- Use compatible instead of label

Changes in v2:
- Use plain partition@xxx for the node name

 .../mtd/partitions/binman-partition.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
new file mode 100644
index 000000000000..754f804524a5
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
+  compatible:
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
+        compatible = "binman";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@100000 {
+            compatible = "u-boot";
+            reg = <0x100000 0xf00000>;
+        };
+
+        partition@200000 {
+            compatible = "atf-bl31";
+            reg = <0x200000 0x100000>;
+        };
+    };
-- 
2.42.0.609.gbb76f46606-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
