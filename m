Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D3BC25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W90x8eSICvzGS6RVfwtnc/uGnzf8afyuD1/bHdaqwr4=; b=kbfMriuFXysNCZblfTfa1XJyxU
	ezP9qoX2Hd0lC9KkqupcTio5mjx7Xj9qLtw/DYhCCzZHZi3N0FFd9/dyNiwwJ5PvOXP1X30Qtb2IS
	lQEL1n0GqD+ZXA1wRvCHUCLustid2dFWk3eWzzpgM7A1jSGIivMQyXdxX21hd9rgLWy+4i14zbG2l
	nnj9AXEaV2ntvB1I8feQBBBsCM6L/QGIeu3/ISwHwNmChZQCmeXIJsvai+e7itomUE6qnL6QJCC3c
	6hafqrMd48YdDQi3Z1x/N61XY+Jvg1YCrsj/XdoSfX+wHGtzPUk8BSe+NLm2zFO1gCW0R1rt0QRQf
	QQ8GejJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvr-000000073GD-1RSl;
	Wed, 05 Jun 2024 18:00:19 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvh-0000000738w-3z1F
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:15 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-df7a6530373so127537276.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610405; x=1718215205; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEr10taYCu3WGRiwn+CGqfggqJNbp7A+We0V3ygommI=;
        b=Tfm7Fl/SzBvtHEu+ztBK+Ax8vvfRfVmwL6loBRTjvq+xNmyJsjTbsNEXf9cOflOQwY
         mzYv5GEvqlfcvO0x2t/iPgWlCdGxAElzOzI3OYgeGuPkN1LLzR+3+QnrwNMwVYHV+r7l
         DE1E+M5xXsjO70PKtlf1jUvg+aU/aaiL0qAUqobOPRdUQTxpBrus3daZNk2ULDrjin9m
         nWCbi1zhdvPv+U2fI/1i9kObsbZMN3zqb3QlzR8UVAHI/6Sen3I8E61ZbM8ut/OtTqB/
         so55y4GI857AsqZHMTogbf1p4vfTPJPMcK+GJYXtX1gH3v5WDcm1bT3O84ppqlwMKiZy
         IesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610405; x=1718215205;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEr10taYCu3WGRiwn+CGqfggqJNbp7A+We0V3ygommI=;
        b=VB87kTfj5kyqHy0AkfIAOPS9O5zdCMR3C8ajETscM8/uQH2taaw1WtGBK5uvPrmpO2
         Jt4RcAAmAnLKcoVq3uB5w6eNoK/QAjNh/xlxNKO6a+Q5h0SJHDiHLFh8UqykthyG9vuj
         k3EPXeA5LyeweeNLIaUkkDjrOOxFX61SFyhDE9Lu9xdYhvr0bhTfxsc2HQl3xvwXV+8s
         XasOMc4YCfdbXJvaEzYXmb8uwRAbmn1uvchfPONHW6d7sf5xzSRLd31mqjbr5XMAPIu8
         EzEbWKu2FgjV+AK2IBXSOwOoJa7mPU+tdLEYtl1Z3F190NMLBn3zfSVdQP7uw59z1mwZ
         oBpw==
X-Forwarded-Encrypted: i=1; AJvYcCUDPD2HjmlxaH/QjZaUxKjpOw/iWj3bmHfk6SOKg5l61whZ3A8eFejoqU4iY7fbB3wM/paBAttq3ry/bzbeHRBEZIfZTXc3nTaet0syJQ==
X-Gm-Message-State: AOJu0Yz3b1B8Yk4W/6gxana8/qhwXF0Rt4DWqj5/XmmTJ0Xa2ygipGVg
	2NYNo8YmsFpIXAnz/eYGuaZ1OajK6Mb6pRtovnNp9t5jDM1wqg/XduYlPkJ/jpOokLM/GOJVHOW
	CMM0zfh+7dQ==
X-Google-Smtp-Source: AGHT+IEFfd1XOUpmBlCQ8OC96XaGHvsQJFoGDWo7KSg31aa/FmwG5qSwwUZMqSajPkXkOc1t6VuaS9UByNrZ0g==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:dfd5:0:b0:df4:eb0b:8fd with SMTP id
 3f1490d57ef6-dfade9e0f4dmr76066276.2.1717610404805; Wed, 05 Jun 2024 11:00:04
 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:45 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-2-joychakr@google.com>
Subject: [PATCH v1 01/17] hwmon: pmbus: adm1266: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_110010_090250_AEC9196E 
X-CRM114-Status: GOOD (  11.77  )
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
 drivers/hwmon/pmbus/adm1266.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 2c4d94cc8729..7eaab5a7b04c 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -375,7 +375,7 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 	return 0;
 }
 
-static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct adm1266_data *data = priv;
 	int ret;
@@ -395,7 +395,7 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
 
 	memcpy(val, data->dev_mem + offset, bytes);
 
-	return 0;
+	return bytes;
 }
 
 static int adm1266_config_nvmem(struct adm1266_data *data)
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
