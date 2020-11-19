Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C92C63697
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 14:43:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9457724698
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 14:43:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aGup6Dpb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9457724698
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o7qUcjIYMnunWP2RGSUXjRPFC07E+xZs/T0EX22uSUc=; b=aGup6DpbaAR/aclFl22fI+7I2
	hxYzQy2IeDO+9mZMC9w06IxI0BurdhxCiNI+M5QGrtbykFM/e964Z5K14mzTO3q9l0qTExQRqBemU
	3Go69Ul5g6f1Xfb1rncmmtYDc8CM9kYATK7Zou5RC4GOaRXNB6VuslScGdHf7psMR1CbHuGg7ziws
	MRSswg8rJaVIY+lndRK3IX159qCKLHyh2zuDe4haNtIy0mWShYMR/URJTx4Pzn6V5pEBdoLiJAKBk
	Yy5irkPBTg9pkYLImFgdrbWlJoa4gB0I0jdKztkv329fi4tJjUbgWfHKCeMxp/WkFvoDgcKF+h+fo
	I8uWu1ZfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfl7y-0000pz-Bj; Thu, 19 Nov 2020 14:41:38 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfl7m-0008FB-8p
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 14:41:27 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CBF6AA4F;
 Thu, 19 Nov 2020 14:39:22 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E1C061E130B; Thu, 19 Nov 2020 15:39:21 +0100 (CET)
Date: Thu, 19 Nov 2020 15:39:21 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 15/20] block: merge struct block_device and struct
 hd_struct
Message-ID: <20201119143921.GX1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-16-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-16-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_094126_451171_BEBD238F 
X-CRM114-Status: GOOD (  23.73  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed 18-11-20 09:47:55, Christoph Hellwig wrote:
> Instead of having two structures that represent each block device with
> different lift time rules merged them into a single one.  This also
            ^^^ :) life     ^^^^ merge

> greatly simplifies the reference counting rules, as we can use the inode
> reference count as the main reference count for the new struct
> block_device, with the device model reference front ending it for device
> model interaction.  The percpu refcount in struct hd_struct is entirely
> gone given that struct block_device must be opened and thus valid for
> the duration of the I/O.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This patch is kind of difficult to review due to the size of mostly
mechanical changes mixed with not completely mechanical changes. Can we
perhaps split out the mechanical bits? E.g. the rq->part => rq->bdev
renaming is mechanical and notable part of the patch. Similarly the
part->foo => part->bd_foo bits...

Also I'm kind of wondering: AFAIU the new lifetime rules, gendisk holds
bdev reference and bdev is created on gendisk allocation so bdev lifetime is
strictly larger than gendisk lifetime. But what now keeps bdev->bd_disk
reference safe in presence device hot unplug? In most cases we are still
protected by gendisk reference taken in __blkdev_get() but how about
disk->lookup_sem and disk->flags dereferences before we actually grab the
reference?

Also I find it rather non-obvious (although elegant ;) that bdev->bd_device
rules the lifetime of gendisk. Can you perhaps explain this in the
changelog and probably also add somewhere to source a documentation about
the new lifetime rules?

> diff --git a/block/blk.h b/block/blk.h
> index 09cee7024fb43e..90dd2047c6cd29 100644
> --- a/block/blk.h
> +++ b/block/blk.h
> @@ -215,7 +215,15 @@ static inline void elevator_exit(struct request_queue *q,
>  	__elevator_exit(q, e);
>  }
>  
> -struct hd_struct *__disk_get_part(struct gendisk *disk, int partno);
> +static inline struct block_device *__bdget_disk(struct gendisk *disk,
> +		int partno)
> +{
> +	struct disk_part_tbl *ptbl = rcu_dereference(disk->part_tbl);
> +
> +	if (unlikely(partno < 0 || partno >= ptbl->len))
> +		return NULL;
> +	return rcu_dereference(ptbl->part[partno]);
> +}

I understand this is lower-level counterpart of bdget_disk() but it is
confusing to me that this has 'bdget' in the name and returns no bdev
reference. Can we call it like __bdev_from_disk() or something like that?

>  
>  ssize_t part_size_show(struct device *dev, struct device_attribute *attr,
>  		char *buf);


									Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
