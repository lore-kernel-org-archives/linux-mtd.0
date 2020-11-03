Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DCFC2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 10:05:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F4FE21D91
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 10:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jGJhYeAe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gVIw/Fqt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F4FE21D91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SISQ5utEwBesqQbW0xVUfDeDnZPoAeHPHc71ruIZ5dk=; b=jGJhYeAeTohPAHrmeeoIt7d3z
	3+2ByR1dliiRLGHiMlvupp5zVT/u3iNN6SIub5Rw0L+zPl03Z8edsw8UqUMrmbHYTwO9vh/jBY2Jl
	vxamWTnT4hmcBgrUgA66kf5DO9lw1xjsuGuhiE0taJW8FlNaSKp4L20xZ03/RkfGODmBnLxZGwAl+
	yiJ6spHYEh1SazItmKtVip7XHtmFEDb+hQSaYSHSYglB9mEtC160dAqhDaqasqX1F1zweDsy1l8ql
	xzblQU/ZiSmWn4Q23H53V3Jat8C/SAvLNoEVAIALOwQguSqzMRG+WxpjdS1IgbRaQ3SkLJV1j2VDs
	tPyUEgFCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtBE-0003qg-By; Tue, 03 Nov 2020 10:04:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtBC-0003qM-Hv
 for linux-mtd@merlin.infradead.org; Tue, 03 Nov 2020 10:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3WpVULkLjyjfEcc/Yeid5tcCF5pLH/mmO71d4DGUAHk=; b=gVIw/FqtFqzBIBZPKldVg1//Ci
 9laIHpf76kN3anxbzuTSBim+QmpsqCvS/VwY3r0FEfs0ruyhLX6J32SZoJif7A2LEHum4YOD8ZgvW
 omE3SQLLbajRCBpfdOrEjrzOSVpPthifBgGCQ0YsdSJliQoc346W4iyAT9mRTEVMpXff5Iwlf0VO/
 6fp6eW4owrfwFxjiHandGwJJ9KTYKG+tp8jnD/Pn+E90r4cCCUswG/mIyQT49nXtHnqS+UISkVvxv
 o2s+8xUVA+jyGMuAjXAby7ZqMKJ+YEsmFGaZ6Pn8TGo8BfibKFnElbJ3JzsLxN5MS+sJ7xqpt70Hj
 J2GHY1sw==;
Received: from 089144208145.atnat0017.highway.a1.net ([89.144.208.145]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtB9-0000CJ-U8; Tue, 03 Nov 2020 10:04:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 01/10] mtd_blkdevs: don't override BLKFLSBUF
Date: Tue,  3 Nov 2020 11:00:09 +0100
Message-Id: <20201103100018.683694-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103100018.683694-1-hch@lst.de>
References: <20201103100018.683694-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-raid@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

BLKFLSBUF is not supposed to actually send a flush command to the device,
but to tear down buffer cache structures.  Remove the mtd_blkdevs
implementation and just use the default semantics instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/mtd_blkdevs.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 0c05f77f9b216e..fb8e12d590a13a 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -298,38 +298,10 @@ static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 	return ret;
 }
 
-static int blktrans_ioctl(struct block_device *bdev, fmode_t mode,
-			      unsigned int cmd, unsigned long arg)
-{
-	struct mtd_blktrans_dev *dev = blktrans_dev_get(bdev->bd_disk);
-	int ret = -ENXIO;
-
-	if (!dev)
-		return ret;
-
-	mutex_lock(&dev->lock);
-
-	if (!dev->mtd)
-		goto unlock;
-
-	switch (cmd) {
-	case BLKFLSBUF:
-		ret = dev->tr->flush ? dev->tr->flush(dev) : 0;
-		break;
-	default:
-		ret = -ENOTTY;
-	}
-unlock:
-	mutex_unlock(&dev->lock);
-	blktrans_dev_put(dev);
-	return ret;
-}
-
 static const struct block_device_operations mtd_block_ops = {
 	.owner		= THIS_MODULE,
 	.open		= blktrans_open,
 	.release	= blktrans_release,
-	.ioctl		= blktrans_ioctl,
 	.getgeo		= blktrans_getgeo,
 };
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
