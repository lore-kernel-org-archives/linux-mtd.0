Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2442C433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZmVVzknS1YmVgxJqXLJj/ppC2g3gShe33uga8OrICg=; b=lrSDKeAZu8zB8d
	7Cku0L0NUWGipqLaZ7iMFutQ7yYnYEu4o8uv+4OVA26Sa+sCVJyg415DHwg3RoXlM5pS74QM3s+kk
	x2GDgy808w/CT9RBL7+5NOVlYj971h9tPM0mOkqc/eIN2061NdGLHnygCV8i/5z3ds/7fWGwyjhuJ
	ZawC3Rf14MH0NEoMlsLbs/E8NrV0q12ZHujc4pzeyuX1HHlcUq9kQuCD4OkuAHSptjukq9/G5O6ml
	ofZGFJLkGrkhClu/QqS7CHelvq9ycqwK/XYNWhNt9DlYBkwFyBUhURo8Gu14HI8IDaDWUnB0lw9aE
	nkNGChqEuMghsrl7h6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncU64-00Ci43-BS; Thu, 07 Apr 2022 15:30:56 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncU0u-00Cfpr-3G; Thu, 07 Apr 2022 15:25:37 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B53392129B;
 Thu,  7 Apr 2022 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1649345134;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5NLYRb0iRWqH+wp45tMsxWQ+2lcKX7UH+x3jrUc4CM=;
 b=gyRKbvUTSeCHD0kZFeha6b8GtwnfMcBVdpUrcZUXAMFpgjyGa2cKvGcE+1LQgsvJsr0yFR
 VJy4sQoNdJcuIc7oMupD7ITgqoAKAsjuZZusxwRbFTjJc52vRJgP/0hGLJXdzVq3P3r19L
 5WyRvzygj8B2JBXB13wX08lyO4vdhmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1649345134;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5NLYRb0iRWqH+wp45tMsxWQ+2lcKX7UH+x3jrUc4CM=;
 b=h4c6BQrPPD9W33KeeEtgIxkffE6SxGamCvLBsxsw2FlmdG/K+M8MV8ruvANXF9Az9aOJRY
 CNJk3HEoegzTiHDg==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id A2CECA3B94;
 Thu,  7 Apr 2022 15:25:34 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 7459CDA80E; Thu,  7 Apr 2022 17:21:32 +0200 (CEST)
Date: Thu, 7 Apr 2022 17:21:32 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
Subject: Re: [PATCH 10/27] block: add a bdev_nonrot helper
Message-ID: <20220407152132.GI15609@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406060516.409838-11-hch@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_082536_383436_01193648 
X-CRM114-Status: GOOD (  10.72  )
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 06, 2022 at 08:04:59AM +0200, Christoph Hellwig wrote:
> Add a helper to check the nonrot flag based on the block_device instead
> of having to poke into the block layer internal request_queue.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/ioctl.c                       | 2 +-
>  drivers/block/loop.c                | 2 +-
>  drivers/md/dm-table.c               | 4 +---
>  drivers/md/md.c                     | 3 +--
>  drivers/md/raid1.c                  | 2 +-
>  drivers/md/raid10.c                 | 2 +-
>  drivers/md/raid5.c                  | 2 +-
>  drivers/target/target_core_file.c   | 3 +--
>  drivers/target/target_core_iblock.c | 2 +-

For

>  fs/btrfs/volumes.c                  | 4 ++--

Acked-by: David Sterba <dsterba@suse.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
