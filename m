Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA61BC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E52F6008E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E52F6008E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYnidvEFgy5q0HLzv2PW6llsVKlXTIMJTATvUu4KrP4=; b=42My3i/uPy0d1h
	qI9cJMHRl7j+GTuCTVF+h0yFy4k2W6EJMnBefDNMrP9fR3Cbal4B56hz934PnpvEgt4ca2/FW6uJk
	3sfIgSn7BPMLgjpSD3OnTyhVdUXKu2ENPhFbCtG5WnjT4uGC1qsqdk2MSHWtMtxPMabjuA28Nbwd6
	TqYZZ/CP0P8T+1I13/5vh6lGEB7oEbfX+ALV7S6/6f3HqOXZ1QY5BQ/lPejoOrxPWocUr4eLbvD4m
	BpL3SK+n3kY1VYjPQdeVO4HmeSsUvJNxNiGP8rabfgPddYCheFTmRkWWlIMHgt/LzjHCYU0HHMKUZ
	5YhfWrZP3+nwu9ztD1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meuBz-00FYBn-V2; Mon, 25 Oct 2021 07:14:48 +0000
Received: from [2001:4bb8:184:6dcb:6093:467a:cccc:351c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meu3K-00FUaP-HR; Mon, 25 Oct 2021 07:05:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 12/12] block: don't include blk-mq headers in blk-core.c
Date: Mon, 25 Oct 2021 09:05:17 +0200
Message-Id: <20211025070517.1548584-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025070517.1548584-1-hch@lst.de>
References: <20211025070517.1548584-1-hch@lst.de>
MIME-Version: 1.0
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

All request based code is in the blk-mq files now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index ebcea0dac973d..94b76d62a4396 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/bio.h>
 #include <linux/blkdev.h>
-#include <linux/blk-mq.h>
 #include <linux/blk-pm.h>
 #include <linux/blk-integrity.h>
 #include <linux/highmem.h>
@@ -47,8 +46,6 @@
 #include <trace/events/block.h>
 
 #include "blk.h"
-#include "blk-mq.h"
-#include "blk-mq-sched.h"
 #include "blk-pm.h"
 #include "blk-throttle.h"
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
