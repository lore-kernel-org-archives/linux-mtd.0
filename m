Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90777C47099
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:18:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5194961402
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5194961402
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8+RmDVFynVvvWiaH4/MBgV6bce1Ia7vodtgU6MqhIo=; b=47f6+JtyGugxUu
	lJ/WibrKUJihMcDMEOfZ+9BCZJ3ZbzJVf3YhHXQ91dXyw2YZF/VzRk3KjoSb3UUP8AOnEz5dJELmu
	5jE/dRn2/uPH1T1JfWd1cUL2k/SxSIy0hXZKpqcXjKajOvjpaLjXHUzQzG4mQzqRWbPTmNyhl7Ore
	Zw810rUkDqhf7N5aQy8TugE3exvyRIOm38ex3QJ0JyB2dTfM0722Chq8RRyB3m6Q+8sZrbR+7DnOT
	ayP73ge8nUy3U869tLu0ERkuwd2kgG5szrBKOJAmAvTUcMcRm7ST47oUrq/hJzSi0ugaLKSSY3wyA
	Shr0UUHLZeppIHJS4/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpBZE-00E83O-MH; Fri, 04 Jun 2021 15:17:01 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpBUg-00E5mj-FS; Fri, 04 Jun 2021 15:12:25 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so9390885otk.5; 
 Fri, 04 Jun 2021 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Axi/Uev8x89LTj+S3KWC83OqhvyPd7zI+O6x+3a1ANs=;
 b=pXsgNeUzYIDLxE0VMZw/i2wgMFqIy9Z19Bqkdv899couZg+c72RfXzqwdSu3omFeoI
 PQrb79SFQRfagJqIqflH6LZJYfRbAZnqmHFwEromxlDVGVyyFeAR1o1Yk4lUakABVBv0
 gQqLnams5pAE/4prNBFGV2/bWvBoUqLMEzzBQVUP5OD6qxJQV46hguaE6FH3Jw6jpx6A
 zeK6ByWppWhxVI1GuDFvfblpNb8SR1HfQKLJzH56TgKvNIRd1SLD3UNHlkVBdn6Bjobx
 msfvnSbtcBinshoBhZkbG2R/H0GzPLWOELSqQUPnicD7/ZMcCSuwFtwu++1RfzAFeqhi
 8ZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Axi/Uev8x89LTj+S3KWC83OqhvyPd7zI+O6x+3a1ANs=;
 b=WkPScwHNADmZ4Fp4zzzEnR2Nl63xG8LoLeONcI2sUDfnbsTMG5OIiy+X+QBTb0Ys77
 xnNknuKpkWkkpgTStlOlXEiTs6KbzIkUhbspODag7kH5UfsrnFz3zOgUduN/lg7I3JE8
 LHbR21EO+FZ/u50CD7JlowhXBWJmrwQea7DP3WyswkRMB0BjmLnIFtyVoZ0Y+/MU5XaA
 9gQnw451kJ7OEg83zsakynQcdawA7kclySnFlkhV7P62ZqcNyP28S4z2SQl6TLIlM0Uk
 b1xVmtAaUeV5OeeCcohVPixNrk0cFzJMgymAuZnlx6uv41vOzfjtpDoxWc4MYlxuxT7K
 ndeA==
X-Gm-Message-State: AOAM531HVfw+rk/U/h1/zDDQK2pUsW9hJ5fSzITS3gb1Ur1tB76sfGxQ
 3+DhwHtmbRWhUMU7H/WX2Hs=
X-Google-Smtp-Source: ABdhPJzus7QkWZolLTF8j8qgAivcqHh94rvtf71D3K1YLdVBaoV9tqY4DxxrBRCgR0aHJ8qJP/vqKQ==
X-Received: by 2002:a9d:355:: with SMTP id 79mr4301635otv.101.1622819478023;
 Fri, 04 Jun 2021 08:11:18 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id k16sm523440otp.19.2021.06.04.08.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:11:17 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-spi@vger.kernel.org
Cc: jon.lin@rock-chips.com, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [RFC v4 8/8] arm64: dts: rockchip: Enable SFC for Odroid Go Advance
Date: Fri,  4 Jun 2021 10:10:55 -0500
Message-Id: <20210604151055.28636-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604151055.28636-1-macroalpha82@gmail.com>
References: <20210604151055.28636-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_081218_557110_E70FB1A0 
X-CRM114-Status: UNSURE (   9.92  )
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
index 49c97f76df77..f78e11dd8447 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
@@ -484,6 +484,22 @@ &sdmmc {
 	status = "okay";
 };
 
+&sfc {
+	pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus2>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <108000000>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
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
