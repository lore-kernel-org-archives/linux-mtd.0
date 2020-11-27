Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFA9C63777
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 09:42:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 072F221D93
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 09:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bfbFXDpg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 072F221D93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VR3zvOZKDd1GXXeR7ig25eDFAVHioOzFzfF2B0DCcHE=; b=bfbFXDpgMBWDATJjYDh3D2YbA
	m6NLfZUh6/y+GhDQwcDIOn/ayLTaXnNArarnw65iAn4oT8+EihjdmMAvfsuCzOyGwrB6C5JkhxuD1
	Mqrzmzm5lHqWM72h+P28UcOnHI0fK6Sqynu1grlU9CgocvWJKykC10Y/oq52zoVHRr3a6+Lw8jGC1
	bVzeYCAtl3y9d2VHtP3nU/nRee9OEv1jA8J0mwJWqyNBKmWgE9Pj03LbC/7cAEOmmlJ6P1SNe8bSu
	Ql73RMOQB8itKxFwyEiMblZ3vAQQvLb/SFGAAFeOVGq4Qvxwc31ZdbWtr/qXEq8Egu027Ech8HsQz
	gTvuYoyCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiaFn-0002pV-1l; Fri, 27 Nov 2020 09:41:23 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiaFf-0002ko-Pm
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 09:41:19 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id D046C68B05; Fri, 27 Nov 2020 10:41:09 +0100 (CET)
Date: Fri, 27 Nov 2020 10:41:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 29/44] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201127094109.GB14976@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-30-hch@lst.de> <20201126165036.GO422@quack2.suse.cz>
 <20201126175208.GA24843@lst.de> <20201126180408.GB422@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126180408.GB422@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_044117_501323_8CA4F4C5 
X-CRM114-Status: GOOD (  18.27  )
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

On Thu, Nov 26, 2020 at 07:04:08PM +0100, Jan Kara wrote:
> On Thu 26-11-20 18:52:08, Christoph Hellwig wrote:
> > On Thu, Nov 26, 2020 at 05:50:36PM +0100, Jan Kara wrote:
> > > > +	if (size == capacity ||
> > > > +	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
> > > > +		return false;
> > > > +	pr_info("%s: detected capacity change from %lld to %lld\n",
> > > > +		disk->disk_name, size, capacity);
> > > > +	kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
> > > 
> > > I think we don't want to generate resize event for changes from / to 0...
> > 
> > Didn't you ask for that in the last round?
> 
> I've asked for the message - which you've added :). But the udev event was
> correct in the previous version IMHO...

Note that this version only prints if the gendisk is up.  So any initial
setup does not see a message.  I think that is a better indicator than
checking for 0.  Especially as say a remotely triggered change to 0
is an even worth printing, and except for DRBD all drivers did print
the message.

> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
---end quoted text---

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
