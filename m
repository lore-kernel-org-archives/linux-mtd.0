Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98774FF885A
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 01:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+UIs1uoCJjRdznIhBpM1zcNATF4eZ9JJomiqt1KSEc=; b=UvRu5GxJSOmfDC
	Qf7LEQUtCXgHAIGrhhVe5l6OJtEWccjoNHOofu8iYiLmyawCYMqF/M3Ue6A1ME6PAn7RMWfASYLlc
	MUIqEFAa9uAh1wn+b7e8z3LpgihcT9eGnsIT8gvlsGSZNK3lskkePzTPHR33H8o4FOJX4vM+9Rmcp
	tCyOCwnb6zhi7YkF9Ojh6APOS2/SbRssWmlS83CtPl/nKFqyEQM9BXlUlVd52sbc3srOEfnIh3nkd
	/OBw/xZThp5uGlDjQO1dUe6u8wB9Y5M0vAtIc/NwFIm2iMxVJOk/tQW+8pCv9IMEfZsN34gbHI9Oz
	RwlytE1m/ZZEleuHcD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4jG-0000000EpEl-21tL;
	Tue, 05 May 2026 01:37:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4jD-0000000EpDB-1SXv
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 01:37:40 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso21230675ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 04 May 2026 18:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777945058; x=1778549858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjrHxUF0jl2CZOESmwQoL3r7trIxfKHjRfBdfvvWu+U=;
        b=Bj80GpU/tiRtQqt/n3M2t5n1X5c+zRPqoJzsTTVXSrjtZKoYdpMfYBDscDJVpV9/Zq
         QORC+BypJZQ8MTdp3t4/o+mua9x/33z8sHvjEWhZBOurz2u16Zcd5Yqg8bLlo1Xu3Dgt
         ge1ft2tP+gFW8jGapZr4k1eovZlV4B1JayFC5wRVitHxwlx3enPp7d9n4H4vH5ax4KUW
         8R2M/JXQfr7Dpdqm0xP25iNMyaLpYl5rdMKhA8t4P9YglFykX4GZO6P/GteyN4JnIA+g
         mg+M/BbOwpR+W8mirH1EDHditM6JAcP3X1D86nb8u0vIxV/aS6YCH5MmvvY76pdfMHFj
         XtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777945058; x=1778549858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gjrHxUF0jl2CZOESmwQoL3r7trIxfKHjRfBdfvvWu+U=;
        b=RKBMlAcjcXvQuec9O731MkiJFN29pw3sdZoSh30k3yABY/sxGwPjmRuuhnPn/J1Fwj
         CQOtF7yWP6rQ+ClOpKaEolQhldNVZCnTx1Y5GKAGcInwNLTwbRm7rEAVza129Rq8e7Mx
         nqS/FcSXzOe27NMaQ6McAcbq7a03a+f+sB7wA3fqLzju7tJq7kbDGxrJu4O9n9hPXW45
         XnMgOTMza9vIK5yb8MMnY6VdUN0KYI/wlwLLFfDVrGHjY92AHmb+PQ6dzjb1SBGHnw7b
         EGDr9D6sA9Tla+yAxGnFYc3nMISW1zNXlQQSVsqedCkMSW12Jw5HKNdaYh+jdjDs7t9U
         OCHA==
X-Gm-Message-State: AOJu0YzOQo3r3Lg3lAhkxFx2sylxtDcXzJFy92ST0qITDWNegy+xIMcR
	esjO/VFlxn3SDVunOncS5Ec9Qvtap0WhmCFyMo1VDH6Xw0d0HFBtYqqP
X-Gm-Gg: AeBDietUJhgFZe9t2vazShuwns/UU7yVf47OUZ8yiMFtm+z2q9uqlT5vg+kfpkIBa3Z
	1kZ3XriIVzwhP5EdPMu6ypzXP6VAQbKv/pREfdb2hqxfcWvruklbCmHqjhuSDS4t4zNb3EGW1Ji
	XeK+owDC+mEPgpiVrmlGIeyq/VS7nQJ9kCY/400hoYwmPcDWU9urS9YUFUuLACEN2CDHXzSrc9T
	bo8OcBSLah9o4mVrxZ9BmHiAxX0PgD/KSuinnQ994SkGYg5Ic4Lr8g9bkFYDc/fA/BiJfFMCxK4
	r4qmhvDlDNxrk79t3qtW00xC1a/ksTsQmBRAuahfYONXaYCEi5SHF8NFFC1W6vpYwfRGG4BCkoY
	4bujoJyuiwKlBze3f8GL0xyuzpnikjA8ZNMtkWhNA5NxHi3zWiNNQesAq7vbOnUN898m4b33Ji2
	u2b2M4HAY4DWTkuMewvR8l7isbD4I35Bm1JjdLetSOulgzTzsvhGHrdE3n
X-Received: by 2002:a17:903:2ecc:b0:2ba:15ff:345d with SMTP id d9443c01a7336-2ba15ff376cmr79860945ad.35.1777945057671;
        Mon, 04 May 2026 18:37:37 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae5cc52sm121946995ad.78.2026.05.04.18.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:37:37 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id C90604163B7C;
	Tue,  5 May 2026 09:37:34 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v10 2/3] mtd: spi-nand: Add support for randomizer
Date: Tue,  5 May 2026 09:34:52 +0800
Message-Id: <20260505013453.980249-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260505013453.980249-1-linchengming884@gmail.com>
References: <20260505013453.980249-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_183739_391911_647E5CAD 
X-CRM114-Status: GOOD (  17.18  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This patch adds support for the randomizer feature.

It introduces a 'set_randomizer' callback in 'struct spinand_info' and
'struct spinand_device'.

If a driver implements this callback, the core will invoke it during
device initialization (spinand_init) to enable or disable the randomizer
feature based on the device tree configuration.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 20 ++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8aa3753aa..78557e48f 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1307,6 +1307,22 @@ static int spinand_create_dirmaps(struct spinand_device *spinand)
 	return 0;
 }
 
+static int spinand_randomizer_init(struct spinand_device *spinand)
+{
+	struct device_node *np = spinand->spimem->spi->dev.of_node;
+	u32 rand_val;
+	int ret;
+
+	if (!spinand->set_randomizer)
+		return 0;
+
+	ret = of_property_read_u32(np, "nand-randomizer", &rand_val);
+	if (ret)
+		return 0;
+
+	return spinand->set_randomizer(spinand, rand_val);
+}
+
 static const struct nand_ops spinand_ops = {
 	.erase = spinand_erase,
 	.markbad = spinand_markbad,
@@ -1594,6 +1610,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->user_otp = &table[i].user_otp;
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
+		spinand->set_randomizer = table[i].set_randomizer;
 
 		/* I/O variants selection with single-spi SDR commands */
 
@@ -1881,6 +1898,9 @@ static int spinand_init(struct spinand_device *spinand)
 	 * ECC initialization must have happened previously.
 	 */
 	spinand_cont_read_init(spinand);
+	ret = spinand_randomizer_init(spinand);
+	if (ret)
+		goto err_cleanup_nanddev;
 
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 58abd306e..9ec45b727 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -585,6 +585,7 @@ enum spinand_bus_interface {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: enable/disable read retry for data recovery
+ * @set_randomizer: enable/disable randomizer support
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -613,6 +614,8 @@ struct spinand_info {
 	unsigned int read_retries;
 	int (*set_read_retry)(struct spinand_device *spinand,
 			     unsigned int read_retry);
+	int (*set_randomizer)(struct spinand_device *spinand,
+			      bool enable);
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -669,6 +672,9 @@ struct spinand_info {
 	.read_retries = __read_retries,					\
 	.set_read_retry = __set_read_retry
 
+#define SPINAND_RANDOMIZER(__set_randomizer)				\
+	.set_randomizer = __set_randomizer
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -754,6 +760,7 @@ struct spinand_mem_ops {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: Enable/disable the read retry feature
+ * @set_randomizer: Enable/disable the randomizer feature
  */
 struct spinand_device {
 	struct nand_device base;
@@ -787,6 +794,8 @@ struct spinand_device {
 	bool cont_read_possible;
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
+	int (*set_randomizer)(struct spinand_device *spinand,
+			      bool enable);
 
 	const struct spinand_fact_otp *fact_otp;
 	const struct spinand_user_otp *user_otp;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
