Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814CBEE643D
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VV6yjKFUXL0iJ2+GTdOwhUpJItRsZOblICC/ojZLclY=; b=Af4XNwFMzb2PO5
	1iiTJYrKBCwZJvDHB42fME/va7UgKSN6aYp0lZXZRNPflPJP3bCUY7zAaECS5+maX1d/3w765U4v7
	CyqicJRvFR7nRhDDrhZEIW7Vn/Jwl+KvxN0/1Tv3cdHNRRcKTFZYt7BvLcmzgdeyw32dJQM6lwVsb
	R2CZWa6+XkJS7XdyelzrLgCUQWftgfyPHxPjh31+0cNsa2fsJysHBGG2VsNj4oLnWLH5MbeH7U/e7
	sN/0Qa/X9uLcD2XOTffw2cFLwMhxhByFBRXVZklidFj8VpL7J97MUAriHTEWgw7XY3qmrSTgmPkx2
	9fsuqYHLd8Vzao7V6z9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3w2-00A6wN-17;
	Fri, 15 Sep 2023 08:12:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3vx-00A6sC-1e
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 08:12:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2CEEB82C12;
	Fri, 15 Sep 2023 08:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95208C116B6;
	Fri, 15 Sep 2023 08:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694765529;
	bh=utFKRANVZtGYY99+KusTYx9mpahz1bWeq2+B2mYmxpM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u7ZZ04P7NNTjEy8db3yxq5WykW9nfMARDsEitw+zFsilwyg8MYEDZbwKDaW4Bk+ri
	 XqhAjg7PY1jEK0KLVU7WXOJ5xBgubUpGkaw9q6z7NVdts6NpA1SOa1zMcxUDNPgW/6
	 m/i7SBY8kISDewEMb+rnrRXGYGYcjJ79+yKZ/mLnJDcQX3QMNX1oH1bf9Qo2DNA67h
	 on8CxbhTyXZ+dTr3DtwDxwTvABbB0KhAv/tyPPbcpRDgrFS41PUBywxCzFisNbt4jN
	 dy+OCJvVVMKiUtsA3pphKIq7lxH1DbsXePkokz7tWENq0wp1GCWiKZxjuJVy7KJTac
	 5NTy/Ntu3prUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F06EE6441;
	Fri, 15 Sep 2023 08:12:09 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Fri, 15 Sep 2023 11:11:07 +0300
Subject: [PATCH v4 25/42] dt-bindings: mtd: Add ts7200 nand-controller
MIME-Version: 1.0
Message-Id: <20230915-ep93xx-v4-25-a1d779dcec10@maquefel.me>
References: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
In-Reply-To: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694765525; l=1566;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=IfQ7ikafYC6qmbgOyIMlAODFiCL8J32QWAN5Sndb1Ws=; =?utf-8?q?b=3DKaTFkGwz3oEV?=
 =?utf-8?q?HEI9B1pnun7uUIDGnyAaIH/H9lGIdSqVH+IVMzloMbWB73DlhMDTNWPAQKB8a7rD?=
 901KLWh4C1KZQD8QIUfHTgMIv59JPcicvlvEQPf6ecIckD/hYbp4
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_011213_835572_8F47F79F 
X-CRM114-Status: GOOD (  11.38  )
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
Reply-To: nikita.shubin@maquefel.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add YAML bindings for ts7200 NAND Controller.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../devicetree/bindings/mtd/technologic,nand.yaml  | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/technologic,nand.yaml b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
new file mode 100644
index 000000000000..f9d87c46094b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/technologic,nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Technologic Systems NAND controller
+
+maintainers:
+  - Nikita Shubin <nikita.shubin@maquefel.me>
+
+allOf:
+  - $ref: nand-controller.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - const: technologic,ts7200-nand
+      - items:
+          - enum:
+              - technologic,ts7300-nand
+              - technologic,ts7260-nand
+              - technologic,ts7250-nand
+          - const: technologic,ts7200-nand
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@60000000 {
+        compatible = "technologic,ts7200-nand";
+        reg = <0x60000000 0x8000000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        nand@0 {
+           reg = <0>;
+        };
+    };

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
