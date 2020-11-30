Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97DEC5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 09:45:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42107207F7
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 09:45:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OzE93s+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42107207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=omvM3Enrd3SAhw5wytqOtplpS8s2CxYSmReiTRMbukI=; b=OzE93s+rIq20fSTbENk4BKo3Q
	CcQReG0jhi2xytJ6QZl91IixLcpU+oxX1T6R+OGpm2xgEkuy61JYAo9ikl8VBN9XMAx8DJDSeE+Kg
	fQNgEz+OQomVe60sbD1wlQuMQJh4IuwMbY2dlcjXxOzQxEGy/vSQG8HAmwT1mCJmBdN76w1MdBnnG
	sLbZ8q5G824HzfxvTCeSDVhrgsNquVv1JmjncXrYrhVhHUehrSpKXY+eNw8Hfz26F0oOddyoPxgbV
	MHpJJgBiJcVZ3vXj7zXbPhF2zkjNZNEUm5BCxxDWEY5FZCCoWZ9Z4UdedXX8Us7D6AWmJMYnAtrar
	Q3Piu5KKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjfjO-0002bM-1z; Mon, 30 Nov 2020 09:44:26 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjfjK-0002aP-Ti
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 09:44:23 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7A4CACBA;
 Mon, 30 Nov 2020 09:44:21 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 3E43E1E131B; Mon, 30 Nov 2020 10:44:21 +0100 (CET)
Date: Mon, 30 Nov 2020 10:44:21 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 30/45] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201130094421.GD11250@quack2.suse.cz>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-31-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201128161510.347752-31-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_044423_079892_338BDF17 
X-CRM114-Status: GOOD (  24.92  )
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

On Sat 28-11-20 17:14:55, Christoph Hellwig wrote:
> Now that the hd_struct always has a block device attached to it, there is
> no need for having two size field that just get out of sync.
> 
> Additionally the field in hd_struct did not use proper serialization,
> possibly allowing for torn writes.  By only using the block_device field
> this problem also gets fixed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Coly Li <colyli@suse.de>			[bcache]
> Acked-by: Chao Yu <yuchao0@huawei.com>			[f2fs]

...

> @@ -47,18 +57,22 @@ static void disk_release_events(struct gendisk *disk);
>  bool set_capacity_and_notify(struct gendisk *disk, sector_t size)
>  {
>  	sector_t capacity = get_capacity(disk);
> +	char *envp[] = { "RESIZE=1", NULL };
>  
>  	set_capacity(disk, size);
> -	revalidate_disk_size(disk, true);
> -
> -	if (capacity != size && capacity != 0 && size != 0) {
> -		char *envp[] = { "RESIZE=1", NULL };
> -
> -		kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
> -		return true;
> -	}
>  
> -	return false;
> +	/*
> +	 * Only print a message and send a uevent if the gendisk is user visible
> +	 * and alive.  This avoids spamming the log and udev when setting the
> +	 * initial capacity during probing.
> +	 */
> +	if (size == capacity ||
> +	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
> +		return false;
> +	pr_info("%s: detected capacity change from %lld to %lld\n",
> +		disk->disk_name, size, capacity);
> +	kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
> +	return true;
>  }
>  EXPORT_SYMBOL_GPL(set_capacity_and_notify);

I know I'm like a broken record about this but I still don't understand
here... I'd expect the new code to be:

	if (size == capacity ||
	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
		return false;
	pr_info("%s: detected capacity change from %lld to %lld\n",
		disk->disk_name, size, capacity);
+	if (!capacity || !size)
+		return false;
	kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
	return true;

At least that would be equivalent to the original functionality of
set_capacity_and_notify(). And if you indeed intend to change when
"RESIZE=1" events are sent, then I'd expect an explanation in the changelog
why this cannot break userspace (I remember we've already broken some udev
rules in the past by generating unexpected events and we had to revert
those changes in the partition code so I'm more careful now). The rest of
the patch looks good to me.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
