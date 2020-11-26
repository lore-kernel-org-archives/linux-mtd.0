Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DDCC56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:52:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42792207BC
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:52:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b+uAjfgs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42792207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=56J2grSirBRLUyf3o0tWnW693IVLY7r0t+ApSbpvpAk=; b=b+uAjfgsC1VR8Kph9k10CMimY
	uZPE5OWe6yzDgy2B1t849HYUGbATdAkyOJmdLdMJDjyFhj9LA2houMngxYg7gQ0F+BP6S8IARntgr
	IrvA9z8psdnjE0IaWdtP/H8NfdijMpML07P4VPvr4K5GGdjYoByxzWt0j7i9hUAz5mGn4g3JShWYI
	Uos9VowH4BfGk33HcJERk0Yb0r6tci3uzry0vvW/QTmc1U58lzBZOYE+tDDWuTuwrRYM+ZfxiOG9x
	H9L+LD7zx/kOQlBHP8ZOas0vFhgnw2LJlxO2Q+T66848ViKaMlW9kLtV/1WBboTR0NMukmp05NZgk
	DAACY5hHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiLRE-0003Gn-NJ; Thu, 26 Nov 2020 17:52:12 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiLRD-0003GB-5I
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 17:52:11 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7355A68B05; Thu, 26 Nov 2020 18:52:08 +0100 (CET)
Date: Thu, 26 Nov 2020 18:52:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 29/44] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201126175208.GA24843@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-30-hch@lst.de> <20201126165036.GO422@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126165036.GO422@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_125211_329409_BD68B9EB 
X-CRM114-Status: GOOD (  17.96  )
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

On Thu, Nov 26, 2020 at 05:50:36PM +0100, Jan Kara wrote:
> > +	if (size == capacity ||
> > +	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
> > +		return false;
> > +	pr_info("%s: detected capacity change from %lld to %lld\n",
> > +		disk->disk_name, size, capacity);
> > +	kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
> 
> I think we don't want to generate resize event for changes from / to 0...

Didn't you ask for that in the last round?

> Also the return value of this function is now different.

It returns true if it did send an uevent, which is what the callers rely
on.

> > diff --git a/drivers/target/target_core_pscsi.c b/drivers/target/target_core_pscsi.c
> > index 4e37fa9b409d52..a70c33c49f0960 100644
> > --- a/drivers/target/target_core_pscsi.c
> > +++ b/drivers/target/target_core_pscsi.c
> > @@ -1027,12 +1027,7 @@ static u32 pscsi_get_device_type(struct se_device *dev)
> >  
> >  static sector_t pscsi_get_blocks(struct se_device *dev)
> >  {
> > -	struct pscsi_dev_virt *pdv = PSCSI_DEV(dev);
> > -
> > -	if (pdv->pdv_bd && pdv->pdv_bd->bd_part)
> > -		return pdv->pdv_bd->bd_part->nr_sects;
> > -
> > -	return 0;
> > +	return bdev_nr_sectors(PSCSI_DEV(dev)->pdv_bd);
> 
> I pdv_bd guaranteed to be non-NULL in pscsi_dev_virt?

Looking at the code - only for disk devices.  And while ->get_blocks
should only be called for those I'd rather err on the safe side and will
add the check back.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
