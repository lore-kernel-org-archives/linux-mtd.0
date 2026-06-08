Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C4BCD8C9D
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2026 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g/K3k6EfCDO7JPHCgUyYxhG5FtHFZogYxWff8hFYbU4=; b=ZOd9f1e4/Xxh8Z
	mOo+ezo5enwpFSx+ygQZHzQM0/LGgn9u04HqESIkb2UvQJgVFv2KNVRbMrCNWXCnOt4kqdVDw4bxJ
	1+RWpyyRJPQFhaZNoRLTWMM8g8LWQbtSsV0HjHhEuT4EIeRPt0fvqCN9ULjTrh5HIYO9SGWNDA9B5
	oBlWryLoFjDQLwqjHsd6YoOuAxvUlC/6Ier6/dkQC/JrzkI7PbOm355IrpCK37Fmza6lxR9yGuO7m
	zV2c6w0ZpxId7b3LRjbdZ7f2oWJ9M4s8MDlsX0Rn6nnLivLErAHC2iwUMoOwBGXGk6s58oVITXpi7
	c7ddwg2weM64H4CR4QBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcrD-000000044Qy-1KWe;
	Mon, 08 Jun 2026 16:29:47 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcrB-000000044QR-1z6a
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jun 2026 16:29:46 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8423f869421so3426981b3a.3
        for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2026 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780936184; x=1781540984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b+8emAbA9Qe2QPTAVFSijG7IdGtj1XKMqOrP2cN75Qs=;
        b=OOfbUfwO92o0qsNaewBI85F0o5aMx5eYmbrQM+E71fD4QWxkA7C/Q6jVsAjZ/w8bMv
         JG3OpPpNulAytCChuOh7wNmqhqa6qzn921+0Nf5cpC3rKxTJ84KNY0X8v/KFPgtODjJV
         zQTy91eL4GXHrTxEq9EENE/3uXw+TJz+AWub8mHUB1ASFn+50eeO0M5DD5Vc9SNEfdP+
         EHai4Ism/U5e872sizG4HWs6gJ28r99KlmLnc8PewYS124KCoZ72D1aWiC/3fI2veB83
         RU16rHGXsQQov7zH35i89la42Ynq6VNg3p9k6lAx/fLsddGBbzHG1lTk6+urRnQNJFtA
         +nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936184; x=1781540984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+8emAbA9Qe2QPTAVFSijG7IdGtj1XKMqOrP2cN75Qs=;
        b=YeZQ6ktZzHRoXG5PcQcohk+cH2tFvLupd24PHnYhOCrF+awK8F6RWo064im6MN7//t
         ZJ/Ps98jDV5F861FfhHcRSs52IZMb+ynGLcBBVw3mUbiYVHmkhUhdTPEz4r6qCdR/jxd
         86NfVi7bOAgY29AshRipV5DZ34CE0H24MpSU6JHQ7jrJiHbhIo0oxybc6hIRhVfpUXP4
         mgN8YGzqDbZOUkGuKj1InciaHDe9YeyYY55zQGYQfPrCHFNRM/5ZsWlTmpLsfkmH/D2X
         ChfhL1k+1w3+He5zc6gLY4T5k8UaJZo1ZJt2lFUCNyYCRFLmPxkkUY5EK1oXHhVYO/yr
         hL2g==
X-Gm-Message-State: AOJu0Yy4rtG/qNNJT3syFd/4lbS4zBZA2xsiYkrBI45EHW5n+DUU7INr
	KSJRGPh9ffURvwrN1YLR3SzRUclp0rcRCYcUyoyMlKUeNzHrI8y+GoRf/qYTA0kPfP0=
X-Gm-Gg: Acq92OGWTyDKE/yPiSnfCKRGqofMu5I1N20M5Qm3uhIoB2t4flJMZ8IjZuW85wU9uby
	P8SnBdDhgzkIa6TrrSJR0CmD3Mb/nt/wV2VGO9Rrf5yhgU9l1x3b9lh0+vSp+SiEDuT7OUiW00q
	2ssSHl0HMTCsNiLSr8fIYj89Yq99uB7TBozPoUo08k9j2WqYQ+7p/DTfZrXxF+eHtX64v2h/qZs
	Y/hpmrsDP7k2BLSN29kFlMcsC5yUhCPgjLBk7NPTBlE8EK5CSWzNKU8ksS+wJkhhGSTbfH3S+RV
	ibIzAfPbCUJ1gy2xjS7vHt8gdoArnDlaRBVKCiE7YfGrU4wO/Dvcf/aeEe6XLFPTzH82kNrerCq
	Y83EeTwhm3Lgp/7d2G05ymMHJ9k9m92dzfokvorX3Ba3LqZTfC45DD/AJdhrlWYqnRQbAwCYsTG
	jqt4qpWM/Lmn5SZmDsAwiaVxbpgScTuLP+VNQ4Ua7eKh8rFGi0qh95
X-Received: by 2002:a05:6a00:909d:b0:842:7e71:b74 with SMTP id d2e1a72fcca58-842b0feef31mr16255771b3a.44.1780936184472;
        Mon, 08 Jun 2026 09:29:44 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:9a2:954d:67fe:d9c2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282375f2dsm19851022b3a.19.2026.06.08.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:29:44 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: slram: avoid dangling device list entries
Date: Tue,  9 Jun 2026 00:29:39 +0800
Message-ID: <20260608162939.6-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_092945_514211_22D4F691 
X-CRM114-Status: GOOD (  15.03  )
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

register_device() links a new slram_mtdlist entry before the entry is
fully initialized. If a later allocation, memremap(), or
mtd_device_register() fails, the failed entry can remain reachable from
the global list and later cleanup can dereference or free invalid state.

Build the new entry off-list, unwind partial initialization locally on
failure, and only publish the entry after mtd_device_register()
succeeds.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/mtd/devices/slram.c | 95 ++++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 69cb63d99f573..c7f6beba078fe 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -129,71 +129,78 @@ static int slram_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int register_device(char *name, unsigned long start, unsigned long length)
 {
 	slram_mtd_list_t **curmtd;
+	slram_mtd_list_t *new_mtd;
+	struct mtd_info *mtdinfo = NULL;
+	slram_priv_t *priv = NULL;
+	int ret = -ENOMEM;
 
 	curmtd = &slram_mtdlist;
 	while (*curmtd) {
 		curmtd = &(*curmtd)->next;
 	}
 
-	*curmtd = kmalloc_obj(slram_mtd_list_t);
-	if (!(*curmtd)) {
+	new_mtd = kmalloc_obj(slram_mtd_list_t);
+	if (!new_mtd) {
 		E("slram: Cannot allocate new MTD device.\n");
-		return(-ENOMEM);
+		return -ENOMEM;
 	}
-	(*curmtd)->mtdinfo = kzalloc_obj(struct mtd_info);
-	(*curmtd)->next = NULL;
+	new_mtd->next = NULL;
 
-	if ((*curmtd)->mtdinfo)	{
-		(*curmtd)->mtdinfo->priv =
-			kzalloc_obj(slram_priv_t);
-
-		if (!(*curmtd)->mtdinfo->priv) {
-			kfree((*curmtd)->mtdinfo);
-			(*curmtd)->mtdinfo = NULL;
-		}
+	mtdinfo = kzalloc_obj(struct mtd_info);
+	if (!mtdinfo) {
+		E("slram: Cannot allocate new MTD device.\n");
+		goto out_free;
 	}
+	new_mtd->mtdinfo = mtdinfo;
 
-	if (!(*curmtd)->mtdinfo) {
+	priv = kzalloc_obj(slram_priv_t);
+	if (!priv) {
 		E("slram: Cannot allocate new MTD device.\n");
-		return(-ENOMEM);
+		goto out_free;
 	}
+	mtdinfo->priv = priv;
 
-	if (!(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start =
-		memremap(start, length,
-			 MEMREMAP_WB | MEMREMAP_WT | MEMREMAP_WC))) {
+	priv->start = memremap(start, length,
+			       MEMREMAP_WB | MEMREMAP_WT | MEMREMAP_WC);
+	if (!priv->start) {
 		E("slram: memremap failed\n");
-		return -EIO;
+		ret = -EIO;
+		goto out_free;
 	}
-	((slram_priv_t *)(*curmtd)->mtdinfo->priv)->end =
-		((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start + length;
-
-
-	(*curmtd)->mtdinfo->name = name;
-	(*curmtd)->mtdinfo->size = length;
-	(*curmtd)->mtdinfo->flags = MTD_CAP_RAM;
-	(*curmtd)->mtdinfo->_erase = slram_erase;
-	(*curmtd)->mtdinfo->_point = slram_point;
-	(*curmtd)->mtdinfo->_unpoint = slram_unpoint;
-	(*curmtd)->mtdinfo->_read = slram_read;
-	(*curmtd)->mtdinfo->_write = slram_write;
-	(*curmtd)->mtdinfo->owner = THIS_MODULE;
-	(*curmtd)->mtdinfo->type = MTD_RAM;
-	(*curmtd)->mtdinfo->erasesize = SLRAM_BLK_SZ;
-	(*curmtd)->mtdinfo->writesize = 1;
-
-	if (mtd_device_register((*curmtd)->mtdinfo, NULL, 0))	{
+	priv->end = priv->start + length;
+
+	mtdinfo->name = name;
+	mtdinfo->size = length;
+	mtdinfo->flags = MTD_CAP_RAM;
+	mtdinfo->_erase = slram_erase;
+	mtdinfo->_point = slram_point;
+	mtdinfo->_unpoint = slram_unpoint;
+	mtdinfo->_read = slram_read;
+	mtdinfo->_write = slram_write;
+	mtdinfo->owner = THIS_MODULE;
+	mtdinfo->type = MTD_RAM;
+	mtdinfo->erasesize = SLRAM_BLK_SZ;
+	mtdinfo->writesize = 1;
+
+	ret = mtd_device_register(mtdinfo, NULL, 0);
+	if (ret) {
 		E("slram: Failed to register new device\n");
-		memunmap(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start);
-		kfree((*curmtd)->mtdinfo->priv);
-		kfree((*curmtd)->mtdinfo);
-		return(-EAGAIN);
+		goto out_unmap;
 	}
+	*curmtd = new_mtd;
 	T("slram: Registered device %s from %luKiB to %luKiB\n", name,
 			(start / 1024), ((start + length) / 1024));
 	T("slram: Mapped from 0x%p to 0x%p\n",
-			((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start,
-			((slram_priv_t *)(*curmtd)->mtdinfo->priv)->end);
-	return(0);
+			priv->start, priv->end);
+	return 0;
+
+out_unmap:
+	memunmap(priv->start);
+out_free:
+	kfree(priv);
+	kfree(mtdinfo);
+	kfree(new_mtd);
+	return ret;
 }
 
 static void unregister_devices(void)
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
