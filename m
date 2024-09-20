Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485E6CF9C5F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2024 18:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkfLuPuucQmORT/VDhaIc6Bt7kaM4NJGX2kdOLeCH5c=; b=uQQLJ7Qk1+w7np
	99gixXftc58DSuIsDQhtwG8TBHUXvM6QuEVmTvdTsf/ExUp737cNSZDrZ+CAF2hRAfkw8FJHbyvAS
	jr8WjhSIYdg3gXJ0vmjxjRg8nAyMwOobN3OROg82CpWbzww0mRYS+FHnr5XZY+WC50ZaMIVRuir6P
	gMbHxVPn/PVLtP3fjlTcmydvkbgqMeJMgtgsGFjU+X4eNOP6jEGol9tzN2gT1cbkQaMVBaRhtGAzJ
	cf2uLWaQWZ14LvCfTLBgzLqjzCfh1BBeMXxuzfCkLJlpFC3X0Ldc4eSU6BJH5miFHQjEWaPzcxwMr
	oNz2kMnz1YqoaT68V0Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sriGc-0000000CnMq-0k3j;
	Fri, 20 Sep 2024 18:22:06 +0000
Received: from chessie.fmt1.pfcs.com ([2001:470:1:205::234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sriGZ-0000000CnM1-0C01
	for linux-mtd@lists.infradead.org;
	Fri, 20 Sep 2024 18:22:04 +0000
Received: from localhost.localdomain (ip-77-25-16-238.web.vodafone.de [77.25.16.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4X9L932C89zMR7p;
	Fri, 20 Sep 2024 18:13:11 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH v5 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
Date: Fri, 20 Sep 2024 20:12:29 +0200
Message-Id: <20240920181231.20542-4-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240920181231.20542-1-erezgeva@nwtime.org>
References: <20240920181231.20542-1-erezgeva@nwtime.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_112203_092203_EB77085D 
X-CRM114-Status: GOOD (  13.53  )
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

From: Erez Geva <ErezGeva2@gmail.com>

Some flash devices need OTP parameters in device tree.
As we can not deduce the parameters based on JEDEC ID or SFDP.

Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
---
 .../bindings/mtd/jedec,spi-nor.yaml           | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 6e3afb42926e..4f7bb3f41cb1 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -90,6 +90,43 @@ properties:
       the SRWD bit while writing the status register. WP# signal hard strapped to GND
       can be a valid use case.
 
+  otp-n-regions:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Some flash devices need OTP parameters in the device tree.
+      As we can not deduce the parameters based on JEDEC ID or SFDP.
+      This parameter indicates the number of OTP regions.
+      The value must be larger or equal to 1 and mandatory for OTP.
+
+  otp-len:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Some flash devices need OTP parameters in the device tree.
+      As we can not deduce the parameters based on JEDEC ID or SFDP.
+      This parameter indicates the size (length) in bytes of an OTP region.
+      Currently the driver supports symmetric OTP,
+       which means all regions must use the same size.
+      The value must be positive and mandatory for OTP.
+
+  otp-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Some flash devices need OTP parameters in the device tree.
+      As we can not deduce the parameters based on JEDEC ID or SFDP.
+      This parameter indicates the offset in bytes of
+       an OTP region relative to its previous.
+      User can omit it if the offset equals the length.
+      Or in case we have a single OTP region.
+
+  otp-base:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Some flash devices need OTP parameters in the device tree.
+      As we can not deduce the parameters based on JEDEC ID or SFDP.
+      This parameter indicates the base in bytes of the first OTP region.
+      User can omit it if the base is zero.
+      I.e. the address of the first OTP region starts from 0.
+
   reset-gpios:
     description:
       A GPIO line connected to the RESET (active low) signal of the device.
@@ -118,6 +155,8 @@ examples:
             spi-max-frequency = <40000000>;
             m25p,fast-read;
             reset-gpios = <&gpio 12 GPIO_ACTIVE_LOW>;
+            otp-len = <512>;
+            otp-n-regions = <1>;
         };
     };
 ...
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
