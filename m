Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40008C19F2A
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Aug 2022 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DP6z3OWb1oNsCYzgPCnUkjMRKHxPzT+hbbEAuOpDaTU=; b=GxdEb9jErR7YA4
	W8mYc/iPM7Ayw2a0lXht3/AujHrLK1SlOq3F8+QutNs922YKjOv+memxrIOmTFEsHpPhmB7bYD51n
	Rxk4xOGW94m1wNf+x8Gzu1Oj9OtOttZwwr+lqDtaRsDNBvQd9nUTVA0ncg4fAO4lD5ge9gAjar2hZ
	nmRd3l3ZLrEdMdzDiaVPTLGAVtXwIsLme+CG/HK4a0Tu66Lh4g5T/WAbN4XHnFmSf6VeWej6vjTI5
	n+GmFLHbW1kB3ZD4IQLsXepvfdei3zVqESTBi6OX40HohGPNntycpFSMLNIZKSkTzAyG5uq2BnZmx
	MF217MpGQED6vfoWK3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4lE-00Asmd-Us; Thu, 11 Aug 2022 09:45:53 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4l8-00AsiF-FZ
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2022 09:45:48 +0000
Received: by mail-pg1-x530.google.com with SMTP id s206so16704534pgs.3
        for <linux-mtd@lists.infradead.org>; Thu, 11 Aug 2022 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=b1Oaj9/hWDIoo7LWr94R9u2w+RwUUbKnMZZWr2HsxQE=;
        b=ak5QpeBS2N6qRW05UyzyGYDGeCO7vvG2yA+Fi7NrN8C86UV7Jrtd5G9BJRTEcTSP8q
         RckD+DHPrK2iDTQ9uY2KmlrmzPt5Od+CGDFytLFoimuyNRd6DPWpjD0r6XeWpZ8K9tC2
         0qRCfthitp0nixHRWOKulwmo7I6T9y3H0bHBMAxp3OPtZQG+sBk3G4x3abPDHkdYHkgA
         aJn/6AkylpcuVHQIuvPAlbcDmpSUnCBwc+Xhlt7Mig94UqDgsk2V9CZGAKz5OZwgl/Tv
         g9UpX6W/fDlOy1ChVkshNPHrwT3xMgm/zUs6ylu04yakQw0cXqcOLMvoxDlEB7PZ8GED
         Qk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=b1Oaj9/hWDIoo7LWr94R9u2w+RwUUbKnMZZWr2HsxQE=;
        b=7KVb+kznG+W7g7EW8Sb+i0Aw+q3wwMqIZkNWhdpQCqWDS+OgD1OAR2tl73QdkVdkBx
         XcMU51X4Y0CiPEZx5E/rdc1+3sSog62MLAfPvR/Wyb6I4gwP2yiOy/eyEGDojf79+NWI
         3VpCPU7KJZprsOiWNceA4x5EAZeceV3a1sNynNAK9KPd9SpijaDCzKk3boLvJzuGVv8T
         h8k7f0tbihD3+ZCwCpu2k7BPYp0Bm8pT1RGQNQ4HPzxHT+Ut8dcpnfFMoqOh1l+XBiSW
         KSVHnYTxVbqudm+7pmNe+EmFrTUOTUHxsHfUe08eb5MWYBELdxD1zcKSQEq9p3mnx5EM
         0hUQ==
X-Gm-Message-State: ACgBeo2yjnGHzV9WeTJNB7wiR0wSvgCFCSF7Yp58HJ3JfDSiuZpN1Wzs
	uLGEVeNt2Ev7dckabqFD+1zKd/Vneuk=
X-Google-Smtp-Source: AA6agR4NS31mNnMSsiF9o6+pOKg/fVqFJ22nTctuMod1RR4nAC5IXshMx7h5ZFppXV3bpXaHxrvRVg==
X-Received: by 2002:a63:2d46:0:b0:41d:858b:52ff with SMTP id t67-20020a632d46000000b0041d858b52ffmr14289298pgt.516.1660211145274;
        Thu, 11 Aug 2022 02:45:45 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id x14-20020aa79ace000000b0052d7606d144sm3586922pfp.74.2022.08.11.02.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 02:45:45 -0700 (PDT)
From: JaimeLiao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: jaimeliao@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 2/4] mtd: spinand: Add continuous read state
Date: Thu, 11 Aug 2022 17:45:34 +0800
Message-Id: <20220811094536.24498-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220811094536.24498-1-jaimeliao.tw@gmail.com>
References: <20220811094536.24498-1-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_024546_580426_0C566EE4 
X-CRM114-Status: GOOD (  10.53  )
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

Add continuous read state and initialize state to
default false.

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 8 ++++++++
 include/linux/mtd/spinand.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index dc2e1dc1dbee..380411feab6c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -193,6 +193,11 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
 
+static void spinand_init_continuous_read(struct spinand_device *spinand)
+{
+	spinand->use_continuous_read = false;
+}
+
 static int spinand_continuous_read_enable(struct spinand_device *spinand)
 {
 	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE,
@@ -1261,6 +1266,9 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->ecc_strength = nanddev_get_ecc_conf(nand)->strength;
 	mtd->ecc_step_size = nanddev_get_ecc_conf(nand)->step_size;
 
+	/* Init continuous read */
+	spinand_init_continuous_read(spinand);
+
 	return 0;
 
 err_cleanup_ecc_engine:
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 37b46c556bd7..d70a6f49cc6f 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -415,6 +415,7 @@ struct spinand_dirmap {
  *		because the spi-mem interface explicitly requests that buffers
  *		passed in spi_mem_op be DMA-able, so we can't based the bufs on
  *		the stack
+ * @use_continuous_read: record the continuous read status
  * @manufacturer: SPI NAND manufacturer information
  * @priv: manufacturer private data
  */
@@ -443,6 +444,7 @@ struct spinand_device {
 	u8 *databuf;
 	u8 *oobbuf;
 	u8 *scratchbuf;
+	bool use_continuous_read;
 	const struct spinand_manufacturer *manufacturer;
 	void *priv;
 };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
