Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5C0C04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 11:51:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0257C2816A
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 11:51:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TkmrzfpJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P71J9B0h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0257C2816A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4hU8KK+DAK5yyadHaRFW1R58YK2CRciBXr3ZAnlYNg=; b=TkmrzfpJXTxKO/
	v9iIUyPxS7tgB/cR1Bct7HfpORenA8vLNhSWmEwGOT6u9RJyFSHmme/lD+lo9HF89xxH7aLqk91ka
	R39lLYGt1uvUBqTjoZOJJRrGCrIPzyiwq3MUdDHgRb7kmkndgsTjTX5ybJyVi7SbVKVde21Ej6UmS
	sdOglMyE5+MRFACWBrPee3FFgzaO5Xcbb/2qZ+19IrEiFL7SvgBDTFJ9sZx7D2BzDe0JdoZLao1s1
	ydRoeBG7i2zj57tbt2YJDrxFI2unJLXY0LcwZAscoRCpuYwcaDbn1uT8qX59J/YYv28MHUhpxPn8W
	cy3E59afulxOqBU6HSrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXlUd-000143-3J; Mon, 03 Jun 2019 11:51:11 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXlUY-00013N-97
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 11:51:09 +0000
Received: by mail-pf1-x443.google.com with SMTP id j2so10481902pfe.6
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2019 04:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r0UV4XAi8BV/7AwbYckW/1tNpeu3R9fbI9KWDMd5+Og=;
 b=P71J9B0h3cCQAztRsji9/ZNGFTZZdIlRiLS4/uWmXzRHEIgDYdn8DHhcBm/VxSwhlb
 uqBwZJnaKhbc62ybaBQdEpXxdqOl9wkBFP30q7P49N1/3kLwOHn7LYc+Xwc2F8psHeDw
 folru3Q78s7AnY4eZ3ZNJUoLTFCirEaj8rS9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r0UV4XAi8BV/7AwbYckW/1tNpeu3R9fbI9KWDMd5+Og=;
 b=e01lCRHUZR8efT22xjAaXOueXFQJH2fCcs5JeTY46hBTWoJ9F+5hKLdzhkrmykdbJt
 8JCCiIhq2wneEJqf9/8U4tFX/L+60y4oHyGtoPXRw0jNO9mE5QDr/ckcsvsRM/Y47hW7
 ax0bef/dUm4JO7L4fRZqpjse+CRLSxc+o15jCvzO9A2C4W+YR54wp65eBjxkw5UQiLKX
 oohwOV0utlwlqBi+UeUZYMRIAXyZ2/tlifo3ZtK5iqLKdBx5jRl4ccGlSTyoQcWsTCHl
 LgmWggna+Xj+H2CN350UdlVOZuGXtMIlGrbTL/4ebTGBbzD1cm97JmYYGH9lQCPDxd3g
 JAXw==
X-Gm-Message-State: APjAAAX4zXjzR70BMny2zqUjaiVWzT5im+D0SiCZeoPvJiidUkHcldbS
 Dc5RmkYf1vwbC/gXFkA9tTy/1Srmts0=
X-Google-Smtp-Source: APXvYqzex611PEXSvxKZ5t9Dj4CTFu5hSCPCWPBRXB46ER20mZSTFk3Kdw/dxzrgPEeYeEJUPKi9rw==
X-Received: by 2002:aa7:8ec6:: with SMTP id b6mr30581769pfr.234.1559562663566; 
 Mon, 03 Jun 2019 04:51:03 -0700 (PDT)
Received: from zhuohao-z440.tpe.corp.google.com
 ([2401:fa00:1:10:e25c:13cd:9607:cc7f])
 by smtp.gmail.com with ESMTPSA id h132sm5772822pfe.17.2019.06.03.04.51.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 04:51:03 -0700 (PDT)
From: Zhuohao Lee <zhuohao@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v6 2/2] mtd: spi-nor: enable the debugfs for the partname and
 partid
Date: Mon,  3 Jun 2019 19:50:53 +0800
Message-Id: <20190603115053.219438-2-zhuohao@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603115053.219438-1-zhuohao@chromium.org>
References: <20190603115053.219438-1-zhuohao@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_045106_326272_285DB5BF 
X-CRM114-Status: GOOD (  11.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, zhuohao@chromium.org, bbrezillon@kernel.org,
 richard@nod.at, briannorris@chromium.org, marek.vasut@gmail.com,
 boris.brezillon@collabora.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch adds spi_nor_debugfs_init() for the debugfs initialization.
With this patch, we can read the partname and partid through the
debugfs.

The output of new debugfs nodes on my device are:
cat /sys/kernel/debug/mtd/mtd0/partid
spi-nor:ef6017
cat /sys/kernel/debug/mtd/mtd0/partname
w25q64dw

Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd1aaa5..52b1a2da9ac0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -3935,6 +3935,17 @@ static void spi_nor_resume(struct mtd_info *mtd)
 		dev_err(dev, "resume() failed\n");
 }
 
+static void spi_nor_debugfs_init(struct spi_nor *nor,
+		const struct flash_info *info)
+{
+	struct mtd_info *mtd = &nor->mtd;
+
+	mtd->dbg.partname = info->name;
+	mtd->dbg.partid = devm_kasprintf(nor->dev, GFP_KERNEL,
+					"spi-nor:%*phN",
+					 info->id_len, info->id);
+}
+
 void spi_nor_restore(struct spi_nor *nor)
 {
 	/* restore the addressing mode */
@@ -4036,6 +4047,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->_read = spi_nor_read;
 	mtd->_resume = spi_nor_resume;
 
+	spi_nor_debugfs_init(nor, info);
+
 	/* NOR protection support for STmicro/Micron chips and similar */
 	if (JEDEC_MFR(info) == SNOR_MFR_ST ||
 	    JEDEC_MFR(info) == SNOR_MFR_MICRON ||
-- 
2.22.0.rc1.311.g5d7573a151-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
