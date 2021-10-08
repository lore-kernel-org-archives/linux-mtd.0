Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3545DC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:00:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3385610A5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3385610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuKne3y4TpG0wr77/xed69V8nfk0LonKQNfrex18B70=; b=fLVQB8fZny09of
	sO2MFjzADkLr7mCfNyGd0ZQS7DVLkQn92SrhrfEHKwVVee7IF3xBzNq+0r+H4AsMoaH5dDtJFjYP4
	tcHwfxgRubWH7BNINjUxxLklmU6ol/QiwlYWf87hIQmgMDQ4bsPI5S96AzHHb0J0zW5RQ7BXAK3qm
	KbriB4fl9UGc8sYrnvU59/23pI+SuAUppbdVp1WtIuBF/6fNbvZ1g0Kptc0/48XebDseptalSWLdv
	5aeLIm0eCrDKllUpIn4Yxo+q5hM04P0Rg8dBSfhoz17i2Tg6x0vhP6xYje5NjC8DmfTBW1kOfh9Qc
	bt9w4AimIys+scCKqrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNOC-00GKu7-RS; Thu, 07 Oct 2021 07:00:24 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNNC-00GKbV-Mc
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 06:59:24 +0000
Received: by mail-pl1-x629.google.com with SMTP id l6so3245214plh.9
 for <linux-mtd@lists.infradead.org>; Wed, 06 Oct 2021 23:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YAFMQ2KZ4xVB0Wrc5fyZFtQ6EGFwRq1i0mBPkCu/hmk=;
 b=M6J2LPqVRY9irxDI+AJKVQnkvCpfnAIOnGEwHWQeuw2y0o2E9ceRSaa+r14G1qufoc
 ky8jHSBqgwQvoQqzigXgagZ6UxFbag3pnU0fQW1SSXIvvwfYRXDteiuqEUy66HzEuaLa
 LPqeK32RURz/48U7b4YvRxnd9jkQdpLTJa9qK0R8IK4Q3gie/2aSOC+9AJYDXWTING44
 7Xr+x6BuIqaaNjoytmzSC+Xv7ymjXQheoQElMSPqGTaEhjqMkim1YCJvwDdRkwe8mPCD
 jlxErY/V6yfUdzDtGm2AQxdc/duI/FTSscCHIBQekHtodENooJfLw+JpAHbnd8gcPd8U
 SJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YAFMQ2KZ4xVB0Wrc5fyZFtQ6EGFwRq1i0mBPkCu/hmk=;
 b=YWhE39vYjFasFt44aNf8J/7Ds4ijuYb2MLHJScaj8r0qbp3d+slMcgCjE1PAyROdtq
 Kz8noxCR18H7OjCuyG2LqD42uScDbscUbzBQ/FbJm1/DO/1H6PIucsC1+tE7cGAyDsz6
 Fo3FhCfRG8DOwqFOwHQnXxWs+LTbOSnbNifT2w+XoRy2GiVNohPdgn0fXsd5TZBoJdhC
 LOs7R9rfdNZ1AElzeBYa+ZxdxY5klkkFA1E7lmmcZSe2QrfDTEe4MsuD3qTTyTz+0Jm6
 jHTw4j5frHL8DHvIyYnX6NE1Dax+0qkEjVGRDgu12oy+EE/JNVGq/P9WXuCaBgFA8g1Q
 fenQ==
X-Gm-Message-State: AOAM531cpI5JMe8yNue8YcvfXQLN3T2vAalWAeeaW6PEVZf8lQJQSmMd
 sI4c/Kv9jjzI8vzUN5O0YZrZ0qJjxCQrBM2K
X-Google-Smtp-Source: ABdhPJya87IZRzyEJadlSeppgtSuR5m7qPHfPsxcsiDaVJGlQhMLqbVR4zCW+EXBzdealLZf1+LKPQ==
X-Received: by 2002:a17:903:228c:b0:13e:f389:4ca9 with SMTP id
 b12-20020a170903228c00b0013ef3894ca9mr2189946plh.80.1633589961212; 
 Wed, 06 Oct 2021 23:59:21 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.googlemail.com with ESMTPSA id u12sm7137844pjr.2.2021.10.06.23.59.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Oct 2021 23:59:20 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH 3/4] mtd: spinand: Add support continuous read operation
Date: Fri,  8 Oct 2021 14:57:58 +0800
Message-Id: <1633676279-29708-4-git-send-email-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633676279-29708-1-git-send-email-zhengxunli.mxic@gmail.com>
References: <1633676279-29708-1-git-send-email-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_235922_771849_C63EAD33 
X-CRM114-Status: GOOD (  19.63  )
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

The patch adds a continuous read start flag to support continuous
read operations. The continuous read operation only issues a page
read command (13h), issues multiple read commands from the cache
(03h/0Bh/3Bh/6Bh/BBh/EBh) to read continuous address data, and
finally issues an exit continuous read command (63h) to terminate
this continuous read operation.

Since the continuous read mode can only read the entire page of data
(2KB) and cannot read the oob data, the dynamic change mode is added
to enable continuous read mode and disable continuous read mode in
spinand_mtd_read to avoid writing and erasing operation is abnormal.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 38 +++++++++++++++++++++++++++++---------
 include/linux/mtd/spinand.h |  2 ++
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 0d9632f..0369453 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -195,6 +195,8 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 
 static int spinand_continuous_read_enable(struct spinand_device *spinand)
 {
+	spinand->cont_read_start = false;
+
 	if (!(spinand->flags & SPINAND_HAS_CONT_READ_BIT))
 		return 0;
 
@@ -598,16 +600,22 @@ static int spinand_read_page(struct spinand_device *spinand,
 	if (ret)
 		return ret;
 
-	ret = spinand_load_page_op(spinand, req);
-	if (ret)
-		return ret;
+	if (!spinand->cont_read_start) {
 
-	ret = spinand_wait(spinand,
-			   SPINAND_READ_INITIAL_DELAY_US,
-			   SPINAND_READ_POLL_DELAY_US,
-			   &status);
-	if (ret < 0)
-		return ret;
+		ret = spinand_load_page_op(spinand, req);
+		if (ret)
+			return ret;
+
+		ret = spinand_wait(spinand,
+				   SPINAND_READ_INITIAL_DELAY_US,
+				   SPINAND_READ_POLL_DELAY_US,
+				   &status);
+		if (ret < 0)
+			return ret;
+
+		if (spinand->flags & SPINAND_HAS_CONT_READ_BIT)
+			spinand->cont_read_start = true;
+	}
 
 	spinand_ondie_ecc_save_status(nand, status);
 
@@ -667,6 +675,10 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 
 	mutex_lock(&spinand->lock);
 
+	ret = spinand_continuous_read_enable(spinand);
+	if (ret)
+		return ret;
+
 	nanddev_io_for_each_page(nand, NAND_PAGE_READ, from, ops, &iter) {
 		if (disable_ecc)
 			iter.req.mode = MTD_OPS_RAW;
@@ -689,6 +701,14 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 		ops->oobretlen += iter.req.ooblen;
 	}
 
+	ret = spinand_continuous_read_exit(spinand);
+	if (ret)
+		return ret;
+
+	ret = spinand_continuous_read_disable(spinand);
+	if (ret)
+		return ret;
+
 	mutex_unlock(&spinand->lock);
 
 	if (ecc_failed && !ret)
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index e044aba..c2a41a3 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -422,6 +422,7 @@ struct spinand_dirmap {
  *		because the spi-mem interface explicitly requests that buffers
  *		passed in spi_mem_op be DMA-able, so we can't based the bufs on
  *		the stack
+ * @cont_read_start: record the continuous read status
  * @manufacturer: SPI NAND manufacturer information
  * @priv: manufacturer private data
  */
@@ -450,6 +451,7 @@ struct spinand_device {
 	u8 *databuf;
 	u8 *oobbuf;
 	u8 *scratchbuf;
+	bool cont_read_start;
 	const struct spinand_manufacturer *manufacturer;
 	void *priv;
 };
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
