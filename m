Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C618C433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:05:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAC40205F4
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OumvMo1V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVsnqs8C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAC40205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OgUVvNkjLJzRAR49PtyZIgs5ZMth0jwiRRoHD1Ttdso=; b=OumvMo1VN4Y8j7cYH5ov4nUeSb
	/ZLln3043ruqtWzgDOG0BLnzzV9cQqtO+7kZ1w92cxT4W2Y4FYCGWstIlN5T2Zo8WwPodn39Y0vxd
	BibuWF2ceCjngGfAgUta+T7PhygDlrdH7TCG+8AXhOJ56CtfOxg1o7eSUh3sbcJA0gRXMlZC3OCyu
	85tOrXYtE3kilxFARJaGNxmoIySP7NM7Ina894xcy/FLQjSXX7VzdMXqrcXvQfS4aTXDJ+b8P8xwg
	5/gn+WqMCHI909XNrq4IiSWLsnih1ZwgV33qicdCcq+v6UOlA/9GQGpLmVA3RCLhJ+k2c2T3avGaQ
	kS+ccuWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huiI9-0005js-54; Mon, 05 Aug 2019 19:05:09 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huiGz-0003Xu-0m
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 19:03:58 +0000
Received: by mail-pl1-x643.google.com with SMTP id m9so36690727pls.8
 for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2019 12:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WTjsdbRcxllaA9qiR58nLj2IFAtYRUI1NTA117+fv/8=;
 b=QVsnqs8CAvBq1fRt/ra+IVgk34x4ot0utSWht9j3lB9GisZ7j9DUTOpAmble/vASOF
 YVvaon6Fk1Czl/E3l2EEpry2/Huj5R8UlLsJTRfK78rlIXHamMSYmf5nxumpM5o95Poq
 dtJTuTR3A+JSEDNX1Iog8S8JQMlN9x+Wpf9Eu1Ty/SdBzMgku2k9eWGIo++Hvd22tbVp
 ckD4iHeWniCgKFQN5+q3+DUBOAA2dH6+iT4Mpdss3wg0wKjwAgBv0py7ZYBF8SMA0hDA
 So8SNlbWcIhsLYwis9aaQMpuEyq1iK987PXgxQj9HhRET2q0EW9Vsymdlm0OLwXTmIaj
 k3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WTjsdbRcxllaA9qiR58nLj2IFAtYRUI1NTA117+fv/8=;
 b=Rb5K8ztOidL3b/Xr33wOHTxOlL9fLlLUFfkIBMQ/QTleM/pkAWgW/0jHnUXoi2uReA
 nlHOMfk/+kJbE11jr72Qx6GW6YfNidfJsfXWqBF8PFTzGvUnv+X3D5b2Ez58W9ulmHte
 ji5pmZfKnZbJ1Bpt5/Xu65r1sD4Qt6x1NtUTVbHD2s6UUKZaR/m8nD01JcERg7IxIKQn
 RLd6K1y7vKJPwkpTtP4bc/v3wGP7efN7x4bFazZOdrT6/2Imky2LXHRBBbnytiLV5NFp
 Zgm3GGWvjFG/Gjvv0q+0O8PA6wA7xBgU1nSCHDMrbqXwHWyy5GHiW+DQntt1OJ2l3yU7
 9Sgw==
X-Gm-Message-State: APjAAAX5tBRnuqNcuJ+V5SqROrfidPPq6fBmfRDNO4YXRBGrcTVUcle9
 xMkHkzCrevUkNEpTYLyzFkdm+fap
X-Google-Smtp-Source: APXvYqw/1BFPRLt/4SFeqmU0oQ+aCU5AhpYId2fD3Ddt5H2TV9iu7fCci5WINRz23/Rki3+PTqSa4Q==
X-Received: by 2002:a17:902:f01:: with SMTP id
 1mr145395969ply.170.1565031836118; 
 Mon, 05 Aug 2019 12:03:56 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id q198sm88045579pfq.155.2019.08.05.12.03.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 12:03:55 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v8 7/9] mtd: cfi_cmdset_0002: Split to wait write buffer to
 check if completed
Date: Tue,  6 Aug 2019 04:03:24 +0900
Message-Id: <20190805190326.28772-8-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190805190326.28772-1-ikegami.t@gmail.com>
References: <20190805190326.28772-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_120357_076513_6FB28CA3 
X-CRM114-Status: GOOD (  19.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Just refactor to split the wait from do_write_buffer().

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v7:
Rebased on top of polling status register support in master.

Changes since v6:
- Removed the tag of Koen Vandeputte as same with the v7 1/9 patch.
- Address the ./scripts/checkpatch.pl issues.

Changes since v5:
- Rebased on top of Liu Jian's fixes in master.
- Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.

Changes since v4:
- None.

Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 89 +++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 7abd844bd702..2ab0dd0b11be 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1918,6 +1918,55 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+static int __xipram do_write_buffer_wait(struct map_info *map,
+					 struct flchip *chip, unsigned long adr,
+					 map_word datum)
+{
+	unsigned long timeo;
+	unsigned long u_write_timeout;
+	int ret = 0;
+
+	/*
+	 * Timeout is calculated according to CFI data, if available.
+	 * See more comments in cfi_cmdset_0002().
+	 */
+	u_write_timeout = usecs_to_jiffies(chip->buffer_write_time_max);
+	timeo = jiffies + u_write_timeout;
+
+	for (;;) {
+		if (chip->state != FL_WRITING) {
+			/* Someone's suspended the write. Sleep */
+			DECLARE_WAITQUEUE(wait, current);
+
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&chip->wq, &wait);
+			mutex_unlock(&chip->mutex);
+			schedule();
+			remove_wait_queue(&chip->wq, &wait);
+			timeo = jiffies + (HZ / 2); /* FIXME */
+			mutex_lock(&chip->mutex);
+			continue;
+		}
+
+		/*
+		 * We check "time_after" and "!chip_good" before checking
+		 * "chip_good" to avoid the failure due to scheduling.
+		 */
+		if (time_after(jiffies, timeo) && !chip_good(map, chip, adr, datum)) {
+			ret = -EIO;
+			break;
+		}
+
+		if (chip_good(map, chip, adr, datum))
+			break;
+
+		/* Latency issues. Drop the lock, wait a while and retry */
+		UDELAY(map, chip, adr, 1);
+	}
+
+	return ret;
+}
+
 static void __xipram do_write_buffer_reset(struct map_info *map,
 					   struct flchip *chip,
 					   struct cfi_private *cfi)
@@ -1948,13 +1997,6 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				    int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
-	/*
-	 * Timeout is calculated according to CFI data, if available.
-	 * See more comments in cfi_cmdset_0002().
-	 */
-	unsigned long uWriteTimeout =
-				usecs_to_jiffies(chip->buffer_write_time_max);
 	int ret = -EIO;
 	unsigned long cmd_adr;
 	int z, words;
@@ -2011,38 +2053,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				adr, map_bankwidth(map),
 				chip->word_write_time);
 
-	timeo = jiffies + uWriteTimeout;
-
-	for (;;) {
-		if (chip->state != FL_WRITING) {
-			/* Someone's suspended the write. Sleep */
-			DECLARE_WAITQUEUE(wait, current);
-
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			add_wait_queue(&chip->wq, &wait);
-			mutex_unlock(&chip->mutex);
-			schedule();
-			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
-			mutex_lock(&chip->mutex);
-			continue;
-		}
-
-		/*
-		 * We check "time_after" and "!chip_good" before checking "chip_good" to avoid
-		 * the failure due to scheduling.
-		 */
-		if (time_after(jiffies, timeo) && !chip_good(map, chip, adr, datum)) {
-			ret = -EIO;
-			break;
-		}
-
-		if (chip_good(map, chip, adr, datum))
-			break;
-
-		/* Latency issues. Drop the lock, wait a while and retry */
-		UDELAY(map, chip, adr, 1);
-	}
+	ret = do_write_buffer_wait(map, chip, adr, datum);
 
 	if (ret) {
 		cfi_check_err_status(map, chip, adr);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
