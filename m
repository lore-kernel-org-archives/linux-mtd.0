Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3611C63697
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:17:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F682224D
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BgxSiBEr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="shpiisUA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F682224D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WfmOYe61xajgQHxU/1/DEUgghTZG41S9qjrvxeExy9o=; b=BgxSiBErUhNperEvT+IMmpZdv
	FvzswjftLk5lRQ0AN2+TKyHOh5hC8+wrPTLjduxM3juycptbks7nYiG2Pw/ZsDzRfEc6pboeFO2em
	NxZWttQAavhhe1uruaJXez94zHROwntQXpf+T1uYglv/CqwPzSZz66XqTUWVl+uh6hz0frVJ7/W2O
	bXKrRistViddPd6332DHWFTHq7+8THZRlMnbycQDbxosKbbfrNo+El/3kw+OV4yTKw+2LTNIkCxWo
	dkzemWCUYALxWRO3DgkL+dwM6KJZpocS3DmXEZ1YH8TVV2qMy7pqoW3HbiLa2EpzkR9ow2o75Mco3
	ocR6HWV7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2tF-0000wI-B5; Sat, 28 Nov 2020 16:16:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2se-0000lK-Iv
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=2uWDeQgsBeIc9r8ohTt9OrV40AdHP0SZhV+7+E52opA=; b=shpiisUAhts82WFLQNhdzcv7gf
 cVXdTqnjKFz6zzbQfWDVeyUWw5ZitA4C1KMpmS00s5jdL1Tl5dH/EJAgvASHZak5i+LPVhjxY70m9
 hWE2iHpA6jngvi/UzdCraCOzf6O2BGU5xGNAzeAVONtlffl2qaRwK677uBtkU+NRx/fx6Y+8YnogM
 hEuHXUziGVxxk6pZ5ZKe6tSPOYqqoLGuyOo3PQuS/pzr9RxgfNVrjR5q+7/M/xgtcITAbcfpLu0jJ
 Yla6VRt48cUuPRK/EfdZ/nz0mD+7eNkKyZmm0XBWVj5T4VdNG7s6tYmt/d2n+b0Mat81gCz7MOBq6
 Euy92KgA==;
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2sd-0000DU-6A; Sat, 28 Nov 2020 16:15:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/45] loop: do not call set_blocksize
Date: Sat, 28 Nov 2020 17:14:32 +0100
Message-Id: <20201128161510.347752-8-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128161510.347752-1-hch@lst.de>
References: <20201128161510.347752-1-hch@lst.de>
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
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

set_blocksize is used by file systems to use their preferred buffer cache
block size.  Block drivers should not set it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 drivers/block/loop.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 9a27d4f1c08aac..b42c728620c9e4 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1164,9 +1164,6 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	size = get_loop_size(lo, file);
 	loop_set_size(lo, size);
 
-	set_blocksize(bdev, S_ISBLK(inode->i_mode) ?
-		      block_size(inode->i_bdev) : PAGE_SIZE);
-
 	lo->lo_state = Lo_bound;
 	if (part_shift)
 		lo->lo_flags |= LO_FLAGS_PARTSCAN;
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
