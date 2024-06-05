Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F9FC25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 19:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D/HsoI4hNKUI0RE5WtYVW15jh3S+Ct/IzRZdH15rFqk=; b=icTrOpnCiQVPxd2fTEjEnlFzLG
	XLH0q19Ssih7Bqz75bfrQG87/UWZa/VCRocRurjhLUFUrHXTLd5ejCpSW880jnqkE9a2TNguIz/mX
	hrUYI87kciSpRKEk+FLdhz9jiNy4k82papdRt5tumtPdPJ8vEBjc3BYiknySYE3h8zemSaQrbD8AK
	ZEAf89dTDEDkeg2CGHROICtDl3a/b71PlA+O4TEbwGkJLDTQ1UqGczZYMlVAOhEYzU4J91gMkQyQd
	zrOpTloaEVxWDcUPbqTILqxZ618dOiE1CObbF6YFY90d6NIk9KFyO+T4DAF6XB2teU04BN4y1WC38
	65mGu66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvtT-00000007FXD-1v3N;
	Wed, 05 Jun 2024 19:01:55 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvu-000000073Fa-1UCj
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:25 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-df7a6530373so128328276.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610418; x=1718215218; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AwIs39A3C8kh3vVRuRyRYkps3QbjGarBaeH82L3DU0g=;
        b=3izzRDs3YSqxJaztguej5MpeKR/z+qM9sPEGdEwMav04okB5J/1iZSYdj0cCQZpQXF
         tmQgyUIZx+FVI44l70AS/B4iUYaQTtb8FQjP9uz5PuKbFkGft5O2jz6qb5CxDyHLn64g
         JfN+8/L4Ju7Q7gl4AK8LlGe035qqaAJwcuuHrYROUAVguTScxtptbBGYU1MtD88YTvYf
         evHFcHGgIv0GTkKVgETbeZSa04BhoAMmXPU1KcdeXCN4Na7EcmkZ8XacylS9r20mWw94
         PMcqXwUTDmF56atof7hL949YYHM1hYysUmnv+lH3jGWueQMW/zneCnaBpZp5ybcvrgeb
         E0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610418; x=1718215218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwIs39A3C8kh3vVRuRyRYkps3QbjGarBaeH82L3DU0g=;
        b=IIwBuNfuOwhASm3QOytqG1NTyuOSGypcfX7wTUiE8hTfQOR8t0FadxlWJ/TJYTKBIu
         EQQtrWFkQFPKVeagP4LZBFcts5Z45Jl/K1NG31VA4NAl8mSqOzhn3Cv3sDbxZaCgHFom
         iCduN9oWq8csgr5dogWPeyR2WVa6nW47z2beFaJSJZu8EHLPsa3CLa6RqV0XpPBJrjts
         swGFQhjFHycmL+gca1o3g1IP75L3GxFNCXaKsH6ReP/0kEhUKWLa6zVoIxnpwMISPEhn
         DPl9dmVUlLqylWosCckP3tPkQWs+KimwdckVYsTpP0FRrRRByZpAoZ9g3fuswBbMZ4B3
         YzeA==
X-Forwarded-Encrypted: i=1; AJvYcCWjVLl7oSQLc0dp/63pIVEa4I83I+sdTUKJPdYph6GxfRbXWHEyNrM23yw2JXk/y4UVEg2y3MBrcGZNEqtptEhvcVOuj4W5WbpDiWhmIA==
X-Gm-Message-State: AOJu0YzEZLrsbrkEl8xaoR+rc4HwUMtVLcwunYEy6KCWw9dubdNK3Oq8
	R0ZYaGCjJeVTzXfjzniyNCI5ZM/7lA/gVP16w7YPWPezpoHOK2QnhDrWPx6OK+bgCWeThMjXbr2
	rvEJdHSaElg==
X-Google-Smtp-Source: AGHT+IF67RE9Tjmuj/kq/k/X6dA78e699FHOj3MI1LHmpXg9uh50LZwtSgAXRWUPUOYrgrIfYkhy+wDlS5BIsw==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:9004:0:b0:de5:a44c:25af with SMTP id
 3f1490d57ef6-dfadec0b255mr68711276.5.1717610418012; Wed, 05 Jun 2024 11:00:18
 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:48 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-5-joychakr@google.com>
Subject: [PATCH v1 04/17] iio: pressure: bmp280: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_110022_583855_92F6E6F7 
X-CRM114-Status: GOOD (  10.46  )
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
 drivers/iio/pressure/bmp280-core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index 09f53d987c7d..8d5aeabfa297 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -1465,10 +1465,11 @@ static const int bmp580_odr_table[][2] = {
 
 static const int bmp580_nvmem_addrs[] = { 0x20, 0x21, 0x22 };
 
-static int bmp580_nvmem_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t bmp580_nvmem_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
 	struct bmp280_data *data = priv;
+	size_t bytes_read = bytes;
 	u16 *dst = val;
 	int ret, addr;
 
@@ -1518,13 +1519,14 @@ static int bmp580_nvmem_read(void *priv, unsigned int offset, void *val,
 	mutex_unlock(&data->lock);
 	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
-	return ret;
+	return ret < 0 ? ret : bytes_read;
 }
 
-static int bmp580_nvmem_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t bmp580_nvmem_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
 	struct bmp280_data *data = priv;
+	size_t bytes_written = bytes;
 	u16 *buf = val;
 	int ret, addr;
 
@@ -1582,7 +1584,7 @@ static int bmp580_nvmem_write(void *priv, unsigned int offset, void *val,
 	mutex_unlock(&data->lock);
 	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
-	return ret;
+	return ret < 0 ? ret : bytes_written;
 }
 
 static int bmp580_preinit(struct bmp280_data *data)
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
