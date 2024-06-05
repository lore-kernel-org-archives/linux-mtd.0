Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2087C25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9dMs9Q71rYOg2i/GzbJInU1ylrhrPk+uUEhO+kc/M+A=; b=ZOpyjri75uxT1fsg7wSYephPhI
	IZoBeDh207a+prsWJ7wcWMMQgOomIhsSy6aCYb6zM5j75a50Xdu9NrUCqF+XhIV4w89D6+toGeAhn
	g4mcsovsdawwbViN10oaceXOjUsx9wu4wOqgaoQ2gi42BK8fe4UCGF/zBcI5wu5upFv7jSIE3ZTso
	h02H9SgbzA7GzzJV6Vvhg7crb1ZTuA/yOtKlpNQu8H5CGzgmZ65ZjWzz/800lGyXRhGctTGxh1JaF
	tHXCS8Y2qBaZp0554UjqinSnw2E1U2QHd5wJ5WxqvMGMmsSbsmOklCZ7qNNAGBFGdAB1+UiLTN1xh
	gxxE07pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuw6-000000073TN-46W0;
	Wed, 05 Jun 2024 18:00:35 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvp-000000073Cr-3ylu
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:19 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-62a0eb1c809so264887b3.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610414; x=1718215214; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvmsbFq1f0xb8qTUeLHIrwaOpt4YNpx3HYdX4+QrPhA=;
        b=1UL4KDKPz8BjQ2nQUK1wAI9AVEkK5QoOHEH1zd+mFQDxnQtU+Wo5+9+nBBscBO0tE0
         KRtD8BT6UO2wZU0gnRr5WKqI1Ktq6rhrFrQG17fkzufK4IlUL5zu2diNsQ70sqHY+44s
         ZeQE2oCW+AFnfffOOhkZEJJQ5P8bdQoEGcdhYXkL93xik0IaCY9YGniEuY7Vpxv4xqTM
         1gd8iJW8rylEY7Nw8PDxrsaw2lZXLuGWx4yXo8Kz2YZEeq5VeD4CThxud/5W+Exrt5/O
         IlSsQvNa5Q57iUYtx07OacZiAB2SDkeYv5TvteEJtLR4M0zov49A8NIm9LX5/F1LBg2p
         vbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610414; x=1718215214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvmsbFq1f0xb8qTUeLHIrwaOpt4YNpx3HYdX4+QrPhA=;
        b=pLqQRKjISoEX2VdRSy/mEoHtX/B51U9kryRG/+BisTGMdHnCn4iIHigdk+EOCfb45i
         frqDmVX7xcwICGyGDUYxJnT4FRvvRx4ywwj53fwy7qaoR7oUnA6fdmdzdFwklKyt2OyP
         xK+FhrBIKpSpfIlgKK9baQ1PuUAiOP3/Er7MBzjhTQppZmOJ5bUWCWDRPPzlXHqIePnm
         u6uqXmKIOMSGopRJfA+rQMlxoggeZVFizAdLh5Zp68YyvjYyHBUVSHi/igEEz4Y8abtz
         +vp4EVgUsCb4+iDOPVWXAy+0amvJdKBfsyzwfWvZGFtw7mwv2mSAmjyKbhqBMALW1HWk
         rY4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbV6tG8+y2gm2RNoBbrgZf6i/gp3FRysHaZHSB3S9S7MzX3aWcfpsSzepo1T6N8ksjefdN9v10sA2YClJJYCVEEYaeym0mI66TieiZdg==
X-Gm-Message-State: AOJu0Yzs/5c1X7IgEwZ0DeCaViw7hehLiM3lKuV80AParp80ybQZufHd
	aZFW49nwoojA1ndf+nHOSEpO5yynI8lWMEnGWwI2GDrme/bUAC7Igl5z4pol4FWimrNT07/ftF4
	tN1C8ATpcbw==
X-Google-Smtp-Source: AGHT+IHixjuOYQ1InGCAjmo87JHH7BxdpNaY95UBwdRBHB8eZTSP6/tJXCeai8kdlzm5GsjEUY/q6O3hk54taA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:6688:b0:622:cd7d:fec4 with SMTP
 id 00721157ae682-62cbb5e6bc6mr8437267b3.9.1717610413829; Wed, 05 Jun 2024
 11:00:13 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:47 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-4-joychakr@google.com>
Subject: [PATCH v1 03/17] media: i2c: video-i2c: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_110018_021349_17975DB8 
X-CRM114-Status: GOOD (  11.12  )
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

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/media/i2c/video-i2c.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 56dbe07a1c99..2bfc221b5104 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -151,12 +151,15 @@ struct video_i2c_chip {
 	int (*hwmon_init)(struct video_i2c_data *data);
 };
 
-static int mlx90640_nvram_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t mlx90640_nvram_read(void *priv, unsigned int offset, void *val,
+				   size_t bytes)
 {
 	struct video_i2c_data *data = priv;
+	int ret;
+
+	ret = regmap_bulk_read(data->regmap, MLX90640_EEPROM_START_ADDR + offset, val, bytes);
 
-	return regmap_bulk_read(data->regmap, MLX90640_EEPROM_START_ADDR + offset, val, bytes);
+	return ret < 0 ? ret : bytes;
 }
 
 static struct nvmem_config mlx90640_nvram_config = {
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
