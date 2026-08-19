Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B890C5B572
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2026 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFqag9ucNofS8xwDzL7+vmSLPOC835RPGRr53tkuzzk=; b=Ag9xmJrrhw5mmJ
	RzO0ny4xCst57XYXz/b5mABif4otf3fXuaQFuxfCS1ueyCnIeT1xLSkupQk4M8/lp+KuneqxS5LDK
	dSQL9gifB+LDsyQatWIwO2GooC90bUW62FWUrUQrILpTbXVMe0Irr2vJ6EDkX38pOBIThqYHz0Qie
	UP1KzQpVKBMewtnAxG2J7bocfVCehFYrgXglN6GE3OVJukxXQPHoTpFKsySEtM8a79I/FrpdX8tVG
	G2xiIQfVqy5HaDSnvdVE0fdRdYoQrXNIgKYp2n5jAlD5tFbSSo5Wvm7ka4UAjCdzLDgw+AEnLUC9p
	hfqRv3pkxQ6/VcDFBn+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgyO-00000009wVo-45oV;
	Wed, 19 Aug 2026 14:08:56 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgyL-00000009wUl-2tRk
	for linux-mtd@lists.infradead.org;
	Wed, 19 Aug 2026 14:08:55 +0000
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a93dedec;
	Wed, 19 Aug 2026 22:03:47 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH v4 1/2] mtd: spi-nor: core: Fix mutex leak in spi_nor_rww_start_exclusive()
Date: Wed, 19 Aug 2026 22:03:36 +0800
Message-Id: <20260819140337.36775-2-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819140337.36775-1-runyu.xiao@seu.edu.cn>
References: <0a15f6e8-f1ca-4945-9bd5-2b64a2802a58@linaro.org>
 <20260819140337.36775-1-runyu.xiao@seu.edu.cn>
MIME-Version: 1.0
X-HM-Tid: 0aa01a55d45203a1kunm0db6d2d0140e28
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTU9KVh5KTkJNQ0wYTB9NTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ayrdjv61Na3LInCrwmOcPR3ii9Z02YiD3rL6lpx3+MK79et/zGZ25xqpw0oR1x2SsB9Cuu7QI/kIFz/H9C7LWVnFQXT/PX/c+nndU2yl85LOmK+rA4L+x2j60822tVC1F2quh7fABvLbfIYQQFEzrbW9JMs5rUFEsfaoy8//paQ=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=zGCg9rLuHCXctyeYGSM1cLTpJ4wS8crEseTBz4E8UT0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_070853_967168_FBFED12B 
X-CRM114-Status: UNSURE (   9.71  )
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

The RWW wait helpers must not block while evaluating the condition.
spi_nor_rww_start_exclusive() used mutex_lock() directly and could return
with nor->lock still held.

Switch the four RWW start helpers to conditional scoped mutex guards so
the wait condition never sleeps and nor->lock is released before return.

Fixes: 74df43b3f626 ("mtd: spi-nor: Enhance locking to support reads while writes")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Changes in v4:
- Use the original RWW locking commit in Fixes and update the subject.
- Apply the locking fix to all RWW start helpers used as wait conditions.
- Keep commit 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex
  cleanup helpers") as a stable prerequisite because it adds cleanup.h.
---
 drivers/mtd/spi-nor/core.c | 84 ++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..d5c6a925862e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1273,14 +1273,15 @@ static bool spi_nor_rww_start_io(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 
-	guard(mutex)(&nor->lock);
-
-	if (rww->ongoing_io)
-		return false;
+	scoped_guard(mutex_try, &nor->lock) {
+		if (rww->ongoing_io)
+			return false;
 
-	rww->ongoing_io = true;
+		rww->ongoing_io = true;
+		return true;
+	}
 
-	return true;
+	return false;
 }
 
 static void spi_nor_rww_end_io(struct spi_nor *nor)
@@ -1310,16 +1311,17 @@ static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 
-	mutex_lock(&nor->lock);
-
-	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
-		return false;
+	scoped_guard(mutex_try, &nor->lock) {
+		if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
+			return false;
 
-	rww->ongoing_io = true;
-	rww->ongoing_rd = true;
-	rww->ongoing_pe = true;
+		rww->ongoing_io = true;
+		rww->ongoing_rd = true;
+		rww->ongoing_pe = true;
+		return true;
+	}
 
-	return true;
+	return false;
 }
 
 static void spi_nor_rww_end_exclusive(struct spi_nor *nor)
@@ -1369,23 +1371,25 @@ static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 	u8 first, last;
 	int bank;
 
-	guard(mutex)(&nor->lock);
+	scoped_guard(mutex_try, &nor->lock) {
+		if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
+			return false;
 
-	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
-		return false;
+		spi_nor_offset_to_banks(nor->params->bank_size, start, len,
+					&first, &last);
+		for (bank = first; bank <= last; bank++) {
+			if (rww->used_banks & BIT(bank))
+				return false;
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
-	for (bank = first; bank <= last; bank++) {
-		if (rww->used_banks & BIT(bank))
-			return false;
+			used_banks |= BIT(bank);
+		}
 
-		used_banks |= BIT(bank);
+		rww->used_banks |= used_banks;
+		rww->ongoing_pe = true;
+		return true;
 	}
 
-	rww->used_banks |= used_banks;
-	rww->ongoing_pe = true;
-
-	return true;
+	return false;
 }
 
 static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
@@ -1440,24 +1444,26 @@ static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 	u8 first, last;
 	int bank;
 
-	guard(mutex)(&nor->lock);
+	scoped_guard(mutex_try, &nor->lock) {
+		if (rww->ongoing_io || rww->ongoing_rd)
+			return false;
 
-	if (rww->ongoing_io || rww->ongoing_rd)
-		return false;
+		spi_nor_offset_to_banks(nor->params->bank_size, start, len,
+					&first, &last);
+		for (bank = first; bank <= last; bank++) {
+			if (rww->used_banks & BIT(bank))
+				return false;
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
-	for (bank = first; bank <= last; bank++) {
-		if (rww->used_banks & BIT(bank))
-			return false;
+			used_banks |= BIT(bank);
+		}
 
-		used_banks |= BIT(bank);
+		rww->used_banks |= used_banks;
+		rww->ongoing_io = true;
+		rww->ongoing_rd = true;
+		return true;
 	}
 
-	rww->used_banks |= used_banks;
-	rww->ongoing_io = true;
-	rww->ongoing_rd = true;
-
-	return true;
+	return false;
 }
 
 static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
-- 
2.34.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
