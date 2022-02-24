Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC29C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7ShWTZC1lAl9wBDhElg1FFifUSg1MY716xbgwGiUu0=; b=g6j9FIErvA29ST
	9+sw8qCv30GqvX6HegqGoshYPs6i7zwGmzxLi/9L2hnf8L1nDYALcTwsJCx461dh5veexZ7MNwuUY
	SfAsmwLJlq7cVRI+35DJR0rbLY8rxKFkF2gQSkcBRoSunjgD7Q90y3hBph5rGIsC5y9jYwmFNptl6
	59hEM5GCcopTMWIIY2nvB2wTYW/9DSQYm7geJ5ca4qU9IEG+9pbz3FLkH8ms2+0Jdy1oU37/bCVyf
	5N0TmgS1rcas2o/CEteGikluYF1EfJTQPeByRR1TPTy4UCi24d1SAw3Zvox7vJ/puzjWHzCVouXxm
	SQxqKRYgT3qVyZb2pyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNFvj-001GYc-Sp; Thu, 24 Feb 2022 15:21:19 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFvX-001GVX-BH
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 15:21:09 +0000
Received: by mail-ed1-x529.google.com with SMTP id x5so3307258edd.11
 for <linux-mtd@lists.infradead.org>; Thu, 24 Feb 2022 07:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BenUmI5YlFoZ8y7dkLtbgkF8fzK7mypO7kCBy+ysHLY=;
 b=a4YpovKaGp3D4sf23/UFKiiJ0qYs/2HZoPFoKGprlMkFvbllwVwZU/Ls6kf6bvHJdK
 Yz+wVEUHyJvuCn1JAFuUKQSnXFyjQ6IR3ljO4Dmol9Ki7q6NzdZtxUk6OrZL8saE2y8M
 D50KG1xdcOQ6fwiTDdR5jOP6R3q3N94J0kY1UemWiEUdpK9LMT5CcYxCBt22BkNDO4Bh
 3kEE0oFRZRG/fUDztlObehEiM1NcqxLyDz3WdnRv38QWpDMFllY+0/8oldBYwv8BQOc9
 AFuXxYSGH/EOb0ubVnYsTPL5KXzOJBjRqGVPDR+08Efl+p6H5gofpRyqOT2nt5rt7dt1
 ZRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BenUmI5YlFoZ8y7dkLtbgkF8fzK7mypO7kCBy+ysHLY=;
 b=tnieHfpOF9oXcXlZvHIXIXXZlGK6uK4JyMkULXOU7i0Jcof5VCQhPnh7E/clYmflOL
 CHEJwywidQxraVuP0YMrjy0SNnbddt6XwXKz6kHHIW86Yrv33SpFZbFJWfBMdecOG5MV
 6oZ+h2SjRq5q4dVtTIW7NpJBoF7a38KnPx0X4LVcggV/mpOFYpWsAaFmYNs1HV+CGt80
 WaeoY+bTNNhjiTgVl2wNDcbbmKY99IJqu2Qyn+6hKuKFF8IW9Y9pHzzjviSTLzq1rFhm
 AAxp1obRjfN4MU8WgMnr0uwHZrBGhXSMIzGztSkIcnrlGP+IDnyFipxJ3xczR8iLea9j
 O/Dg==
X-Gm-Message-State: AOAM532VVLSUbtYhOstBpV1+txlCb8gdFh89bMi4KSZjEA5uG7JDIBVN
 20qq/BhINd84hM4zxzf7p/s=
X-Google-Smtp-Source: ABdhPJz29+csu8N1YY87hVMgulkAFd7SkgNkyf8NP0JgSciPnhGW9ualgEk/g+UskvOTqJ3GHVbVUQ==
X-Received: by 2002:a05:6402:5ce:b0:412:be81:a9d6 with SMTP id
 n14-20020a05640205ce00b00412be81a9d6mr2861662edx.272.1645716065288; 
 Thu, 24 Feb 2022 07:21:05 -0800 (PST)
Received: from Ansuel-xps.localdomain ([5.170.108.128])
 by smtp.googlemail.com with ESMTPSA id x12sm1501980edv.57.2022.02.24.07.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:21:04 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC RFT PATCH v3 1/2] dt-bindings: mtd: partitions: Document new
 partition-dynamic nodes
Date: Thu, 24 Feb 2022 16:20:42 +0100
Message-Id: <20220224152043.27777-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224152043.27777-1-ansuelsmth@gmail.com>
References: <20220224152043.27777-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_072107_411008_746A4919 
X-CRM114-Status: GOOD (  20.52  )
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

Document new partition-dynamic nodes used to provide an OF node for
partition registred at runtime by parsers. This is required for nvmem
system to declare and detect nvmem-cells.

With these special partitions, the reg / offset is not required.
The node name must be in the form of "partition name"-dynamic.
If the partition can't be displayed using the node name, it's possible
to use the label binding that will be used instead of the node name.
The node name or the label binding is used to match the partition
allocated by the parser at runtime and the parser will provide reg
and offset of the mtd.

NVMEM will use the data from the parser and provide the NVMEM cells
declared in the DTS, "connecting" the dynamic partition with a
static declaration of cells in them.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../mtd/partitions/partition-dynamic.yaml     | 56 +++++++++++++++++++
 .../mtd/partitions/qcom,smem-part.yaml        |  4 ++
 2 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml
new file mode 100644
index 000000000000..e0efa58e4fac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/partition-dynamic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dynamic Partition
+
+description: |
+  This binding describes a single flash partition that is dynamically allocated
+  by a dedicated parser that is not a fixed-partition parser.
+
+  A dynamic partition require the node ending with the "-dynamic" tag and if the
+  dynamic partition name can't be displayed using the node name, the label
+  properties can be used. The node name or the label have to match the dynamic
+  partition allocated by the parser.
+
+  These special partition definition can be used to give a dynamic partition
+  an OF node to declare NVMEM cells. An example is declaring the partition
+  label and all the NVMEM cells in it. The parser will detect the correct reg
+  and offset and the NVMEM will register the cells in it based on the data
+  extracted by the parser.
+
+maintainers:
+  - Ansuel Smith <ansuelsmth@gmail.com>
+
+properties:
+  label:
+    description: The label / name for the partition assigned by the parser at
+      runtime. This is needed for sybsystem like NVMEM to define cells and
+      register with this OF node.
+
+additionalProperties: true
+
+examples:
+  - |
+    flash {
+      partitions {
+        compatible = "qcom,smem-part";
+
+        art-dynamic {
+          compatible = "nvmem-cells";
+          #address-cells = <1>;
+          #size-cells = <1>;
+          label = "0:art";
+
+          macaddr_art_0: macaddr@0 {
+            reg = <0x0 0x6>;
+          };
+
+          macaddr_art_6: macaddr@6 {
+            reg = <0x6 0x6>;
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
index cf3f8c1e035d..1d7d9b3378c3 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -19,6 +19,10 @@ properties:
   compatible:
     const: qcom,smem-part
 
+patternProperties:
+  "-dynamic$":
+    $ref: "partition-dynamic.yaml#"
+
 required:
   - compatible
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
