Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A00C433E2
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 15:21:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05B3E206A2
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 15:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jAX8NWDE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e+3jk+59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05B3E206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0sUxebcAnFFJQMIItXtra0NjiQqfOvC8ayYc3y/SSnc=; b=jAX8NWDE4jVllGrSk/F+1LZ192
	8rblV99mcZtCkZ0rA6iFHC1AQNf1l/zepsT8cigFEs77dzqba+2FcLMRQ+CHvRwUwhsXeJsrsyupC
	hsAnwfKQ90H2r9f9AyekBecujdZQ4o6yRvodXV7Urvn7n+ih18LX00GSbkZOvp/5Ej4OQ7Jl1ySgR
	WfNjNFVPNUOaXTBK4Qg4V2oHSLFYxuCUXg5GBkAa2dpwAIQyjy6vAcpkxO4uYNJ0wmZUI+2yBuZ2W
	l7r1wzuGej6ZhjKbztywnNq4qcLLqSF9nT593k8VMXrE5OOe5sqN25kHxz8UV+pWR1lfdGgTaJwLc
	uNdPvNFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIClC-0007Ek-Gx; Tue, 15 Sep 2020 15:20:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIClA-0007EM-DE
 for linux-mtd@merlin.infradead.org; Tue, 15 Sep 2020 15:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=WgQU+DROBiFXSU4XRLi15Ig7DnwkeQul1eu0RWtmaDw=; b=e+3jk+59mxpACTbbZjvM84YGj4
 ceZbnJEyNbo2sMobiL9SoJ/Wml/TfR7ZxGNJ2SmU+0KOtNugocfDQjsanQudzdZwG8tMW2iGt2Dbh
 5mQmfr9qjUufz+t8XYePond1pxsq56FWF3eh/QXzn34d7rxr8btIOElj7CGNBYepyUHlm89BAuMWW
 FTRFUOsqtFqEL6dBsoD8pHkZEwTfg+xJKDiQK18DDhC6neKQnJnR54JJ1XBA0dPWp6V1bYeExdck6
 hrhjpYhRMs5GVJSKvJV5yRYrE8qRMuWvyKp0uETm2uGjmbQ8U96hYfS5T23/uXLzXtXL5lfc40b7j
 JVXhJ3JQ==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICl8-0000xV-0W; Tue, 15 Sep 2020 15:20:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: bdi cleanups v5
Date: Tue, 15 Sep 2020 17:18:17 +0200
Message-Id: <20200915151829.1767176-1-hch@lst.de>
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
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Minchan Kim <minchan@kernel.org>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jens,

this series contains a bunch of different BDI cleanups.  The biggest item
is to isolate block drivers from the BDI in preparation of changing the
lifetime of the block device BDI in a follow up series.

Changes since v4:
 - add a back a prematurely removed assignment in dm-table.c
 - pick up a few reviews from Johannes that got lost

Changes since v3:
 - rebased on the lasted block tree, which has some of the prep
   changes merged
 - extend the ->ra_pages changes to ->io_pages
 - move initializing ->ra_pages and ->io_pages for block devices to
   blk_register_queue

Changes since v2:
 - fix a rw_page return value check
 - fix up various changelogs

Changes since v1:
 - rebased to the for-5.9/block-merge branch
 - explicitly set the readahead to 0 for ubifs, vboxsf and mtd
 - split the zram block_device operations
 - let rw_page users fall back to bios in swap_readpage


Diffstat:
 block/blk-core.c              |    3 -
 block/blk-integrity.c         |    4 +-
 block/blk-mq-debugfs.c        |    1 
 block/blk-settings.c          |    5 +-
 block/blk-sysfs.c             |    4 +-
 block/genhd.c                 |   13 +++++--
 drivers/block/aoe/aoeblk.c    |    2 -
 drivers/block/brd.c           |    1 
 drivers/block/drbd/drbd_nl.c  |   18 ---------
 drivers/block/drbd/drbd_req.c |    4 --
 drivers/block/rbd.c           |    2 -
 drivers/block/zram/zram_drv.c |   19 +++++++---
 drivers/md/bcache/super.c     |    4 --
 drivers/md/dm-table.c         |    9 +---
 drivers/md/raid0.c            |   16 --------
 drivers/md/raid10.c           |   46 ++++++++----------------
 drivers/md/raid5.c            |   31 +++++++---------
 drivers/mmc/core/queue.c      |    3 -
 drivers/mtd/mtdcore.c         |    2 +
 drivers/nvdimm/btt.c          |    2 -
 drivers/nvdimm/pmem.c         |    1 
 drivers/nvme/host/core.c      |    3 -
 drivers/nvme/host/multipath.c |   10 +----
 drivers/scsi/iscsi_tcp.c      |    4 +-
 fs/9p/vfs_file.c              |    2 -
 fs/9p/vfs_super.c             |    6 ++-
 fs/afs/super.c                |    1 
 fs/btrfs/disk-io.c            |    2 -
 fs/fs-writeback.c             |    7 ++-
 fs/fuse/inode.c               |    4 +-
 fs/namei.c                    |    4 +-
 fs/nfs/super.c                |    9 ----
 fs/super.c                    |    2 +
 fs/ubifs/super.c              |    2 +
 fs/vboxsf/super.c             |    2 +
 include/linux/backing-dev.h   |   78 +++++++-----------------------------------
 include/linux/blkdev.h        |    3 +
 include/linux/drbd.h          |    1 
 include/linux/fs.h            |    2 -
 mm/backing-dev.c              |   13 +++----
 mm/filemap.c                  |    4 +-
 mm/memcontrol.c               |    2 -
 mm/memory-failure.c           |    2 -
 mm/migrate.c                  |    2 -
 mm/mmap.c                     |    2 -
 mm/page-writeback.c           |   18 ++++-----
 mm/page_io.c                  |   18 +++++----
 mm/swapfile.c                 |    4 +-
 48 files changed, 144 insertions(+), 253 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
