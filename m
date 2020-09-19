Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958C1C43464
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 06:52:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27A1A20796
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 06:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jYwUANDD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27A1A20796
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+aticcOcc6errkhIX8LCoFGCLn1OZu7DVwRDZudBWTs=; b=jYwUANDDjhvUSItRypU7o91WY
	9hJS813YxJN8aXsAIfQSc9Oc7i330mqXKo+7DFwjPH5B+9FxetkJGXq4bAdM5cXkZbhDVhclvPDiz
	PLrNrkpLQOLr4hzhu808wM8nw8yXTMWILQX+CVrtV7+zd2FzVeNd1/D5CK57ZuzDo3o/jMB7oXQ7e
	ACeY4zC/PBsNxlcSHZvmoBx2Ypj6YJGN+TAAnfjIrLOhWx9+DBuqn5q51bK+h3Xp2CTf59NYhUmsH
	cgwGCAIkaPj7e1Y12Ijpjr16YF6c8n6VcXpJKTqkfGCZTj8wlIt0fQPe+eQsDJeoUZ4djBSlccIkn
	HQYg47t/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJWib-0002E7-IC; Sat, 19 Sep 2020 06:51:33 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJWiY-0002DC-Uu
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 06:51:31 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2740768BFE; Sat, 19 Sep 2020 08:51:27 +0200 (CEST)
Date: Sat, 19 Sep 2020 08:51:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 10/12] bdi: replace BDI_CAP_STABLE_WRITES with a queue
 and a sb flag
Message-ID: <20200919065126.GA8048@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-11-hch@lst.de> <20200917092524.GC7347@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917092524.GC7347@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_025131_108443_B6FDF288 
X-CRM114-Status: GOOD (  20.76  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 11:25:24AM +0200, Jan Kara wrote:
> On Thu 10-09-20 16:48:30, Christoph Hellwig wrote:
> > The BDI_CAP_STABLE_WRITES is one of the few bits of information in the
> > backing_dev_info shared between the block drivers and the writeback code.
> > To help untangling the dependency replace it with a queue flag and a
> > superblock flag derived from it.  This also helps with the case of e.g.
> > a file system requiring stable writes due to its own checksumming, but
> > not forcing it on other users of the block device like the swap code.
> > 
> > One downside is that we can't support the stable_pages_required bdi
> > attribute in sysfs anymore.  It is replaced with a queue attribute, that
> > can also be made writable for easier testing.
>   ^^^^^^^^^^^^^^^^
>   is also made
> 
> For a while I was confused thinking that the new attribute is not writeable
> but when I checked the code I saw that it is.
> 
> Not supporting stable_pages_required attribute is not nice but probably it
> isn't widely used. Maybe the deprecation message can even mention to use
> the queue attribute? Otherwise the patch looks good to me so feel free to
> add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>

Thanks.  I've fixed the commit log and changed the warning to:

	dev_warn_once(dev, 
                 "the stable_pages_required attribute has been removed. Use the
		 stable_writes queue attribute instead.\n");

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
