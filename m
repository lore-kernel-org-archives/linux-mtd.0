Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2418C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 23:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMgcmjBIBZ+fVHjvkgrikj4as2erGjzocLvRJWeGQwg=; b=oFqSPRwpcTzk8M
	qayiQ00goURJFST2Zd0FJfvBg2R2ijnxSY08uvdg6TE65Eilwzi+HaB85KHioV+T2Mhj6mImCDCNy
	405OJ/0tMrLNkO2Cy+UqAOqO0TfNEvbutCu/dE8FYy/qzy0dF+J4pxRHnmOVwJ+e7Wg87wFzTCdtR
	bzPr+SWvWFgtmywKbqtfrN8x2WyZWgazRzlocpZ5PWHvhRgKcMCfgcggYnmE5F3VzEgV2oac7FYpX
	9IyFzx/+GXHTF3uyQUQ/Z6ncXOz//MLw0rCjKGeMRgmbqreljXtFSnYOg0MCcDHyB6ysp0rRrwE8X
	+I7ZP04fmL/Zd1S++t9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrTAN-004I0U-Jb; Wed, 18 May 2022 23:33:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrTAI-004HyK-Ou
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 23:33:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id j24so4809921wrb.1
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2022 16:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tPbG+1Qsh5nbAzaiZ8E/pw1mS5ghkz1deStVQwXqkP4=;
 b=VGx115cjLF+9JtQTO0M/Lx7jnhO4p03qIpnSdOE2KVl7vxxeYJVK2X5ZzA7yvUv0ur
 xqm0VeAv67/JQtCQgEDee0y7tlGRr7Ixxe5+ViQutEgQeZeNYXlrYEf5c3xZOUB3Hd/l
 QBA0aas54guBiLOl4xXwaUraYBlfmn1Pt0JF5aBxhiFgFSYlWxfvZBouDoVJ3PcQgI1Y
 Nwcc8L77SG82PVtThUiPjS1tzr/MaaUngdlSdwxyIRItD+x91p5JKRPsXdc8QYCh1Fbw
 Xq2CB6g/gHrgeXPZ56PMsTlLjE5r0l3cyqvW89gMikJ/3qG4kE3Ps2dFZe8YSq3Ys/17
 HZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tPbG+1Qsh5nbAzaiZ8E/pw1mS5ghkz1deStVQwXqkP4=;
 b=E/sXk/TL+c2w+1NTFlJ00g+BuzTbgGVplA3azPEEkaTiv6ZZ4KVull/U69MNpYNDum
 /WZdLxshirKRVMLdcXWzPnzUI7civFoI/rhoL+SOw4hLAzyV6CDYweNbSAaPv2GmEAsi
 +9aoXfhikaMb3vvi4EItkMCgLX70sd5fNm0keHQ+JgcCSSXNfcRfQ68Cy53TJT0SHtts
 /fEwespOpGJBdZIVG5PlZZhyw8KBxOo0t1fyQSu8saEJzPENrCiXabcxyI6PFbzUjhF6
 1BrtD7t+lFlGqQhkxkhZiy4UK/6TR9SGm3KymQ/Gr4Nmfq9d8rUWS07Ye/F3hwK/SJT2
 p2Dw==
X-Gm-Message-State: AOAM53081JFtXeDucUpL+fB4/uqLJnU+piopSOZiv1bCcTgi0fBTrcOx
 0q1rwWhS9dDRq2CQyUmHdjc=
X-Google-Smtp-Source: ABdhPJzqihmw4n6FOdPzo7A6p0tJo0zukMbN/45Svsp6+TcDeaV6CrpCCK1wVn2iJ59bOG1ZpBaV1g==
X-Received: by 2002:adf:f001:0:b0:20d:22b:183c with SMTP id
 j1-20020adff001000000b0020d022b183cmr1538233wro.313.1652916792084; 
 Wed, 18 May 2022 16:33:12 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 j25-20020adfa799000000b0020d042efd11sm3217476wrc.61.2022.05.18.16.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 16:33:11 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: mtd: partitions: Document new
 dynamic-partition nodes
Date: Thu, 19 May 2022 01:32:57 +0200
Message-Id: <20220518233258.5483-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220518233258.5483-1-ansuelsmth@gmail.com>
References: <20220518233258.5483-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_163314_847265_045C28AD 
X-CRM114-Status: GOOD (  19.80  )
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

Document new dynamic-partition nodes used to provide an OF node for
partition registred at runtime by parsers. This is required for nvmem
system to declare and detect nvmem-cells.

With these special partitions, the reg / offset is not required.
The label binding is used to match the partition allocated by the
parser at runtime and the parser will provide reg and offset of the mtd.

NVMEM will use the data from the parser and provide the NVMEM cells
declared in the DTS, "connecting" the dynamic partition with a
static declaration of cells in them.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../mtd/partitions/dynamic-partition.yaml     | 57 +++++++++++++++++++
 .../mtd/partitions/qcom,smem-part.yaml        |  4 ++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml
new file mode 100644
index 000000000000..f57d7b9cae7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/dynamic-partition.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dynamic Partition
+
+description: |
+  This binding describes a single flash partition that is dynamically allocated
+  by a dedicated parser that is not a fixed-partition parser.
+
+  Each child of the parser partition node is then compared and if a match with
+  the provided label is found then the OF node is assigned.
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
+required:
+  - label
+
+additionalProperties: true
+
+examples:
+  - |
+    flash {
+      partitions {
+        compatible = "qcom,smem-part";
+
+        partition-art {
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
index cf3f8c1e035d..b6fa25949fe2 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -19,6 +19,10 @@ properties:
   compatible:
     const: qcom,smem-part
 
+patternProperties:
+  "^partition-[0-9a-z]+$":
+    $ref: dynamic-partition.yaml#
+
 required:
   - compatible
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
