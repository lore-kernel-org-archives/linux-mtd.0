Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AD5C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 08:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocVvzrgxmSRkUuTbyRVQsL1WaT0s2dxmr4QlHkqaTE8=; b=V7VhtP0C7Aa33U
	gwL+xIo5vMDxDUxfwK7um44dllPTWiokIHCbzCjijeH3tMMCpJB7WlQESGJBIVwSASU/FcV9sQJnN
	GLxGv1m+ebcW8kvno00GwgeQ/sL4WEHKLveYIsrJEVNuukDxnJmSt7ZiBzdjpbN/awBXjYDaTiiBe
	dEdDvsyI9ff/V0Y2N1oY/7l0/S/WoNzBjVjdEx2nhuPmFXG+u/dOGXEPEfA5Ajk+BABjcqXbgVG1Z
	4CMnhx7YD7ENOhvezlp/acVkvuv1YeJiPAEeM8LWghjaQfFP/XNB72jHdZxb8psIjSeLFXSteH6YR
	PtVZgjWBVerDuJgrjXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3SC-002Rlm-0h;
	Fri, 15 Dec 2023 08:21:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3S8-002Rje-2Z
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 08:21:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so4269875e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2023 00:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702628506; x=1703233306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqNjncwqqjJXTlOOAiExi5LnEF+/WvA2Fq4G9Cr+svw=;
        b=eWN7c/xRR+5v7xUL/d1Gr5Qvu+BitIHRiyNojIOvRssFH5yOgJBJYC4RVbnf5QvZHb
         6SLBV6YRm3+VjhqOzTsXC143VpcYpKJ1mKMCcr4yVmn4UvenwkG43zQ4HRHdNroX+kQ2
         LlPiF6a9TZpoXmzZmAE8/+7Bo0+4hTYL1lvoZj0vQjvvVVAQ0VT6mrV9YeAqUJd0mRsH
         e/eeFIe7A1OKp2KTgrKa4mexhJ2nHYZPmiODMVOAMi3qrJRvhACW2MZq1ypSvsuSvhjr
         i1xXhB/BqWF+h1ANGlBxCuya9SpZbN+Bea+sYU5QxnU4+4yMtnj3MrlLxoCqBuHA7dT+
         ou3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628506; x=1703233306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqNjncwqqjJXTlOOAiExi5LnEF+/WvA2Fq4G9Cr+svw=;
        b=L/kIYYDGvqSVRBkvq+IK2a1K+h8Oqye7+e3Q1rpY+ONt8rbkfs+lk/+65JRCx1C8MQ
         l13ZVQN9m6ed3ICCa4ZyCZXJy0G1+qaneBxJp/lbwthBS+xupyMrKZQE/aOIwXKIm71k
         nNdxiaLDkE8O3RzKd8PjYOMxcs5NlMQj5mwMZvgBumbglkGieXuNbJawWgfvI6hO/5Sg
         ZqETGLtpXgViGZq5ezyd+LxMq9Vuiuv9vVDb6TnrwALuPQw9t2wmpv7TrnJuVglhfYNG
         29gQ6HegNqPfo87bMuPdv6SI3/nQYjJ7Ks1tmotW4LaVPi+Ghq+0tlbfwnw+OSw9FdnE
         yAdQ==
X-Gm-Message-State: AOJu0YxzInVwQJvOtzSrmBurDB+pZWC2s5VJHBbnkQJGknkn+vkmXUjz
	9RJEtdBj5uP6gR5bPLvwDwW8/Q==
X-Google-Smtp-Source: AGHT+IEAprxPB8+tgE3JnpMosxNYTrH7hypu72LvvlwTtYzO4+cM2VZVHdoj8gUmTcXKKT9/DpKA0w==
X-Received: by 2002:a05:600c:4384:b0:40b:2977:3d7a with SMTP id e4-20020a05600c438400b0040b29773d7amr6188952wmn.31.1702628506656;
        Fri, 15 Dec 2023 00:21:46 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c1d8100b0040b47c69d08sm30365570wms.18.2023.12.15.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 00:21:46 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	jaimeliao@mxic.com.tw,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 3/4] mtd: spi-nor: sysfs: hide the flash name if not set
Date: Fri, 15 Dec 2023 10:21:37 +0200
Message-Id: <20231215082138.16063-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215082138.16063-1-tudor.ambarus@linaro.org>
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557; i=tudor.ambarus@linaro.org; h=from:subject; bh=hQA5sORbw3xtkYv7YIEfdLni0OPdPoQur1BiyIea9wA=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlfAySzUrbRUhPFtUY+SLXVrH2ZVFiRqJ+XTJmx 6Y8ol5Q7c+JATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZXwMkgAKCRBLVU9HpY0U 6d0GB/9LEbjWhFVspZLCZOYxkhAWms2RGSpBdOGHiBozm1pTqpVVvwgUhHQOoexQ+ApAgD5n+qo QNAAdxWhNakleE9iq5tV8QmhYTzaplcyg+8RlsQbpS9fwMGwk98LmHE7Dt974gmuJNFR+IBYhIS iURU69hhL1D3pl2sjh2NaDHEgQuH4WFqIX8+0zP5WCzDyoFB8vjfwsJ99rO8kcR7fF0wwWTvXC8 YU6aEWiUELfKZkvsZwfO7Gru5IgDkqv1mUZumIF+IV/q8zpgf4phkuAwXNfNDfDaXyGWeYi00gE RW7HHx8c1LR/98xHAE3GF2eR9wF9LRM/x8dt/cPZV7u8YKWz
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_002148_831006_72FEF59F 
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

The flash name is not reliable as we saw flash ID collisions.
Hide the flash name if not set.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
[ta: update commit subject and description]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor | 3 +++
 drivers/mtd/spi-nor/sysfs.c                             | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
index c800621eff95..6d7be97bf7d1 100644
--- a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
+++ b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
@@ -25,6 +25,9 @@ KernelVersion:	5.14
 Contact:	linux-mtd@lists.infradead.org
 Description:	(RO) Part name of the SPI NOR flash.
 
+		The attribute is not present if the jedec_id founded in
+		ID table but flash name didn't include in it.
+
 
 What:		/sys/bus/spi/devices/.../spi-nor/sfdp
 Date:		April 2021
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 2dfdc555a69f..96064e4babf0 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -78,6 +78,8 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_manufacturer.attr && !nor->manufacturer)
 		return 0;
+	if (attr == &dev_attr_partname.attr && !nor->info->name)
+		return 0;
 	if (attr == &dev_attr_jedec_id.attr && !nor->info->id && !nor->id)
 		return 0;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
