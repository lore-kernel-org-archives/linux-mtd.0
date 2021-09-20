Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A53C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 13:29:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB57C60F93
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 13:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB57C60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owI9PVCIVj/bdCq8ljm6eaJavNsw2O/D7Krctsu7rU8=; b=o/ubQ7Mkg9juxc
	srrLSyGkcI/qB/Id5CE9tvR8xwABQXaZ/RAOm6OScdv+zBCmdLtXAXA48jNlVQXRFdyfi+rqCw/NN
	OpegT7wQfqM8BqXPxkL8W8AzyLCTwyGSU8JaY6VyXy63/QZNWrGOnxgZHdviKvrOxR1rRz8wYaISS
	trWOHWQVhVPWVXeePx7f4sCAxYZ7I4z6pNTNBhmFojMiEv0enJNdfw6KaeSN2TqqPDs7b7ir+og23
	1pAW+slsOO2Chw6X7y7SzQgqJbQrrWgNQB9oztxdTI0mLcNxDvEN5qTyt7aQogjlLIuFKEFZ+SI6E
	aEtbJKIBAm8cK2bXGKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSJM7-001m3u-Qs; Mon, 20 Sep 2021 13:29:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSJLc-001lth-Ri
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 13:28:42 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B0A7D3F322
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632144519;
 bh=O+npPoECYtJ/ZpzV1HLKddQ+EXO1NtYHdY0Cec4JU10=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=vrDE8ssyIHzsRuUWL7ILVAm6FDfpW9Cordy/A4pZU+3u7v6pBpY4TNYpKT0M97uvF
 q/ATgaad4CZZECJn3cRFZRzEgm59LYuhhvFkSj43pC/nEx3XWKQtPqOGvjBvUB/rEa
 am5lt6stJpHWlFgtatm9TGFfEib+H9TjGt57Iudm0a65mU0fR3nXHlxbA6bQQUcowK
 Zyp18dEZ83qMVlo1Cq0gD5y7/uNlgGIjPz3Jagc/sdyQ18aL/Hk1tqz1LdsXGN2zQK
 oKarcYjzZzOQx+SpiAGyZfY4q1EO3bRJ2fZ4CYrFNOPH40fZOSYaRJflMjuQOnkZ6f
 4VV72AfI6kWiQ==
Received: by mail-wr1-f70.google.com with SMTP id
 m1-20020a056000180100b0015e1ec30ac3so6069490wrh.8
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 06:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+npPoECYtJ/ZpzV1HLKddQ+EXO1NtYHdY0Cec4JU10=;
 b=F0WSo5ruto3b3upl4IZHNUXOIpRKi4qwGEU++WOIcv/pHRcODxhYnmLgFCvnvlnWC1
 MQkusst/ZcUQyxKqArAZmWmVvu7MRs1um46H9TZc+Q0kjrCtNESuLI+xj1p0GirSoVCl
 kdzWD9clSXm5NdCLBIm5Y7Y/65a7UDYik3nCPW/DoeRIrbooFnt73ZYPkC61w9z/fK1J
 AgJ7uDRG4x0U9QlnwClYpNc0M1shELZQE0R6SbZqh5aQFhNgV3Nt949AS7/DRlG8lCZ5
 SZXn3NmRpAkooYTNrIwBnNAdUjVdUMlKDebLCTdQXSDoQAjtRlZHjYONt3ldcotrHwuc
 fUUg==
X-Gm-Message-State: AOAM530ByTW/3aHq0W9ESZnfBwP4qfzcpxFoxjUVuYa05boXUu6AO159
 YX3GdS7AjgVJldvqCvLHKVRLDAdA+EO+z1ysKwEQMDmJ1tJCpknIV/y18/tItMrmXG+ome2gYiU
 z0bY/FYLVVxr8iM9UFK46DPJx3612famUW5ubcEGNRp8=
X-Received: by 2002:adf:8170:: with SMTP id 103mr28964674wrm.167.1632144519418; 
 Mon, 20 Sep 2021 06:28:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU1n79MwXc4vaCAxSEjXBbGZEunmWRE3XbvJmB87c2EiwNDfExqsKDT3J4oHSVLZL0aKxDPA==
X-Received: by 2002:adf:8170:: with SMTP id 103mr28964657wrm.167.1632144519271; 
 Mon, 20 Sep 2021 06:28:39 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id g1sm45429wmk.2.2021.09.20.06.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:28:38 -0700 (PDT)
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
Subject: [PATCH v2 3/5] riscv: dts: microchip: drop duplicated MMC/SDHC node
Date: Mon, 20 Sep 2021 15:28:28 +0200
Message-Id: <20210920132830.152802-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
References: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_062841_123154_10EAD9BC 
X-CRM114-Status: GOOD (  14.63  )
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

Devicetree source is a description of hardware and hardware has only one
block @20008000 which can be configured either as eMMC or SDHC.  Having
two node for different modes is an obscure, unusual and confusing way to
configure it.  Instead the board file is supposed to customize the block
to its needs, e.g. to SDHC mode.

This fixes dtbs_check warning:
  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: $nodename:0: 'sdhc@20008000' does not match '^mmc(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Move also bus-width, suggested by Geert.
---
 .../microchip/microchip-mpfs-icicle-kit.dts   | 11 +++++++-
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 28 +------------------
 2 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 07f1f3cab686..fc1e5869df1b 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -51,8 +51,17 @@ &serial3 {
 	status = "okay";
 };
 
-&sdcard {
+&mmc {
 	status = "okay";
+
+	bus-width = <4>;
+	disable-wp;
+	cap-sd-highspeed;
+	card-detect-delay = <200>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 };
 
 &emac0 {
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 5084b93188f0..83bc14860960 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -262,39 +262,13 @@ serial3: serial@20104000 {
 			status = "disabled";
 		};
 
-		emmc: mmc@20008000 {
-			compatible = "cdns,sd4hc";
-			reg = <0x0 0x20008000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
-			interrupts = <88 89>;
-			pinctrl-names = "default";
-			clocks = <&clkcfg 6>;
-			bus-width = <4>;
-			cap-mmc-highspeed;
-			mmc-ddr-3_3v;
-			max-frequency = <200000000>;
-			non-removable;
-			no-sd;
-			no-sdio;
-			voltage-ranges = <3300 3300>;
-			status = "disabled";
-		};
-
-		sdcard: sdhc@20008000 {
+		mmc: mmc@20008000 {
 			compatible = "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88>;
 			pinctrl-names = "default";
 			clocks = <&clkcfg 6>;
-			bus-width = <4>;
-			disable-wp;
-			cap-sd-highspeed;
-			card-detect-delay = <200>;
-			sd-uhs-sdr12;
-			sd-uhs-sdr25;
-			sd-uhs-sdr50;
-			sd-uhs-sdr104;
 			max-frequency = <200000000>;
 			status = "disabled";
 		};
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
