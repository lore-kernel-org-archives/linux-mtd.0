Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B77C77B61
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Apr 2023 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8m6j6zShMyNfqnb4r5z2y4HXAxuQZKhiEC33cBpNJk=; b=nPSxcuybLulJtn
	h5AHPcchl/HADQUksdqm7KIhmU4PTKyHJ8kI4rHzygFFbH2C5hWXL7j6I4c350ucAMv9gGTBW0ag0
	mqeRcb47atEwOb0GnIre815XuVpa+3rpLAh+Mog6wdi/KpY3b6WrVr/At1tL76TpqgauOmKfGSKFW
	6x8Isjil/BirjvcyfsxyMRI12mD7+fAW2tZr2/psT1EcyzgNW5T9rQ6+YMziL6kbyeBLJZmKpnN69
	CAFUIVPXBC/oDy128ppJw2ODX7qXI6Xk3IMBGCQQ2iWR+Usf9DO+YTGvl8c2wfUlqrgGQzg7mO0+4
	5PAKTFHOEaiHT5SoqHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsc6-00FoOt-2w;
	Mon, 24 Apr 2023 09:36:02 +0000
Received: from forward501c.mail.yandex.net ([178.154.239.209])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsc2-00FoK7-2f
	for linux-mtd@lists.infradead.org;
	Mon, 24 Apr 2023 09:36:00 +0000
Received: from mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:261e:0:640:2e3d:0])
	by forward501c.mail.yandex.net (Yandex) with ESMTP id 472855ECEC;
	Mon, 24 Apr 2023 12:35:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id JZBb1pbWwKo0-2xt778SJ;
	Mon, 24 Apr 2023 12:35:54 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1682328954;
	bh=gzZfNhCP4gLQxuxIz1zy8IGUwOFk5Um/gkdDTo4axVY=;
	h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=caqZCqDLVch5A8ypmNCfIAMmaENWkpVFbRauIda656kQ6KQThwDcE991Cawuw51ul
	 AbXrWBNhpvkR7BsGW5b5ohmYThfKk4TDk4Qf5/3xZSL33tgiLyM+HtmaSe+33VREX1
	 /DbEUmHjj35NZzYFsT+cb1Zyn1hbCY231hA3Dpxg=
Authentication-Results: mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: Arnd Bergmann <arnd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lukasz Majewski <lukma@denx.de>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/43] dt-bindings: mtd: add DT bindings for ts7250 nand
Date: Mon, 24 Apr 2023 15:34:38 +0300
Message-Id: <20230424123522.18302-23-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424123522.18302-1-nikita.shubin@maquefel.me>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_023559_045315_47664023 
X-CRM114-Status: GOOD (  11.66  )
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

Add YAML bindings for ts7250 NAND.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../bindings/mtd/technologic,nand.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/technologic,nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/technologic,nand.yaml b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
new file mode 100644
index 000000000000..3234d93a1c21
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/technologic,nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Technologic Systems NAND controller
+
+maintainers:
+  - Lukasz Majewski <lukma@denx.de>
+
+properties:
+  compatible:
+    items:
+      - const: technologic,ts7200-nand
+      - const: gen_nand
+
+  reg:
+    maxItems: 1
+
+  '#address-cells': true
+  '#size-cells': true
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: true
+
+examples:
+  - |
+    nand-parts@0 {
+      compatible = "technologic,ts7200-nand", "gen_nand";
+      reg = <0x60000000 0x8000000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      partition@0 {
+        label = "TS-BOOTROM";
+        reg = <0x00000000 0x00020000>;
+        read-only;
+      };
+
+      partition@20000 {
+        label = "Linux";
+        reg = <0x00020000 0x07d00000>;
+      };
+
+      partition@7d20000 {
+        label = "RedBoot";
+        reg = <0x07d20000 0x002e0000>;
+        read-only;
+      };
+    };
+
+...
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
