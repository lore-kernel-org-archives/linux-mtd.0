Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23415D49C8D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEjnkrwrM6MSFg8qyBLkclhARH+6KcXu12btWPA5YRc=; b=fO8kAzCeLPh/7d
	tF9icrHLLTpkWTa1N8nqksWX2gsa3NZsEZRSGfdlOYcK5XviL+ccSPzMtSP9O9amuhf4tzqRNrYMw
	Ca5bswctOLDJdqA41QepTXYnfhjCEWObQfKwaZa74pN20UtzP12Y0Z7CkIRWftQXqfW23rtSwLzRQ
	c6RFxZxXAlwABvtaDTyPfZNur27qiJUnUGLPrZ5/QR7F9xIczLHtaT5FpJgoLxHDgEmWsAjAjk86+
	9j/UmmzrF46xB87yw+Uta/rnaz0rfpzPtzkbY91cwQegwWkvDUISfr/CJrgS5c0VnG2CC/cBvPZW/
	P3mlw68eLTha0Yw5JTGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkl3-00000001GP3-3AMB;
	Fri, 30 Jan 2026 09:25:41 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkl1-00000001GNu-3V6Y
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 09:25:40 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso1097652a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 30 Jan 2026 01:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769765138; x=1770369938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6GlYVoagWgHxL70iH3i0+bpomJ0J/vOUXSulmlnz4o=;
        b=V2doPitj44GVGfVZMDuebkx9bEVHi7sDqGexzZ6B2SHNHDMxFzPCnslZB21bqK+mUZ
         b+kZJqgRsYNuz9TU3Vfr9V5QYWhcD06NOOBgezTIzVjj5TiX6whEZ5Mm+phjk/sWjXy2
         pNfeJx1dzsJclNnslkgNucyfPPi0zt7FKfEa8otMHQ/Y9UlSYT1MRDjXsH/tFCEnfAiW
         RepGBFFiPvc95GHk6+tVIgBmFbjf4ywNtK6qV5ohPMMp/r7Um84P3wQRO+D+ZqT2MLQc
         WHiAN3QI83d6eSdSssMmQ6tLYIZdPSGWG3QMTHRl+6U67G+dhX8K0BrrTczxwvnt4zFt
         XrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769765138; x=1770369938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A6GlYVoagWgHxL70iH3i0+bpomJ0J/vOUXSulmlnz4o=;
        b=HtONLw0fzl6fZelRo12jckCbF/YP8b0ZWOxIwFIAOYGIIRQGBiWsZNR/caeqvvnPuO
         l/8pZ7DF2iBNQl1xnzIf/29KAYZ0Fs74PycoN1Q+ba0lOf7MDsEp7GMc29+CQBN2Uh56
         5rOIz3y7eB6CICTeYIK8b3CItK31ZfzK24s9+8JztTcO3/YK6Cu8m44t/y9sNSW779Ci
         ymsg3nxV+QKYDtX1XkZWrnv56jqn9Adly1+pMT4SMTuCQ4szH9wnMvuP5h8/+843vgkK
         SBfY/ZCPDBnb7loU7u033CN2WQ7yM4HnyPSS5u4dCuqdqeMuCu11dw39TxD1YZftPpSA
         GtvA==
X-Forwarded-Encrypted: i=1; AJvYcCWlkLN8WOn6OhJw2zZO6/P5qCS7MM0plsO/rUid95IcoovJozeqvmxi7mE/BRLIBft/JBCMJNDPUgA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYwTkrFXqMDSQ6GrUx9yXcVra8gq/ZbiLwUwfFYHyI8r4qVBWq
	cbwwrkYishHNI7+OzFcMBpt13DQsShgG1XbL+RS48/Gmn6M/mKxgzD6t
X-Gm-Gg: AZuq6aJBp/Na5wa1QRDeiDA8T8CkYPi3pFDAAkyVOJwPW0SATqn7fe6T7FjdZuyt2PE
	SR0va98/Y116/mT2ggh1OzFuvSiYOuYHrtezN7ocvvQ/j7sr3iM1ptDw5cBJxexo9nhJitwXBG4
	a1PjvNFDj2JJPp6rjWyHFigziNroyb7OenvrtrLq+gc39MX46a+BDPEtkjUHcbE/z0nYyGcNiV2
	ZedXpAwZGOyFLq5mYfmiffoQ5fQSbhz47w/lfB9n4AHCcbdiY3rE4f+1QOdAonwZXb6oF16xz6/
	9aS2abHFgXI0L9nBosIzLxgR0Nek3HZvMSUIjSdfyKl3qI5CylnVwXq6oLuszVfO8a1DLU0ux+u
	iIVgpu3F72pRAQd22Jiaw/zvLdHhHBSuyMNhAk0ng/cMqVgPlnkB0gfRyDKjjiOtgzmFItfPrsr
	ujGLOMgqNMc7z7SZMLH9f6piCcvmcbrj0K4tBpq++A3z6P
X-Received: by 2002:a17:90b:5101:b0:340:ff7d:c26 with SMTP id 98e67ed59e1d1-3543b313a60mr2954738a91.16.1769765138282;
        Fri, 30 Jan 2026 01:25:38 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3f0872sm7433405a91.16.2026.01.30.01.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 01:25:37 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 1D0944136074;
	Fri, 30 Jan 2026 17:25:36 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v3 1/2] mtd: spi-nand: Add support for randomizer
Date: Fri, 30 Jan 2026 17:23:48 +0800
Message-Id: <20260130092349.621034-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260130092349.621034-1-linchengming884@gmail.com>
References: <20260130092349.621034-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_012539_892617_318F778D 
X-CRM114-Status: GOOD (  16.36  )
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

If a driver implements this callback, the core will call it during
device initialization (spinand_init) to enable the randomizer.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 21 +++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index d207286572d8..3bf99776cbf5 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -206,6 +206,12 @@ static int spinand_cont_read_enable(struct spinand_device *spinand,
 	return spinand->set_cont_read(spinand, enable);
 }
 
+static int spinand_randomizer_enable(struct spinand_device *spinand,
+				     bool enable)
+{
+	return spinand->set_randomizer(spinand, enable);
+}
+
 static int spinand_check_ecc_status(struct spinand_device *spinand, u8 status)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
@@ -1218,6 +1224,19 @@ static int spinand_create_dirmaps(struct spinand_device *spinand)
 	return 0;
 }
 
+static void spinand_randomizer_init(struct spinand_device *spinand)
+{
+	int ret;
+
+	if (spinand->set_randomizer) {
+		ret = spinand_randomizer_enable(spinand, true);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct nand_ops spinand_ops = {
 	.erase = spinand_erase,
 	.markbad = spinand_markbad,
@@ -1412,6 +1431,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->user_otp = &table[i].user_otp;
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
+		spinand->set_randomizer = table[i].set_randomizer;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
@@ -1588,6 +1608,7 @@ static int spinand_init(struct spinand_device *spinand)
 	 * ECC initialization must have happened previously.
 	 */
 	spinand_cont_read_init(spinand);
+	spinand_randomizer_init(spinand);
 
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
