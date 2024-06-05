Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94810C27C55
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 19:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zArnD/KlElgdoM+gXIBetFFfJtap2fXJLoPN8AmHGP4=; b=EALhRjynOgKj6TNNcsHdh5Y2uw
	3VC+PQKToCm7c7B1u8EEGuLI93YeKxwrKMCqGAkAQ8TPJtO3CGCmYkQUeycOZMVqGTUoOMfOF8mRv
	OEwM5/CPnLQf+AiesnAkPbW4Yzi5J/9zZehD2g8J7BuXNnraOlH3jJdQdlkqbzyshkp+f25zUcbZr
	U+Wtwpx+AdGg7iEYprluTf5MzemQSvYsQs1dO4ECJETBqaQ98bIn+GSyJ3jNpyMN/PnHvag8Xk05J
	qe8J3gMVw1PnqfIgjODqEu0MyRO6ZIIlS7xSQ3DO37JNgeP0SUbFg6sUqvjV6q5QbV1Gp9giUGtFQ
	9/SI7eAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEw80-00000007Hou-1xGY;
	Wed, 05 Jun 2024 19:16:56 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyc-000000074jG-0X6O
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:03:15 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-62777fe7b86so409327b3.1
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610586; x=1718215386; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kj3F75/M4iGlFf64jdDqM9oitcQAChmy+MmDZHUpac=;
        b=QdT70hC9B4OEr0yZtMB9/JpMfhx7qf7flao6qt2Rq1vbFNwTCpegwWZ7Bia2AV4t4X
         Yk+kY/EgGltDH1Gk9UUtCbUQlI0GP/Hda5jdXPgNzA/km81F1/RuU+1AhjcHf6Z1evl2
         T1tRtd1sk3VVmLV97bjciCkDCrX6/w8fKfrhF8ZSt+HjWxWMPi81MmyjGgd3sjzxhiN9
         xKTvzNGDpbQaqGdbCk6qKzaEp1URO9ZSwfqKiZ+AGC8HXKsk+xFxbCmBWmHyF0c6HFwZ
         aunSeopQW+GktzuGHuztVtqpTlfifVcJknpWtBXlvgPua6mR/+1OP0g5d3qIhCv2NE4i
         8BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610586; x=1718215386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kj3F75/M4iGlFf64jdDqM9oitcQAChmy+MmDZHUpac=;
        b=d9ay8mQXszx3QGCDdooaOUAkIw+NlM3O8KceiwoPVdI8UPmNIAVkt/R7b95OrbFvle
         RZ9m3bqzA0CMdfnJ/FZKVuu6jSNL44qqn4LFiSGm5XG5WaXCJ+hwuxXBbMNydkDKqEK3
         SWzApcEbs8a/8cRuvUBNFc63wP5L6V9R7Yt0iVNvieippOu5r07Z4MzyQ1WcaUjiiwBv
         PKv05YdlkfHyA2fYByTfCmhUx+a3Q5NGX9o5ZFgpDx55nlQFsGM3jDbkbJPgcJ7cMyEV
         cVaEHZlWKAbbjjTIUoFDwgj34+nzue3URYE+2CsmsIQ1+sQjKFAY2dK67D1rx49vbjvF
         dJmw==
X-Forwarded-Encrypted: i=1; AJvYcCUUxNLyUNBvNMbJMTgYrEptlB8eJDZzT3lYTKcWG95KJSTo4i75aJItfbwqaHEj2jIYRLKzYs8Qj8fJEa/aZXZR1g+wML7hlM53IPUqtg==
X-Gm-Message-State: AOJu0YzvVMs650DZlm2wfaVWSeTv7Qi68WIPpdA1KWluR6vwSBZ5AlUy
	+ph4Rd5GpR8qvjkVPIGd6SPUcByBpJiDN318sOEmQmWI0NDiouuMriLtg5u4qRgkYEZetUrZKvX
	rMHcqOyoWkQ==
X-Google-Smtp-Source: AGHT+IG6CBdANF91FP38CmQTKr/LfgQsOsOD0b5R4Rhez9xhC1dP1JVIrpq0leEJ+8nApvlRDSurrJhIyku1Vw==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:c93:b0:61b:ec24:a014 with SMTP
 id 00721157ae682-62cbb309e5bmr5896267b3.0.1717610585878; Wed, 05 Jun 2024
 11:03:05 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:36 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-6-joychakr@google.com>
Subject: [PATCH v1 15/17] thunderbolt: retimer: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_110310_355421_311E8163 
X-CRM114-Status: GOOD (  10.42  )
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
 drivers/thunderbolt/retimer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 6eaaa5074ce8..fa52ea11ec28 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -32,7 +32,7 @@ int tb_retimer_nvm_read(struct tb_retimer *rt, unsigned int address, void *buf,
 	return usb4_port_retimer_nvm_read(rt->port, rt->index, address, buf, size);
 }
 
-static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
@@ -52,10 +52,10 @@ static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 	pm_runtime_mark_last_busy(&rt->dev);
 	pm_runtime_put_autosuspend(&rt->dev);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
-static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
@@ -67,7 +67,7 @@ static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 	ret = tb_nvm_write_buf(nvm, offset, val, bytes);
 	mutex_unlock(&rt->tb->lock);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
 static int tb_retimer_nvm_add(struct tb_retimer *rt)
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
