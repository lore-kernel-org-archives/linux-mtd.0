Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28994C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 06:20:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9E1061BFA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 06:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9E1061BFA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1uywC+FzjXG+Q0/6rz4JBH85mtO+99NWOiTkAvDPVOA=; b=GZpAza5Q/SgORT
	BCraGQUhh9yO0XVkoxCIneM3n8GlR++CaYRt3mvszQQMvp212gFjnzB+QeGiRb1VLWjq0QL4DBX6Y
	CrNpyuh4TneB75E7EbePRoWDPDL6ucvPz2X4vsBN94npu6K85hQmfAYDXFt0ETHWs2n4WMx+Mty3l
	+DJuORd+uNPGYXBQ0pVM9V5k6LhnqKe19Bt2ZAs0Bq69ZE2REBM/6EWgXPGa4S9sMFe/CO5CMSRI5
	fYzEUNqOw3H026e7pCa1nuP8WN352oG3CxjuHgpiEkTLZLdM0Onho+ki7wi4P/1Ag6jrQW1dwkKnZ
	NgW624pfzTRcW2dhAt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnEIe-003Roz-E1; Wed, 17 Nov 2021 06:20:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnEDC-003Q0V-0d
 for linux-mtd@bombadil.infradead.org; Wed, 17 Nov 2021 06:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=viN/M0s94isJpAI9XG+tAyGwzk5B+gYmCJUD6Ta5toY=; b=DmCyOSBxb/zzr/09ETedwRIi2e
 wWu/BkxWyRBfumSegeofjM4bpJqi0m9vEI6i0xBOuwI9Gwh9MMNARP0J1F9Vi9I05uDZZCDVSr+W7
 v9lYzYgc/g9CT+TAXDZrBx3TfrOM9xdGQVNfZ5UL98rTwqUPY69IfH0kbS2cMcJum/4sAFZCyejEl
 Ld9+aLsy/l6DJB7tm7Tuw0xxCu6mDG81/dFRT8+GIjorxEdkJ7tDF6hlJWRn+vUKnOlAoGTIyotui
 COsMsboULPAegSzeAsB1bqpm86SsCfyVxLTBY193JUQFR0jleXGT9xRyU2za1UJ6jIBPeHLvLrHJd
 qU0PwygQ==;
Received: from 213-225-5-109.nat.highway.a1.net ([213.225.5.109]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnED9-007MHU-OQ; Wed, 17 Nov 2021 06:14:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 11/11] block: don't include blk-mq headers in blk-core.c
Date: Wed, 17 Nov 2021 07:14:04 +0100
Message-Id: <20211117061404.331732-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117061404.331732-1-hch@lst.de>
References: <20211117061404.331732-1-hch@lst.de>
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

All request based code is in the blk-mq files now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 5722c1d9da09c..ee54b34d5e99c 100644
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
