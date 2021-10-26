Return-Path: <SRS0=fZpl=PO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D9BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 05:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 593F161074
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 05:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 593F161074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyQGe+PiSp3t0YnEHHEmof9Ep587Qlhu+Lh/cML2BN4=; b=YyKSfDhvSQyHSN
	c+uqxbCRRAz5JtYDubjiIZ6GU8xRj8uF+vxLEuOh+mE9vXDI58dD5lvXntEfAn7EMB3d4u4Ila/3D
	5TX1F9UhcM2vP7ZcNaZ1PObUTWqS4vvOmOMfkS08j5OQQtsgLVvDVv1OYfjmaYDZPrVaw0s5pALLj
	QNdBGb4dUFJTbVKtxEAxT1cftwziwexTkQ/502u4saKqjCxr57i/Fj0WCt+W4SjK4roym4LcvcJLr
	wYzTthvuW6x+zOI9rpVG7BGkNymnaVzUl8EjYBN04Z8f3EZSGb11yMT7/BNZV3Co+W3dfmp3SAVM2
	VkTZWx8FCzcmaemk6zKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfFRS-000jHr-L7; Tue, 26 Oct 2021 05:56:10 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfFRL-000jF6-9n
 for linux-mtd@lists.infradead.org; Tue, 26 Oct 2021 05:56:08 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 4FDDED6F7D;
 Tue, 26 Oct 2021 05:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1635227760; bh=pSFGkotVeNb5qsNJzmaYe1nuIoE4MQOk1MI2epzMezw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=mb4c8iQmnzJxx1dB8NEUWqgGmzC7/ebnkAlILjN+AKwCaCPhEUwOJaqLEcie/Myfr
 wx6MzX1keEO1GrxO7anneoiClnG2OOLaaUblcnSC4pB9r80TlF45IObvhThZWbeBYy
 s+OGmKSeBoBj/WOx6zHGfezRR48ZE/xKu6xSvUp1sDFWalZVQ/XsnWSS4HJAqXcVY/
 gKyA8fZCESCdAzHFYU/PXm5dHffp504H7FQymVHOv3mPlGhILWPnuWpqTbU5EdXP7C
 CE+ZQ93RqaegsqBaV7BvXCrI2GL7BIQGMeoxjkh3u7dCx+1lfazjKNO+Mj72uzk3rm
 z53FfnOAcDnhg==
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] mtd: rawnand: nand_bbt: hide suspend/resume hooks
 while scanning bbt
Date: Tue, 26 Oct 2021 07:55:48 +0200
Message-Id: <20211026055551.3053598-2-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211026055551.3053598-1-sean@geanix.com>
References: <20211026055551.3053598-1-sean@geanix.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_225603_987041_9EF49779 
X-CRM114-Status: GOOD (  16.32  )
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

From: Boris Brezillon <boris.brezillon@collabora.com>

The BBT scan logic use the MTD helpers before the MTD layer had a
chance to initialize the device, and that leads to issues when
accessing the uninitialized suspend lock. Let's temporarily set the
suspend/resume hooks to NULL to skip the lock acquire/release step.

Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
Tested-by: Sean Nyekjaer <sean@geanix.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index b7ad030225f8..93d385703469 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1397,8 +1397,28 @@ static int nand_create_badblock_pattern(struct nand_chip *this)
  */
 int nand_create_bbt(struct nand_chip *this)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
+	int (*suspend) (struct mtd_info *) = mtd->_suspend;
+	void (*resume) (struct mtd_info *) = mtd->_resume;
 	int ret;
 
+	/*
+	 * The BBT scan logic use the MTD helpers before the MTD layer had a
+	 * chance to initialize the device, and that leads to issues when
+	 * accessing the uninitialized suspend lock. Let's temporarily set the
+	 * suspend/resume hooks to NULL to skip the lock acquire/release step.
+	 *
+	 * FIXME: This is an ugly hack, so please don't copy this pattern to
+	 * other MTD implementations. The proper fix would be to implement a
+	 * generic BBT scan logic at the NAND level that's not using any of the
+	 * MTD helpers to access pages. We also might consider doing a two
+	 * step initialization at the MTD level (mtd_device_init() +
+	 * mtd_device_register()) so some of the fields are initialized
+	 * early.
+	 */
+	mtd->_suspend = NULL;
+	mtd->_resume = NULL;
+
 	/* Is a flash based bad block table requested? */
 	if (this->bbt_options & NAND_BBT_USE_FLASH) {
 		/* Use the default pattern descriptors */
@@ -1422,7 +1442,13 @@ int nand_create_bbt(struct nand_chip *this)
 			return ret;
 	}
 
-	return nand_scan_bbt(this, this->badblock_pattern);
+	ret = nand_scan_bbt(this, this->badblock_pattern);
+
+	/* Restore the suspend/resume hooks. */
+	mtd->_suspend = suspend;
+	mtd->_resume = resume;
+
+	return ret;
 }
 EXPORT_SYMBOL(nand_create_bbt);
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
