Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150CBC388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:05:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B036C20756
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:05:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="diXxtv1a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ym5ZpzHK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B036C20756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YvK21/bSfxF9SCTpCnygwb1P6xAuVHaU0rD5cccI58s=; b=diXxtv1aFxFnicZbA7upYxz3d
	iF9HeTSRTcaqiGA9cWp4Y4Tr6dxQohQip3hKk0imX7tz8hEbHUF+abSap5wsLmPLHzli9Cfj+Lrqv
	dYhGiEoK0qgNe2LRiH6FiVvMHTxf/VbSuszskTZc3JrWYc84hSA0XIW6rJ3FTIt64oiTcpBK3ephd
	htcQ7Yl4i+a2ZPAZFB8055y8igVBlYawH/YLfpSS5SRlrOixtlLwtTaLNzSAhiSd5qLlxxBMuL15A
	r4nuz/N8dlHlmiXJF7rSZJmVeqMMEEI5OssorEb3Yl8zx1fA3+1v2T7/hqpyio1VzRq6VEg0t15Rj
	hz7Q8soVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYmob-0003CY-77; Sat, 31 Oct 2020 09:04:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmoZ-0003CM-Nq
 for linux-mtd@merlin.infradead.org; Sat, 31 Oct 2020 09:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ccFP0prAIqmawhHUijWCb+7+0K8IzQR5e/dvexyFO7w=; b=Ym5ZpzHKJJlJDCRVypUAPGA7II
 66cevz7I1EwaypqqFcVa4mhtzXPSi14G+BSzgrfzXjomstRfmzNHCsxM5hd29idZSqhKB1/O4HyWG
 cI6qz9Lwu++xOvn9i+X8tPtN8trZ9oJtLj76lZSWkXb3ZLGYjohpW/C91ZUiGJDWAilob25tuOxU8
 wWmbGMxU1XT1LIZmT1gjKko1SC7eCo8YP6MVaFj8XbUPgjJpMHk0q7JXRlJcdwutx3Bh5cFR0nxhS
 jV54N+PYZt0wvKMUO99H8jx8u1/OuX1wJitqfVVZIpjpCZ/SAnQ8ifL/aOAbUP72QXrCbKu6iqTeH
 +dYElAMg==;
Received: from 089144193201.atnat0002.highway.a1.net ([89.144.193.201]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmoY-00076g-4q; Sat, 31 Oct 2020 09:04:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 02/11] mtip32xx: return -ENOTTY for all unhanled ioctls
Date: Sat, 31 Oct 2020 09:58:01 +0100
Message-Id: <20201031085810.450489-3-hch@lst.de>
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

-ENOTTY is the convention for "driver does not support this ioctl".
Use it properly in mtip32xx instead of the bogys -EINVAL.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/mtip32xx/mtip32xx.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 153e2cdecb4d40..893be95eceb34e 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -2029,7 +2029,7 @@ static int mtip_hw_ioctl(struct driver_data *dd, unsigned int cmd,
 	}
 
 	default:
-		return -EINVAL;
+		return -ENOTTY;
 	}
 	return 0;
 }
@@ -3215,12 +3215,7 @@ static int mtip_block_ioctl(struct block_device *dev,
 	if (unlikely(test_bit(MTIP_DDF_REMOVE_PENDING_BIT, &dd->dd_flag)))
 		return -ENOTTY;
 
-	switch (cmd) {
-	case BLKFLSBUF:
-		return -ENOTTY;
-	default:
-		return mtip_hw_ioctl(dd, cmd, arg);
-	}
+	return mtip_hw_ioctl(dd, cmd, arg);
 }
 
 #ifdef CONFIG_COMPAT
@@ -3254,8 +3249,6 @@ static int mtip_block_compat_ioctl(struct block_device *dev,
 		return -ENOTTY;
 
 	switch (cmd) {
-	case BLKFLSBUF:
-		return -ENOTTY;
 	case HDIO_DRIVE_TASKFILE: {
 		struct mtip_compat_ide_task_request_s __user *compat_req_task;
 		ide_task_request_t req_task;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
