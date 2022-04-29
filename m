Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B67C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7ShWTZC1lAl9wBDhElg1FFifUSg1MY716xbgwGiUu0=; b=fq/WOOsFXbI+98
	pgS9X4LJHMAIRmM4A5TS/TNLbYGrxPU4l5qLuIvf5e3YQCT5hz0smVsfKF4I5kofdDMIHWhS5T5NZ
	VbhwvrE4tyNUNs/+0Xv85pBv26xB+ojlA9t4ARV/k0OKF/h5jM4J/eA4Ebrft5c28tQ1FHtKBLbh3
	DZ0ymDvFYFJrglLxyxki5c0KWA2ZImI7/y56zrxkG1IIT9jzqGkSBKJZJft2YHWuKzooxubm8ROVG
	ySv4S4pQl4RB84F+rKLSZiLZ3tQHK6UMeyahKpOZXb6xAbvzGbV74LyaIErXXGrkQpxkeVmrRHAoN
	8unfw/6J0ON3JYGqjvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQ5Y-00BFYT-6x; Fri, 29 Apr 2022 12:51:12 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQ5T-00BFTR-BE
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 12:51:10 +0000
Received: by mail-ej1-x62f.google.com with SMTP id k23so15277840ejd.3
 for <linux-mtd@lists.infradead.org>; Fri, 29 Apr 2022 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BenUmI5YlFoZ8y7dkLtbgkF8fzK7mypO7kCBy+ysHLY=;
 b=QjJcXyX0Tbqo6ltLEBb8JucwUuWznyJeaKAtemFVTehtLAi+LCsimByCxeERypXBfc
 xv0+sK6gEkwAQz4VsL9BPu9WjHA7/xOLiv8X2ZRF/eX2fhyducz2VqnypCgsnvKCRNK+
 nQO9sPGNiRgd82coerrG+ouWBQRabe8cgm4NweLVAtOq/oDiSC4LA1M/hNu8qvL1gl1X
 ldnroNIK8Z/obfyHrp0UAIIj9F4Kn5z+MyDZV+dchNPtfgJZU5O8dCKa48Qi8PQLBU4A
 mBuIUWc46CG+9GqzcEmahIk9gVnAz3P8Xz9xbRmC4l5CuGtv81jtrIJJ4Md4De6b2Tov
 iK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BenUmI5YlFoZ8y7dkLtbgkF8fzK7mypO7kCBy+ysHLY=;
 b=M5q9wL9HuAI3KXTL447rv5p1TblBRTqhyTAIj/Cd1411x+/GDA5Clz9XFqoGZxfzCC
 Kyu1HcvdFqMoE1GFMEzyR08oQBFFx0IZ58Pb8vUUE2DKvkpGaG3cAzrI4grIqdztEixP
 p+H5BZVi/OnUC4jgumGokU5mlxF37ZpaA5rKEqlgW6MRMYsrn1vDj7i1Jw4CATYkdNLq
 wslx9nCAfTnfFrxg8gwBLeqqzp82DLwLqA87hNILkEt04zwBWVInPpue3fx+PR4NPN8c
 KS8uJScEZ8OXF+w3KNYsrQ17kJQs37f4y5TgK07FiCka+GEHZTYGwwEtpNsHUGC4WeUR
 fsjA==
X-Gm-Message-State: AOAM531k14mYeqaz77MEoIDWOOObIHoWX9XrEua63/+bZZNG767jmRkD
 0kkqmWDQa5IMUj55y7khmPU=
X-Google-Smtp-Source: ABdhPJzcaPjPiMJaEJBt+TyXfl1pat5tjEZR0q5MJYJbj2FbHBU0jDI98msQGayKRO4VWcieXH3C/w==
X-Received: by 2002:a17:907:33c2:b0:6f3:9aff:d532 with SMTP id
 zk2-20020a17090733c200b006f39affd532mr23226425ejb.394.1651236664201; 
 Fri, 29 Apr 2022 05:51:04 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 hf27-20020a1709072c5b00b006f3ef214e33sm615347ejc.153.2022.04.29.05.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 05:51:03 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3 1/2] dt-bindings: mtd: partitions: Document new
 partition-dynamic nodes
Date: Fri, 29 Apr 2022 14:48:24 +0200
Message-Id: <20220429124825.21477-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429124825.21477-1-ansuelsmth@gmail.com>
References: <20220429124825.21477-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_055107_401187_AF02E268 
X-CRM114-Status: GOOD (  21.36  )
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
