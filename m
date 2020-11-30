Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F47C64E8A
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 14:52:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE5920719
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 14:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I6E2K+9m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DE5920719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HMlE/IwC28yH0FHKhIF7kzEuBOJoNemzXKwrTYPGFIE=; b=I6E2K+9mu0Y2JSkwS8hKzjubJ
	RrgrGgmGYxe+rQ0lAheiDNFvC0n065iijKZ03hTnqv0UCYO1kCly3hdiS9nDU6MuJd+1eQKZSSHfx
	j2FkWUC/I+lU/F+utWlCzz+j+XUz0H6NG6cLiRCngrdUZHXzTN0VyNuvmfwSLwMfaytSeBW6H9j6S
	zcWPG5KHdXPtj7AEOjX6eipclH0V+Hnbhmg54UXahCaC2vz0UbjOclxe5BFPNM+g5/N0fmqVOVbKe
	ryLwxeOOP0I1OdgDMwUlx0X1gZSmRYHfes7n7sq55iUr2oWvilupieyo80J0gviC3/2DLHbW1l+Ni
	PpZFm5AwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjkX0-0001hq-Iy; Mon, 30 Nov 2020 14:51:58 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjkWx-0001gt-WF
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 14:51:57 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3C4A86736F; Mon, 30 Nov 2020 15:51:50 +0100 (CET)
Date: Mon, 30 Nov 2020 15:51:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 30/45] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201130145150.GA24694@lst.de>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-31-hch@lst.de> <20201130094421.GD11250@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130094421.GD11250@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_095156_170413_F85F9696 
X-CRM114-Status: GOOD (  17.10  )
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
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 30, 2020 at 10:44:21AM +0100, Jan Kara wrote:
> I know I'm like a broken record about this but I still don't understand
> here... I'd expect the new code to be:
> 
> 	if (size == capacity ||
> 	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
> 		return false;
> 	pr_info("%s: detected capacity change from %lld to %lld\n",
> 		disk->disk_name, size, capacity);
> +	if (!capacity || !size)
> +		return false;
> 	kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
> 	return true;
> 
> At least that would be equivalent to the original functionality of
> set_capacity_and_notify(). And if you indeed intend to change when
> "RESIZE=1" events are sent, then I'd expect an explanation in the changelog
> why this cannot break userspace (I remember we've already broken some udev
> rules in the past by generating unexpected events and we had to revert
> those changes in the partition code so I'm more careful now). The rest of
> the patch looks good to me.

I explained that I think the GENHD_FL_UP is the more useful one here in
reply to your last comment.   If the size changes to or from 0 during
runtime we probably do want an event.

But I'll add your hunk for now and we can discuss this separately.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
