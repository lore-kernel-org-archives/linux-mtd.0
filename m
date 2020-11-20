Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F5DC5519F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 10:53:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C3B20657
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 10:53:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RPjtWyrK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04C3B20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gaY5hdowC6BKuzMWKJWxOdVapNYCWtyYfACptN3DvBU=; b=RPjtWyrKHc7nMrWtXfWiLSRZe
	i0wpFvHCngMflKmQjsWQDzhf8xgkR2WLs0jqrw3aFPcxBiCHOcjMPlielwU5qdZwjVE3H89yqsBMX
	BOHG9oU07ENOvm5wnjQEc5HBWW3SxsJoPOmPZwVdRfDwWQALKlSAZj/alV0K/yRaeDuze5rE3cGEp
	3lJ/5FTU+P5IxyzrCGxevGc1AUJFM1Cg5CtY7bPJm3KRPT8JDhSf1xQaQcE75yL+B00hKXeF+euun
	iH2yLSjS4y9RHraONziSHURPdHeoaX4TLY8+f0ba/0m0XTV+0ul9/dYnKzRvJp/I/AtApkzXr+RpT
	jIBj+NFBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg42e-0004GG-84; Fri, 20 Nov 2020 10:53:24 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg42b-0004FG-EI
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 10:53:22 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 015E9AED9;
 Fri, 20 Nov 2020 10:53:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id AC96F1E130B; Fri, 20 Nov 2020 11:53:19 +0100 (CET)
Date: Fri, 20 Nov 2020 11:53:19 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 15/20] block: merge struct block_device and struct
 hd_struct
Message-ID: <20201120105319.GA15537@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-16-hch@lst.de>
 <20201119143921.GX1981@quack2.suse.cz>
 <20201120091546.GE21715@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120091546.GE21715@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_055321_633881_6BEC9F49 
X-CRM114-Status: GOOD (  20.53  )
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

On Fri 20-11-20 10:15:46, Christoph Hellwig wrote:
> On Thu, Nov 19, 2020 at 03:39:21PM +0100, Jan Kara wrote:
> > This patch is kind of difficult to review due to the size of mostly
> > mechanical changes mixed with not completely mechanical changes. Can we
> > perhaps split out the mechanical bits? E.g. the rq->part => rq->bdev
> > renaming is mechanical and notable part of the patch. Similarly the
> > part->foo => part->bd_foo bits...
> 
> We'd end with really weird patches that way.  Never mind that I'm not
> even sure how we could mechnically do the renaming.

Well, I believe coccinelle should be able to do the renaming automatically.

> > Also I'm kind of wondering: AFAIU the new lifetime rules, gendisk holds
> > bdev reference and bdev is created on gendisk allocation so bdev lifetime is
> > strictly larger than gendisk lifetime. But what now keeps bdev->bd_disk
> > reference safe in presence device hot unplug? In most cases we are still
> > protected by gendisk reference taken in __blkdev_get() but how about
> > disk->lookup_sem and disk->flags dereferences before we actually grab the
> > reference?
> 
> Good question.  I'll need to think about this a bit more.

My thinking was that you could use

kobject_get_unless_zero(bdev->bd_device->kobj)

and after you hold this reference, you can do everything else safely. In
this case it is really useful that device is embedded in block_dev and
not in gendisk itself...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
