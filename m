Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD158C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6japhBJfH+ZVDFvFjLbIMetyRTPErg/8PWIcI2ctFjk=; b=FYqaRAMTI4rdEw
	Kulp8EMzJonnyw6vpLxZLuqIXB3nGKVXF+4nDPdSoaCZZwJjx+E05Nu5jYmJ8y1RHOYkuif761tyj
	DF6nAO4V2iE7/MqFgb/rYK8OtGwXGULEaCQVNi90BAOGXG2mN5yI1sThgZ2J9UiTTSQTSN38mLyqb
	SNBZWrM8Ht5FwO7UsmQAW+rSDFOn+HyYuNdmI5eCVJnYDvVnFnCHF1aRJwV2NhKqOHiID5NucjLDE
	oug3Gs/08Fk3FsDfoet46XbiwwTM8w+R+bBxEIb6uxvd/03oesd2g8xkhhMODPArGsn6MycpYZPAb
	1b7gZ8mtszTsmL6Zhp4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neGxJ-00Ei1P-W1; Tue, 12 Apr 2022 13:53:18 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neGxE-00Ehx7-U4
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 13:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1649771593;
 x=1681307593; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jupemliQ8dJWnscgwhDk1djkO0V1yNDM+5JWRzk83NE=;
 b=orNa5E0WJS90ORW603ZpkrDgp4SE9y31VRNwXX+7esmwsQLLYRSXDdrO
 7zsHRjb77+aiX2lsOmAfh0n9pa8jV4jkOpCjPEBTUyzmRPjlCtB3hgv1U
 0VPwTWK3Gmc+6h3CiJyjqia3pkp1UvtESWmJ6R0SpMFRJ1NsBIILr5YDk
 k5C56f0KrA7/tCjWWUrbwO7GbzdgUtfyOyC6sNTBQWM0KVBLRYauzeKED
 T3JP5MjMZ5jSP166UJpVgZex45dVyt2S/GlfuDx4vMhgWwdotvMRpe61f
 TkNfUmB1kUXbRLIL3ek2NtyiRL/264H2RY/By11s99t19iuKdpr023kdH Q==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <frowand.list@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/4] dt-bindings: reserved-memory: Support MTD/block device
Date: Tue, 12 Apr 2022 15:53:00 +0200
Message-ID: <20220412135302.1682890-3-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220412135302.1682890-1-vincent.whitchurch@axis.com>
References: <20220412135302.1682890-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_065313_328169_148E9171 
X-CRM114-Status: GOOD (  11.21  )
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

Add bindings to allow MTD/block devices to be used in reserved-memory
regions using the "phram" (MTD in PHysical RAM) driver.

This allows things like partitioning to be specified via the existing
devicetree bindings.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---

Notes:
    v3:
    - Reword description.
    
    v2:
    - Add note on what "phram" means.
    - Use /schemas/mtd/mtd.yaml instead of relative pathUse /schemas/mtd/mtd.yaml instead of relative path.

 .../bindings/reserved-memory/phram.yaml       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/phram.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/phram.yaml b/Documentation/devicetree/bindings/reserved-memory/phram.yaml
new file mode 100644
index 000000000000..6c4db28015f1
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
+  Specifies that the reserved memory region can be used as an MTD or block
+  device.
+
+  The "phram" node is named after the "MTD in PHysical RAM" driver which
+  provides an implementation of this functionality in Linux.
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
+    description: region of memory that can be used as an MTD/block device
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
