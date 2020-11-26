Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE1FC56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 18:24:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E35D920B80
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 18:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aMzktkeb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E35D920B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kZFPP4NPDSlUDCtoai1XKHE3NAxtiNGC/pfAPpGy9Ek=; b=aMzktkeb7lX8LmT9e09FDnpvY
	qpbHLuxrM6x9diyMc4R3yCPOIIoH9/jMvQqZXWhbIZxG+3IQQc08cY/eW9ozQoiVDi8qNCfSeof3f
	M/BpIB4zXAVSvDJH9jnyxfG3kaK8g+3A3VE0yqbOGCmReLfyzYQp//262uugPcZEKQbVk4HQF3DAG
	pVVPtjrXX1MY/D2OZWCdaPX2KXyihWLVdQEy7+YfPu6vYP0fKp7LHPtXRBWMxAMOfT8irHw8I7a2T
	6i/lUgS6V/08g57jBDjZChaLr3e9dmgAbglS56pINIaeTWdDwluZZAMgVZyIlHfa7ZD8tBQZqww5G
	BOx4QNFOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiLvS-0004KF-KA; Thu, 26 Nov 2020 18:23:27 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiLuP-0003vh-Cj
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 18:22:22 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F7B7AF27;
 Thu, 26 Nov 2020 18:22:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 8EEA81E10D0; Thu, 26 Nov 2020 19:22:19 +0100 (CET)
Date: Thu, 26 Nov 2020 19:22:19 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 37/44] block: switch partition lookup to use struct
 block_device
Message-ID: <20201126182219.GC422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-38-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-38-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_132221_648695_487FF169 
X-CRM114-Status: GOOD (  15.39  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Chao Yu <yuchao0@huawei.com>,
 Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 linux-bcache@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 26-11-20 14:04:15, Christoph Hellwig wrote:
>  struct hd_struct *disk_get_part(struct gendisk *disk, int partno)
>  {
> -	struct hd_struct *part;
> +	struct block_device *part;
>  
>  	rcu_read_lock();
>  	part = __disk_get_part(disk, partno);
> -	if (part)
> -		get_device(part_to_dev(part));
> -	rcu_read_unlock();
> +	if (!part) {
> +		rcu_read_unlock();
> +		return NULL;
> +	}
>  
> -	return part;
> +	get_device(part_to_dev(part->bd_part));
> +	rcu_read_unlock();
> +	return part->bd_part;
>  }

This is not directly related to this particular patch but I'm wondering:
What prevents say del_gendisk() from racing with disk_get_part(), so that
delete_partition() is called just after we fetched 'part' pointer and the
last 'part' kobject ref is dropped before disk_get_part() calls
get_device()? I don't see anything preventing that and so we'd hand out
'part' that is soon to be freed (after RCU grace period expires).

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
