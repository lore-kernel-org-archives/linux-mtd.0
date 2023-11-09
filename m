Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D52C4167D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MuvaMjdaVl6iv+bB1XxVViT8tTThvF5qHTW7fhCLK5U=; b=o2y/QDuM+GGxV/
	TP04GTDazh6irSlKdie1Y532UtXw1v0tGwTxjLX+ElKgwX4YlSsUOfAnO1jS8b5/1BTbWweC6q3TT
	21+DkGM6sZfNASzFk0NVE7N7SqKhSmmcdpIco4npox1vvfiZ+gQnS2469NB4uKhMVsIbedk/J1PSC
	KyqdIzJe1AhnwLAhPI4Tf3ebUOm1zlxwJ6F6SzBT+/PohgZsEr40l0e2yOgNum5mXhUNz8tKsOVEr
	frPc07mZbN9EhXVG/OtVWIBkpMKzbGwc/6ON0chP6aR9d849Z+Kf1m/7NYLWNVjDL+xB3/RyP3rNH
	JF//rzwTx4Nd1biOERyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13AD-0063X9-1N;
	Thu, 09 Nov 2023 11:25:33 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13A9-0063Tp-2r
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 11:25:31 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso797076b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 09 Nov 2023 03:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699529126; x=1700133926; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p19gz0pvmUr9WwyXQ4dXMb3io5xq3Mq3immW42vKGSA=;
        b=bT9QA2w1Kg+Q41WqRaorqovXn/nTQE2Y4gsCRKuCmRTvfMjIHiUq1OWX0FWWqyA80b
         eIQLBzcFscXNib75YSu5icDfiPm8YmXli/uc4bZr5mauDdzQbpt8gjZwW7JHfg61Xzqu
         HKx0ijPRsmqTMgOyxvypkXM7yxOYIS8dTISa64t4MEH+Yv2kBnwjJ3ZIWEQnBQjQUDd+
         MSbmnrFeT+3C8jUhEod1l9zLrkvWtFL3xZlEOvGr3VIxwKH1BOA4YPqW+tv39mc5xXFV
         MKTo93XaNURYe6pF9H7zuwrwkqUy/xKNZKo1SfpPU8NCkHc0fxYUGBaIxkMgrQA2OoAl
         4oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699529126; x=1700133926;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p19gz0pvmUr9WwyXQ4dXMb3io5xq3Mq3immW42vKGSA=;
        b=dehc7Il3CZul/tHKgk21ylir036DOiMMwMW7O8iAK4F8tFNXQX18falwX74q2yTm9m
         KabfRFuXqdHw+GUUjVlIst8HfR5+rMI7xwTjK2vY3oIkyZBuotr5NMGrwjXEpjbItmaO
         Qy0U9wqsbZwA7rJuGUUJ1PLVsvBzzElx1HqsbF/sXPk+Fh0lHqOgAcP69hk8biRtnOS7
         XN5Be9B5Xrc35rU10cNypY3yohWIvPvnlEp787TsBL11d2YYg4KW4PFVcxMkdfkl6LyC
         2ojuV+OSsgIFWL+FnDMJu6fGK14Gq7aOv6rV7hXskI2XyCI1HD/+tWIHZ37nSQmY2C2a
         fNrw==
X-Gm-Message-State: AOJu0Yye/jeLEMx/mu78++ePEPjEvhnzkbR4zcv4rfKhjJbEQm4hLaB5
	gUvNkxNxI0I5GqHEYPSIh+b6L7FYIbI=
X-Google-Smtp-Source: AGHT+IFezaWjfyPhQ4EtGd2FdGwqg6QZMuQQXwtrCCdd1O0q+2Mk54aA3K1mnUsrNmpwATo5CMNWpw==
X-Received: by 2002:a05:6a00:179e:b0:6bf:50df:2df5 with SMTP id s30-20020a056a00179e00b006bf50df2df5mr4807795pfg.13.1699529126212;
        Thu, 09 Nov 2023 03:25:26 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id y36-20020a056a00182400b0068790c41ca2sm10455953pfa.27.2023.11.09.03.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:25:26 -0800 (PST)
From: JaimeLiao <jaimeliao.tw@gmail.com>
X-Google-Original-From: JaimeLiao <jaimeliao@mxic.com.tw>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com,
	angyanyu13@gmail.com
Subject: [PATCH v3 2/5] mtd: spinand: Add support continuous read mode
Date: Thu,  9 Nov 2023 19:24:57 +0800
Message-Id: <20231109112500.4966-3-jaimeliao@mxic.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231109112500.4966-1-jaimeliao@mxic.com.tw>
References: <20231109112500.4966-1-jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_032529_923736_24BEABC3 
X-CRM114-Status: GOOD (  10.01  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch supports setting the "CONT" bit of the configuration
register and create spinand_continuous_read_enable/disable functions.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 11 +++++++++++
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 849ccfedbc72..cfc295f5e31b 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -193,6 +193,17 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
 
+static int spinand_continuous_read_enable(struct spinand_device *spinand)
+{
+	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE,
+			       CFG_CONT_READ_ENABLE);
+}
+
+static int spinand_continuous_read_disable(struct spinand_device *spinand)
+{
+	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE, 0);
+}
+
 static int spinand_ecc_enable(struct spinand_device *spinand,
 			      bool enable)
 {
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index badb4c1ac079..bb9288ffd898 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -154,6 +154,7 @@
 #define REG_CFG			0xb0
 #define CFG_OTP_ENABLE		BIT(6)
 #define CFG_ECC_ENABLE		BIT(4)
+#define CFG_CONT_READ_ENABLE	BIT(2)
 #define CFG_QUAD_ENABLE		BIT(0)
 
 /* status register */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
