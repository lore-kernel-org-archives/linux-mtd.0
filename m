Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C05C25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 18:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DJ3/HzMA90mX7GPJ5KHEIb79PvSkJPd/UcF7SWiMC+E=; b=jSWy8uB4V5ZNY+3B7KZTiZE9js
	E9v0zOclr0xxh1iTgcu9VlGpB/bpyCrx+WLgbR6i0eQAK68hIhdJhWgayZVla5HowAF53JffbCu5M
	z7OSXZU1PgsC2ezyaGpndKpyC7VwC6QY2Tp8XpHmzqOYdXHwr/qi7NcxHCuLHEhdTtz7V74YMa135
	Wm5TO3fil+AJdFsvLe9eO47TDYd8oSHDNe3XVSLNpXC4YLXRaSXHVQHeGD4y7uSl4YPnXHmnZr6qS
	brPhxTf4/pAg8Itj/41fr0XLTV/HywapShafGWdU/uDOybfhqXaX1froh5ROEJXhwbkJSXEC/qzaE
	qk7vO4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyO-000000074ZN-0CIh;
	Wed, 05 Jun 2024 18:02:56 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyK-000000074VO-2SNs
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:02:54 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-629638f1cb0so235947b3.3
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610569; x=1718215369; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUTCTG4PiwJpsjy0QKETkEiNDEwH04EYXsIQhajeZMg=;
        b=IR/DeYKNMovsS1s2UDxRYLH6q9DJ71xQWy94cfrvIGmI1nreETvgX2vD5YFJseh6Ln
         CSY10mgNWg4jNFuZWvy1Vrlseii3iG/SPeoRgqZJ1cYtNLM4jxj0GnTKTurTf4JBcd62
         QopZOZk72Ffdl8P2CUTcxgO/V3mpXjdDpNIg7ymZdXfypf/lfwAajpnchNaVonsc0T3L
         2gd7X/0d8l80WH04zVQHA6LKQOVGMxg1f+XllghN+GYxe3NaE1VCmbUJUtZVVY4bpqlS
         QJY57rAYkbMDJxpiBz7C/Su8aIGT1a58sFj8lEwtS+k71guvv48lmVaF61hmugppvqdP
         twnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610569; x=1718215369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUTCTG4PiwJpsjy0QKETkEiNDEwH04EYXsIQhajeZMg=;
        b=aV0kPRxh1Cuk3lSYz1sbAuNa0iVPDv1ht0bkZHG5faCQEVT9wJ5GRCXhjh8e4r6VcL
         X0IpxH8S4IblB77DBiWA2da/uqkZ4AwXnlm8RyKf0TqXEZKhZmFt9kE6oVlJ0qF14ogO
         V+y4N016fcPf3S1ffPN1kUDdT+IQ3gijQfoY8A+pNiTbnx5pyyekN5xbi1ZT2YiK3+hv
         FAUGUxqvlO/uVRQgbIg7mCK2FHpzbnc0Ao9Oc85ijr3o5rnekwC2JLe4w8cYSdTX6AMN
         +T9ZzM6QlgRMF9f3xTos8rJFNRdO/GYLU2YoDJ/Q2nccAqwoizqF3T9V/PYZM6xYPGwb
         hseA==
X-Forwarded-Encrypted: i=1; AJvYcCUMqo2gsxu8Vnfsr8/q1SC0Eebmvj0fRFM40sBU3wPFOi7hCHpiHAxGcgkcK/Fb8lBhoCIhQZDdycKaitekygh/e8loe8PIC9dWHd9koQ==
X-Gm-Message-State: AOJu0YyRzcdRCn3LRkIttXBURA0znt4QLp6YXzDk4tt1DyssfcIjDb0s
	LXFre91vxVkloKqewS+AsqCjflibRGkqmoHmAKuJIdeY/RZ62xK/A5CvVU2QNeGSQrpcq8goc6F
	9rrvpsrICbg==
X-Google-Smtp-Source: AGHT+IGRE1l9odt4GG6RaI8M/uHdLkQEjh5Taz0VKgQ269YOTeE9TiCNJPVhuqv1Ry405YEIQ6hIdx0yWPVe/Q==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a81:4c07:0:b0:62a:415b:a137 with SMTP id
 00721157ae682-62cbb4a2295mr5047937b3.1.1717610568813; Wed, 05 Jun 2024
 11:02:48 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:32 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-2-joychakr@google.com>
Subject: [PATCH v1 11/17] mtd: ubi: nvmem: Change nvmem reg_read/write return type
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
X-CRM114-CacheID: sfid-20240605_110252_675892_3C65036C 
X-CRM114-Status: GOOD (  11.43  )
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
 drivers/mtd/ubi/nvmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/nvmem.c b/drivers/mtd/ubi/nvmem.c
index 8aeb9c428e51..eab14821343d 100644
--- a/drivers/mtd/ubi/nvmem.c
+++ b/drivers/mtd/ubi/nvmem.c
@@ -20,8 +20,8 @@ struct ubi_nvmem {
 	struct list_head list;
 };
 
-static int ubi_nvmem_reg_read(void *priv, unsigned int from,
-			      void *val, size_t bytes)
+static ssize_t ubi_nvmem_reg_read(void *priv, unsigned int from,
+				  void *val, size_t bytes)
 {
 	size_t to_read, bytes_left = bytes;
 	struct ubi_nvmem *unv = priv;
@@ -55,7 +55,7 @@ static int ubi_nvmem_reg_read(void *priv, unsigned int from,
 	if (err)
 		return err;
 
-	return bytes_left == 0 ? 0 : -EIO;
+	return bytes - bytes_left;
 }
 
 static int ubi_nvmem_add(struct ubi_volume_info *vi)
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
