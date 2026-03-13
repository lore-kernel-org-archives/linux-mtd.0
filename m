Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7C0105F7AC
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OIl4KsiJtJ5iWuAr+0fOfyCE9wLzpliL/PHty6DXbgM=; b=QALDLiFymaHspO
	zA/mEzjd2BXJb6bncZIGpH4KzhiVlkaec9s6ooicU8ysKmZEdu/z4aArGvWcitbc5YNlOPJJIHTLq
	SZLYf9ckEff9x+tMtfBPUzf9VJ2mLQNmL+t8N6T/zobJMSnGBtl5I6OeplbRd9Lu3zxyr3VjuVunD
	3c+Em+g6w8KKTDz9WGD22j8wbRnTFNw+AUJFozQb++2taL6uQZ0NWlxmdVmMY16yMIVXSWpDicoYJ
	Zoikdzj5EeWvO8RPRW0tYC10LHWBA+2cH2rUGdiC3SVhMAhC/iNnutGE5AR3k9KxbUt450msnrOdv
	VEdlKUJs9CjU7xUFvHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12jC-00000000IEd-1wWO;
	Fri, 13 Mar 2026 13:38:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12j9-00000000IDm-1gwK
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 13:38:57 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-829759ca646so1307412b3a.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Mar 2026 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1773409134; x=1774013934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVlBxLx93dYm/v39k+lAv+cdQqoileUcSY7dr3O8QjA=;
        b=dSSiB+ZcnVFh8ECZbuelt5kgC2GB6T+LLctj+LondGcaj0p4Z0RcAN5NjMI1swA+pp
         aCFbLYSF8mkV0p7lDPL8UZaPeAje5wH1rRuuJIcRymtVPScwcMmZp4MfgYyTci11X+KZ
         grFveR/LkyU+37O5BqGcdsh1u/jYnxP6KrNvjKCnCQ6Vq4sbygeCs2iMWMjRVYgEWvwz
         OKgk1tIE48/Try5dFaIDByoPvPZ2ZtX980735+25v6V5NS+IbtWFwglgWDdpm/epSxxJ
         Bd0kJnV546ZsixWlYWF1BFFej97e5LrAxGcLYmFIthy7J34LnL1KclUtPPGjIxEgcs03
         GYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409134; x=1774013934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVlBxLx93dYm/v39k+lAv+cdQqoileUcSY7dr3O8QjA=;
        b=gtS+bmmALWzyBRBoNtciwxuTsyQT3toG31MOGXuLGF+V/6M9H66bHeXEVzDZ9kQivN
         ZVEyWLIQZEHPdb9NXhffL8eNMmUsQPPkmDEo1/sZmjr3SnRpYKRnkB4WgQAM+2Bh7Avf
         T2J9R+7IJNsFuF4KSsmNwiwFAXZB2AKtVVrQiri4yunwo5klRkJY4Su/kczW9xqSC8aT
         6GGoovZ5DQQtdVrbFPFySp8Im7y170S24MkeGWnmpqNcnwJKjvpQeTk7d4s/GF1tZlTc
         h0f8/tJ7nIVC8v6/gCgw6+C+RvFXtQaBC/Tirj+uIdME+z6feJ18jgKfFubLw+dnPpyf
         8mGA==
X-Forwarded-Encrypted: i=1; AJvYcCWnZWlwHAu11lxbK0m3SRR2rK0XHoc8hW5YYNrb7rmCoCt9uogeHPR0S2DvVxdigSoztNCNa+21MYo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoRzRosF3xbnJiHsZOIBPBJq9xVA3QOD2oFQkxOxQ23CUdzfnX
	eJYtFBWevx59LnVuufTaCDFei117WZCxEvkgmovoVCKCWGiDJDkD5R+iUVs1prTTxYc=
X-Gm-Gg: ATEYQzzffA3Bqcc5hp4p/hugaVjbTCOD6qYOFgkNhZRzAnvpw1mq5Xc8bgCMyNZiMH/
	TW5+f9DaPuyXNKsmEgYfD60lKbMG1ElS1rNOcYws2GkfWmPK0mFHqOwbsqVJ19eI5LLUCKKW8yJ
	fu9fps7AiTBXGmOCO4xlMjUdWshsKaI36jpYjJcFzg3gjZXWOhEAheJMp7t/hGDSWCfu9SmVLDK
	4n7x8p/Mgz602kgt1+70HK2gQr5opI+o0tSKV8E2ZHzmeg+7WoE9kpOIll+jukwIGzeOtDYNeqS
	s/jPLwTp9+SNEcXbG/ftEsLcoQ6bF5/1nDBhKxLQNBt9Ybaw0qtL/AkIUoAy97ZUYk7b/c+Yrgs
	2X01bXGrUknSJU4/eJfukEA+uzD2zPHmrOhHnP6V1Tj4E5Yq6cH5vs+RlMmielyeDtINvJGQp2K
	x1tqAuGYwEOIA3RW4A/Q8gjF0hn0mD1tA+3LIOY56pFfimB5btJFjDdYLb9rUSw8s=
X-Received: by 2002:a05:6a00:138e:b0:823:ad3:4ff4 with SMTP id d2e1a72fcca58-82a198b84ddmr3060475b3a.37.1773409133845;
        Fri, 13 Mar 2026 06:38:53 -0700 (PDT)
Received: from ubuntu2404.huaqin.com ([103.117.77.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07343719sm6101620b3a.38.2026.03.13.06.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:38:53 -0700 (PDT)
From: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
To: takahiro.kuwano@infineon.com
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
Subject: [PATCH] Subject: [v2] mtd: spi-nor: gigadevice: Add support for GD25LQ255E
Date: Fri, 13 Mar 2026 21:38:06 +0800
Message-ID: <20260313133806.2390946-1-wuweimin@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_063855_540084_A94DFB1F 
X-CRM114-Status: GOOD (  12.30  )
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

Add support for the GigaDevice GD25LQ255E (JEDEC ID c8 60 19),
a 256Mbit (32MB) SPI NOR flash chip which supports SFDP.

The chip supports 4K sector erase, dual read, and quad read modes.

Link: https://download.gigadevice.com/Datasheet/DS-00562-GD25LQ255E-Rev1.2.pdf

Without this patch, The WP status cannot be obtained using flashrom:
device:/ # flashrom --wp-status
...
linux_mtd_wp_read_cfg:
ioctl: Operation not supported on transport endpoint
Failed to get WP status: failed to read the current WP configuration

and with this patch:
device:/ # flashrom --wp-status
...
Protection range: start=0x00000000 length=0x00000000 (none)
Protection mode: disabled
SUCCESS

Signed-off-by: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>

---
Changes in v2:
- Following the recommendation of v1, remove name and no_sfdp_flags
  parameter, and SPI_NOR_QUAD_PP flag bit.
- Remove size parameter to to make the `spi_nor_needs_sfdp()`
  function return true.
- Link to v1: https://patchwork.ozlabs.org/project/linux-mtd/patch/20260213144133.1778932-1-wuweimin@huaqin.corp-partner.google.com/

This flash memory has been successfully tested on a Chromebook device running the Intel Patherlake platform, which is currently under development.
---
---
 drivers/mtd/spi-nor/gigadevice.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0ad..9774f7fe7 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -82,6 +82,9 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x19),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	},
 };
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
