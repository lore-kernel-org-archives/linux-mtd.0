Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E685A606A338
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BK+x0E0y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=cWa4WdSw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rQhvtyBhFOrk9LFqM0nRYk0mlrB3phweudacx1Hs4es=; b=BK+x0E0yISDv5e5unDS6Uq1Bib
	9I9QJy5wlvAUwzzY/cTgIIJB1g7c81jn8wyAR6vt2CDG5d/oMO5brQg94HmwsskvRN/0jwQiaOXxw
	23fT29qPHCGG1fOzgigQ9vktKgjAhpg+fp0hEByuS/4O9NMdHMyaun1DFLvC7USpcQBisybShuSye
	dEvgtxRT34jyFQwKVZljrLWst1gMfmncQDrrvxsT1eEAxneL2IDUV232elIbNrnN8J7Wb09wLGlMc
	C8rd08zsm5AbFmyqvuKatGKIEGrC+QWle0Cb46n5PfmJjAqb8DY3EpGYx+GdNCBcGM0uVVNfkegF5
	RGZ+8ZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAeM-0000000FjAp-0i1L;
	Sat, 14 Nov 2026 10:06:22 +0000
Received: from mail.simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAeF-0000000Fj7S-43kw
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 10:06:19 +0000
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 65FBBFA1B0;
	Sat, 14 Nov 2026 11:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794650772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+6iIGb6Xz2jGcS8GBEsfoNM5QVNb6M4ABjpFnFddxg=;
	b=cWa4WdSwWsT5C/SeDnE+qlLrPMgSz4dHOWdh28jrmjJvTrLRDDeAy+7FxBevFaHVCSadqE
	Dk+Wg4lmODtpSUO+/uviqPFERdKCaWk5oDgnWsFcxc64SomolASFXLqHXT49W+I6y77Dl/
	5ck3SWn0p1JhW7c1+1qnuX/IZJ6rfiT8NEcbuKmMlkRv+6yarheUrsO+Y2uHtcTmAsH7lI
	IRNkxmRmD3wqmIHpjj7mxzGZij7HDGZUBkkubJc+TceK7iNsjTNAvkb49+SWbVf03tMfdc
	Z4BQVH4qH2iRQ5+HfI4Y7EwkE9/jKJURA6S1tNEqPVfpriSB1A76M/cb3eV04g==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	John Crispin <john@phrozen.org>,
	Sebastien Decourriere <sebtx452@gmail.com>,
	Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH 2/5] dt-bindings: mtd: Add lantiq,nor
Date: Sat, 14 Nov 2026 11:06:04 +0100
Message-ID: <20261114100608.3432120-3-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114100608.3432120-1-sw@simonwunderlich.de>
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_020616_433260_AAEF1FE4 
X-CRM114-Status: GOOD (  19.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NOR flash on the External Bus Unit (EBU) of Lantiq SoCs is handled
by the lantiq-flash driver and used by danube_easy50712.dts, but its
binding was never documented.

Add a schema for it, including a new optional lantiq,ebu-swap-check
property. Some boot loaders, like the BOSS bootmonitor on the bintec
elmeg RS123 and RS353, enable the EBU's own endianness swapping for the
flash chip select (EBU_BUSCON0 bit 30), and the flash then appears at
its unswapped addresses. Whether that bit can be trusted depends on the
SoC: it only works on VR9 (xRX200) from revision 1.2 and on AR10
(xRX300), and Falcon has no such register. A board property instead of
a list of SoC revisions in the driver was requested in the review of an
earlier attempt at this. The property does not state the bit's value,
so a board keeps working with either boot loader setting.

Link: https://lists.infradead.org/pipermail/linux-mtd/2017-January/071749.html
Link: https://lists.infradead.org/pipermail/linux-mtd/2017-January/071818.html
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 .../devicetree/bindings/mtd/lantiq,nor.yaml   | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/lantiq,nor.yaml

diff --git a/Documentation/devicetree/bindings/mtd/lantiq,nor.yaml b/Documentation/devicetree/bindings/mtd/lantiq,nor.yaml
new file mode 100644
index 000000000000..e6f2be1245dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/lantiq,nor.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/lantiq,nor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq SoC NOR flash on the External Bus Unit
+
+maintainers:
+  - Simon Wunderlich <sw@simonwunderlich.de>
+
+description:
+  Parallel CFI NOR flash on chip select 0 of the External Bus Unit (EBU) of
+  Lantiq SoCs. Depending on how the EBU is configured, the address lines of
+  the flash are swapped, so the chip is not accessible as a plain
+  memory-mapped CFI flash.
+
+allOf:
+  - $ref: mtd.yaml#
+
+properties:
+  compatible:
+    const: lantiq,nor
+
+  reg:
+    maxItems: 1
+
+  bank-width:
+    description: Width (in bytes) of the flash bank.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 2
+
+  lantiq,ebu-swap-check:
+    type: boolean
+    description:
+      The EBU's own endianness swapping for chip select 0 (EBU_BUSCON0 bit
+      30) is usable on this board and may have been enabled by the boot
+      loader. When it is enabled, the flash appears at its unswapped
+      addresses. The bit only works on VR9 (xRX200) from revision 1.2 and on
+      AR10 (xRX300), so this property must only be set on boards with one of
+      these SoCs.
+
+required:
+  - compatible
+  - reg
+  - bank-width
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        flash@0 {
+            compatible = "lantiq,nor";
+            reg = <0 0x0 0x2000000>;
+            bank-width = <2>;
+            lantiq,ebu-swap-check;
+
+            partitions {
+                compatible = "fixed-partitions";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partition@0 {
+                    reg = <0x0 0x40000>;
+                    label = "boot";
+                    read-only;
+                };
+
+                partition@40000 {
+                    reg = <0x40000 0x1fc0000>;
+                    label = "firmware";
+                };
+            };
+        };
+    };
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
