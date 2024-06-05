Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CACEC25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 19:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MoOiEXm5a/tBM6X7/AzNu9/9K/1c5ydy8+tB2N6Tro8=; b=iOmrq96NeieZGRapi0MPEijCSV
	JR6PoWB7wmDvTwVQ8pBQ7xJbksAnJzRldP7tEmkNhCNTQUx+iO2WNQ/Ggf5Yzj3yE/N2D7o3i05FP
	L9wkFKQTA2YD2Q9ABW0esGrEmC18eg9+AWU1ieJuOwv03i/Wci7hDSTRSWQCfDaBndrAM+kJE7S1R
	T2zn7iLcAju8PxotDpKWa6S1XQcnGX5N6GMlHoGWa3kBrI/WTEwgPPBWzXyg4Re/43mCxzKStI1Ve
	sujZv6Ur2ubcMXW4QmsCNfd3Ay74xZU8/nhO/Akg6l3oEpGbWk59CxTv9MzK4k0ZJD3yi9rgErGrP
	DEKLf9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvti-00000007Fiu-49aF;
	Wed, 05 Jun 2024 19:02:10 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuw7-000000073QK-1TOw
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:47 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-62a3dec382eso603277b3.1
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610430; x=1718215230; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GabZAVwK9FSl0VODpa0rRnhc7Hb5WIAFsUpyNY/Jkgw=;
        b=ckwPFo3b9FzZ80AXhPlbZl9Sp8r43TS+dCRvhO72dZkNabZYg/mR+slPHeMij7v64P
         gm7DBIUCb0VUA07LPR0c7q5xiOTg99kHOtsolNDGvqaNtSUeoYeLmOm0mHZKlwyAYKK0
         YpL0Kb/tYlzvP9+tknUPPJoLieCXOxQ5T8GqhhGSSpFUxV9/NLQstOqTs/UbUhH+fo0B
         vzfwPS5udHr1YQLaojwb96qidYiTc7EBR5Ly1GyBb3UgEhkbwXYuhvwKEt8NrzDujxeb
         bKDXcC3SV98mPeXU3HRwcwo8Tjwuvsp7/CSwJGm2Bawq2OolT7NVN9O4Xwyo5Lv0x8un
         v/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610430; x=1718215230;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GabZAVwK9FSl0VODpa0rRnhc7Hb5WIAFsUpyNY/Jkgw=;
        b=XQT8XmO/1u+3OhvrQx2iS2m9jN90IhgS+8pIQNEjPOzqfrqDY5eRzVYzi6ZhDO5O9t
         bd3JaaXvrMGxUv2Kc9yHX1bzWktLj52ddta2cmInuocpXyetkXtroDD4vUBJXjUVzxnD
         tEy52FFvXjz/xgMA/KPTo3ccL5D8Q4bThRlVl+gQiu1BNGbzNnT5jxXi7simbf7XGInY
         ONtl/S1UzGdLv6/C1xs9vjuFsCqg6MLwLMUzpM5Xfaooh7SGf897O4k9AIU0rHCcPR+z
         Ok8pzgebPU+hmfK17ZOSqSXvhfq80p1V8LnO5muxdO75+Xg502WPVOghzQFgbkEB0hyo
         +57w==
X-Forwarded-Encrypted: i=1; AJvYcCVH2XkgpYGi69HTKWAukSQX8W0VfuUETiQKgF3SDNZfCcNfSkxf5QcediHbQg+0t+64PNUbHEQoWiUs3MD/jxtY3W8Z1gz2I0uGhwzqfA==
X-Gm-Message-State: AOJu0YyPilMElpVbNfdrQiSIytyqKLgNtIzooYM1UWXVLHVBY+zw6LT9
	yWGTtzXSZo/t3KqFUCrEw7lbvYzsNC6zbPKhaFvBo+UldVnqsirq3ueGOHrjmrEN4fL3fHbAhFk
	kNx6ofMIWkg==
X-Google-Smtp-Source: AGHT+IEja+GLVOpS7V2U0r8IR9Z9ZB6nAf9rPU6225JSB7wTRYk1qUU4QFIkeBtYF/8VHx1IHDowrDp0WPzcZg==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a0d:d952:0:b0:627:de82:8077 with SMTP id
 00721157ae682-62cc709af05mr798057b3.2.1717610430440; Wed, 05 Jun 2024
 11:00:30 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:51 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-8-joychakr@google.com>
Subject: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_110037_420338_963A7CD0 
X-CRM114-Status: GOOD (  12.80  )
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
 drivers/misc/eeprom/at25.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 595ceb9a7126..73d60f80aea8 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -74,8 +74,8 @@ struct at25_data {
 
 #define	io_limit	PAGE_SIZE	/* bytes */
 
-static int at25_ee_read(void *priv, unsigned int offset,
-			void *val, size_t count)
+static ssize_t at25_ee_read(void *priv, unsigned int offset,
+			    void *val, size_t count)
 {
 	struct at25_data *at25 = priv;
 	char *buf = val;
@@ -147,7 +147,7 @@ static int at25_ee_read(void *priv, unsigned int offset,
 
 	dev_dbg(&at25->spi->dev, "read %zu bytes at %d\n",
 		count, offset);
-	return 0;
+	return count;
 }
 
 /* Read extra registers as ID or serial number */
@@ -195,10 +195,11 @@ static struct attribute *sernum_attrs[] = {
 };
 ATTRIBUTE_GROUPS(sernum);
 
-static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
+static ssize_t at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 {
 	struct at25_data *at25 = priv;
 	size_t maxsz = spi_max_transfer_size(at25->spi);
+	size_t bytes_written = count;
 	const char *buf = val;
 	int			status = 0;
 	unsigned		buf_size;
@@ -313,7 +314,7 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 	mutex_unlock(&at25->lock);
 
 	kfree(bounce);
-	return status;
+	return status < 0 ? status : bytes_written;
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
