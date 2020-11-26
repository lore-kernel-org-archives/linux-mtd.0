Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE1EC63697
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 18:05:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70651207BC
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 18:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wbF32kI1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70651207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uVIUF2PsaQE+/W8GI5HXMSGotR7xWTAGSEH92pWhq44=; b=wbF32kI1jftiY695HKRuWXiMw
	y/YpwfIH7ELMYsZt21k3UNabJOC/BJwAvXGuma5kjW4xcD29BdBc1btqKLtCePtS42cXCBozoPhxy
	J7xwwdRnqc6bTMm8GsCjpWplQ+UxdJKY5sslKfekx8o7F59LmE55tDU86S9ZgDk16Y8KZIFOHB0V/
	RlApZHXrAkJhrO2per433kd59EU4UhHJyJ/9GFHNhsv1iDVhElo+S6OJBBmaU4xed5vMhEq5E55kF
	47imBeQNgz+LQp1mmOgpAzTenHOaKt8RmnEgoCOnl79mzrmVDgx7VymM9lCEtoW+FEdi36x7cNQDH
	f9P6aAHQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiLcu-0005v0-36; Thu, 26 Nov 2020 18:04:16 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiLcn-0005rt-Ua
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 18:04:11 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8607EAC55;
 Thu, 26 Nov 2020 18:04:08 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1FC061E10D0; Thu, 26 Nov 2020 19:04:08 +0100 (CET)
Date: Thu, 26 Nov 2020 19:04:08 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 29/44] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201126180408.GB422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-30-hch@lst.de>
 <20201126165036.GO422@quack2.suse.cz>
 <20201126175208.GA24843@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126175208.GA24843@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_130410_330070_7BB02B44 
X-CRM114-Status: GOOD (  17.97  )
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

On Thu 26-11-20 18:52:08, Christoph Hellwig wrote:
> On Thu, Nov 26, 2020 at 05:50:36PM +0100, Jan Kara wrote:
> > > +	if (size == capacity ||
> > > +	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
> > > +		return false;
> > > +	pr_info("%s: detected capacity change from %lld to %lld\n",
> > > +		disk->disk_name, size, capacity);
> > > +	kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
> > 
> > I think we don't want to generate resize event for changes from / to 0...
> 
> Didn't you ask for that in the last round?

I've asked for the message - which you've added :). But the udev event was
correct in the previous version IMHO...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
