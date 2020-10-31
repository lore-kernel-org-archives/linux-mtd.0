Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F399C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:18:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8412D20739
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:18:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gHJcAdNh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gsAsqe/H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8412D20739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jgZ582KpY5v9bVJoQJlSIbZe/R4G2GtwwW/g2WyCiro=; b=gHJcAdNh0l/bawb5lE4gkk25T
	CYYi3g6a/2zC91myzD26NRzLS/ESjjMn4pFO0ixyLOBCm45YEiTailvjLEqoI5RWg1JAvYqxYcIsI
	upVIBYkbRM6Y8SAwpy9fYUbo9u8t+LRFT9iaYaz+q2oWwMcPSMES5ggSbHVoG8Ouctx8wPcaRMGDe
	IUNqys9OxCXQi0tQNhNHcl9N4LfysVa5mR6FyYmyOOax2ItZDj30xV6GiOoy5mvFZdfbU+5d0w6W4
	kJaK202I45Wsmn8zVRpZwSKp0VCtwCyOgcOQs3lDMWNMUbkLR7v3AyWssmUurbOCRAPChJTLzl4pq
	30NSXeWdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYn1K-00057t-Gu; Sat, 31 Oct 2020 09:17:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYn1I-00057c-6m
 for linux-mtd@merlin.infradead.org; Sat, 31 Oct 2020 09:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=QiPy3Lgic6nDpUFxJOfw2mawJ5uhHq47Zrqs9uu41iQ=; b=gsAsqe/HGXmFvNBDIcqnTyqeSv
 /+fW7OH+gdIj4TucEQO+LoO2ozVQ+EVh7iYOD7kLiyplBB1e430DA3owtMUjzhWEGI0GX2oArMOP/
 AdvpDzoM3UZUYfwicg85oLsBgjfn7bGXJrWHXfCjHSAfIVOQvReCvVgL/Afwn5SZdqoKHn+ZMpL8n
 8tgIxQFnMCFvDXOLSz/5Wtye7yWjLtbi+RHFWWSX2Utw9cxWuQfgZf+T08/ZxUXdTOIu8gj5kuVbn
 hq+cIJdBMTO7KHleVianKloWF7X6KmM8BnNOFU+GWyYLaWHYkLjmIulGD9G3dZPNMDPOw5c/deflw
 T80Bh1wg==;
Received: from 089144193201.atnat0002.highway.a1.net ([89.144.193.201]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYn1G-00080G-Kq; Sat, 31 Oct 2020 09:17:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/11] block: don't call into the driver for BLKROSET
Date: Sat, 31 Oct 2020 09:58:07 +0100
Message-Id: <20201031085810.450489-9-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201031085810.450489-1-hch@lst.de>
References: <20201031085810.450489-1-hch@lst.de>
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

Now that all drivers that want to hook into setting or clearing the
read-only flag use the set_read_only method this code can be removed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/ioctl.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/block/ioctl.c b/block/ioctl.c
index a6fa16b9770593..96cb4544736468 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -346,26 +346,6 @@ static int blkdev_pr_clear(struct block_device *bdev,
 	return ops->pr_clear(bdev, c.key);
 }
 
-/*
- * Is it an unrecognized ioctl? The correct returns are either
- * ENOTTY (final) or ENOIOCTLCMD ("I don't know this one, try a
- * fallback"). ENOIOCTLCMD gets turned into ENOTTY by the ioctl
- * code before returning.
- *
- * Confused drivers sometimes return EINVAL, which is wrong. It
- * means "I understood the ioctl command, but the parameters to
- * it were wrong".
- *
- * We should aim to just fix the broken drivers, the EINVAL case
- * should go away.
- */
-static inline int is_unrecognized_ioctl(int ret)
-{
-	return	ret == -EINVAL ||
-		ret == -ENOTTY ||
-		ret == -ENOIOCTLCMD;
-}
-
 static int blkdev_flushbuf(struct block_device *bdev, fmode_t mode,
 		unsigned cmd, unsigned long arg)
 {
@@ -384,9 +364,6 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
 	if (!capable(CAP_SYS_ADMIN))
 		return -EACCES;
 
-	ret = __blkdev_driver_ioctl(bdev, mode, cmd, arg);
-	if (!is_unrecognized_ioctl(ret))
-		return ret;
 	if (get_user(n, (int __user *)arg))
 		return -EFAULT;
 	if (bdev->bd_disk->fops->set_read_only) {
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
