Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F18C27C52
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 18:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VfU8CZchW081lFYNYSmpEXpxciBRhftW5eoI4/u0ozU=; b=kVrxPEF++t020dV2QE9B+UIq2l
	7zmakCvwpNYo7/q2pSZDkFywYuJY90qPbsKSQxCs2C2pC66242aZz6NP7lK6FG4ho7A02YMaODgkP
	2YxDXuzH3YXN9Prt/JGAjThtJGBAajOxWeK/LJqOr/qiuoZfqGKXJEm9+/GmvCD7LARu4V6K43Rhl
	T30Xl0t3gtFFUocfcOn2kCR28oWoj+VvDmAu5+pdyao+gh4elAgImDFcNqZAmmDBdBhur4YCxKkCE
	UtRNZ+5tmULGWUPKsjL0jhCGITbuQVt4Nf3mRT57ocL+PrCAjoAGDi4U4otdRqmWnAiOsDH9J0fTt
	ZonuIy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuwN-000000073ij-3Iw3;
	Wed, 05 Jun 2024 18:00:51 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvz-000000073Jh-0sHf
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:32 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dc691f1f83aso23619276.1
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610423; x=1718215223; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oWEvs7lXuHPW/wbGZW3HASpAVL3QgOZ/ef+Ervw8nvw=;
        b=LXVFdLSNn5f8aX1v/sXHtqs3bcIUwvw60RsKzj2iM9bZnhkzjxQOH5vgGrJ1kw5r3V
         ftJBu0wjezQSsANOg4d1VJbOwxj/nyHX7LDpKUatbQtQvj35QeFIqVmnkQqR5Aedl14e
         l0rS2s9l+AHuoCEknZK8h/tHw3o/6i1/qdna4Q0bRTpMPyw53nfCCcEXYqVFtOi5D+qZ
         I7O3KmJCxEL5eZixpzDCUcz9HSSLx4G4qpp7Thme1YNwexIPCXi2tHrMTWYfOybefIpe
         Ioq1DrJyIdpb8ihs74NCQ3ogFIBf4E6jDROdkzfjtvy+/p2lGFEeT4upAnCNHmn/eV/s
         ot3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610423; x=1718215223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWEvs7lXuHPW/wbGZW3HASpAVL3QgOZ/ef+Ervw8nvw=;
        b=wnOqku3mZmij9oJQEo0qMa8l6siTUTgxiXuTaUZJkfqeb/f/6n2aqRKGEe99QT+0AI
         sNZ/dtDZqjh0vx2gnRe+O1TX67vJOoWFoBLRpCD/OROM3XO5AkTR7tvWqfqn/6BaTMgW
         ekUm1jcT311XCqB8XTRep77meR/oPAwPMo1JEW+Dw2C5yrFHfFV1sOkKWnOANpebJKx0
         upc4A9iIcEN8vdaN0B5QNlljFwZFJjV9c1QPVd1WKWKj8C/9fHx34qndNjq0Nh4Bqa7y
         /4qUSHtyv6awS2dbWLaFp3TjmsEA0CPmUn9YEuuwpJaf4FcR8x9jD1WRkh9LjMWTUZ86
         vSKg==
X-Forwarded-Encrypted: i=1; AJvYcCVq36eBoW+YRyHa6TyE2cHpu9CxatVrHZmZPUaMjs5Z7y9H6PMWZsavlRoB9VPCQw3bSBQCn0l5MQnzXUzFtAPRGLhV5QhK51K/LmEgJg==
X-Gm-Message-State: AOJu0Yw9fz7kYNMREeKyr68iLkV/g74JqoxqHUa9ycp/qn0sKn6ldivu
	9KtNVJbDe4Pr7RpzzjWKughLhL43v05pur9hhCj+hfRTCTw0jZ9+FoD53U08VFZFhsC6M6HBc+d
	JjW0+F3zisw==
X-Google-Smtp-Source: AGHT+IHzBpKnrggHmMHMkvKX90wRDGnyxC/rya4wNnolxBy/S7eZxADMs2JOhL4gs65LRvS4Cl380vcS0L4//g==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:9004:0:b0:de5:a44c:25af with SMTP id
 3f1490d57ef6-dfadec0b255mr68771276.5.1717610422643; Wed, 05 Jun 2024 11:00:22
 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:49 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-6-joychakr@google.com>
Subject: [PATCH v1 05/17] misc: ds1682: Change nvmem reg_read/write return type
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
X-CRM114-CacheID: sfid-20240605_110027_533365_406F6301 
X-CRM114-Status: GOOD (  10.47  )
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
 drivers/misc/ds1682.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
index 5f8dcd0e3848..953341666ddb 100644
--- a/drivers/misc/ds1682.c
+++ b/drivers/misc/ds1682.c
@@ -198,26 +198,22 @@ static const struct bin_attribute ds1682_eeprom_attr = {
 	.write = ds1682_eeprom_write,
 };
 
-static int ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
 	struct i2c_client *client = priv;
-	int ret;
 
-	ret = i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + offset,
+	return i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + offset,
 					    bytes, val);
-	return ret < 0 ? ret : 0;
 }
 
-static int ds1682_nvmem_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t ds1682_nvmem_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
 	struct i2c_client *client = priv;
-	int ret;
 
-	ret = i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM + offset,
+	return i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM + offset,
 					     bytes, val);
-	return ret < 0 ? ret : 0;
 }
 
 /*
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
