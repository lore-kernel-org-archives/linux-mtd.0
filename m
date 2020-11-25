Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D0CC56202
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 13:39:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1848C20637
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 13:39:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kYN6Tpr2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1848C20637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5LfASU6Rdmpfq7GObOJV24uZkiRmS0/0NrdpkEBX+3M=; b=kYN6Tpr28yBwWfbCVSBGHOmxN
	ryWQv+XTLDbgkSHNrg/Rc16S4pc6ZR+yj8w9DEHoCdA8RN5vmXcuaQWkm3KBN5DikNiXeZavksgBK
	C1Pbz1eienJkM7a+pTlBATi2L7DmoqJG+zXWNWpb7cF65iY3ICtTc77mDQgSrriEZ+34YrQ8tLrpr
	IEmzdC9631/vLAjmypP83d+Oe1+FTsXdB484hsyv8z8XAAfldYa9UIR0TGV5LgwNdVSJGk1dm0rHU
	jq3VZpOhpoFUChf+6uaVVMlOq6or/tnMfA0hB8mMXeQ8wyo+ucQxOFNVSej06w8LOl1iIgT19vtju
	Wj4tpcQ4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khv12-0007Ir-Ng; Wed, 25 Nov 2020 13:39:24 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khv0z-0007I8-RK
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 13:39:22 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCF50AC23;
 Wed, 25 Nov 2020 13:39:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 8ACF21E130F; Wed, 25 Nov 2020 14:39:20 +0100 (CET)
Date: Wed, 25 Nov 2020 14:39:20 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/45] block: remove a superflous check in blkpg_do_ioctl
Message-ID: <20201125133920.GL16944@quack2.suse.cz>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-13-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-13-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_083922_000983_A016A800 
X-CRM114-Status: GOOD (  20.65  )
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
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue 24-11-20 14:27:18, Christoph Hellwig wrote:
> sector_t is now always a u64, so this check is not needed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/ioctl.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/block/ioctl.c b/block/ioctl.c
> index 6b785181344fe1..0c09bb7a6ff35f 100644
> --- a/block/ioctl.c
> +++ b/block/ioctl.c
> @@ -35,15 +35,6 @@ static int blkpg_do_ioctl(struct block_device *bdev,
>  	start = p.start >> SECTOR_SHIFT;
>  	length = p.length >> SECTOR_SHIFT;
>  
> -	/* check for fit in a hd_struct */
> -	if (sizeof(sector_t) < sizeof(long long)) {
> -		long pstart = start, plength = length;
> -
> -		if (pstart != start || plength != length || pstart < 0 ||
> -		    plength < 0 || p.pno > 65535)
> -			return -EINVAL;
> -	}
> -
>  	switch (op) {
>  	case BLKPG_ADD_PARTITION:
>  		/* check if partition is aligned to blocksize */
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
