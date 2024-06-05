Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE834C41513
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 19:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HZrBYfJCeiop7lJvi7/qlvNeGjZsi4rJdyFUp/sJl9E=; b=LqAj3VTztdLin1ywVF2aXEeUzf
	eP02fQ7ozExLkBO1xgU1cuYU3cMWNh9AwI5xBvWw7sb+d9HKCP/rCuLDd0n7CN+Ft45ZRje9HJl0k
	pV8aJl0E0USUNvVW6gBMFcY26R8uoCeYPr86FP8KbyqhV6oelKbGFVZNgggoawiYkZD9SR42Q/FsI
	1ZsVmlnUrJKzIExUBIedT6fC528kSU9Prn4VeA5Jy9ZDkI89FxcVKrrOZ6ELNyZ3bFmVv+mJC1qP0
	ImWtZZmil1/FcwOb7EojTnY3Ijs9PVbkFXMpHaHJJ++XtvkFTNM9IWnmAoE6HtAta/6PW8X5J93j4
	uTNlfhOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvtX-00000007FZI-2uXR;
	Wed, 05 Jun 2024 19:01:59 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuw3-000000073Ml-1X1s
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:37 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-62a089511f9so15304297b3.1
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610426; x=1718215226; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq8gN9PC4V0/WUeYJD+ngNL2/82oznUqnDRsVCEUyhc=;
        b=eHoQbCRQWdzbk7jqAn75VRv068J3wp+Cl8xeWBjZ18byVpf9+X4lgl0/CMmIrR/Gzv
         GoJl66vo4YXkPAJ9xRm0DFLd8XcY3R8EihQo+kYvUafcWsKPJSlcwt08gXi5dPcTDAq9
         NRKcsgt4PLDOqfXZqZMjvR/8a9xUQmbykuPQAF7YNBjfI7U9rWywpho1DjlVS7FZMBrK
         rk1YUhXEFqyCM6sYe3RTlWixUA2WUeOzvYTfDRCeY7lLtbahDuSTuKs8xoDPIY2A3rmF
         RPzOmWkhjG//s97r5GdU/FzAUQkncWD+GH6nfdN+YYe2xs/3ew6I1/WcUTJyUHPE0wCQ
         ysYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610426; x=1718215226;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq8gN9PC4V0/WUeYJD+ngNL2/82oznUqnDRsVCEUyhc=;
        b=a5sIOTHhNOlbOI9kzqV0+K5Nk7tAe/ln9rtLcDToho0/5El+GR+latg21b8ISdIVQb
         VrqI1SuZMjbi6D2otohOBK2Zvo2mUk41CByOfsthpCxMZwlUCFVxc4aHO3FBZX3KrG/a
         JzlsOl3b8SrHXvIAnU9BF9TNk2/XlFwN+Lv7GPztR5n341juyIZMrUniwZzFH6wc0X7X
         R+Z7W6BK2gbG1V22OgPr23zOAv62ocF7TpYr1EEdbTLIVO0KvjDxP3y0tzVCYm2lENCq
         T5T2rwJHCU3pzNPX/Il9tg1Y+yj2RlidC0SGN5c2fvo3BdpQq+psQNoH7Hiq2Ab2SHSJ
         9f8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5e4ohohUEkfQQyGMVoS31+HYYyGHWI6Wk48xpTuO2h+iB7oobcCzbnF/f4553gHmBIx/17s1Cyilif34HOGroGsSlYeWo2W5pbg7qIg==
X-Gm-Message-State: AOJu0YxhloeBA+KTs7ArAWtZSTxtPGMd5dSf0eO1RkDfJ2dur4lGelsC
	5AGjt+1XKRxEy6V4uMOZ65FuAa37NsZGMt2+ONfK+VfYW6aNP++5eXEZMg2+ril6eP0PnMDafos
	Ot/B7dnOUsA==
X-Google-Smtp-Source: AGHT+IGpQQ4ibO82CB++j7EQg4rT4P/RHw0r35tzLXXxO3B/dL6yEQW14Z2L0s1fkq9sPWcVhlzFxs8YqockaA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a0d:d4ca:0:b0:623:be6:d5e4 with SMTP id
 00721157ae682-62cc71784bdmr605497b3.4.1717610426639; Wed, 05 Jun 2024
 11:00:26 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:50 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-7-joychakr@google.com>
Subject: [PATCH v1 06/17] misc: eeprom: at24: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_110031_947161_2262928C 
X-CRM114-Status: GOOD (  10.92  )
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
 drivers/misc/eeprom/at24.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 4bd4f32bcdab..0e8d92d6ab1e 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -424,8 +424,9 @@ static ssize_t at24_regmap_write(struct at24_data *at24, const char *buf,
 	return -ETIMEDOUT;
 }
 
-static int at24_read(void *priv, unsigned int off, void *val, size_t count)
+static ssize_t at24_read(void *priv, unsigned int off, void *val, size_t count)
 {
+	size_t bytes_read = count;
 	struct at24_data *at24;
 	struct device *dev;
 	char *buf = val;
@@ -465,11 +466,12 @@ static int at24_read(void *priv, unsigned int off, void *val, size_t count)
 	if (unlikely(at24->read_post))
 		at24->read_post(off, buf, i);
 
-	return 0;
+	return bytes_read;
 }
 
-static int at24_write(void *priv, unsigned int off, void *val, size_t count)
+static ssize_t at24_write(void *priv, unsigned int off, void *val, size_t count)
 {
+	size_t bytes_written = count;
 	struct at24_data *at24;
 	struct device *dev;
 	char *buf = val;
@@ -509,7 +511,7 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 
 	pm_runtime_put(dev);
 
-	return 0;
+	return bytes_written;
 }
 
 static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
