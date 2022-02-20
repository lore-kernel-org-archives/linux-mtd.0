Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E474DC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Feb 2022 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4dIf0/KEBOEI4a2Vf/Vj4lKYeL8bCbwbjs+pdNyqWQ=; b=QqgVPrw5r2VY9k
	w47wwBVhMPJ2pD1+ZkOzNNaKBYrm1FjgQeultr7mqeusEq15Lk/VqkzNfc2AIZM6jfx9Ql9YwD/Lt
	+4ray3RN8RP67eXQnQpMCstg0+DyGFIs5SyMN8lJgQpA2m/33nDm66K4blx6AZQiTPX0J/0rpKoU1
	FVFoOiONerMoQT3NJlGvCmQu4SqOmcpXXlZopOjFU9dl9G87pVaTx6J0RMYi0tEWS+qGnfnDk7bpR
	Tzl5ob6CDnNgBR4H3qTxgKFJUxezxgkUhuSlAnV10EEb4U3KaulOhUSuhWCyYVsR0OKvR6irs1U01
	4DOg9h0FKOUZFThyei2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLqBV-001zun-91; Sun, 20 Feb 2022 17:39:45 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLqBS-001ztD-6k
 for linux-mtd@lists.infradead.org; Sun, 20 Feb 2022 17:39:43 +0000
Received: by mail-ej1-x634.google.com with SMTP id a8so27373392ejc.8
 for <linux-mtd@lists.infradead.org>; Sun, 20 Feb 2022 09:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0XdH+UuoTmIJpoL0GQGXlMfGXdvLAhnJy2/X6+fBU+E=;
 b=I07Ksbcl8KQ5uFjT4EV/NYk5JjRe6BhMypo4Y9zOFfZxj/WZ+eFLJzUTO+RdNclElJ
 z792NtSF3RMaJPITTBXx4scOOj3/oaD/fUwwOiU7ovbrp3zAm+/av+IxmxSXHBrYqFTG
 aq0aHI0lg6+E/+La87DONZzagS9sKMTF12snPBFlDEuB0bjwUDnNM81ZUvjtUx3AEzOi
 xVQ2z3UOkNX/NNPKOyTocVfEuqTSF1i3B56LarHnjBxzsEpf0xM6/HYUwq791e1c6wWv
 rjzNLaxJi9iUZ17mvsqpMDQemxbALVhawzH3K7srpsoZBACrSf81IvJxJo2lmK5SU0Ry
 Y/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0XdH+UuoTmIJpoL0GQGXlMfGXdvLAhnJy2/X6+fBU+E=;
 b=OCQDThSUOM5Wx8+CbZ2t8pQI/9sSyhsjiGgMoD0VRhaoY9zOc/QbvV3JQNkNSfqi8j
 E9RO8Vt6Z8SDbtfEgA/Jh6779zfE/gIvjhomRDM5p/XGzU95Zye44ph0BxKZ1g0nE8sP
 1EBTrDPQj4yG0uJPDuNjR5lelzEIjuJYFeTwdkGv/QhHlcAKkjnQ8wwEUrLPihxbhJvB
 Qm1eolXu3fh1bEysBPae3LAQNyzaGTjXN1idvMxa6DTrWvCx10wPJrVsSJuK5HSXYOdl
 1l175tFJWtCFhhGY9Qr7hvy6Z0YoARS11xcHdQR7SRfUuuCGR1m0HmXEXtmm5WrVwr1m
 5d0w==
X-Gm-Message-State: AOAM533EsgQyJEVQioNYLo8E+dxFqxtj2lBlCnKyLMndxIZgOyz3R2PT
 fa1H++uS1UfeV8uPLcunm/w=
X-Google-Smtp-Source: ABdhPJya5ibmpCyFDayy/wBqecm2M9yZe1IhqwI6AEh4pXXMSO5Al2QNHYNJr88scIIdJkvdtWMfDQ==
X-Received: by 2002:a17:906:3905:b0:6cf:7ef5:fee0 with SMTP id
 f5-20020a170906390500b006cf7ef5fee0mr12949599eje.307.1645378780088; 
 Sun, 20 Feb 2022 09:39:40 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-42-71-246.ip85.fastwebnet.it.
 [93.42.71.246])
 by smtp.googlemail.com with ESMTPSA id i5sm4416721ejo.188.2022.02.20.09.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 09:39:39 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC RFT PATCH v2 1/2] dt-bindings: mtd: partitions: Document new
 partition-dynamic nodes
Date: Sun, 20 Feb 2022 18:39:04 +0100
Message-Id: <20220220173905.14165-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220220173905.14165-1-ansuelsmth@gmail.com>
References: <20220220173905.14165-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_093942_268191_09F5B063 
X-CRM114-Status: GOOD (  16.47  )
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

With these special partitions, only the label is required as the parser
will provide reg and offset of the mtd. NVMEM will use the data from the
parser and provide the NVMEM cells declared in the DTS, "connecting" the
dynamic partition with a static declaration of cells in them.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../mtd/partitions/partition-dynamic.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml
new file mode 100644
index 000000000000..945128e754ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml
@@ -0,0 +1,54 @@
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
+  by a dedicated parser that is not a fixed-partition parser. To declare a
+  partition the label is required. This can be used to give a dynamic partition
+  an OF node so that subsystems like NVMEM can work and provide NVMEM Cells to
+  the system. An example is declaring the partition label and all the NVMEM
+  cells in it. The parser will detect the correct reg and offset and the NVMEM
+  will register the cells in it based on the data extracted by the parser.
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
+    partitions {
+      compatible = "qcom,smem-part";
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      art {
+        compatible = "nvmem-cells";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        label = "0:art";
+
+        macaddr_art_0: macaddr@0 {
+          reg = <0x0 0x6>;
+        };
+
+        macaddr_art_6: macaddr@6 {
+          reg = <0x6 0x6>;
+        };
+      };
+    };
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
