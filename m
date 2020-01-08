Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2F4C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:54:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6E020656
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qZ+Pp2k5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvW80tsx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6E020656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=axl0aMx7F8O2CVodig2MFGpsmsX63LSOo9xfSOc57yM=; b=qZ+Pp2k5TXjCOddskFFVE0Eqpv
	l0bkbKN/12NrOonVLmbzMRIN6KF87+Ldn8Pq7i3yciSuR7tMstZVMzddXg+hcEbDT1+++f70RsEi1
	9P5RsYO31mlnnorVm6DmoAWJZculLSigC9t6OkqXLIHs1CM2ZvqYIzQso6r5bOAeJSEzXt/l89cqS
	t89lPtpXw5NUQZDtNDcL9P6uwi4gte84FKFSzfUEfcBXO2ZfiBaKsY3x/C79vKiIJsw9kfs4jVCPH
	hWLCl81cp6HJDwWIC8ilmCgSXmfOLLdj8RCsyQawOPGxLTjmxcSKfTf+GmyO5mCMkS0o4BR5lAm6r
	B1Sh94xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipILX-0006s3-Jn; Wed, 08 Jan 2020 20:54:31 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipIKq-0006LM-ET; Wed, 08 Jan 2020 20:53:50 +0000
Received: by mail-wr1-x442.google.com with SMTP id c9so4902444wrw.8;
 Wed, 08 Jan 2020 12:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HAVtrrvP7lMDn+z4yW5t1+0ZMAlAWmibvRDN72JzVdg=;
 b=fvW80tsxmitYEBvGtuh21m8wnBrE83VykidXd3KTI0rxQr60hgtOGRLWtAgjGRdeSO
 ZsRWTtQ02MuMnIsoiUmBaJpGUxV1cStx+zM1VnKo62bXNajzo4DGa5tyqaWhJlvyunGn
 PPcjQo11qmTC+Jjg8VnDzQpYw240eF2tRX7QhBqxq2X77Bvevr0h3cnpGnSLucGwGqu4
 NeZ8g8I5QTPHgNTGPznEcq4Vs++QwEPJ6yCN3ke8la8QHoifR+iUp+vPBM0TSQofpGIO
 +tf2wJ9uuEfsKuTLtLkXDn/e3Tl03vRVdSzJufN+Nhd+ctQwX2QSzffJWD8WE5rgcqhr
 U50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HAVtrrvP7lMDn+z4yW5t1+0ZMAlAWmibvRDN72JzVdg=;
 b=XzFAXuvCjRFo+iGspDzAW5jHEB6z6pZmYjzHqx2P1qcE/7/4L5KAkgJ5eIshB35XNm
 Xx3JY6rxw24fO17+2EL49uYRdfkDjl2cQ98sYpZsNtBCggR776XBZNyZyRLSPlGJfydQ
 PmBCJrJg+wMJquAPfoS9eZntKrQsM1Nyp26rEIPGDwedSalGiZaBgi7I8AnCKRJ1Tq4D
 HaSIR1JiyjAlRbpNLEYJc1rqFSeUFaPbQCafRoz9ALIaWL2wBq5o4dRcLoOOxpnMInMP
 vUxIS8gCi3aulEqc4S4vEnc6vCVqxJWp3PlwRSBDdxI/T4oz5CRXP1e3ybjhvqJSwfJB
 yz+A==
X-Gm-Message-State: APjAAAVTef6k+Cgvc7wETAnnfrKHE5TkSVARznPB7Nwy5Tsy2Kc20eoG
 oo1a3NW03/e1Rl3vQbjvcNc=
X-Google-Smtp-Source: APXvYqxULPp2fA/trb8q4KJWfPyDdsD0Vv2qlG337KA4yMv9O2EsWOqRDwrpvkD0urJEQL8otamhMQ==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr1025519wrw.277.1578516827246; 
 Wed, 08 Jan 2020 12:53:47 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c5sm311835wmd.42.2020.01.08.12.53.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 12:53:46 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v1 01/10] dt-bindings: mtd: add rockchip nand controller
 bindings
Date: Wed,  8 Jan 2020 21:53:29 +0100
Message-Id: <20200108205338.11369-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200108205338.11369-1-jbx6244@gmail.com>
References: <20200108205338.11369-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_125348_498315_6C791571 
X-CRM114-Status: GOOD (  12.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add the Rockchip NAND controller bindings.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/mtd/rockchip,nandc.yaml    | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nandc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nandc.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nandc.yaml
new file mode 100644
index 000000000..573d1a580
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/rockchip,nandc.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/rockchip,nandc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip NAND Controller Device Tree Bindings
+
+allOf:
+  - $ref: "nand-controller.yaml"
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,nandc-v6
+      - rockchip,nandc-v9
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    oneOf:
+      - items:
+        - const: hclk_nandc
+      - items:
+        - const: clk_nandc
+        - const: hclk_nandc
+
+patternProperties:
+  "^nand@[a-f0-9]+$":
+    type: object
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+
+      nand-is-boot-medium: true
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3188-cru-common.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    nandc: nand-controller@10500000 {
+      compatible = "rockchip,nandc-v6";
+      reg = <0x10500000 0x4000>;
+      interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru HCLK_NANDC0>;
+      clock-names = "hclk_nandc";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+        nand-is-boot-medium;
+      };
+    };
+
+...
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
