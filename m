Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2916C2B9F7
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 17:03:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BA3C6117A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 17:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BA3C6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FZIAnK6y4dCRHn+JF6e1pH8o9EXAwRqlz9SYRWPVAk=; b=KavGIUD3cNP5dH
	tVrfNHjPUuKPiRZdEoP+3AeqLj2ckojAIybam2gfcWwu5+B6Ivya6299HREC/rwtNeS2jA5Uj6TPe
	kX5zPeBd4GrbCMfIsXv2cGvXt/20+YgrvkRTyrv+zRGRFR8uwMZXPEj9swS7mJWrcOVqH7hxoBd3D
	B+auLBtyzry1YmLLuYB0w8wIylepIuXNI99BfFkDMQmkXdeDDqzUSkRn2cEMRiLZWfyabgtuWnCAT
	pUqSn5U5J/vP4aqdXBCFTTQaXNF7g5Z2DXPqpUL0Boe0/7iWwC7R+Cj37QlfU+/SOEH9faOsu+h8s
	ZYjJKUhpS6EE/AryX1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmfsf-00HG1P-AQ; Fri, 28 May 2021 17:02:41 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmfqc-00HEnc-Ra; Fri, 28 May 2021 17:00:36 +0000
Received: by mail-oo1-xc30.google.com with SMTP id
 s20-20020a4ae9940000b02902072d5df239so1089620ood.2; 
 Fri, 28 May 2021 10:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gdTuEFb5W1z98PRYNR4fX6ULPFfnwtTbmcJDxcUqyRo=;
 b=ejXHpqs/6c0eyfNau0jB3gDY/5MxzKBs3Fc10eaE+9QC9BisrD+u82cwzSdwC/IpNS
 IEmGO3/GKRJ1LgOzfGKloYo20NidT6TjQk/HnESsPfrbtsxOpyJja22OTCPzXlgdtM+q
 w2anMhAZMZGvOHRZ9BAmodmhuYezpJRFRVGXlb/spcWsvJHXIVQztBa42IX3iQbKh+0h
 cp2oM/BAT+mr3NtzfeVvWlthASDQaHvzfuju2QLO9Rcin0pE4IXsZBrgdi67mKg26mrl
 s4kgV66t4AOnrFz1XWgyx9v91q7gqQzOEJKCMdmN9WVZn8UDQ3PVCujjoYj0X8+2fr/F
 H/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gdTuEFb5W1z98PRYNR4fX6ULPFfnwtTbmcJDxcUqyRo=;
 b=GrE/LT+ewqnhYEEZaBRifVa+NGiNRiKHCL/TA4Zn1jHaspBmtpneaEW1M3Ad41R+1K
 uHYqcPobYmAJ9O7KdK9y3JKzZUrIK3bJilLmZKaSXnnsCj0FpktVfrs65IGd1SY4H7nO
 miqpkyrxL1ffrlkMCIUakTKQr7u6FR22b510ApdPuI6oGt+Qu11fcbG3IhClAxhJ6/0f
 nWjEiZnAkbyLayBzCgU9KcWh7PucLuEkqqUrBVXX9JjOxxTdC2DWUrcz67D5TuFF8KrR
 uRGgwHjUa5rR+tbWqdWrisGyPdnivLsT1Wr2EUNfePEBca7jlzHGpRXQKr/kQt85pFRE
 l5SQ==
X-Gm-Message-State: AOAM530A/5YCncivkYOEm+E+PXxAka+l9ucIMJHCb04uI0ktztQKaqWp
 VMB4PLq6KVrwaAAkNPKvjn6dYN4elt4=
X-Google-Smtp-Source: ABdhPJxJykkt/yf6uYro0mVaN7rzBIcFcz2Z3G3yrJ/lmFDx1OTRowGG+2Ousg7ahPUmitukIQM+FQ==
X-Received: by 2002:a4a:94ef:: with SMTP id l44mr7627865ooi.84.1622221233498; 
 Fri, 28 May 2021 10:00:33 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id r7sm1219084oom.46.2021.05.28.10.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 10:00:33 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 heiko@sntech.de, robh+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
 miquel.raynal@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Enable SFC for Odroid Go Advance
Date: Fri, 28 May 2021 12:00:20 -0500
Message-Id: <20210528170020.26219-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210528170020.26219-1-macroalpha82@gmail.com>
References: <20210528170020.26219-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_100034_927506_5FE94468 
X-CRM114-Status: GOOD (  10.59  )
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

From: Chris Morgan <macromorgan@hotmail.com>

This enables the Rockchip Serial Flash Controller for the Odroid Go
Advance. Note that while the attached SPI NOR flash and the controller
both support quad read mode, only 2 of the required 4 pins are present.
The rx and tx bus width is set to 2 for this reason.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/rockchip/rk3326-odroid-go2.dts      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
index 49c97f76df77..a72506d7c6ee 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
@@ -484,6 +484,22 @@ &sdmmc {
 	status = "okay";
 };
 
+&sfc {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
+	status = "okay";
+
+	nor_flash: xt25f128b@0 {
+		reg = <0>;
+		compatible = "xtx,xt25f128b","jedec,spi-nor";
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+		spi-max-frequency = <108000000>;
+	};
+};
+
 &tsadc {
 	status = "okay";
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
