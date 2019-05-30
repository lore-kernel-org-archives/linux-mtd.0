Return-Path: <SRS0=l9qW=T6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5009FC28CC0
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2019 15:21:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 224F225CCB
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2019 15:21:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rj5zCiCJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="frlHefSp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 224F225CCB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3pl1l05xtNYQ+M3QTH9AM3263dpFNqww/O0a/1SIVU=; b=rj5zCiCJIWkF/O
	iEWnh0qgTBYrngphfdThC/twAFejZA2ZIXV4koehDlEV8Y10qgNjT2dygK+YQsCFPJ0moeLLSVoQX
	BHIHj7FnY4RHQfWt5d9uLbY7o4nq8EPSoQIu4XqCs+c2rt9FmUfbjnJvDczcnUFjK8ak8JOF1/3KW
	Z7mF6T5UPZMFMz7IqyEU9sKWM+aLvcNf+XNAWA0rWnhkzhdVTYI5Fe9QcrRsQJip5yiBGGYIyhf2u
	E4/PX8Ic4vadCTNlOflCUPyU1liE+vLJYISVCvXfvGtbLrUVqf4/vslRlTmzhT3ozm1zcYQbVcmRi
	IKev36g4nrBe6oqxcYHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWMs0-0007lU-59; Thu, 30 May 2019 15:21:32 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWMrw-0007jq-UG
 for linux-mtd@lists.infradead.org; Thu, 30 May 2019 15:21:30 +0000
Received: by mail-pl1-x643.google.com with SMTP id d21so2711548plr.3
 for <linux-mtd@lists.infradead.org>; Thu, 30 May 2019 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFcrH7Aa42BIXd3ROM5psMb2SlHVujIh9k4fZWdi9tU=;
 b=frlHefSp9KHo9H63PF2IH3/uVgNmjQCv60NwiZXEr5gRsgVxlUMoupxJEIlZ9gmVdg
 AzrhHKhAlLkGixJ+mqdid656EDHejs5PHC1tFQRrKtxELt+AeS3V7WojzWrhyaaX2TaY
 AKDnZVHMFLQAvjCktZp8KOQ4TAgjaIpnZvzRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TFcrH7Aa42BIXd3ROM5psMb2SlHVujIh9k4fZWdi9tU=;
 b=Ik2he14b4YMs40xE3/rQZTxK6dsgfCsYwbo3T7jfQF5ON3Sm0P+cqc3XoXFu/ispxj
 q/K0Cghsa3/PRI2Lrez3vk/IbSZJmo+7MCZgaF5gXhlVop46JLtYL+jtp1AnWNsAgw20
 qJ+7mw59ryM/nPmmYW2JtGXC3yFuWiuXl+HL1SqEIAtgGIbYeGYfaGKr1pdH6a5+H3V/
 zMVDCQxcR81cV++jH8xHD1RghHlMO+dq56i/IHcyaMjsKiDAABLh09+ygNdTlkVPtTMr
 4/KwviQIXkK8G3JvBt7/E2URIRO6hmBpISVvbMKhcrKWi1k38ytNT/mgOl17vCu0Ijfg
 4GJw==
X-Gm-Message-State: APjAAAVp5Was0H4JHchH/Erk4AFnD70Nwi5MlU3xLkr89O0/V/PoGtqE
 nV8irgDj2LeqPnb9sDq8wTBeko7wcIw=
X-Google-Smtp-Source: APXvYqz5slNyvfLmB5bccB1WlSclCly8FpU4NyVzWUmNxNSd6+1eb4QqUCOuZJB2hmhcmG5PvXrVmA==
X-Received: by 2002:a17:902:b696:: with SMTP id
 c22mr4051511pls.119.1559229687727; 
 Thu, 30 May 2019 08:21:27 -0700 (PDT)
Received: from zhuohao-z440.tpe.corp.google.com
 ([2401:fa00:1:10:e25c:13cd:9607:cc7f])
 by smtp.gmail.com with ESMTPSA id j22sm3198663pfh.71.2019.05.30.08.21.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 08:21:27 -0700 (PDT)
From: Zhuohao Lee <zhuohao@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4 2/2] mtd: spi-nor: enable the debugfs for the partname and
 partid
Date: Thu, 30 May 2019 23:21:01 +0800
Message-Id: <20190530152101.176431-2-zhuohao@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190530152101.176431-1-zhuohao@chromium.org>
References: <20190530152101.176431-1-zhuohao@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_082128_979819_E73A988A 
X-CRM114-Status: GOOD (  12.82  )
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
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd1aaa5..c7e57e9a48e5 100644
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
+	if (!mtd->dbg.partid)
+		mtd->dbg.partid = devm_kasprintf(nor->dev, GFP_KERNEL, "spi-nor:%*phN",
+						 info->id_len, info->id);
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
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index fa2d89e38e40..4ad8b9117659 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -386,6 +386,7 @@ struct spi_nor {
 	u32			flags;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
 	struct spi_nor_erase_map	erase_map;
+	char			*id_string;
 
 	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
 	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
-- 
2.22.0.rc1.257.g3120a18244-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
