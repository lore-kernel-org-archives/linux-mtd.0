Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0936DC61D9D
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Nov 2023 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbGgfxUxFwZ5AilgChqJv2fk25BFm+61VZ8sM49pxEE=; b=vypfTH3jog7+g/
	8JAniNAsLhaaj31Tq4N/cM/dxfQ5ggsVZcadFAMUhONDdNoV/8POqPaL6i7vbnBw0pDlzL7Ylz1xn
	u30UbXUgJ/6lMWE+KqhPUNwdfnjoTEjjkcnQnf3KmW5FenXKZ3bYRC5dsMQSOMZRAsgV8v8TQ9ie+
	/AOwkcePjmHUmXaTgcA0zX/UprBao/kySlcmwC6E6OiqXNqOxSZJn+ZZnUPzwMotd8eBwfYhiRvK4
	qRmpcFQnTYy4gKdbc7UN3JWb29rGboX0Jwsfnk9gV4RmsopK7Ssv8a35XbqPMnIwi1HscQSweCZZO
	DyPIh3bpJ4YTiUZ1AgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5j6u-001871-0U;
	Wed, 22 Nov 2023 09:01:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5j6l-00181Q-1P
	for linux-mtd@lists.infradead.org;
	Wed, 22 Nov 2023 09:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B420661CB1;
	Wed, 22 Nov 2023 09:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50E13C116B9;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700643675;
	bh=0k3URFJZb18PwpzeMhJ7DF35374xGK50doG0S5Yr3LQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JEdBGLYgPPiCHpQo4HSzHQrJ8HjD5/bJJbOGwuMillLsDFZJ5XokcWM+n+i8eoIEp
	 VbgRFEAXptO4KmpnG6rZilSOKiXd1Jsp+W/ACMNvgGSty2WxWsnS2sH3yTQ1FgpCuq
	 JuuD2P69AZLn9P3syF7z71C5EVJIyzMPXMx3ETrZgRPKdg8OX8yTKlrGXquOielLfN
	 TmAUI/OswwNHoub+y8V3umVhNL6033wCeMGjWVU6DDMD4yAeI3Kq9PPmzw8/QA1sSr
	 x2UuNpWdrBNQ+E/dzv0QAz84LaAoAEEOP1EeEyUAy/mO+3ZAKdp8SijUz+YAIxvRt0
	 EzQHzwJbfYvLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F520C61DA4;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Wed, 22 Nov 2023 11:59:56 +0300
Subject: [PATCH v5 18/39] dt-bindings: mtd: Add ts7200 nand-controller
MIME-Version: 1.0
Message-Id: <20231122-ep93xx-v5-18-d59a76d5df29@maquefel.me>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
In-Reply-To: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700643671; l=1633;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=bq2OLT9jIJx+y3Eu11Bq5qmV15g39ulN9ve41TDPTOE=; =?utf-8?q?b=3DqMmI0b7q763R?=
 =?utf-8?q?fiGGoh5b7EQtsdpbgwsX9INzXeMRgQTXejxGVG2aYRTibSW4aFGpW1tggsipYf8L?=
 LA8Q7Um5Ax+cW/wokh9LS8Tcn8b40b49g43zQiocV7D4acUFZyVw
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_010119_574464_21E6EBB8 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
