Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB790C64E7B
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 15:19:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D02C20719
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 15:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SvsmCxHL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D02C20719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yDINuVVQhleSKvCHRc3u8eiQd7RIoTKHU7SvREG0J6A=; b=SvsmCxHLIdBNWmkXgLi2VT0h9
	Ho+Q++IzMTQQik1J5aJqmJfNk2JXwCVv8gBf/9zvsaFtysirw6Few4F3CGEwGjyJFsDkjLS4MYqVY
	gnImPVlqf8kdz/6DMaKZSSFwhlUmM2YBnpqNfrnjGevqfg9UZaZqFc3r8bcm57do4Anl47xQDk5ui
	BVskXtNjpgFVQCq1dsqmc3eR8Q755i+2Z4i8Qa3fr6jsEDvwjdEdTHKe6TXO5OUZmZAbfZpBkRpmQ
	5JHQx6Kqy4zkcqI0r4gzcVDDC04vBPabQsaIA74PR6qU8vrZi67Ki02MpeApXYzXIxX98ppqCrJan
	7UPpRaxUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjkvy-00044T-3P; Mon, 30 Nov 2020 15:17:46 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjkvv-000442-JY
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 15:17:44 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62EECAB63;
 Mon, 30 Nov 2020 15:17:42 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id CC8061E131B; Mon, 30 Nov 2020 16:17:41 +0100 (CET)
Date: Mon, 30 Nov 2020 16:17:41 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 30/45] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201130151741.GN11250@quack2.suse.cz>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-31-hch@lst.de>
 <20201130094421.GD11250@quack2.suse.cz>
 <20201130145150.GA24694@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130145150.GA24694@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_101743_770224_0ADF03A9 
X-CRM114-Status: GOOD (  24.79  )
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

On Mon 30-11-20 15:51:50, Christoph Hellwig wrote:
> On Mon, Nov 30, 2020 at 10:44:21AM +0100, Jan Kara wrote:
> > I know I'm like a broken record about this but I still don't understand
> > here... I'd expect the new code to be:
> > 
> > 	if (size == capacity ||
> > 	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
> > 		return false;
> > 	pr_info("%s: detected capacity change from %lld to %lld\n",
> > 		disk->disk_name, size, capacity);
> > +	if (!capacity || !size)
> > +		return false;
> > 	kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
> > 	return true;
> > 
> > At least that would be equivalent to the original functionality of
> > set_capacity_and_notify(). And if you indeed intend to change when
> > "RESIZE=1" events are sent, then I'd expect an explanation in the changelog
> > why this cannot break userspace (I remember we've already broken some udev
> > rules in the past by generating unexpected events and we had to revert
> > those changes in the partition code so I'm more careful now). The rest of
> > the patch looks good to me.
> 
> I explained that I think the GENHD_FL_UP is the more useful one here in
> reply to your last comment.   If the size changes to or from 0 during
> runtime we probably do want an event.

Ah, right, sorry, I missed that. And I agree that it might make sense for
changes to / from zero during runtime to send notification. But it still
seems as a thin ice with potential to breakage to me.

> But I'll add your hunk for now and we can discuss this separately.

OK, thanks. With that hunk feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
