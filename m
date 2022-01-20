Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B263DC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jan 2022 20:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZy7vjeCsopwvpmbmXTyz2Y8zft5w7fletKLuy7kwIs=; b=Oo6hhx4Rg3KxhN
	QyDOyiN23lnoGdeL/WZuSQhRM504R9h9Y1cTE9fH/twrOdrJ40hJyGDOI/dLEV0x7wWRO72OgSZra
	L2b/z69J73kvbTFmrj9CMhPXsCFUX8QC6UXUtsj8IYfovC4Re3gGvgFaqchDHcwGEPm6RnkSqiHDT
	j9iQH0I8oLKCB9bfCesSzWS2rt4ouwQXXRJqD0WebhpZVEzP9jZuPwbX4m6awvXUbgY0oodh7gsvi
	kFeUj/8GTgP3cmWYBS60wQEbilQsa3Gxik1CK/x4tM/Eh0KObNrr3Ic6tJVUiAMg3EQIbpoIKXN+Y
	+1YTZL5t3cLLRkIjUUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAe11-00D7NM-Er; Thu, 20 Jan 2022 20:26:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAe0k-00D7Iv-Gr
 for linux-mtd@lists.infradead.org; Thu, 20 Jan 2022 20:26:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so16533800wms.3
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jan 2022 12:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BU6QG1pcbtiezVEs71fXj8uW5BmpzUpTu00HX48AVes=;
 b=C9cRX0L3KktFSggGD3oPSst1A6JSeiEjti+f7jeM/dT0acrhWyF60/Bb+B8Fa1wzCn
 ANZOMXsDoZg1m1FVOrl7yYdG6ZherCMau9B6psHFBQlO2vP0Bijw/nB/J33I2dnUSE+U
 qp0M+V44pf/Q9vlaHUFh1K8lIQEuRUBu7SgenqVD1CEHoe/JtIbMrCSZ/dg5nYb1Nupe
 SJZKgQdgKWLl7dzYDyE1M6c0MM7malWiTmNGXJec5ey/6x4ls76eZE2X0M3ma5ISAWSn
 zVeRG1M574KuiXT2Ur0r/3U9IYhuE9VgYfSX5d/ooiXsPk8FrpxNGwT7G4NUYGzkntyD
 JmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BU6QG1pcbtiezVEs71fXj8uW5BmpzUpTu00HX48AVes=;
 b=ZFr6G6zHx/jiYg26netrb68eJE1loSN2MVjIKdWo1z84w+aalMmYoAziQ6TAlW/mkN
 fmanxmugY7oSxa6gky1l4SSMsiUbmQO5ibuc5imfzBhMs6ocSUw/y2JpxHje+IbxEeuC
 l0huqL49ElSMW0q/5HPlYt0+kBuQP+m/C9tlchQf3xZUiiWPkjfTEOngAtDxkD35ViIc
 XAVPU6zvWFtl/XfRYTfFEYdSxM3Plq0dOv1RMOvWCIEXwzjfHAqTFfC2fjSfhULEuP1Y
 SVkhU38EiQ6i7r1BPNb9iiTrdEL5u9sP+EXmaOVSm6dAlT/RJH+kIYA7hlaYlPZNrovv
 CfFA==
X-Gm-Message-State: AOAM532NfUFH6KN4fGLSPzNJcMknvW4wvq7ohDy/Jku+dM96Vguw0UsW
 n4PqY2P8Ekh6W5yKjeRwDXE=
X-Google-Smtp-Source: ABdhPJxniIQsGh7ZQrt5BO1i77UUotIRau7Ve2ypejLfqZTMAC4M7yvn+a6dt+yDU0WQIkeJiE70Kg==
X-Received: by 2002:a5d:4c4d:: with SMTP id n13mr684134wrt.641.1642710380687; 
 Thu, 20 Jan 2022 12:26:20 -0800 (PST)
Received: from localhost.localdomain (93-42-71-246.ip85.fastwebnet.it.
 [93.42.71.246])
 by smtp.googlemail.com with ESMTPSA id n11sm862919wms.3.2022.01.20.12.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:26:20 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] dt-bindings: mtd: partitions: Document new
 dynamic-partitions node
Date: Thu, 20 Jan 2022 21:26:14 +0100
Message-Id: <20220120202615.28076-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220120202615.28076-1-ansuelsmth@gmail.com>
References: <20220120202615.28076-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_122622_580704_03FF118F 
X-CRM114-Status: GOOD (  16.16  )
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

Document new dynamic-partitions node used to provide an of node for
partition registred at runtime by parsers. This is required for nvmem
system to declare and detect nvmem-cells.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../mtd/partitions/dynamic-partitions.yaml    | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
new file mode 100644
index 000000000000..7528e49f2d7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/dynamic-partitions.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dynamic partitions
+
+description: |
+  This binding can be used on platforms which have partitions registered at
+  runtime by parsers or partition table present on the flash. Example are
+  partitions declared from smem parser or cmdlinepart. This will create an
+  of node for these dynamic partition where systems like Nvmem can get a
+  reference to register nvmem-cells.
+
+  The partition table should be a node named "dynamic-partitions".
+  Partitions are then defined as subnodes. Only the label is required
+  as any other data will be taken from the parser.
+
+maintainers:
+  - Ansuel Smith <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: dynamic-partitions
+
+patternProperties:
+  "@[0-9a-f]+$":
+    $ref: "partition.yaml#"
+
+additionalProperties: true
+
+examples:
+  - |
+    partitions {
+        compatible = "qcom,smem";
+        #address-cells = <1>;
+        #size-cells = <1>;
+    };
+
+    dynamic-partitions {
+      compatible = "dynamic-partitions";
+
+      art: art {
+        label = "0:art";
+        read-only;
+        compatible = "nvmem-cells";
+        #address-cells = <1>;
+        #size-cells = <1>;
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
2.33.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
