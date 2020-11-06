Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E678C2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 14:09:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 763CB207DE
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 14:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hOwFqP31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 763CB207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q4T1+TpyPoX/J94OCvHsm8lghbv0zkP/OhOOfyFoISo=; b=hOwFqP31RPJjnQu4Z3n2TZwD15
	DgIOtRk/zswvoYNFMRna9BELgmUfw7ofeZ56v3YAug16XSdnCif9zTRd/bTDLKLc86t2RETUJS4bo
	aUbxs01dT06QjMdSDnFT3ldll0mWEsO0jLoZ+OPyobXTBj5xdRd8wY5gWBkwhkjOeI8hYIbAkXA/4
	ot7Xrx6JO0JSCFqc/6YyGKe5sm28/GmWIO0vPniGwpSRub8tAlvyo7t2HaMsSnhF64XuXv8oc+z93
	FSuUbfIY3r3dXS7bF15FfFJXEoSa2gwzoWG/Fm61MlGJNJkUtZRBBA08jbgZhvlEeBl0SDN1Nv3d6
	Nk4oP+zQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb2Pg-0002FB-3N; Fri, 06 Nov 2020 14:08:24 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb2Pd-0002E8-He
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 14:08:22 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 59BF668B02; Fri,  6 Nov 2020 15:08:18 +0100 (CET)
Date: Fri, 6 Nov 2020 15:08:17 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH, RFC 11/10] block: propagate BLKROSET to all partitions
Message-ID: <20201106140817.GA23557@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_090821_706751_C04004A8 
X-CRM114-Status: GOOD (  12.04  )
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
 Vignesh Raghavendra <vigneshr@ti.com>, martin.petersen@oracle.com,
 linux-s390@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


When setting the whole device read-only (or clearing the read-only
state), also update the policy for all partitions.  The s390 dasd
driver has awlways been doing this and it makes a lot of sense.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/ioctl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/ioctl.c b/block/ioctl.c
index 6b785181344fe1..22f394d118c302 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -354,7 +354,10 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
 		if (ret)
 			return ret;
 	}
-	bdev->bd_part->policy = n;
+	if (bdev_is_partition(bdev))
+		bdev->bd_part->policy = n;
+	else
+		set_disk_ro(bdev->bd_disk, n);
 	return 0;
 }
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
