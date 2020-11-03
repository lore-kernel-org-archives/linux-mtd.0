Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB925C388F7
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 10:20:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0F1206B5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 10:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="flQofOsv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EUCvbfmE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A0F1206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/OfrUn/95IFiUPZZMmGxdLimzCVnoJky7OJDEKdgoc4=; b=flQofOsvw1cUOT+7Ia0nYPqnf
	yA3iAaXWMtNxKnvkezvlnUPnK3gPEPyBIOmCY4G/54fnlVl/4R/fMXoF9n6spih6SIm2BDY0IvhUr
	fTo9jANaTQlgQxNR2XG9fG+morGIlnalhxptPpF3eAjXAvzX3d8db6Lw1jdlFHO/dXy0qRHPtQS1X
	TuLpO4pA0mbJLrbeUxMhZ8YACVRUMwUYH7tnY99WhicMGNxxHGdgFwOhdw6yd3nFwuUvVLwjPG8X1
	8VUK1pcrfOl0i5AnRpQNqrVMbumJs1fNmjN462J/tK7VnV2mGbesSSCGBYDF6GBAaHb/+bLD+WxuU
	31vALYRyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtQ9-0006yu-Tk; Tue, 03 Nov 2020 10:20:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtQ1-0006wi-CY
 for linux-mtd@merlin.infradead.org; Tue, 03 Nov 2020 10:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=LHct6feTU7L0nCAl+LeQycCuOcwMhUL/YjRE2qUcCWU=; b=EUCvbfmEHp0IpQXzmXvVfjnuzg
 bGacAQCt80Bel0nlDOWWmOEIu/92AmksnWinXhnPhdMMDlfDf9FWoNM/HuCdCVlXtkm5MKufxnkWl
 tmml6TFttlAkN6GyTx5qY1zJ35r9pIfWBr3CCmLw9v3jU9ByIaFXZdGMCEdW6UwvW98v+8E49fxsE
 2Q0crdFjqYy1xBCp1I2lopKAMDshkL5oH0AreUZMk7orAKa7C7dZZtw073QaVZMp7z6Oj3cF02CsO
 zbgIDwcet1zYdy3v6MbWqKOcNo4agmG3Uqi/KWqZlLjJOaqxKGyNVjTkM97Oi53FMQhp8PfMNsbni
 qQdNOW2g==;
Received: from 089144208145.atnat0017.highway.a1.net ([89.144.208.145]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtPz-0001Dl-Fp; Tue, 03 Nov 2020 10:20:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/10] loop: use set_disk_ro
Date: Tue,  3 Nov 2020 11:00:16 +0100
Message-Id: <20201103100018.683694-9-hch@lst.de>
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

Use set_disk_ro instead of set_device_ro to match all other block
drivers and to ensure all partitions mirror the read-only flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index cb1191d6e945f2..3e1ea45bb315d8 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1137,7 +1137,7 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	if (error)
 		goto out_unlock;
 
-	set_device_ro(bdev, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
+	set_disk_ro(lo->lo_disk, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
 
 	lo->use_dio = lo->lo_flags & LO_FLAGS_DIRECT_IO;
 	lo->lo_device = bdev;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
