Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A876BC282EC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Mar 2025 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fgtYejhuv7LhQlWvGsTxXp/Opd84Rk99+R/zU/7Z8Mk=; b=K40XA+tSj1mfTm
	MgSXQhinYH/x6HXj65YJspq+crAQZBNNxcT+/ZUwTgwPpIVcTaQnLZ8wmITBRvyW6a+E7z2rbnFy9
	Sac10APVQHEUuZGeTTaZXgeyl2SFU7ctFDmRIMnnncy5opy5m76k3OdaITDYiziNV//5JQmaXfewL
	7SmCyE932ipUTL9VlnhAu4pyAyGr4Gv/hmf/luZloGHgj/ubstYo2TAwiXYxIF/icIrTno+1D0emo
	hGT2KXmCHehpB+Bp3/DkrYcrLsTTIUDqzkpNP9nvVlR+EaJCpkYPbJtYFGmL3gmkiWIXEb38q+r0R
	yB68JTgCmsJNkR3Uvx0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF5G-00000003fps-0XKq;
	Mon, 17 Mar 2025 18:21:06 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF5D-00000003fnk-1dd5
	for linux-mtd@lists.infradead.org;
	Mon, 17 Mar 2025 18:21:04 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5e5c808e777so4739184a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2025 11:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742235661; x=1742840461; darn=lists.infradead.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sfFuu+eJmVYNAVthekeQ7PDh1EKYPBc4N+wgHd4KYbE=;
        b=ZnrISqd3osTOVGBHsqq88//kTdPVgvspzP3Ys9k7Gc5H9sab0iwalQ+il0JqD/4T5W
         Y6AubGnQ6Hg4HR8e7wfjHPNkX070NICIRXoEjEdxZQsEbf6j4mPlc0dEsQPY5a8cNODt
         xKv3zeRGRjAKX842No952VGGluDPR5/dHom6p5ERye+8U3b3aIdOkcmYO8v8VuDmOV+g
         82iKCpS2kuk/fmq68zCu1YO7Mju66dUYrkkciPtu37MmjYxFWGERwK3Pgm+yZXYhKGOK
         3VpB2yFebFgPUcPMi44OgL+S3Cv3FSJZj07uwucoNbWDruKiYMOpwItgsuJv0UDAQHRh
         KX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235661; x=1742840461;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sfFuu+eJmVYNAVthekeQ7PDh1EKYPBc4N+wgHd4KYbE=;
        b=A3pYrKN+eg3JG+Iw/E1hDX2WRQbxOJrSBM6qJU/9XKphdgGoH3XqDdIqZDtagdyoVZ
         0SB+qezzZH7zZZS04lcNR7vxvXX+Bl0SP5gIljrbYvnfRNEy7uKs8oloIyPrIdW8s0e3
         E0WRlR/vWDS/ia+0aPA4j+XdfvPDP+TbVAhHBGdL+QDw/TcpxNXalRu4iPslbI9aPUoP
         D0ExEbFPGutf4O1kBddP5jfxrMOLO1/23VYkCfYADniApTfr2AY3ktPOrCG1dIo7PgJD
         MDCa++wy5R2772wS5NhBDvuTGgyvFlz40Ab5eok4R8ZIdwaptlOEYgqqNBwmL1NxEFIm
         ACyg==
X-Forwarded-Encrypted: i=1; AJvYcCUO7xHyleRqpIpxXgMnYSsF0GPCCi1mxMIkzPhQ43NWXnPcUAE9W/qv/HDy1bK9AHEZPa5v+W/QQFU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk3sGzAduKmvnC9tsufBC3po2dYnh5bx6hYrmsKpPK48yhn+Un
	Yvk8XevqG1VIe4fkn0CvVH7/aFjLLgGWMTrp09MMeLKVjl4iLoRrd4qqIMuY8c4iBBAJkBG2aVL
	6GpW/EA==
X-Google-Smtp-Source: AGHT+IG1h8GfnurAMl6dMtwyuldeVpIzzbD9T5cwDcyYDpilHM/PkC7SNnNSgKT74Xa5F/SNuijtZLO1G21O
X-Received: from edbfi25.prod.google.com ([2002:a05:6402:5519:b0:5e7:8957:e479])
 (user=czapiga job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:26c4:b0:5d1:f009:925e
 with SMTP id 4fb4d7f45d1cf-5e89f649a75mr14429927a12.16.1742235661486; Mon, 17
 Mar 2025 11:21:01 -0700 (PDT)
Date: Mon, 17 Mar 2025 18:20:56 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250317182058.2060277-1-czapiga@google.com>
Subject: [PATCH] mtd: spi-nor: macronix: add MX77U25650F, MX77U25655F and MX77U51250F
From: Jakub Czapiga <czapiga@google.com>
Cc: Jakub Czapiga <czapiga@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_112103_429104_2E1B7B26 
X-CRM114-Status: GOOD (  11.68  )
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

MX77U25650F and MX77U25655F are 256Mbit chips with SFDP and block
protection support. MX77U51250F is 512Mbit chip with SFDP and block
protection support.
All chips also support top-bottom lock configuration, however this bit
is SR2(3) and is also OTP (defaults to top). Due to lack of API to
support TB in SR2(3) and due to it being OTP these chips will only
support top blocks protection.

Signed-off-by: Jakub Czapiga <czapiga@google.com>
---
 drivers/mtd/spi-nor/macronix.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 99936fd25d43..c65e7cdab5cf 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -193,7 +193,22 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx25l3255e",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
-	},
+	}, {
+		.id = SNOR_ID(0xc2, 0x75, 0x39),
+		.name = "mx77u25650f",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+	}, {
+		.id = SNOR_ID(0xc2, 0x76, 0x39),
+		.name = "mx77u25655f",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+	}, {
+		.id = SNOR_ID(0xc2, 0x75, 0x3a),
+		.name = "mx77u51250f",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+	}
 	/*
 	 * This spares us of adding new flash entries for flashes that can be
 	 * initialized solely based on the SFDP data, but still need the
-- 
2.49.0.rc1.451.g8f38331e32-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
