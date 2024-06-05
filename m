Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E9AC25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 20:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5UT8WgvsPoW2AtNnCv+Th4BShg3/dvBd+PIcTR/tQcM=; b=o/wWL7mVY8i4I5ycqJJLOmkJiW
	NyVaOcF4C3pN524YVR6uighI3iIDiYLLldfK9ZeQxn9RBa5xGXYL+xFF7NGuWbpzmVpnkPqIwEYWv
	y8lhHnB3GdI8Spc0xNsMztlTHdVYpQQ5b+I2s0E0m2Q1zM5Qzhvq35McpZxv0AqTbEwQapYExe8mt
	JOmq2YsY/49Y1xm2kUDp0JVto8qyNQNNxM63br6qlo5xWvfMwaZL6M+ni6k5L408KolUUNpvnK6J8
	SxBssFwc6PfqvSC68su0qh6PgnqjNYh1P3X/AF8RfH5Jp8ky5R604x04/UsrcwOzHfcnwlABKniIv
	XbWvk6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEx43-00000007Qn9-1Bpk;
	Wed, 05 Jun 2024 20:16:55 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuwB-000000073Tl-3RE1
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:01:05 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-62a2aec8521so607577b3.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610434; x=1718215234; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVw14u+NFBf2FJ7HWAHlLpDDoc6dqDnKHHZFCo9Dzmo=;
        b=G2z68Q42h8BopQasNC59Hs1iU6alvuTCNS3++OdmKiQ5yn8O3op6CCl2OMR44KEs3h
         tqXBYH3WeAjYKGLPhr0uuEuEsCOaRxv5R74eUo3eF4kZTZlggp+gsYsL2FJf2atqLRI8
         wSpwd9nDpECCC9+s+cbRMCa4afFaxTd0Cn00gsyketdA5vKiH8P8Efxo/+LBtpnrRTX7
         cco5CJRd9j2SDjg5tse/3onRoO5soomEeS0lXJ0RErL9Xl5ioyFWURmOHEqBK3mUFtkX
         9V7k+lpdhW2OYZ8HOrxuy+Tyc4jAgwhZsxlwR58fJCbUcR3H2WHOxA/LilsKzzmW2SL4
         JIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610434; x=1718215234;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVw14u+NFBf2FJ7HWAHlLpDDoc6dqDnKHHZFCo9Dzmo=;
        b=DT2OgH1HuUrOvIEds5ZYDUiOSesJkwAwH7m3LH7SkoKu92ERPDNV025i8JhCumlX3P
         IJ7R9DDb5E8UvtFTU28hTJbtLhCG9OCIUe+4U+q9NVHh/CgFBrfcEeGfErSOnxn6l3uN
         OILmovKryWSpviBVzd1Ley6w4GwcDQlzA2F+HJWu/3dbcJ21AOR4Quazt3fT3mu9cEyY
         0IGqsx4IqeDaPzJhBN4y6/QaUQzYu9Dp/3D8xD7ywhuCMhcCuFmn8MMYknydqwsA7Vuk
         oSyr/mI8PN8nmDY/imEAUascGviioHDSucoU3PKuYo246G/sa8YkeVz6gYNa8TM2OSd/
         9XNA==
X-Forwarded-Encrypted: i=1; AJvYcCUMP42X5LSiO7FJqGkKG42P/TPznFyMHZaEKs695rkoKntQAzPnZhHVJv/DHwW2ozU2uNKWSHSwx17gG0H6fUp4SOa4pHsllUFluSRgow==
X-Gm-Message-State: AOJu0YxjBQz5REEh8yICRlX0Fjdh50Migtqj4IPVm+9coWeM7pJVl6lB
	X52GEIO0FSEA1T7ptVadKO+IS1325YgYWA0RIo6bpo9sFBOzPL1aRZJiOhXYDxZv9cyXptOzOzk
	wrdUykbWNrA==
X-Google-Smtp-Source: AGHT+IFNKfAUW4OMaL9qXpdep3tJtwg2SPr15+NfVtMPZB9WLEiwmeB7gCF1Z3uW4GFYC8/zL1lL4yiz6W2izA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:39c:b0:627:96bd:b2b with SMTP id
 00721157ae682-62cbb596fc6mr8752147b3.6.1717610434368; Wed, 05 Jun 2024
 11:00:34 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:52 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-9-joychakr@google.com>
Subject: [PATCH v1 08/17] misc: eeprom: 93xx46: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_110040_756433_2742FFC1 
X-CRM114-Status: GOOD (  11.07  )
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
 drivers/misc/eeprom/eeprom_93xx46.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
index 45c8ae0db8f9..5d618a13fe5a 100644
--- a/drivers/misc/eeprom/eeprom_93xx46.c
+++ b/drivers/misc/eeprom/eeprom_93xx46.c
@@ -79,10 +79,11 @@ static inline bool has_quirk_extra_read_cycle(struct eeprom_93xx46_dev *edev)
 	return edev->pdata->quirks & EEPROM_93XX46_QUIRK_EXTRA_READ_CYCLE;
 }
 
-static int eeprom_93xx46_read(void *priv, unsigned int off,
-			      void *val, size_t count)
+static ssize_t eeprom_93xx46_read(void *priv, unsigned int off,
+				  void *val, size_t count)
 {
 	struct eeprom_93xx46_dev *edev = priv;
+	size_t bytes_read = count;
 	char *buf = val;
 	int err = 0;
 	int bits;
@@ -158,7 +159,7 @@ static int eeprom_93xx46_read(void *priv, unsigned int off,
 
 	mutex_unlock(&edev->lock);
 
-	return err;
+	return err < 0 ? err : bytes_read;
 }
 
 static int eeprom_93xx46_ew(struct eeprom_93xx46_dev *edev, int is_on)
@@ -258,12 +259,13 @@ eeprom_93xx46_write_word(struct eeprom_93xx46_dev *edev,
 	return ret;
 }
 
-static int eeprom_93xx46_write(void *priv, unsigned int off,
+static ssize_t eeprom_93xx46_write(void *priv, unsigned int off,
 				   void *val, size_t count)
 {
 	struct eeprom_93xx46_dev *edev = priv;
 	char *buf = val;
 	int i, ret, step = 1;
+	size_t bytes_written = count;
 
 	if (unlikely(off >= edev->size))
 		return -EFBIG;
@@ -304,7 +306,7 @@ static int eeprom_93xx46_write(void *priv, unsigned int off,
 
 	/* erase/write disable */
 	eeprom_93xx46_ew(edev, 0);
-	return ret;
+	return ret < 0 ? ret : bytes_written;
 }
 
 static int eeprom_93xx46_eral(struct eeprom_93xx46_dev *edev)
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
