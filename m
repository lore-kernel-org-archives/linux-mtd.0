Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444A0C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 06:15:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F0B461B66
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 06:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F0B461B66
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qAlc06nN8q61a8etvkKVIYoZAUq3xaUM1wKVRLVcyDM=; b=C4Uayn8BRS1bYG
	uBAlBsFnlCQFYygC7pg0x2ySc2hHWbGzvy2hpRGqZW0fs44CgsDdAFWuI0zbOalV83qrNYLI1k94A
	T8LQfqYPLCI3Lamz3y6cnUC0Mvy8UwRhMYEVn5hJM9zgJpm4PN2+RuLfOwefPqVuQTKx/NsGFqLOM
	8OfVxQAt97aLkgPhqGKY6LfkCzqveX9TX0rkOIdt8wKj6EToypcb9vCCSXNMHFV3j2PEcTZoqTHFq
	tqtq1Z/JkZnqdsgmOQYDv7ye8yUh5vT6NK9m8LQgQfiQ9xkOMShH7xKEW84k0mWebzz02swOF/Qbr
	c/LJynq3YF1P1WmzThIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnECz-003Py9-1H; Wed, 17 Nov 2021 06:14:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnECx-003Pxq-EI
 for linux-mtd@bombadil.infradead.org; Wed, 17 Nov 2021 06:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=DFAEmPcXtpPd/YSnlYCa7vsCV48/DH47DKoFE2HC6W8=; b=RQs+dlZc/iJE0doyQERQ7LRMgh
 3X1tfu/Q30APhRnF5Ef4VirkMrLgZ1op5aImQLxh2b11YXZPQ4A0b1Pz5C7orl1nszA1fJNUQa1s0
 CchP5jsjhwMwU8fbUZMY/AVoGjYPobNJqsscv2ur2eRykbRO9NEACOeX4jVtYHit0/ub9X2HwUSu9
 WhX5xrw4sP/NC1ISaYvxPA0dNQlSlQB8TtXdtJEuSaZI8m5mgr7EpJIYUzCcZnw9qw7C2F1eLhak7
 ELd0fHnmNS+wpmEoMjwzFV2S7/f1OMSiHxhzHgT9BUeFCP/qEfqGOup2GJtEsihFbjIKuIkEG2qNC
 27gP8/EQ==;
Received: from 213-225-5-109.nat.highway.a1.net ([213.225.5.109]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnECr-007MEM-GM; Wed, 17 Nov 2021 06:14:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: move all struct request releated code out of blk-core.c (rebased)
Date: Wed, 17 Nov 2021 07:13:53 +0100
Message-Id: <20211117061404.331732-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Hi Jens,

this series (against the for-5.16/passthrough-flag branch) removes the
remaining struct request related code from blk-core.c and cleans up a
few related bits around that.

Diffstat:
 b/block/Makefile            |    2 
 b/block/blk-core.c          |  341 --------------------------
 b/block/blk-mq.c            |  573 ++++++++++++++++++++++++++++++++++++--------
 b/block/blk-mq.h            |    3 
 b/block/blk.h               |   33 --
 b/drivers/mtd/mtd_blkdevs.c |   10 
 b/drivers/mtd/ubi/block.c   |    6 
 b/drivers/scsi/scsi_lib.c   |   42 +++
 b/include/linux/blk-mq.h    |   13 
 block/blk-exec.c            |  116 --------
 10 files changed, 552 insertions(+), 587 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
