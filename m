Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FF3C001B0
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rydekivmu5y1gTMP6k4rO5o/w+KhXmNp07Zk1RKzJQ=; b=rMWuEwMkkYF1+J
	p2F6coi4sabZly+HFaTUb7C32Nk5o55VLnT72+SGE4oaO/y+5Tw3kA1HVFxCz+hMHtsFYnkOEkL9L
	RHvwjn9u06xUb2WZWJSWy8p/qObF/O5BPAttnkeLq0FesUudwQfA4pU42TCXfj35gTvHWek9oRSim
	3LqqVeEyKSMyo1oaoT8uBCDcB4QdtHbuIsO8L98TMl57e8MY+p7hsWJW27Sw8ycdH7igSL/iUpxIJ
	Er+fyeQyuFjSjyDBCzh6Q4pnU1SVjarKx9mDUXq1GU1ITWrijZVX7EDE66em1SFZpXqq3S5C65b/G
	l6pkXMT7cYynGlJKJZmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPBi-002so6-2g;
	Tue, 08 Aug 2023 16:04:02 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPBg-002sn3-0d
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 16:04:01 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qTPBb-0007YB-1E;
	Tue, 08 Aug 2023 16:03:55 +0000
Date: Tue, 8 Aug 2023 17:03:47 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Randy Dunlap <rdunlap@infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] dt-bindings: mtd: nvmem-cells: allow UBI volumes to
 provide NVMEM
Message-ID: <6f4ac2fee932a585b5bbdae0d00db4bcef7d1ca3.1691510312.git.daniel@makrotopia.org>
References: <cover.1691510312.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1691510312.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_090400_231160_096BBA0F 
X-CRM114-Status: GOOD (  10.86  )
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

UBI volumes may be used to contain NVMEM bits, typically device MAC
addresses or wireless radio calibration data.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/mtd/partitions/linux,ubi.yaml        | 3 ++-
 .../devicetree/bindings/mtd/partitions/nvmem-cells.yaml      | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml b/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
index 79cfa0a3eaa7d..56e71e3eb56bd 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
@@ -56,9 +56,10 @@ examples:
             compatible = "linux,ubi";
 
             volumes {
-                ubi-volume-caldata {
+                wifi_caldata: ubi-volume-caldata {
                     volid = <2>;
                     volname = "rf";
+                    compatible = "nvmem-cells";
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
index 5474d63268dc5..b92a0b35df094 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
@@ -17,9 +17,12 @@ maintainers:
   - Ansuel Smith <ansuelsmth@gmail.com>
 
 allOf:
-  - $ref: /schemas/mtd/partitions/partition.yaml#
   - $ref: /schemas/nvmem/nvmem.yaml#
 
+oneOf:
+  - $ref: /schemas/mtd/partitions/partition.yaml#
+  - $ref: /schemas/mtd/partitions/ubi-volume.yaml#
+
 properties:
   compatible:
     const: nvmem-cells
-- 
2.41.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
