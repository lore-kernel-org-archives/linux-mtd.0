Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEE4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 13:30:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC1B06109D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 13:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC1B06109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWw5rIc3D4+6vCeLRs5LZbF4btd1OFfCs+hkhmXdDVA=; b=cdhCWsmsZj3x4f
	CXFg0uwDvJxk71/jbJ+i3XmvZmqjBOnR1fLEJ10r02Nn2UwC5MTbV+KDfwgIFN5p0zeCgJkGAnGHC
	LAeus2Qco3xuzWVmL1zrUZQTztSejD6oLxyYP3UK6riYGoKz5PBnxzwMHYP0Ws2vre2NA912NZwne
	CrMucmbmwif8hWeQkmlXMUUanHynir1J74dj61Wqjr36FUom/wxCQOyr7TC8tH2xQ4fbN+W4ZdeMj
	kz5aR2re9VBW5jT/z6d7SsFC2T3MKdf3MDkpXbTb4+rNMiYYuITnlF8Ga3svgDDq0Cz/WFU7DvS9O
	UIfLrxFL10l1cj95lYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSJMT-001mBm-NM; Mon, 20 Sep 2021 13:29:33 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSJLe-001lv3-Ir
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 13:28:44 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5F9AF3F31E
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632144521;
 bh=o/Js1PjbYfMgzPBeKDkGOA2puRzMdr5LGwoQCLB6OLo=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=fvZYJegStS5QF/PKhR/t/+Q0klBCpCYmKP3BbedKW4ThFCGpBbhu5It1xUVMKJu99
 5yhx42ZfGKh71wZmz870fDIyuAOFPaFS6IgLGiCTnzPNkpDEHDeDg4Ev8gYyzCwn2w
 ZeNUYUeDXge+qLaFy2/SHlWJ3pF9r4hTWnBa1puQC4Y3Yev3fCJNkj6cR0YTYk1rCo
 iw2Vh/71vEn8IRsDM8E6LBW/4nyk+/yyqWFwMR7QZJP7+FDmZpiGZ9LvcLA4CQM0Lj
 RDkNNVOeKc8FE0YKKAgERY6DrcVgDdkaoj9Cl5/Om//GttePAqQCbOBN4uxL33gAYF
 vmNDU9FLUp/Iw==
Received: by mail-wr1-f70.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso1036969wrg.1
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 06:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o/Js1PjbYfMgzPBeKDkGOA2puRzMdr5LGwoQCLB6OLo=;
 b=7Y/+Dgs/ZcOvY1tUgIUO+9Os63aGuOQ5Q4E3jDNeaw7jF/MLQA8snXY6koRcm6bS3L
 dnm63yypvwEzo9h1Mq40hog9nz2YPUgq+00hp24FHrz5R5hIX3GiUVfq8Msq39gWU/mE
 lWIz5jcBqakT4MHfKPnFsa4cwfDUE1B3LjZh7zhWFqRTlwsW3PEK9T+aZLRqAO52K6W4
 RsKtiB/WKeMlcImDypHQKWXNi5vBjWbwUXXy3N3kSWDCg/3g+zENd9kRcMyCYXTM9RFV
 LntejEWiNeFffD1TP7KojDQjQB9Hso1SjbCjJ08H8MJxVA4/1VhiXSmbyCeuF2ZL0z0S
 ApjA==
X-Gm-Message-State: AOAM531jbmGyOtxGyldKSntR8bmQujX/3XzTptO8MaUuobomrQudzBC/
 CJQRk+Uks8x5TUu0evFpoAuUVXN9o+QwajBtyhpCMSc+tZGcjtTWKoUvLtEnM7B/9cFYjB8EUO5
 CPt28Ia81py3UgOXPL/5DbKuefexXn/FEElHmZ9mJDpQ=
X-Received: by 2002:a05:600c:19ca:: with SMTP id
 u10mr15004753wmq.45.1632144521109; 
 Mon, 20 Sep 2021 06:28:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5Tjyuod+S15/Y23kxUirk/6MQldc+XQ33JOgIf8TozvJ3laDQt2n04lodhRvn8cF9FhtwQg==
X-Received: by 2002:a05:600c:19ca:: with SMTP id
 u10mr15004733wmq.45.1632144520924; 
 Mon, 20 Sep 2021 06:28:40 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id g1sm45429wmk.2.2021.09.20.06.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:28:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 4/5] riscv: dts: microchip: drop unused pinctrl-names
Date: Mon, 20 Sep 2021 15:28:29 +0200
Message-Id: <20210920132830.152802-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
References: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_062842_836262_256135D9 
X-CRM114-Status: GOOD (  13.32  )
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

pinctrl-names without pinctrl-0 does not have any sense:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: 'pinctrl-0' is a dependency of 'pinctrl-names'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

---

Changes since v1:
1. Add review.
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 1 +
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi        | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index ed590d7c6e37..0db64ac7dc33 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -33,6 +33,7 @@ properties:
       - items:
           - enum:
               - issi,is25lp016d
+              - issi,is25wp256
               - micron,mt25qu02g
               - mxicy,mx25r1635f
               - mxicy,mx25u6435f
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 83bc14860960..55d86b078c53 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -267,7 +267,6 @@ mmc: mmc@20008000 {
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88>;
-			pinctrl-names = "default";
 			clocks = <&clkcfg 6>;
 			max-frequency = <200000000>;
 			status = "disabled";
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
