Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE12C04A6A
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 15:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CqEEYEf9Fz/MsSmw0j3cHp4AD4A6l+ZDONvW9oshn9U=; b=UAy6Y6CyTKCs4O
	DM+AnkfdA0RpICBPln6U4vGkwVuSrxpS0XLNyywAaBGPYN5ocHb5bJYtNDxzZPvbZMen0BdFZuGMo
	JMn303Pc7qk22jeN/3vrVHqRkMKjAZX66CQhAadZRT5QkmuLmHMD1eXh0GI5y+fr8iNlHFGEm2Wlq
	OU8m8mjzMsHtQqF6LNHcvfGG2THRlteDsuQEkMC0Nrs7ak9IuO5jgjTavee7LdMHWoQRqRNtcnbvN
	Xr8wqi3LyBUF8uweYFZPp+JxTh+OdkORS9fQQsxkR0rjRuEXUzQXjs/tP7z9w1Qhk7WSiGF7AcuL4
	Z9Gpchz7nGN04zwdLatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwE1-001tAV-2K;
	Tue, 15 Aug 2023 15:44:53 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwDz-001t8x-0B
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 15:44:52 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-686f0d66652so5267661b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 08:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692114288; x=1692719088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X+b40dDlDBakx8+hTHp2ebRkg2RA++lkqQVSTeac6zA=;
        b=BtS41tzhfK7XY6exlpjzQzgARG+Ehge1+0PRdLnYhdOW6v1Bo7SJIi4QfUUoIKcI9x
         pbi2VdZOgXud1DEl9BDa7AbCo5HKvn/XKF10E4aOV81o3c7y81bD4TpDN0gxIjiW+o34
         PdoWIJpg8d/x3+RQWmBeMDtnW3My6yZM1rnx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692114288; x=1692719088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+b40dDlDBakx8+hTHp2ebRkg2RA++lkqQVSTeac6zA=;
        b=TZNvvWYMfkSBgiqPgqvpBI3VeFC3CamfxoAiwgq8tD5BEVJ3TBmD6CD6UtQnC4Dv7U
         cfC58f7SRd7npUUVvF/cArrjhV01bgty/a3TQcRK/hMmb1yqRpzN8AZ/SjML6aqljxpj
         yvTn6j2m3SP8cEXv9T+Kj0HQKnj8iyv4K/ukKldCF9pZ4ta72U6ppuMSN6/SzxSFQNnm
         o7b/zdAQGxInTRu3RUe2rzjyW1fbOpn0+LLLW9Xv639MikyNDJxFxJT2XPlcrtWIbIOd
         h0iqtbWalyq3yC8kalpZBGMAXepaekEt71oJo3o/ew8PJZUYdK49Boyck6NI5S8bAnNH
         BoNw==
X-Gm-Message-State: AOJu0Yw8yzCbk+NKbXiETB3n+gaWO5rCpqZswZPAHQZZ7sYIR48QZq83
	PBBvDf3Fs4V0/6lXEPnMOCkddA==
X-Google-Smtp-Source: AGHT+IGzSeQ7P7d6hIuKp8jX5Kc6bcArFd2OV1P4lsTdQ+wIT/RytQKLIYbcjxTcDvbMf4xA8ee6oA==
X-Received: by 2002:a05:6a20:3d28:b0:134:1011:8582 with SMTP id y40-20020a056a203d2800b0013410118582mr17945878pzi.47.1692114288344;
        Tue, 15 Aug 2023 08:44:48 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40cf:3807:f8c8:2d76])
        by smtp.gmail.com with ESMTPSA id n13-20020aa78a4d000000b0065e154bac6dsm9431247pfa.133.2023.08.15.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:44:47 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	"Miquel Raynal )" <miquel.raynal@bootlin.com>,
	"Richard Weinberger )" <richard@nod.at>,
	"Vignesh Raghavendra )" <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	cros-qcom-dts-watchers@chromium.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] Add a property to override the quad mode
Date: Tue, 15 Aug 2023 23:31:51 +0800
Message-ID: <20230815154412.713846-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_084451_093945_AEFF9986 
X-CRM114-Status: GOOD (  11.30  )
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

On gigadevice gd25lq64c, the quad mode is enabled after BFPT is parsed.
According to datasheet[1], Quad enable (QE) bit needs to be set to 0 to
use write protection (WP) pin. It also recommends setting default value of
QE to 0 to avoid a potential short issue.

Add a disable-quad-mode property in devicetree that platform can use it to
override the quad mode status parsed from BFPT to use write protection.

[1]
https://www.elm-tech.com/ja/products/spi-flash-memory/gd25lq64/gd25lq64.pdf
page 13

Hsin-Yi Wang (4):
  dt-bindings: mtd: jedec,spi-nor: Add disable-quad-mode property
  mtd: spi-nor: sfdp: read disable-quad-mode property
  arm64: dts: mediatek: mt8183: disable quad mode for spi nor
  arm64: dts: qcom: sc7180: disable quad mode for spi nor

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 7 +++++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi           | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi             | 1 +
 drivers/mtd/spi-nor/core.c                               | 5 +++++
 drivers/mtd/spi-nor/core.h                               | 1 +
 drivers/mtd/spi-nor/debugfs.c                            | 1 +
 6 files changed, 16 insertions(+)

-- 
2.41.0.694.ge786442a9b-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
