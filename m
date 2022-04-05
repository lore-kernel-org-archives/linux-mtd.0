Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B263C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 13:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=putjD/nMzyQanjzuVv/QQTgIKyuhU/8OjvYK4NPNi24=; b=2KOlZ68Uv/EAeg
	Gbd2yTO2o0+s8lHdxsb8Ubk48WjF8N9jG/u9CefbzXi9H68qeWA3Sp/5ehcFQjK/LqrbaYyOzxGmr
	YuoUmOP28fI4sVH+Db8Sc5TiGcgHX2eChAkvzAcA0ZbCTQ+PoZfTdR5coyovCqtKyzh7bLu366hiS
	BMnUSODL+pK+3qhd+Bw8VdOAAxBSTVTT4eDRuy6cdanhaF8p+3FUnvSIAP6/NiggM6UkC1+pbnpWw
	bjAr9xHdD2XE8ZKXU2BqUVMRF2s+/vgY1TFBzZnBoQKL83zInz3O1APiPXdgFzTFnqzUczUfCd8GX
	+2JxquSuW8rVCbhA1xKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbiqw-0012hb-Vb; Tue, 05 Apr 2022 13:04:11 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbiqk-0012dr-Qv
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2022 13:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1649163838;
 x=1680699838; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DqLQ/tqybbZnxatnOYByhvJNRJCuF0z9AxMtXu1mnFM=;
 b=ng2qdwIpsdm3MqJL9ypGZrcttxOGwfIdfi8QcJb8AV5RkK9k7pvmo7IT
 XDla1eoDu6qMLY3fYjGYTrtWtdTaQ4tFKPasyFrTadGrqNDSJWgqU6iDJ
 ucnBIA2/fcuoKeSFT+o7SaQW2ZBmKbz+fuyGLO5N5n3jwa1uSFp+buZnt
 cxmkUXb5jvYj3mxI4uRJ4ccCTnF2sAQwJsMtExTHfEKq5ZCABgVxngF+T
 /ZQNrzdpYktNqboysxG7IEKkfx+bZmb5JtXYIHcM3R6LscuzwaoZPP5oc
 qsVA60Utudy0vdoS5CBFJ00FpCcaDtb8KHvk0cEZfC2hbE3KUGTSq5g0e Q==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <frowand.list@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/4] dt-bindings: reserved-memory: Add phram
Date: Tue, 5 Apr 2022 15:03:48 +0200
Message-ID: <20220405130350.1640985-3-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405130350.1640985-1-vincent.whitchurch@axis.com>
References: <20220405130350.1640985-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_060359_380913_D34ADB17 
X-CRM114-Status: GOOD (  12.06  )
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

Notes:
    v2:
    - Add note on what "phram" means.
    - Use /schemas/mtd/mtd.yaml instead of relative pathUse /schemas/mtd/mtd.yaml instead of relative path.

 .../bindings/reserved-memory/phram.yaml       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/phram.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/phram.yaml b/Documentation/devicetree/bindings/reserved-memory/phram.yaml
new file mode 100644
index 000000000000..318415b56afe
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/phram.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/phram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MTD/block device in RAM
+
+description: |
+  Use the reserved memory region as an MTD or block device.  The "phram" node
+  is named after the "MTD in PHysical RAM" driver which provides an
+  implementation of this functionality in Linux.
+
+  If no-map is not set, cached mappings will be used for the memory region.
+
+maintainers:
+  - Vincent Whitchurch <vincent.whitchurch@axis.com>
+
+allOf:
+  - $ref: "reserved-memory.yaml"
+  - $ref: "/schemas/mtd/mtd.yaml"
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
