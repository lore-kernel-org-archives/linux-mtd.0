Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A55C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yL/9NZZ2PRVuyA6GXllgzV6kcZTkMDpTQOTnZeppxw=; b=DA1XZM2SP3mrRo
	4Gz5xK9AVuYPoqDEpth8WfSrYdzVN7MEgvf/H6ZGwfERPa89RG2giBVDCLcFRAC3OfbC/lJOEqii1
	t/wkpzanBlAzje1ajlZnB+t7GAAUVWozl9VkK4RZv91I/NzfKVXXhNCWYIOqDICVd77wPAwypSpei
	02NjCe6VjRqRx4pc0XJa+ALAzO/FcQQmmTXQQXDdmmPkAIg2Fnb6B9vi1TLZ3pntDIw/pTSoqQcQ4
	SHkMWYhokrl0PuKMl4oPP0UKZGKasvgRiQmAr6dsL2tIVPkx+CaZ00CtbmeWPZ785EkxYggN1T2GD
	7yHT4EenprWqrBjcR5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nREAa-000Ldw-Eh; Mon, 07 Mar 2022 14:17:04 +0000
Received: from smtp1.axis.com ([195.60.68.17])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRE9r-000LJL-2f
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 14:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1646662579;
 x=1678198579; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TaZzkNMvcFak609V5gjWjr2ZiX5c1heN+EdAxQCepfE=;
 b=lcyX1Fp4POJF6YrkNk/MzrgEwAXN8o7QZZyTQPQ4Gm1xwzmKJKWLA3kI
 2o0bZ4OVMvZDhy3GP3OJ7mcAqsd40QOtZah2tw3lum8nhbS5evYfHPysl
 pDlop18609Na38nWKIbWOxyOjA7pwoCmNVM9sHjW5WEpn7jgqfa6Cofg5
 3Q60i9T6c5RD7c0pSwpS/71HwWhXciFQkn+wk4n3O9+oCrWI4ZPR5WHiV
 kd7JOnurtNjgWtFL4MiH7u2SsYzCkN6JfvI0YrjA0V4e93k08nI5AuZVO
 rcifoIjVgNIHDKfPZ9oct9ekO4+QaxqxP0BUgtrpfOE7vOZVoRY5ADBrf A==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <frowand.list@gmail.com>, <krzysztof.kozlowski@canonical.com>,
 <robh+dt@kernel.org>, Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH 2/4] dt-bindings: reserved-memory: Add phram
Date: Mon, 7 Mar 2022 15:15:47 +0100
Message-ID: <20220307141549.2732179-3-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307141549.2732179-1-vincent.whitchurch@axis.com>
References: <20220307141549.2732179-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_061619_514477_A74D8B0C 
X-CRM114-Status: GOOD (  11.90  )
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

Add bindings to allow MTD/block devices to be created in reserved-memory
regions using the "phram" driver.

This allows things like partitioning to be specified via the existing
devicetree bindings.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 .../bindings/reserved-memory/phram.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/phram.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/phram.yaml b/Documentation/devicetree/bindings/reserved-memory/phram.yaml
new file mode 100644
index 000000000000..92e7a80ee87a
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/phram.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/phram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MTD/block device in RAM
+
+description: |
+  Use the reserved memory region as an MTD or block device.
+
+  If no-map is not set, cached mappings will be used for the memory region.
+
+maintainers:
+  - Vincent Whitchurch <vincent.whitchurch@axis.com>
+
+allOf:
+  - $ref: "reserved-memory.yaml"
+  - $ref: "../mtd/mtd.yaml"
+
+properties:
+  compatible:
+    const: phram
+
+  reg:
+    description: region of memory that contains the MTD/block device
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        phram: flash@12340000 {
+            compatible = "phram";
+            label = "rootfs";
+            reg = <0x12340000 0x00800000>;
+        };
+    };
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
