Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC8DC07D5A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=msknxFCortXshY6BpMWHA4Iz7pU5l1F+clsaO00GMyM=; b=k9X2LrZ2rCqW8s
	xgY4sRT/4kQwZUarmJqI+gVL0hdtICRsEQmbgTqM8RxVC9s/l5aObtoW5hsOTEA4HuV++MJ19B2Th
	2njiSDQ2q9DcZM0gNqxiPd9iKnecW760jKiW8zshwa1rEQX9tajkkJi5ISOlOA3kcwgXcMLk0nfOy
	UU4mlJlwFhhxc/SuApNvwdA07HSo6UG/u6vI4vdIvV+ND5uNkIUV+lRa773tEDWe3YO8gp1Brjqg3
	zgGjPazPjwEB5gLqPzhCGYy1KIacS5N4o2KzyTcRJXdXXZreL+a2VixYugLqFRF3yhNxxWnkw7gZ+
	JxMOfdfe+b1Sh5n+2rlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ex6-0034go-1U;
	Mon, 27 Nov 2023 16:59:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ex4-0034fk-0R
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 16:59:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40b427507b7so12673565e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 08:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701104352; x=1701709152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ35+8dHLOqajNjcQcF3HUrNBv1ZIoocmdTe8D0V50U=;
        b=IIQiRClg/Eaj2cEq7k1gOrSZyjqHQ/r1rp71ix5IoTegefPM7cvhFT8qjVXKUe7vBG
         yjLD8aMnCIZggfZjGiiCZ4iEYrr2T09GGHhv+53GFE42TMYZrp5uKkghWRbY5Vfm9flw
         cAaoKfPq049cB7JSqkK75dABdDax1GfOpWeR8t2OWmNema1k1e20CZMSTqw6FFxhRNkR
         CpyaWL0kXjaLEX0YklE35m2Kz78WLMDQE2GY4ytyj/sMcMnO1aWm3tmXTQG9z+cJ8xka
         lVXOhFqMBTgm4JgJRfu+QOHSkLpA/vfQo3J4YsuFckvUurvUAVqbdKpiLsGWcZOmhqi9
         fw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701104352; x=1701709152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZ35+8dHLOqajNjcQcF3HUrNBv1ZIoocmdTe8D0V50U=;
        b=eck/iYGaIUBHEHaUu1bJxym3r00E/qfXKFN3RVrPCqvv0emZZlCL/MfqtqxjOqp3IF
         60pHjfyD2eVwsyneOvO8gvptEawBIb8UGRl8QyIGM9Vv0zB8+ktLliy3Qm5iuI9HohXq
         NVjWer5OFkKS1y7YNAnDguNgEP7VYkZtHvS5ZjGbLxJeFj2G/ZtRX20tYD7WbksNv5XD
         uziNa4lX1tTU2TdYgCdLZjtRHC1ctHmfyzb5Mti0HkHgv4P0lmF83W2rSgFvRGmnMEnh
         JuozM9Lyi9PiSAzpeSJjOme3+ZT+mkaAeMWU5p9wQF5bwS7PR8gvBXs+cWUKoWT7qfii
         8IwQ==
X-Gm-Message-State: AOJu0YzkmVV3c07b/RsFdZumc7ShV3HB47UwcFPhHaopu6WhnXXOuQgO
	qA4XT144xE1CIj0uP5PQW4G1pA==
X-Google-Smtp-Source: AGHT+IGWC72QjNtBr3UIdhR6rkbzgM5TklxBcQjl+NxEKQe4jMzhVI+BS9Zs7YJNA+tiYEYe0JaYoQ==
X-Received: by 2002:a05:600c:296:b0:40b:47dc:9b9d with SMTP id 22-20020a05600c029600b0040b47dc9b9dmr1733483wmk.40.1701104351691;
        Mon, 27 Nov 2023 08:59:11 -0800 (PST)
Received: from ta2.c.googlers.com.com (185.83.140.34.bc.googleusercontent.com. [34.140.83.185])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b0040b34720206sm14477219wmq.12.2023.11.27.08.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 08:59:11 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	miquel.raynal@bootlin.com,
	jaimeliao.tw@gmail.com,
	jaimeliao@mxic.com.tw,
	pratyush@kernel.org
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] mtd: spi-nor: stop printing superfluous debug info
Date: Mon, 27 Nov 2023 16:59:08 +0000
Message-ID: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_085918_232418_25CDA595 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

The mtd data can be obtain with the mtd ioctls and the SPI NOR
flash name can be determined interrogating the sysfs entries.
Stop polluting the kernel log.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 25a64c65717d..6de76fd009d1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3517,25 +3517,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	/* No mtd_info fields should be used up to this point. */
 	spi_nor_set_mtd_info(nor);
 
-	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
-			(long long)mtd->size >> 10);
-
-	dev_dbg(dev,
-		"mtd .name = %s, .size = 0x%llx (%lldMiB), "
-		".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
-		mtd->name, (long long)mtd->size, (long long)(mtd->size >> 20),
-		mtd->erasesize, mtd->erasesize / 1024, mtd->numeraseregions);
-
-	if (mtd->numeraseregions)
-		for (i = 0; i < mtd->numeraseregions; i++)
-			dev_dbg(dev,
-				"mtd.eraseregions[%d] = { .offset = 0x%llx, "
-				".erasesize = 0x%.8x (%uKiB), "
-				".numblocks = %d }\n",
-				i, (long long)mtd->eraseregions[i].offset,
-				mtd->eraseregions[i].erasesize,
-				mtd->eraseregions[i].erasesize / 1024,
-				mtd->eraseregions[i].numblocks);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(spi_nor_scan);
-- 
2.43.0.rc1.413.gea7ed67945-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
