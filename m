Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0736C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:07:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2847F206CA
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:07:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kguL8baz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="seI3CiJ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2847F206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rqcLLQJLl9ID7qRMBDntLuPDNwOiV8KqRhifnB+BLH8=; b=kguL8bazDQ1iTQEabu2KwHhv2
	2g/O6H2B0kOOTOlQaoioyrdpziPNO6Fi8VH4ESO8p0+tvggD+X+d0bwRM39HRY/jkY/ebWOtSvuP4
	oCnsSw9Mt3bnvvgDIxMDjdTRimWj7LvADc6Su3jTuoJ2Io7GC5s2/4SAEoxfxVlTpfFenrXFf9s/G
	pS0Q3JszzUzi5SAm7D4+/gX3e4GR4XbwrRVPEuAUHfEMOAVB7A9mdeVz+kguSG7rojIKsaPxvSrjN
	sjhGcADUL7dGut5nxTqM3QvikUNswk8aYLG816WhGiTJ7CW6CaG9lysmiZMY39E0NUeghBmvnro19
	ewJEVMA+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYmqi-0003Y2-CX; Sat, 31 Oct 2020 09:07:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmqg-0003Xo-UP
 for linux-mtd@merlin.infradead.org; Sat, 31 Oct 2020 09:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=i7wqZZpXCL5ORZNGUa3zoAoYso4IoJJ/DeaKvkfVUtI=; b=seI3CiJ37CFqQ0MPjj1WJETe3w
 OkdVzkFn+IC3T9UEq72RyY3T3xEeriFWZnBtWJv7grnje4N8Qtml6DBrgoMSlCTd8RXVAqDI7nelq
 nExmfzLlOV/zbB4Rj/UqrxG+rz/+YT9brzJfV+Z+7HBDZlwCzMJ+eJBKni1syWyMSUo/ZjcicBIM5
 OlPKDA5yWhcdJ7DF+HyMdr+E4R4ZAH230RSzfOfjnMlJMXu0mN6cm3LxL6tHXNR6OOHgkbrDHyUyn
 rXV+KfjBMm19K6Neb1knHRFJXCsue6NB6EyoO8iq4nqVUyOre0tyFcwfuDIMyzr9lI51Py9d9v0Xs
 tb8M+HBA==;
Received: from 089144193201.atnat0002.highway.a1.net ([89.144.193.201]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmqf-0007GT-57; Sat, 31 Oct 2020 09:06:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/11] block: don't call into the driver for BLKFLSBUF
Date: Sat, 31 Oct 2020 09:58:02 +0100
Message-Id: <20201031085810.450489-4-hch@lst.de>
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

BLKFLSBUF is entirely contained in the block core, and there is no
good reason to give the driver a hook into processing it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/ioctl.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/block/ioctl.c b/block/ioctl.c
index 3fbc382eb926d4..c6d8863f040945 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -369,15 +369,8 @@ static inline int is_unrecognized_ioctl(int ret)
 static int blkdev_flushbuf(struct block_device *bdev, fmode_t mode,
 		unsigned cmd, unsigned long arg)
 {
-	int ret;
-
 	if (!capable(CAP_SYS_ADMIN))
 		return -EACCES;
-
-	ret = __blkdev_driver_ioctl(bdev, mode, cmd, arg);
-	if (!is_unrecognized_ioctl(ret))
-		return ret;
-
 	fsync_bdev(bdev);
 	invalidate_bdev(bdev);
 	return 0;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
