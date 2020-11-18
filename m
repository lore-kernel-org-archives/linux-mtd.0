Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5C8C6379D
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:58:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B7F024248
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KkO/yHJc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Y++3q5UJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B7F024248
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X8ozc6k4+85lnPq2DrI40Is4hjnILJd/3UwSIPDhygI=; b=KkO/yHJcXTfyZztOlWVuQID+s
	/AkNi/iKS5Vxk/vzLigbqXJkpTetCaWxr5ejuDesHqSet3sxj8g9E21sI6Zr3ubp72LtUbJuxh85B
	8AubCikviCJvnB3Q7EmzWs3yd4LaR1FBaVNP7S9N1MltOlOJeX55xByfNs9JIh1A8WUB8iq6QTxGv
	qsE+Lz1wHTaNJ+y/RbuOBhymTrg9Wda44vEw0v7kODbQqd+08IGGBJSRiiR8kLXxz9KRXf0PzuFpN
	SiMvfXuzU2fBsJfPapPUOI6zunE59lsKVIll/WTOhrFJoFgUsFlgUtZFFCkQLpOPgmJpbRuk0CK0p
	Gb/B3Va6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJGT-00041q-Aq; Wed, 18 Nov 2020 08:56:33 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJGC-0003q7-CQ
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 08:56:19 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1605689772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7igakkmhEI4CwNFDZCT70CUptcTv+K/s+YCPQmQlu9Q=;
 b=Y++3q5UJgDUWDlWdeDn6mQNNYdWrbUeFS91t9OchR29jrBjxggFIPk/Zt9w7d5o8Y5Vame
 8OeLl6cMI/636YtXiKuW5EanOqCgIw218k8knrDwI/S+PfWCYEvotYadONsuLQegM5GdhK
 3wwWlNOxGUloBVFJNsllEo8czXvQANE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6417AD2F;
 Wed, 18 Nov 2020 08:56:11 +0000 (UTC)
Subject: Re: merge struct block_device and struct hd_struct
To: Christoph Hellwig <hch@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
Date: Wed, 18 Nov 2020 09:56:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_035616_751606_DDBC838A 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: linux-bcache@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Mike Snitzer <snitzer@redhat.com>,
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

Christoph,

On 18.11.2020 09:47, Christoph Hellwig wrote:
> Diffstat:
>  block/bio.c                                  |    6 
>  block/blk-cgroup.c                           |   50 +-
>  block/blk-core.c                             |   85 +--
>  block/blk-flush.c                            |    2 
>  block/blk-iocost.c                           |   36 -
>  block/blk-lib.c                              |    2 
>  block/blk-merge.c                            |    6 
>  block/blk-mq.c                               |   11 
>  block/blk-mq.h                               |    5 
>  block/blk.h                                  |   92 ----
>  block/genhd.c                                |  444 +++++---------------
>  block/ioctl.c                                |    7 
>  block/partitions/core.c                      |  238 +++--------
>  drivers/block/drbd/drbd_receiver.c           |    2 
>  drivers/block/drbd/drbd_worker.c             |    2 
>  drivers/block/loop.c                         |   21 
>  drivers/block/nbd.c                          |    6 
>  drivers/block/xen-blkback/common.h           |    4 
>  drivers/block/xen-blkfront.c                 |   20 
>  drivers/block/zram/zram_drv.c                |   20 
>  drivers/md/bcache/request.c                  |    4 
>  drivers/md/bcache/super.c                    |   53 --
>  drivers/md/dm-table.c                        |    9 
>  drivers/md/dm.c                              |   16 
>  drivers/md/md.c                              |    8 
>  drivers/mtd/mtdsuper.c                       |   17 
>  drivers/nvme/target/admin-cmd.c              |   20 
>  drivers/s390/block/dasd.c                    |    8 
>  drivers/s390/block/dasd_ioctl.c              |    9 
>  drivers/scsi/scsicam.c                       |    2 
>  drivers/target/target_core_file.c            |    6 
>  drivers/target/target_core_pscsi.c           |    7 
>  drivers/usb/gadget/function/storage_common.c |    8 
>  fs/block_dev.c                               |  578 ++++++++-------------------
>  fs/btrfs/sysfs.c                             |   15 
>  fs/btrfs/volumes.c                           |   13 
>  fs/ext4/super.c                              |   18 
>  fs/ext4/sysfs.c                              |   10 
>  fs/f2fs/checkpoint.c                         |    5 
>  fs/f2fs/f2fs.h                               |    2 
>  fs/f2fs/super.c                              |    8 
>  fs/f2fs/sysfs.c                              |    9 
>  fs/inode.c                                   |    3 
>  fs/internal.h                                |    7 
>  fs/io_uring.c                                |   10 
>  fs/pipe.c                                    |    5 
>  fs/pstore/blk.c                              |    2 
>  fs/quota/quota.c                             |   40 +
>  fs/statfs.c                                  |    2 
>  fs/super.c                                   |   86 ----
>  include/linux/blk-cgroup.h                   |    4 
>  include/linux/blk_types.h                    |   26 +
>  include/linux/blkdev.h                       |   24 -
>  include/linux/fs.h                           |    5 
>  include/linux/genhd.h                        |  104 ----
>  include/linux/part_stat.h                    |   17 
>  init/do_mounts.c                             |  271 +++++-------
>  kernel/trace/blktrace.c                      |   54 --
>  mm/filemap.c                                 |    9 
>  59 files changed, 837 insertions(+), 1716 deletions(-)

since this isn't the first series from you recently spamming
xen-devel, may I ask that you don't Cc entire series to lists
which are involved with perhaps just one out of the many patches?
IMO Cc lists should be compiled on a per-patch basis; the cover
letter may of course be sent to the union of all of them.

Thanks much,
Jan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
