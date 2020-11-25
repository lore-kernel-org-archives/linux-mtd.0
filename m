Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659C6C6379D
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 16:24:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF641206F7
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 16:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oNxpXNvR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF641206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0pinuvjZlVU3AbVtZUwEg7l0gF3LBIcD3wSSOx7JRyo=; b=oNxpXNvRrdIuZGcCxlgKkzqj3
	HfoPfDx3MoNZxunLPvie5dTIpxZM4kb51LyJPuo4pFAeYqjQcSgve8Fx3MhPOKbAutbBP0z141Vzo
	qVCGUAbaU0P6gq9zRC+uouG78uvBcV8UUFCaWmNrKi1Q1/f1IrZdgGGLoW6SZN8xdTv0iUT82rXug
	JqEb5ZaEqmWQtvhrUuKXkA2D5BMuM3u3+28HkOKCQBMLkg1Pqdq0/OG1LeuuGMQ6Yi17yY3R+7+Nf
	5C8RoQSRPi/8epOYDFSj25CSpA4cZ532jJV5UEcB2vzs2AeHqn/JVrsyuVZTNvLnJdPrw/r0VTmmy
	6+IY+Ji1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxZJ-0000gX-D2; Wed, 25 Nov 2020 16:22:57 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxZG-0000fc-CL
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 16:22:55 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4507168B02; Wed, 25 Nov 2020 17:22:50 +0100 (CET)
Date: Wed, 25 Nov 2020 17:22:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 04/45] fs: simplify freeze_bdev/thaw_bdev
Message-ID: <20201125162250.GA795@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-5-hch@lst.de> <20201125122953.GH16944@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125122953.GH16944@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_112254_582221_52CD3C22 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 25, 2020 at 01:29:53PM +0100, Jan Kara wrote:
> >  	mutex_unlock(&bdev->bd_fsfreeze_mutex);
> > -	return sb;	/* thaw_bdev releases s->s_umount */
> > +	return error;	/* thaw_bdev releases s->s_umount */
> 
> The comment about thaw_bdev() seems to be stale? At least I don't see what
> it's speaking about...

Yes, this comment seems long stale.  I think in the very early days
we held s_umount on frozen file system, which caused all kinds of
problems.

> >  	mutex_unlock(&bdev->bd_fsfreeze_mutex);
> > -	return error;
> > +	return 0;
> 
> But we now won't return -EINVAL if this gets called e.g. with
> bd_fsfreeze_count == 0, right?

Yes.  I had tried to drop the return value as all the freeze_bdev
calls ignored it.  But I had missed the unpaired emergency thaw and put
it back and messed this up..

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
