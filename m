Return-Path: <SRS0=vQrn=CL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14B8C433E2
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 16:21:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C22EE2072A
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 16:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GLQirPC9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hmO5GLct"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C22EE2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oCA2INQtQN4F7J36OscKDqiRyzt7SiI7Gzfa2GEO770=; b=GLQirPC9hx33T3pwJFXbFI22p
	Sm39GxvkA72lnOfl1L7cqvwtDUhTFkUqdPk+vSD5soqC+X6rndOsddjWqsBM1u4Kg1F64uXQsPpfO
	z0YEtTTZk86GdTZ6QzhbIkdDrNvQynvJOaXgYedqR1DvSkz2y3yOKhZZBHXlPCZ+Qmpxx9aUyx4Nk
	NwfcgdMGab6xJ/oWcJSjl4Hb0zduIuDBXInCJLkCCSQjp80pJr/x+XC8Ar9w3ivApE1O53WBD3azg
	LzA4KopekF+33OwurJyobV8kPa+pOfX2iFSbMPVLIfZhvKt08h/e2Q5thlbq6WWPT5aF0h2mf++31
	wMezJJT5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDVUi-0005Kv-Vi; Wed, 02 Sep 2020 16:20:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDVUg-0005JW-7a
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2020 16:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599063616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I3XppnnrIephKMf+c97CJaQhGKT7XO5RfPDNT2gEhBw=;
 b=hmO5GLctVVj4WgIOyoohwMGQWhK0FVq5oF4b7pWL/koUfGFDMs1Ct9BWVmdecT1ovjlijA
 du3UIu2o2sQzUOMe9Sap51KRDQ+nS14WWoYFZ0AVXkLAds90WSg/Mhacgud15FKH5Fv4gN
 25ftkKfrKp/ZAFmoWsvXESnVNN9My9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-2MV1gUebNPOKGqCVe8X-ug-1; Wed, 02 Sep 2020 12:20:14 -0400
X-MC-Unique: 2MV1gUebNPOKGqCVe8X-ug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D717518B9EC0;
 Wed,  2 Sep 2020 16:20:11 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8C77E306;
 Wed,  2 Sep 2020 16:20:08 +0000 (UTC)
Date: Wed, 2 Sep 2020 12:20:07 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/14] block: lift setting the readahead size into the
 block layer
Message-ID: <20200902162007.GB5513@redhat.com>
References: <20200726150333.305527-1-hch@lst.de>
 <20200726150333.305527-7-hch@lst.de>
 <20200826220737.GA25613@redhat.com> <20200902151144.GA1738@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902151144.GA1738@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_122018_299361_D1E76AEB 
X-CRM114-Status: GOOD (  30.51  )
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
 martin.petersen@oracle.com, Hans de Goede <hdegoede@redhat.com>,
 Richard Weinberger <richard@nod.at>, Minchan Kim <minchan@kernel.org>,
 drbd-dev@tron.linbit.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 02 2020 at 11:11am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> On Wed, Aug 26, 2020 at 06:07:38PM -0400, Mike Snitzer wrote:
> > On Sun, Jul 26 2020 at 11:03am -0400,
> > Christoph Hellwig <hch@lst.de> wrote:
> > 
> > > Drivers shouldn't really mess with the readahead size, as that is a VM
> > > concept.  Instead set it based on the optimal I/O size by lifting the
> > > algorithm from the md driver when registering the disk.  Also set
> > > bdi->io_pages there as well by applying the same scheme based on
> > > max_sectors.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  block/blk-settings.c         |  5 ++---
> > >  block/blk-sysfs.c            |  1 -
> > >  block/genhd.c                | 13 +++++++++++--
> > >  drivers/block/aoe/aoeblk.c   |  2 --
> > >  drivers/block/drbd/drbd_nl.c | 12 +-----------
> > >  drivers/md/bcache/super.c    |  4 ----
> > >  drivers/md/dm-table.c        |  3 ---
> > >  drivers/md/raid0.c           | 16 ----------------
> > >  drivers/md/raid10.c          | 24 +-----------------------
> > >  drivers/md/raid5.c           | 13 +------------
> > >  10 files changed, 16 insertions(+), 77 deletions(-)
> > 
> > 
> > In general these changes need a solid audit relative to stacking
> > drivers.  That is, the limits stacking methods (blk_stack_limits)
> > vs lower level allocation methods (__device_add_disk).
> > 
> > You optimized for lowlevel __device_add_disk establishing the bdi's
> > ra_pages and io_pages.  That is at the beginning of disk allocation,
> > well before any build up of stacking driver's queue_io_opt() -- which
> > was previously done in disk_stack_limits or driver specific methods
> > (e.g. dm_table_set_restrictions) that are called _after_ all the limits
> > stacking occurs.
> > 
> > By inverting the setting of the bdi's ra_pages and io_pages to be done
> > so early in __device_add_disk it'll break properly setting these values
> > for at least DM afaict.
> 
> ra_pages never got inherited by stacking drivers, check it by modifying
> it on an underlying device and then creating a trivial dm or md one.

Sure, not saying that it did.  But if the goal is to set ra_pages based
on io_opt then to do that correctly on stacking drivers it must be done
in terms of limits stacking right?  Or at least done at a location that
is after the limits stacking has occurred?  So should DM just open-code
setting ra_pages like it did for io_pages?

Because setting ra_pages in __device_add_disk() is way too early for DM
-- given it uses device_add_disk_no_queue_reg via add_disk_no_queue_reg
at DM device creation (before stacking all underlying devices' limits).

> And I think that is a good thing - in general we shouldn't really mess
> with this thing from drivers if we can avoid it.  I've kept the legacy
> aoe and md parity raid cases, out of which the first looks pretty weird
> and the md one at least remotely sensible.

I don't want drivers, like DM, to have to worry about these.  So I agree
with that goal ;)

> ->io_pages is still inherited in disk_stack_limits, just like before
> so no change either.

I'm missing where, but I only looked closer at this 06/14 patch.
In it I see io_pages is no longer adjusted in disk_stack_limits().

Mike


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
