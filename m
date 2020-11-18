Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8E2C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:49:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4808220719
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WipCwaxB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MbUsQaP4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4808220719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EPGXhCY1HuvVsg6FkaeWTmS/6kK8GNHRio43cyE7TGk=; b=WipCwaxBodU/SqqHicdTZSWm53
	K+GhAEtnn3hDQyi7R8MrEpE1Hhn4GXXMJ5bgZ5qTIjnlBmSfEdqjnuDLQR9YfZDmH9bXTS3T0Dykk
	Fe//C7hvwPshlymY72Buzd6PWTv55uyme/K30ESHoPAsRBFXD2zwoEnW78SkqVZj999sz+w0dgy7o
	FdA0w2fybVNcFkUdAW+I151UjXY4r3Wt11qUoA0ABzyOZRKQfKOZ0ivDl+3JXkfkfXuN8oleST3Uc
	1PVmQEL4rpW9ZEE/GiwmcXOH9Ull/sElIGYi09ROXCFq4VmF+P2qagoVbo3vJMtwXtczZKiEaegRm
	iZxJoBqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJ8L-0007xg-Ow; Wed, 18 Nov 2020 08:48:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8I-0007wi-8q
 for linux-mtd@merlin.infradead.org; Wed, 18 Nov 2020 08:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=rtXdmB6pB+D+QbtGbV+uHFq0yQJijYyGHbBI0cLjv2A=; b=MbUsQaP4K2SpOGVW5mv43oSYV6
 aSTVb67wwO58YAjNvYMV+JptsTZETqgQ3iVNAbfWHCQ9HE5JT81DQ5LdbNLiSSXvHq/k7/yLci8zE
 BWakOahKmMr+FGf6UbLTbY5ACvNjirGAI+lCUyjSOA50PJSXlUcCDA0CuGKj7KT+rJUTyYFPsUGnT
 6eRsMiIYjULW2kg2XeaXIAB0btu3VodTKNE1Pz44bT6gTmxgQcB687KguKJxiJBm9EAIUQxLSiLOJ
 rMJ8Ixv3mA08atwcPFG6zZ0vA+A8nlhq/s/JYSobbimDNkp47kt2AOxl+LkE9cWtZofajTO0QNTZm
 OmM7zM1Q==;
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8E-0007kG-NB; Wed, 18 Nov 2020 08:48:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: merge struct block_device and struct hd_struct
Date: Wed, 18 Nov 2020 09:47:40 +0100
Message-Id: <20201118084800.2339180-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-bcache@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jens,

this series cleans up our main per-device node data structure by merging
the block_device and hd_struct data structures that have the same scope,
but different life times.  The main effect (besides removing lots of
code) is that instead of having two device sizes that need complex
synchronization there is just one now.

Note that it depends on the previous "misc cleanups" series.

A git tree is available here:

    git://git.infradead.org/users/hch/block.git bdev-lookup

Gitweb:

    http://git.infradead.org/users/hch/block.git/shortlog/refs/heads/bdev-lookup

Diffstat:
 block/bio.c                                  |    6 
 block/blk-cgroup.c                           |   50 +-
 block/blk-core.c                             |   85 +--
 block/blk-flush.c                            |    2 
 block/blk-iocost.c                           |   36 -
 block/blk-lib.c                              |    2 
 block/blk-merge.c                            |    6 
 block/blk-mq.c                               |   11 
 block/blk-mq.h                               |    5 
 block/blk.h                                  |   92 ----
 block/genhd.c                                |  444 +++++---------------
 block/ioctl.c                                |    7 
 block/partitions/core.c                      |  238 +++--------
 drivers/block/drbd/drbd_receiver.c           |    2 
 drivers/block/drbd/drbd_worker.c             |    2 
 drivers/block/loop.c                         |   21 
 drivers/block/nbd.c                          |    6 
 drivers/block/xen-blkback/common.h           |    4 
 drivers/block/xen-blkfront.c                 |   20 
 drivers/block/zram/zram_drv.c                |   20 
 drivers/md/bcache/request.c                  |    4 
 drivers/md/bcache/super.c                    |   53 --
 drivers/md/dm-table.c                        |    9 
 drivers/md/dm.c                              |   16 
 drivers/md/md.c                              |    8 
 drivers/mtd/mtdsuper.c                       |   17 
 drivers/nvme/target/admin-cmd.c              |   20 
 drivers/s390/block/dasd.c                    |    8 
 drivers/s390/block/dasd_ioctl.c              |    9 
 drivers/scsi/scsicam.c                       |    2 
 drivers/target/target_core_file.c            |    6 
 drivers/target/target_core_pscsi.c           |    7 
 drivers/usb/gadget/function/storage_common.c |    8 
 fs/block_dev.c                               |  578 ++++++++-------------------
 fs/btrfs/sysfs.c                             |   15 
 fs/btrfs/volumes.c                           |   13 
 fs/ext4/super.c                              |   18 
 fs/ext4/sysfs.c                              |   10 
 fs/f2fs/checkpoint.c                         |    5 
 fs/f2fs/f2fs.h                               |    2 
 fs/f2fs/super.c                              |    8 
 fs/f2fs/sysfs.c                              |    9 
 fs/inode.c                                   |    3 
 fs/internal.h                                |    7 
 fs/io_uring.c                                |   10 
 fs/pipe.c                                    |    5 
 fs/pstore/blk.c                              |    2 
 fs/quota/quota.c                             |   40 +
 fs/statfs.c                                  |    2 
 fs/super.c                                   |   86 ----
 include/linux/blk-cgroup.h                   |    4 
 include/linux/blk_types.h                    |   26 +
 include/linux/blkdev.h                       |   24 -
 include/linux/fs.h                           |    5 
 include/linux/genhd.h                        |  104 ----
 include/linux/part_stat.h                    |   17 
 init/do_mounts.c                             |  271 +++++-------
 kernel/trace/blktrace.c                      |   54 --
 mm/filemap.c                                 |    9 
 59 files changed, 837 insertions(+), 1716 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
