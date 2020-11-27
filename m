Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52630C5519F
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 17:31:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB86A22258
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 17:30:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jpBJv/Lm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB86A22258
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bS+fPGVoijGo6E+8/jJQssbXxPayYtqKVoVqFzi4RlU=; b=jpBJv/Lmdz4ndybvzGcMR8fej
	s+Bi2L153+EQaBxix2gsuL0eKwu9R1kr+dji8bKxOSaJuNzN86NDd7wj1SCX2QaoYW8ZGc0oXHQH7
	ywVwDxN3/Et6giBnwWS9jgUTAM3IrnQDVXmVjz/LI9gVpfcFPvTjEsLoKk1Ijm8rc06kftFy5FjZR
	zDnZn8A3rQX+QNhZYem7YI0bsMcAmPzY3on/wZFLtG14HxhAomNKw8S2FUVcJeT9xwGm+vtlZFglw
	c8NbN//Nwy+C7HOTZmOTjmWMQmOzRmFneKbL5rfVAyw/8C8gGnRqKnSXPZ+1Ps7FMYIvXh7ZpL3Ai
	84ASgOfcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kihZV-0000YX-Sb; Fri, 27 Nov 2020 17:30:13 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kihZT-0000Xo-M9
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 17:30:12 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5DF80ABD7;
 Fri, 27 Nov 2020 17:30:10 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1DA451E1319; Fri, 27 Nov 2020 18:30:10 +0100 (CET)
Date: Fri, 27 Nov 2020 18:30:10 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 41/44] block: switch disk_part_iter_* to use a struct
 block_device
Message-ID: <20201127173010.GB4276@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-42-hch@lst.de>
 <20201127125341.GD27162@quack2.suse.cz>
 <20201127152407.GA7115@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127152407.GA7115@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_123011_859739_A6DF0292 
X-CRM114-Status: GOOD (  19.24  )
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
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
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

On Fri 27-11-20 16:24:07, Christoph Hellwig wrote:
> On Fri, Nov 27, 2020 at 01:53:41PM +0100, Jan Kara wrote:
> > On Thu 26-11-20 14:04:19, Christoph Hellwig wrote:
> > 
> > There's:
> > 
> >         /* put the last partition */
> >         disk_put_part(piter->part);
> >         piter->part = NULL;
> > 
> > at the beginning of disk_part_iter_next() which also needs switching to
> > bdput(), doesn't it?
> 
> That is switched to call disk_part_iter_exit in patch 13.

I see, sorry for the noise.

> > > @@ -271,8 +271,7 @@ struct hd_struct *disk_part_iter_next(struct disk_part_iter *piter)
> > >  		      piter->idx == 0))
> > >  			continue;
> > >  
> > > -		get_device(part_to_dev(part->bd_part));
> > > -		piter->part = part->bd_part;
> > > +		piter->part = bdgrab(part);
> > 
> > bdgrab() could return NULL if we are racing with delete_partition() so I
> > think we need to take care of that.
> 
> bdgrab never retuns NULL..

Ah, that's what I misunderstood. I was confusing bdgrab() with igrab().
igrab() can return NULL but bdgrab() uses ihold() and thus cannot return
NULL. But for the lifetime rules to be safe, we should be indeed using
igrab() and check for NULL return...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
