Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0242AC56201
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 16:46:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5532173E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 16:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fej4Vve0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5532173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yjz99AbUvxnn26Bv0u8yD3stloC//e9mnzcQckN9W3Y=; b=Fej4Vve0n1MMd7/91t/mSYG3N
	7CnvUbRyZ2dSWI1dXPa4I3hinJ4Y7NGLq5P00E9fFyrC0J/YB0jmFE2KWmvoW0hPIYda3RuObvSYM
	7qflmEK9YZLWsYg9sIdx57Hgj5M3Y2PNjj0YSFdCDOTZ/bYIO9ztjWnNizzpk45d09b8CLNxJP8o4
	jYdTfpocPzpe+EvdDOQKsATDukl/aEelqwsEDwkJDcAAn7DeGUEcd0xTbIhXkrxm7tUkpeDmVY23y
	ZIlcxYt06WiU4bBzgu7VhmfLQa+vggt3G2efAASmqryZ8RXoAMvANs2f65mRUguKb45w7v6upPTBd
	5SYR/3w8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxvO-000679-I9; Wed, 25 Nov 2020 16:45:46 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxux-0005wh-7J
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 16:45:20 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 05B8968B02; Wed, 25 Nov 2020 17:45:16 +0100 (CET)
Date: Wed, 25 Nov 2020 17:45:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 25/45] block: reference struct block_device from struct
 hd_struct
Message-ID: <20201125164515.GB1975@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-26-hch@lst.de> <X714udEyPuGarVYp@mtj.duckdns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X714udEyPuGarVYp@mtj.duckdns.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114519_501181_B495D4B8 
X-CRM114-Status: GOOD (  20.39  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 04:18:49PM -0500, Tejun Heo wrote:
> Hello,
> 
> Please see lkml.kernel.org/r/X708BTJ5njtbC2z1@mtj.duckdns.org for a few nits
> on the previous version.

Thanks, I've addressed the mapping_set_gfp mask nit and updated the
commit log.  As Jan pointed also pointed out I think we do need the
remove_inode_hash.

> I might be confused but am wondering whether RCU is needed. It's currently
> used to ensure that gendisk is accessible in the blkdev_get path but
> wouldn't it be possible to simply pin gendisk from block_devices? The
> gendisk and hd_structs hold the base refs of the block_devices and in turn
> the block_devices pin the gendisk. When the gendisk gets deleted, it puts
> the base refs of the block devices but stays around while the block devices
> are being accessed.

Yes, that sounds sensible.  I'll take a look.

> Also, would it make sense to separate out lookup_sem removal? I *think* it's
> there to ensure that the same bdev doesn't get associated with old and new
> gendisks at the same time but can't wrap my head around how it works
> exactly. I can see that this may not be needed once the lifetimes of gendisk
> and block_devices are tied together but that may warrant a bit more
> explanation.

Jan added lookup_sem in commit 56c0908c855afbb to prevent a three way
race between del_gendisk and blkdev_open due to the weird bdev vs
gendisk lifetime rules.  None of that can happen with the new lookup
scheme.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
