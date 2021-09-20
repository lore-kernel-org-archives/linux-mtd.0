Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DA0C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 13:29:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E5C60F93
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 13:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7E5C60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Twc+pFqHWQ3hO4Z+xdMCNSwZf5F/bKPBeXTa4XGX75A=; b=auHzgSI6cHjy4J
	sZSA7lKNWy+S9/orcwtbYlH0t0DhMlDFkZ+/XHcXaa4dD3CjZC6PvjhvnHYZJ2Iz6HKdLD4OGQWwG
	r2DqQCdeiF72+EQL7JT2WwqzPq2WB6DJSTrkjRyWQuqH6c2MZ4QhlzrmqtEyy0pisoI80inIJjW57
	4zHeyLXG7fK222qh+e27HseqFqkFr1AM9kHiNHOPzaqrGIccv3ZY26caLAOtHJE9UNXf2UzciQCAN
	UhmUzpVQoTNfpPdVcfQM8axzNjUCdsKOVQ3D1vRC00tLqsF54sEx1zaNlyRSMwxwIJ2DLgtETe1gp
	Qmkmmk8K950Pkcw+iQqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSJLd-001lv4-Uc; Mon, 20 Sep 2021 13:28:42 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSJLZ-001lrp-8t
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 13:28:39 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0412C40260
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632144516;
 bh=405kNu3dtB0zJ30yHuYcgVnAp+AYJ1QTK0vyYlLZaqY=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=kEv/NaLwTXk8F6dfCb+oKmfosaBfM3vaSTCWnkMkLEPvT1BBPMufgoANP/1UVlPvu
 I/XRFm2IGhdT5ZPdgGlE5sVPspi3IaDayu9FA+ajWlet4LdahjRQu9ALzYoGyDliQu
 gV7hvjJ2jpfkd6vBE4v7rqH6RRd3RvpNWIA/TUztvsBYQDQm1nU/DWcnybpNXE2vkE
 rEG3DQkqwOaCZ1x2h62jHBuADywb05RARuiKDdCmdQoYwN7MKUzQEM+PciA3ZrgUF1
 StOfT9nv+qSO82CLvxzzGIdYwRSUBElygTJZYzMYbZuik+13Gv+PNkBWd1sHWv9pHN
 S8xR5qP4g0DsQ==
Received: by mail-wr1-f72.google.com with SMTP id
 v15-20020adff68f000000b0015df51efa18so6070486wrp.16
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 06:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=405kNu3dtB0zJ30yHuYcgVnAp+AYJ1QTK0vyYlLZaqY=;
 b=SNd3X+j9SzHZcTCECK+CpEinZQm7pKk6dtSDe/PJsXvtT8kzTjSdoIFFV1H0Z8gtm4
 cvOoQBsunKqEKal3hnrFZoMipOSm3pwqVU6stT20dah7wHNYL5u70Koj0vjex2nRJzY6
 BtJXxdb6WXG+Vkn7xFy07makkp8S76ut6xsXLao6Vz4rukUIqkm9DJouPVOuTdT4yv0S
 4siIwBcSfFUeWjirkXwuupSfD2DhEgg3HjZqrVnilVVZhBghSHlCZ3P9etOKtmCAdTY6
 jhDDFFGxhYMRMqaZlJ7RTwpbBOINEcPCeOqQxJuY1iyRBRJTlKorSB3+t+mLmfmEK3k/
 v1tQ==
X-Gm-Message-State: AOAM532Nhtzccji43LZfMr9oo/5XJw89gxwahjpEM/y0YEM+ZQ0Smx2X
 sSvzVNbPt5Mq2Dka9Zotxh7mRKBDCeNbL3KtJkaVR8IkWzVOdzeqhEyTh1oDT/n7/jQLdkXxyv+
 ykthZGV3FgL5eJ03edLZqamZ4x7sGbc50vka7m9UBx8I=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr24134475wmc.19.1632144515397; 
 Mon, 20 Sep 2021 06:28:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn/S9tRY6RVjn6ynl0DulA8/tnIBG0wKbhfeCztIh58oZTCS+xiYF7PbLFUUBnXpyQ/mByIQ==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr24134462wmc.19.1632144515253; 
 Mon, 20 Sep 2021 06:28:35 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id g1sm45429wmk.2.2021.09.20.06.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:28:34 -0700 (PDT)
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
Subject: [PATCH v2 1/5] riscv: dts: microchip: drop duplicated nodes
Date: Mon, 20 Sep 2021 15:28:26 +0200
Message-Id: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_062837_473311_59B7E474 
X-CRM114-Status: GOOD (  11.39  )
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

The DTSI file defines soc node and address/size cells, so there is no
point in duplicating it in DTS file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index b254c60589a1..3b04ef17e8da 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -9,8 +9,6 @@
 #define RTCCLK_FREQ		1000000
 
 / {
-	#address-cells = <2>;
-	#size-cells = <2>;
 	model = "Microchip PolarFire-SoC Icicle Kit";
 	compatible = "microchip,mpfs-icicle-kit";
 
@@ -35,9 +33,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x40000000>;
 		clocks = <&clkcfg 26>;
 	};
-
-	soc {
-	};
 };
 
 &serial0 {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
