Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA5EC77B62
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBwRF2sd8FtjNAsC2TgVx1c03eBG1dmm6VN8dEiDKPo=; b=y1yhknlgbpafq9
	bTzxd7KD8wSE5F9Z9B9GrtMISSaG4B7mlVWBzuXRBr8/f8EmXyvwOf6VvWDVEab3orc1950mjtWHT
	t6Xb/fEg5nbtjnZwDqi0AMyIpvX+KWQySrd6A9JZcmdHSb6WgkWs+dQd5Kcvyne30kbQCUVbgdQx5
	Bmbk9YAFNrQ81hHKdYSMlT4P5wT4f+36xdR893SEA7b+blbnsXjHLE+Qdm8HAZC5AdvCKnlAF0bP3
	iHCVBCNQz7lqIvanSu9Gk4bct7MThQ0a05KuJekMqHOOkfSvKD8R7e3qtu65TCijXoFbw5nLg5ydS
	ywtd8tW0o7gg5whd8K2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBS8-00EyuQ-1h;
	Tue, 28 Mar 2023 15:41:40 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBRj-00Eye3-1t;
	Tue, 28 Mar 2023 15:41:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9EF4B6000B;
	Tue, 28 Mar 2023 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680018074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m2kwOBPwszdSQgwOySfHyRaHUutXhyEyP6vkV70p3ME=;
	b=cb02EC4ocRqBK8FdytFlRY6n9Y6juGigWAVXK6jXAERYDg9gx9JIkL0SRfn8oRVm6SIZFZ
	/ITZXoGw1iJ/lSB0w44i44ESsu4FTssaxHQbSeDCsYL07OM0i1RyMyo9itEuAnrWeuTii7
	zdy+YIS5JYn+VVDkN0VHVlSfbZJupuECrUBgl5OgYuI2oMIexuKC7vMslD+D/Dm9NxESMU
	/D+jgHMV71vw86vaHruyU3YLKrBpIfJNIOU0DKHjnoAxZzfX2/qdpUHI+QRI02vXz21vqq
	FOrvJYTUT+ya8RirUIk2qQyqipEAPBawrqmS1wULSh1kq6ZbIJ9bXLo0bw6Jkg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michal Simek <monstr@monstr.eu>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 3/8] mtd: spi-nor: Reorder the preparation vs. locking steps
Date: Tue, 28 Mar 2023 17:41:00 +0200
Message-Id: <20230328154105.448540-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328154105.448540-1-miquel.raynal@bootlin.com>
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_084115_910623_9850DC5F 
X-CRM114-Status: GOOD (  14.52  )
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

The ->prepare()/->unprepare() hooks are now legacy, we no longer accept
new drivers supporting them. The only remaining controllers using them
acquires a per-chip mutex, which should not interfere with the rest of
the operation done in the core. As a result, we should be safe to
reorganize these helpers to first perform the preparation, before
acquiring the core locks. This is necessary in order to be able to
improve the locking mechanism in the core (coming next). No side effects
are expected.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 23 ++++++++++-------------
 drivers/mtd/spi-nor/core.h |  2 +-
 drivers/mtd/spi-nor/otp.c  |  8 ++++----
 drivers/mtd/spi-nor/sst.c  |  2 +-
 drivers/mtd/spi-nor/swp.c  |  6 +++---
 5 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 7d9ca799f767..3a7a407919e7 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1070,27 +1070,24 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 	}
 }
 
-int spi_nor_lock_and_prep(struct spi_nor *nor)
+int spi_nor_prep_and_lock(struct spi_nor *nor)
 {
 	int ret = 0;
 
-	mutex_lock(&nor->lock);
-
-	if (nor->controller_ops &&  nor->controller_ops->prepare) {
+	if (nor->controller_ops && nor->controller_ops->prepare)
 		ret = nor->controller_ops->prepare(nor);
-		if (ret) {
-			mutex_unlock(&nor->lock);
-			return ret;
-		}
-	}
+
+	mutex_lock(&nor->lock);
+
 	return ret;
 }
 
 void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 {
+	mutex_unlock(&nor->lock);
+
 	if (nor->controller_ops && nor->controller_ops->unprepare)
 		nor->controller_ops->unprepare(nor);
-	mutex_unlock(&nor->lock);
 }
 
 static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
@@ -1446,7 +1443,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	addr = instr->addr;
 	len = instr->len;
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
@@ -1706,7 +1703,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
@@ -1752,7 +1749,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index bf2e64671856..c4c78729ccea 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -647,7 +647,7 @@ int spi_nor_write_disable(struct spi_nor *nor);
 int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_global_block_unlock(struct spi_nor *nor);
-int spi_nor_lock_and_prep(struct spi_nor *nor);
+int spi_nor_prep_and_lock(struct spi_nor *nor);
 void spi_nor_unlock_and_unprep(struct spi_nor *nor);
 int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 00ab0d2d6d2f..9a729aa3452d 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -255,7 +255,7 @@ static int spi_nor_mtd_otp_info(struct mtd_info *mtd, size_t len,
 	if (len < n_regions * sizeof(*buf))
 		return -ENOSPC;
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
@@ -325,7 +325,7 @@ static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
 	if (!total_len)
 		return 0;
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
@@ -415,7 +415,7 @@ static int spi_nor_mtd_otp_erase(struct mtd_info *mtd, loff_t from, size_t len)
 	if (!IS_ALIGNED(len, rlen) || !IS_ALIGNED(from, rlen))
 		return -EINVAL;
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
@@ -460,7 +460,7 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
 	if (!IS_ALIGNED(len, rlen) || !IS_ALIGNED(from, rlen))
 		return -EINVAL;
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 63bcc97bf978..688eb20c763e 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -126,7 +126,7 @@ static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 1f178313ba8f..0ba716e84377 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -348,7 +348,7 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
@@ -363,7 +363,7 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
@@ -378,7 +378,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
