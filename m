Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B953C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:01:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE5120756
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 09:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NwniUW4w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P8zIXf0C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECE5120756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZdmJrdc8B0lkkA+bGiKHcAMq9AF45R5bc7jd5ihivsc=; b=NwniUW4wHZXu5ZT+mIQIyjCZjp
	bgZIKRRFJY53jjt6v03ED5I6ROJ/9QKCf7q9Q6u7qId9OjTGOjBV6sbiCKqQsByIIEJYFXP6uujep
	xkot7rAnpls+p7MJSa90yD77qlLjG84YcC8xMdDb62oW244sV2qAliM1JyenoJh8j6TXpmWuXITrA
	8AHlUcxNLM4NIY3S8ORRR1j3rbxavMJNMoj35zVm3Ml/HVNzzrK/j7uabBgOcOgSBOeuUV3ykXA++
	Abc3+1CGvdPPXVCSPqPPejfTlReZq9NNiRLJSxOdgKVn1dd3VZ0blGM5uRwck2Yp5HWGnFa235clQ
	hyuFHIIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYmkN-0002m2-1C; Sat, 31 Oct 2020 09:00:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmkM-0002ll-2q
 for linux-mtd@merlin.infradead.org; Sat, 31 Oct 2020 09:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=m3FemkF6DNOHQ5D48308QA5xeoyXDyaeiceI36E77rM=; b=P8zIXf0ClaVZSlArFCi1K9v3vC
 gkxA94Uro1RF/+GgDyh9vEPwj3Y72/9SSEANZP02i5TvMe10LymbYkPYG6DMc5IDnGBjgQTalEvkc
 7TXnyFUT/j8iHkPcOXM8bZe6ReIb5uXby+YJuLwffRMuoJeVVR4je0nhesz/osz/s3vHOrEWnHbJg
 bhdDx2zoZWldSKltR8JTd7fM6O5mYbGvdN2dy0IKqcHTIM0OnVwHhznWyotA9VltkfkHOEYK1UAzy
 7nL8Sv4tjRi5d0AaEOTRMJmaYjKsZ84BKBO1I6yshpTLLvLz/fqIiFFddRo3CEr/BUnU26g1h076k
 j9lwYORg==;
Received: from 089144193201.atnat0002.highway.a1.net ([89.144.193.201]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYmkI-0006r3-1O; Sat, 31 Oct 2020 09:00:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: block ioctl cleanups
Date: Sat, 31 Oct 2020 09:57:59 +0100
Message-Id: <20201031085810.450489-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
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

Hi Jens,

this series has a bunch of cleanups for the block layer ioctl code.

Diffstat:
 block/genhd.c                     |    7 ----
 block/ioctl.c                     |   62 ++++++--------------------------------
 drivers/block/loop.c              |    2 -
 drivers/block/mtip32xx/mtip32xx.c |   11 +-----
 drivers/block/pktcdvd.c           |    6 ++-
 drivers/block/rbd.c               |   41 ++-----------------------
 drivers/md/bcache/request.c       |    5 +--
 drivers/md/dm.c                   |    5 ++-
 drivers/md/md.c                   |   62 +++++++++++++++++++-------------------
 drivers/mtd/mtd_blkdevs.c         |   28 -----------------
 drivers/s390/block/dasd.c         |    1 
 drivers/s390/block/dasd_int.h     |    3 +
 drivers/s390/block/dasd_ioctl.c   |   27 +++++-----------
 include/linux/blkdev.h            |    3 -
 include/linux/genhd.h             |    1 
 15 files changed, 73 insertions(+), 191 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
