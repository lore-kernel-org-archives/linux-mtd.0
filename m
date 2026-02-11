Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB2AEA8125
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BX1uP1WUNR55C1bQLZF3/5+q84jUbd/P0+RhUg+hRgE=; b=sSfKAlNBO97UNN
	G7W9dhwjZBlcnMA1WO/hE40uZ83NfX/YXaxPd1CAadAwkVurvmeS7gvmwlcxL2A8YkdaLa2vKusq3
	wWKm4su18uDP+Elmzz5ZKKODM8P+p8O8hivMI3hiMrDLi9TYd4niKfgUHW8K3VskaxSHpWUOREAll
	jhDz74k49Whg+o1CWuylcQgK3Cd7D3OaBZtuRv80+QK/UAzXNzmYwgCEYZWAKWY7y/TdVgWDN+yMh
	fjCa5gnI27a/hf/J8Xw+lCW99LhIuRUuIxBToHFuAxuoqBLT1/9qHPQCvX1DRCGiRBW37kGQC1WTh
	1SkdoXYzivo3ld5cPNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq780-00000000TaW-2yoE;
	Wed, 11 Feb 2026 10:07:24 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq77w-00000000TZ7-2DqS
	for linux-mtd@lists.infradead.org;
	Wed, 11 Feb 2026 10:07:21 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-81f5381d168so1876317b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Feb 2026 02:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770804439; x=1771409239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vez69047uDXOuQc71G6ik4HtqOr3/TvZvcnrZ5g7CFU=;
        b=YudOdAAjaTlTX8+WIkOOkIBwJSWOjOVfoMnzFQoby37hsqIKTTQxSKa1CuDmWiIqoI
         IMDHy2P/MzBvJZooA5w2uaDgw1wWh6QQ3jdbRGI5XsyewxVXrh46zi8n8HaFo9PAb4zF
         Kkrt9aLB438cORpyUiJIGcwwqz7ZZ4JOCdZ9m4AK5ePSjNIzdBzdMiS815k21XBLIx0o
         E0ba3jHe7NsAhB7pHebifUyUDfks3KiaEo1xjioY4el4cgEXa1teiMu/TRHTevfMQNzI
         cSKaYUY6LUVf74BXcnxfunTf74xviowuM4wNMRzfmr7nDH2kihhoJm/rZ37flr9L8DT5
         Fb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770804439; x=1771409239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vez69047uDXOuQc71G6ik4HtqOr3/TvZvcnrZ5g7CFU=;
        b=ha+bRhS049UB13uHnPFbletzzci86LrDBbn5pzPiqoK08B3YqdcGpWxrJX8uNllLjx
         lQV0MdG28Ip6UeAvgF2KfBMNMapUMsbXWYVfVdipZbwevspl5zGH8rfS+u9qH54lt0Sd
         bHU5fFjwU387e0yEHdTssooDIZDZuLDea+gTz7AsMILB++cSi1OqWTmON0a8NWgUwApD
         9OyzRZsSbRRY3at6UT2mmOSQ9asnAd1DNXQOXT1+YZoxcUZkMUQDbjCEGN5tYuPuYu5o
         GG86IowOgE4/cPFwIzE2sN6iBKwXM9scxSoB4D42TMsJyYtx4TPRSOVjXB56XuV4n4kF
         6gUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEqXGKCs/18lhk0+YgwwasPxRE/AtthxF9+XHLm6XcU19JQkYVWF1U1GXPdYM0U9A14FIv8Pbto28=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtKjzZv5hDlDkILy2XfqkLtKmozR874BemeInKHwxH7cWLfuem
	hQO7AZlDKUFaaCTfmiXaU4i0rRpe3IYiFPc7QiwBwEZrj/ZaxwF6+27t
X-Gm-Gg: AZuq6aLBDQRNxS5C3Jo/qpDubWIzbG4AahSgVSUc+NpxKdNx98scHurqJ1+JW6u0BH4
	TxBqFHefXkSThINKEmN3RkASIwli1qVQEwzFU/HrbL5RLAHgdtjqHLHRqgm+t82VAq8twRl8st3
	w3cC2o6DK0B1BZ98T5plEvTwFtzl6XNA7/FClEWIBlyZD+RZ4xOnX/P/hYmP3NZGLUOKio1w2XF
	98OW7DO3pvdR3DYwzvO0i6ZpM4DdzNpI0YkWJtjjW4tYpiit09mmsGX1Y4+QN3R8ojWHxpEWAsk
	++pLmqLVofyF7/REdGA9xqjG5hM1dr8HzwGV7nsdT8X78T+ExnQazZ33PtEyKChepPtzwxrcJjp
	GoYe1sqWNWzqGhTKNSwZDu7xTcqko8AdDH3lzqZI1iTlE9UOWPnlUOhlK2lnlhGNRaCq2zlajkH
	WM5NnvNj8jSZ1QZWTO1ay9kxjw6gie/gAyPfC8PEhzmKlEkg==
X-Received: by 2002:a05:6a00:6b93:20b0:824:936a:46bb with SMTP id d2e1a72fcca58-824936a55c2mr2508812b3a.20.1770804438987;
        Wed, 11 Feb 2026 02:07:18 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e7d600dsm1721184b3a.34.2026.02.11.02.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:07:18 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id EF2FD4136075;
	Wed, 11 Feb 2026 18:07:16 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>,
	Tianling Shen <cnsztl@gmail.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v5 2/3] mtd: spi-nand: Add support for randomizer
Date: Wed, 11 Feb 2026 18:05:52 +0800
Message-Id: <20260211100553.907585-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260211100553.907585-1-linchengming884@gmail.com>
References: <20260211100553.907585-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_020720_579869_D3E59147 
X-CRM114-Status: GOOD (  17.21  )
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
 drivers/mtd/nand/spi/core.c | 27 +++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index d207286572d8..d6b12d05c346 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1218,6 +1218,29 @@ static int spinand_create_dirmaps(struct spinand_device *spinand)
 	return 0;
 }
 
+static int spinand_randomizer_init(struct spinand_device *spinand)
+{
+	struct device_node *np = spinand->spimem->spi->dev.of_node;
+	bool enable = false;
+	int ret;
+
+	if (!spinand->set_randomizer)
+		return 0;
+
+	if (of_property_read_bool(np, "nand-enable-randomizer"))
+		enable = true;
+	else if (of_property_read_bool(np, "nand-disable-randomizer"))
+		enable = false;
+	else
+		return 0;
+
+	ret = spinand->set_randomizer(spinand, enable);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct nand_ops spinand_ops = {
 	.erase = spinand_erase,
 	.markbad = spinand_markbad,
@@ -1412,6 +1435,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->user_otp = &table[i].user_otp;
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
+		spinand->set_randomizer = table[i].set_randomizer;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
@@ -1588,6 +1612,9 @@ static int spinand_init(struct spinand_device *spinand)
 	 * ECC initialization must have happened previously.
 	 */
 	spinand_cont_read_init(spinand);
+	ret = spinand_randomizer_init(spinand);
+	if (ret)
+		goto err_cleanup_nanddev;
 
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index ce76f5c632e1..e01315a71222 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -501,6 +501,7 @@ struct spinand_user_otp {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: enable/disable read retry for data recovery
+ * @set_randomizer: enable/disable randomizer support
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -527,6 +528,8 @@ struct spinand_info {
 	unsigned int read_retries;
 	int (*set_read_retry)(struct spinand_device *spinand,
 			     unsigned int read_retry);
+	int (*set_randomizer)(struct spinand_device *spinand,
+			      bool enable);
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -580,6 +583,9 @@ struct spinand_info {
 	.read_retries = __read_retries,					\
 	.set_read_retry = __set_read_retry
 
+#define SPINAND_RANDOMIZER(__set_randomizer)				\
+	.set_randomizer = __set_randomizer
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -635,6 +641,7 @@ struct spinand_dirmap {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: Enable/disable the read retry feature
+ * @set_randomizer: Enable/disable the randomizer feature
  */
 struct spinand_device {
 	struct nand_device base;
@@ -668,6 +675,8 @@ struct spinand_device {
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
