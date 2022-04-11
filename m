Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8551CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 14:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VeS46z1VeKrizhkiyWgv7487i76huaKvgkk/LOltBwI=; b=MdbLTOe/fLrCzl
	Yfg9XL+xqtzz5nXscqjVjjjc3Fa9bZwpOuHKXZLrN1bhi9GjMrxBNAw4PHSkQ1lcmNtQVztm0IxZ/
	77ojX5EpMZ/BRkDnjrqIYvBhktHaMWuOe80KBR6osigDI+BDIRbjzuvicgBoVlAq9665/iF8zl+87
	ZDfrhG88FSKZYeLrT5TG4cvGiKB1z0MhaRLu+atEh6QhnafXWTvusYMaTDGTxVXbW3GP9cDj5aPLS
	fUwUGgC/a5CatSyNuTMd9B+ebtp66At3549p3A7KNUDuuREy1vIbet3U8rUx97Gw/77xGMbrLqHVz
	QWVLSpJHd0H+YrNbsumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nduc3-009GOe-8B; Mon, 11 Apr 2022 14:01:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nduc0-009GNc-ED; Mon, 11 Apr 2022 14:01:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B15B6125C;
 Mon, 11 Apr 2022 14:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E77C385A4;
 Mon, 11 Apr 2022 14:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649685706;
 bh=aoF5JI4oA+WPgt/y0IgsxtsbxAXaCuGafPntNOloKP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z3DJooO+lpgxb0V7M65iVrqmxI0PEssCJPh+vJ1dEw1YBTDUO4k0Ftowa06gEpR83
 S1WtT+TAlqYOA3SV5oPOUKBv5r5Czq1jXlmgnBC2vlAsKUSP12Z7m3WPk2IIXa7ddE
 7+rat37phwTAQkXhdDcOfyIkaP50hX9uWu9MCv3Yv354dhMqhNyhEKK5VIXvkcNSo/
 Yw75O5ZXcRgYxwAIHqrZej/c3adf+HQOwXoAdC34I68eRF5zbda1Ysdnlbmc/q5KXa
 +yAvml8INLRMKi4FRTZn17313igwH9BKq1x7zfZpQGp7kDf9WzbZnpQOZP3oofxBEN
 wCj97MUpv05qA==
Date: Mon, 11 Apr 2022 08:01:41 -0600
From: Keith Busch <kbusch@kernel.org>
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
 ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Coly Li <colyli@suse.de>
Subject: Re: [PATCH 24/27] block: remove QUEUE_FLAG_DISCARD
Message-ID: <YlQ0xbtIcf8gti43@kbusch-mbp.dhcp.thefacebook.com>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-25-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220409045043.23593-25-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_070148_552049_CC7BC724 
X-CRM114-Status: GOOD (  14.92  )
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

On Sat, Apr 09, 2022 at 06:50:40AM +0200, Christoph Hellwig wrote:
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index efb85c6d8e2d5..7e07dd69262a7 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -1607,10 +1607,8 @@ static void nvme_config_discard(struct gendisk *disk, struct nvme_ns *ns)
>  	struct request_queue *queue = disk->queue;
>  	u32 size = queue_logical_block_size(queue);
>  
> -	if (ctrl->max_discard_sectors == 0) {
> -		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, queue);
> +	if (ctrl->max_discard_sectors == 0)
>  		return;
> -	}

I think we need to update the queue limit in this condition. While unlikley,
the flag was cleared here in case the device changed support for discard from
the previous reset. 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
