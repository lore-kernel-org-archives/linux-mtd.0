Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B40DC25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 18:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Pv4H7BEJn/NoEBaMav3joB1jomg4rUVlYA3mLLjwi2w=; b=2C66uli/P7SjpcyJfFOJm6se+B
	ntv9Tuc5ayk/C1EMB6r28NeUh8NZAXvxOvziS94nF+h06pfBnBBsCQ/NwrYl2qHmHzHOtH3ibFDM7
	01NUA4GfCx46pf7uRHaIIt5TchRCbx2F85z0D2kFYW3Mal7f2qLwVgE+LfuC/RrGtCEKVmAyvv9DA
	ljVaOUthuFU3xUDJd5pHFiUbqZISN7r1Nr5cu5fg9rIk+zx6fHRKuDtyOdFiN00LIB6xDRONILKBo
	hLgZOfH0vsVo2KQ9xQMDgePQkEaBVRnU4SHr4jEhfllzR+SoDLr4F5zeGo1ray2YQ21dbL27Hc1Ue
	yXChn5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyd-000000074nF-22iz;
	Wed, 05 Jun 2024 18:03:11 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyS-000000074b0-2s51
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:03:03 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-62a08273919so357597b3.1
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610577; x=1718215377; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gIyLXo+tPpGJoYrLFVnPX7LJcwSjEvXHtDXEdVowSIA=;
        b=p2xkmw5M7ZnarbMsm/DgN+4xO3Z6ud47ahYIkPvnbNR3VuSosCOc4J2nOpFkQKFqpK
         OsqDlYqYMi379ocBtS/ZDcudAhqf8HR0vKpOJqndoLdUScAGp90XDVA9WXIGSCSCshFR
         4YsULTBV36ZS46oo2iKS5RfNggB5ZxYrcdyL/SYYrnYTFXQ9SSQVyz2s+IQHv+/wWvfK
         eLNyao/AAfTW3sp3d1YruNCWDF6EE4rtkVtPRNSDidWBcaJ6DptsYrzOlVQYctvWsET4
         N7pPiMM0DT+cKcpMQ0SvbZut5QdvvKzcv7a1eI+7+U6CTOoBejgE1IPy3zq1gOoByWzS
         FQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610577; x=1718215377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIyLXo+tPpGJoYrLFVnPX7LJcwSjEvXHtDXEdVowSIA=;
        b=QqCs0+3KijOv4TnP4x5VGsFzCE0MCET+x57wZgs7UwiHcWeGcbZtm8V8edNIIR+dpH
         O6Acunx4YM9F07xWnnrC/z+2QXbTbNt1zdlavmYDmsQK5LIU3oKR8tS6Gcq6lZL/1Qs4
         bZDqVJZVnyW6V976ZSug5U9934QHLyJ11IEjAQQo2cq4q7v5ntyZ705mZpuDkdFZdyTF
         JBlOIFgQ1ALLS5V15KNECJ8OkMcl8VDEM5BZMrfleDAQEWdA07x4hw+u8SHrTypUrCWT
         AS9HwlrxOoRvfAzksn3hvST/f+NFhxaSd1hhRIrICQ8FArGJAIm5BOUoigu8nJ8vb5mN
         mXCw==
X-Forwarded-Encrypted: i=1; AJvYcCUs8s9eIgHCDGnlq7SrI1LNrZYY+9AIBSbMwGczPYwptKksWbrGSfYKHoC20mgKOMaAX13/Fu2fX9on8srZWRgEW7vJ28kM5s11Z+N4Uw==
X-Gm-Message-State: AOJu0YxVVY3RkCkThA5b8Jvk1kgamZT84oi5CykWyO2Xt57OaHiCHQZW
	SysqBsiHQSGkcAALhGowdpN0BQ6uHbbyB8o+bI24Ew9YJ8/RwP+5HhNKBX/jLpJhgaXLfXhCK/I
	hCpBp15Y50A==
X-Google-Smtp-Source: AGHT+IHG2azfatKIs/LKs8bXyfwjNeJAhdZhoJHXxOf8ZfbWIWN9yiXy7wSmGDJ/xHP8XZ6qdqs5ZKpzypDE7g==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:887:b0:62c:35fd:678b with SMTP
 id 00721157ae682-62cbb5ab5a2mr4622397b3.8.1717610577229; Wed, 05 Jun 2024
 11:02:57 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:34 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-4-joychakr@google.com>
Subject: [PATCH v1 13/17] w1: slaves: w1_ds250x: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_110300_830290_73339B40 
X-CRM114-Status: GOOD (  11.81  )
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
 drivers/w1/slaves/w1_ds250x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds250x.c b/drivers/w1/slaves/w1_ds250x.c
index cb426f7dd23d..369de01cd84b 100644
--- a/drivers/w1/slaves/w1_ds250x.c
+++ b/drivers/w1/slaves/w1_ds250x.c
@@ -137,7 +137,7 @@ static int w1_ds2505_read_page(struct w1_slave *sl, int pageno)
 	return ret;
 }
 
-static int w1_nvmem_read(void *priv, unsigned int off, void *buf, size_t count)
+static ssize_t w1_nvmem_read(void *priv, unsigned int off, void *buf, size_t count)
 {
 	struct w1_slave *sl = priv;
 	struct w1_eprom_data *data = sl->family_data;
@@ -159,7 +159,7 @@ static int w1_nvmem_read(void *priv, unsigned int off, void *buf, size_t count)
 	} while (i < OFF2PG(off + count));
 
 	memcpy(buf, &data->eprom[off], count);
-	return 0;
+	return count;
 }
 
 static int w1_eprom_add_slave(struct w1_slave *sl)
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
