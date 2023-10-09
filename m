Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF4CE784AF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 22:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wh5ddAM2BPtR1Fe3cf7RADPYCBa/p6LqFgFDG/Eg94A=; b=wRoQrmg3BLvQqv
	+281k8GV3V81w7F65bRfsiYjh7VkT/xR45uKpSQHfGf+yN+Az4giWq6wPr9vjhQTKQELPwfwiu4gY
	3LtoaetyF0wtQsvo2xdFMrLLzE8ryvLU01G7P+J8uHLA/7ktY8o/qUm1QSav9wPO6EVV3oRlhW8j0
	evBhIRSuTOmkc+WIO2kCkiKn0Etepzu0vdPoyOlGqLaannybnYWxC1IiLKKUXkkm4o/0PFCu5WulD
	2VjiLR94NFIcOjz22Q9QyMQJ2sOnzYZ+ZoADyjSgWLNTIK5nW+4QjC5HLFbnGdadWxLJN7qBOez9f
	Puaaww3/27sGjXlcPqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpyMo-00BiPf-1M;
	Mon, 09 Oct 2023 22:04:46 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpyMk-00BiNj-2N
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 22:04:44 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-76c64da0e46so200453039f.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2023 15:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696889081; x=1697493881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Oy3/oDIsrYxVx08XCzjcM9Z9wsmpIMgRcvueEjHv/4=;
        b=P9LfwKAvYnntEq5lrzMN7EBOG4BuN3OTJAmryitwhZlFusTSQhUrkruO2OImJv0R38
         rNAdT8EqAlebIhzEhQxdp9SDh8O4++p2Sl2hm8GtVtLqQo5u86ygY2RawNHHHQinKpyR
         sLw3eZSCQURg+r5bt9ELv3SkSz1EUu4jDW8Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696889081; x=1697493881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Oy3/oDIsrYxVx08XCzjcM9Z9wsmpIMgRcvueEjHv/4=;
        b=PrRvb3dcL/HM4Q2hvOxRBQj7onRWfcWC16kcde7ze9heoQzjjT/yw2Z1WkymWv1HJi
         l7W0Q1XtHv6abmNBgUCRLwNSFzIPdQqsP/Awc3KNQ/qfZSXaUowTtn+dSptTy5iFzfOa
         njkdL1UZf+oqYJiIHXfLNhJx0mDUUp6To974zvgoE1dsF9RD9R1PlQSbtBNrcR9JQSVh
         rLeRgfweqflLtIIyAWhtvd+KbUzKkRvDpWKZVpDdTo5Hav75LhuoZ4CN7R/aB754Es9j
         hL4C2rwlUrf7VaPFv6Q3gDzlBOpfmVVkh8Z4qP0PelMy8Io9vn6PxNYGAOkGUMvXwv2S
         0d0A==
X-Gm-Message-State: AOJu0YzbUwFQEfaR4wx4O2L4qQ2SBDheAsduk1glBNay8m5sCFJEcQsF
	faHCPbiTImA1qAC2Smdr4mZNdQ==
X-Google-Smtp-Source: AGHT+IFwSMMRzbI9ukD+T9rudHAv5MuufQsbRJFD77HiKbqNVg7VVe4MkQLuLmI2ApcxREzIG9BR/A==
X-Received: by 2002:a05:6e02:170c:b0:350:f510:3990 with SMTP id u12-20020a056e02170c00b00350f5103990mr23056007ill.2.1696889081061;
        Mon, 09 Oct 2023 15:04:41 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:138c:cf57:c18d:20f5])
        by smtp.gmail.com with ESMTPSA id o3-20020a92d4c3000000b0034cd2c0afe8sm3164063ilm.56.2023.10.09.15.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 15:04:40 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Rob Herring <robh@kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindings: mtd: binman-partition: Add binman compatibles
Date: Mon,  9 Oct 2023 16:04:14 -0600
Message-ID: <20231009220436.2164245-2-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231009220436.2164245-1-sjg@chromium.org>
References: <20231009220436.2164245-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_150442_776193_F6C9646F 
X-CRM114-Status: GOOD (  15.78  )
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

Changes in v4:
- Correct selection of multiple compatible strings

Changes in v3:
- Drop fixed-partitions from the example
- Use compatible instead of label

Changes in v2:
- Use plain partition@xxx for the node name

 .../mtd/partitions/binman-partition.yaml      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
new file mode 100644
index 000000000000..35a320359ec1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
@@ -0,0 +1,49 @@
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
+    oneOf:
+      - const: binman,entry     # generic binman entry
+      - items:
+          - const: u-boot       # u-boot.bin from U-Boot project
+          - const: atf-bl31     # bl31.bin or bl31.elf from TF-A project
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
