Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349B9C27C55
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 19:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=T7aUmiarQFGEYNwYbafflSgTIA79xEo2JrLF8UBRqes=; b=BWpvT1swTUxvAp019RpdoB6QT2
	vtqm9gWco0IHXdJNDpqV4DLa9HwNwk79B9A8huGbQjpweR5sE5daOueRce5Ekkmjutq5wiZzb7Jdh
	ietyA568UaOggU36JSCLpLcOeT/GNTVqD5VBJ7HCIGCcBiZ0URyxBUizehk7mgTjvctBOl/Rjavio
	XvsKz1iaELmGYRsNFity1Vy/gm4BXzLLDzvp5a4wfDdT9fPGGyRFMXXeVWGYZ/54FlWJpFQKBXmgd
	E6q166KqNKQllc1ENHCuCJ/ixLvEsxnUvortkNMkAWC6yPvIisgH7gQStDXwNzjipEv0ZKg+JcFsz
	xi1rkCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEw82-00000007Hqo-3Z3d;
	Wed, 05 Jun 2024 19:16:58 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyg-000000074nL-2VC2
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:03:19 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-62c7a4f8cd6so745107b3.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610590; x=1718215390; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqJdwI0kfu08l8zta4NZb2Dhq8rse0Xjye+A2f9mH7A=;
        b=4VxQrumrJ1mKCsy33vQUWuhkVGTGf5Eb/hWWkDMXaG224lH91aZFOV+hFSKK4v0Zqr
         qLGhn8S5T6d7N4qSbx0Ly3IDVxPVXAxIe9vxSWHa+hzAmCvTdJAtPtHo4lnz1mfKbGY7
         rCaNqxknmwPWzxAXrvhdMeHD1u4WQMli5rSWu3bohXaefp31AIrYDD2Tm26TnimHmQBH
         xWcc6QT8zhBG6ZJzbIEGPOvwkqnDS2nkAHOrAJwFaHES8Ti3C+iP0MQlD2qya1yQpdp9
         GSvYZpvYUFyslKyiPjWXjS3NT4MOh11ysGpvoVGdI3CZBRyYEduzehPErSdMEn4WCdTJ
         gcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610590; x=1718215390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LqJdwI0kfu08l8zta4NZb2Dhq8rse0Xjye+A2f9mH7A=;
        b=ralXeZqPbCrkpaM/kMOF2jwj59xmeIB3RhWLrO/yXLj6IIqeLSQLHwO3MQcUW3PzyR
         OKt809DPJ4ZBpOkW7fcxd/TZu45MC91F8OLQd/oqKA+xMM/7EYY8iWsPvG4PUiJcwwEd
         KSRDfPrRf4EftHxfwOyyhCQXASPVL92Kan2vUX/hqO8HOkP5Us7zBxferdAcB3FXBUTC
         6wOo9VgqkOH2dtpr+u1a47RuaEHBLOkCRMwxBFNIHHHAMFffpA4NZKQ5olFpHlstnBhS
         SZgAHBCxlI1NVZbSn7BXEdI199SyCs2JtnJ6qWO9HCXnvpngi1PXIT8WfpnfdLYMluVf
         CsVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG4gOp/cIMvXlifQW0sn9EcsJDfAuwHFluXg4NJNYOrDyRx34SZVCQoL4rCHozf9QTkG8M50v8gDQBwAqs9qNXqYhjT8eMUza8nkJhKg==
X-Gm-Message-State: AOJu0YwDvnbn1TUiU9DoX+viY8Y4ORpkBbxbn6KWIFejAYQSmrlZbosV
	rRXXcGIc24dL2BaheJsn6NeH7cD2LnQv4rOlmTojUuxb1xOLlcZD1Rcq+wVsqG3DIl+GNXzwkYU
	fvDiIFjwNkg==
X-Google-Smtp-Source: AGHT+IFarMTHRQyaGAXOhvjvZC3Ev9S2zTS3Kvs5hpqZrMnxro2/BzrazXCSnRirdCi4qPaGa/c0QONTMKwCWA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:d608:0:b0:df7:d31b:7a29 with SMTP id
 3f1490d57ef6-dfacad1dc1amr763889276.12.1717610590398; Wed, 05 Jun 2024
 11:03:10 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:37 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-7-joychakr@google.com>
Subject: [PATCH v1 16/17] soc: tegra: fuse: Change nvmem reg_read/write return type
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
 drivers/soc/tegra/fuse/fuse-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index b6bfd6729df3..1b067dd8a585 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -96,8 +96,8 @@ static const struct of_device_id tegra_fuse_match[] = {
 	{ /* sentinel */ }
 };
 
-static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
-			   size_t bytes)
+static ssize_t tegra_fuse_read(void *priv, unsigned int offset, void *value,
+			       size_t bytes)
 {
 	unsigned int count = bytes / 4, i;
 	struct tegra_fuse *fuse = priv;
@@ -106,7 +106,7 @@ static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
 	for (i = 0; i < count; i++)
 		buffer[i] = fuse->read(fuse, offset + i * 4);
 
-	return 0;
+	return bytes;
 }
 
 static void tegra_fuse_restore(void *base)
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
