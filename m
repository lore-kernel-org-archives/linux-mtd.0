Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F1BC04A94
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Aug 2023 01:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xuw5DKvOatRM9gw5WtuM+65kmeQzJJk32qd02lOf9g=; b=Cr6oa+iS38OJIF
	GtKwNElxkBtrzOrxU9z8a2tOfw0V/bLUa+HokVt6H87alenFOU4pgEx1udVEM0wCr6dIbj2T4oz0U
	VcfYIuNIWPP+hGOaKsqlAq0RT5Eyg6R9JI92LF5UxiUMGIjlpPhEK6MBngB8g0gIve4sxcmqefYVW
	YyXRDsXkBz+q5X2zKjGyU5NWsTsNhErCsEAL7xrkDMlAsH8e1xK16UOcAt74aEKRnc6KQuN4w3lSy
	bFhEW6Tut9fMUQPX+O6SsvnrKE/iTS3xtb5DsalkQRh4XQnBgn5GN7Wfx6whh2ij9uSjX6GO3Yyun
	9NYJvdTAFOOs3RrSzzmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUH5S-0094yB-0i;
	Fri, 11 Aug 2023 01:37:10 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUH5Q-0094xY-04
	for linux-mtd@lists.infradead.org;
	Fri, 11 Aug 2023 01:37:09 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qUH5K-00053b-0T;
	Fri, 11 Aug 2023 01:37:02 +0000
Date: Fri, 11 Aug 2023 02:36:55 +0100
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
Subject: [PATCH v4 2/8] dt-bindings: mtd: nvmem-cells: add support for UBI
 volumes
Message-ID: <7df4543f5dacef006bd7067117cf959b59842d69.1691717480.git.daniel@makrotopia.org>
References: <cover.1691717480.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1691717480.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_183708_058285_BD9DD44C 
X-CRM114-Status: GOOD (  10.22  )
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
index a06c1666d5184..e834441fe5e6a 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
@@ -56,9 +56,10 @@ examples:
             compatible = "linux,ubi";
 
             volumes {
-                ubi-volume-caldata {
+                wifi_caldata: ubi-volume-caldata {
                     volume-id = <2>;
                     volume-name = "rf";
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
