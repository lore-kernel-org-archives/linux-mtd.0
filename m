Return-Path: <SRS0=Ia6G=Z2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2736DC43603
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 13:28:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE8DE2077B
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 13:28:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fNQMtWn0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MU1eCT8s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE8DE2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oErXdxEEmuUDnbWOE9fEtTpPkkfU78bdnlK0wMsUXWU=; b=fNQMtWn09GlEn9
	nwr7cR7wENdVnepgRTaP1k5kaihp7cQmmswrVbqty7ltcCAOqraNLLNwo6lMtuYFcwoHhChbYgn2c
	PZn/qWcqp7MCwpsLyfl1RO8qywO/g4jSc+1enKC0zARRJZyXIfPDCUD/9ugo01hhFzA7j8433wRCg
	ldIcgaj8VLl4M0Q0xdh554P4r+Xm9FaNGuY7GNY4ZOL7wP8S68dYnv6RZ5XuR8aAfxaEg6GwRNqXF
	ktiRRi4NK/8Zcq9W2PAhx2GFSETmp8sz29wxmYS3ppQrePP99hc43bVslYX+bogE3PYE0lmlr83af
	QPdbIJ9mkIKAkXQRmWpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icUh0-0006oi-9r; Wed, 04 Dec 2019 13:27:46 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icUgx-0006ny-1k
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2019 13:27:45 +0000
Received: by mail-wr1-x441.google.com with SMTP id a15so8578446wrf.9
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2019 05:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rsyQqCu1aUv9ntw3UAX1WSAMJmeLw7xkIDrzIKtETZ4=;
 b=MU1eCT8sFGWjc7CRq0KeHYfizNyHUoLKtwOeRdD543mFgMFGmVPnh8Y9mZwgRyFBD/
 LG5n5FMspnAvVbtwPAeZ2dK0mY3iwWkMYPt30MYG5p4mNgsZ/DzIDeHNr8DEkqVXekoc
 KY6xhMaZW6lRV1YrZZH8zS8/YMkBPTJws4pp2kRkTjXDOgu4h/cnq430ihY5MkcURqWI
 LDiIMDegYNCcgd0XJf96PHW637aBOi7xfpfYJpP6LOP83t0WNCH20SBpBss9sMy9bViX
 AjNRCE8oVnMbkhVqvV+xHK6qtzf7UoGLv8BrmmgACR1J8YkWNqa5SEHNtSV38/5dEYpV
 gNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rsyQqCu1aUv9ntw3UAX1WSAMJmeLw7xkIDrzIKtETZ4=;
 b=Wsp8A7oG8bzSXNkyrDYXdynjO5YmVWLUiEObuVpkykEf4sEhmSQ/N8jrdWbGGFNnMu
 ElGSJsXAQUAvo/7KZHSXfk9n1g7hfeAoEhYLPU1136OdTb1Ayb8f88Xu7otvHFGfWLpm
 1JOrSVL+Vc4VHpkUcMvvbNpOFHr8yMhmK/xjzmSNWhFp5C4HDdELJiVfMAYFezhDHRsE
 zN2sammJ9sW8W034Bdc4erk2F8xrwDX1JMlYsBD9z4VGZHIV8l5rfwBctoJyUD2S2j/D
 Nwj3CCfXbMooCPZScUyAUbqQ0E/3RXzPu0217IykEOjyAbpNVeFGRarY1eo0ywvt84yv
 sM5w==
X-Gm-Message-State: APjAAAWNuB4S3S+Uzz3HtLiAK9+3ssJrmGNSxGBWypIvQ/sii7UXikvP
 R3n/lUL7xG92udCQH8UzlBqQHg==
X-Google-Smtp-Source: APXvYqw2s2zyttj+n9kShAjj6xY9xEM3Y9PDoHEKIdHgBMiVi/KMg3tL//PdhtB8DwkoR30FpHYqVQ==
X-Received: by 2002:a5d:6551:: with SMTP id z17mr4287802wrv.269.1575466061045; 
 Wed, 04 Dec 2019 05:27:41 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c15sm8094632wrt.1.2019.12.04.05.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 05:27:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: add Gigadevice gd25lq128d support
Date: Wed,  4 Dec 2019 14:27:13 +0100
Message-Id: <20191204132713.6195-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_052743_113108_21A99A76 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tested on the Amlogic aml-libretech-pc platform which does not support
dual or quad modes

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Datasheet is available here:
 http://www.elm-tech.com/en/products/spi-flash-memory/gd25lq128/gd25lq128.pdf

 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1d8621d43160..d394f3861ecd 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2231,6 +2231,11 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
+	{
+		"gd25lq128d", INFO(0xc86018, 0, 64 * 1024, 256,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
 	{
 		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
