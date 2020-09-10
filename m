Return-Path: <SRS0=L51Y=CT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1311C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 17:16:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BBCA20C09
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 17:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iiADmRCE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vqh1YREu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BBCA20C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tUdO3OoopWLaMtVx9pHWjMssH9I1TVr90sr/kl4Nc7w=; b=iiADmRCEddWa7YtHg3qXtSQdk
	+hW7bzgpWVBVYvMvtm4XIfl1a0p3PvEsTc37aeia4LklVBEdku5rUOJWbFKbums0Tu85VMh70DSk0
	kxkwNli3425uEb1nCEWD2l8djqpzn9YbmaRDo3OV57O3E8NdiZCnyWp97JmUHyxtB2sIJslWwym3l
	fAex3kJZRXEv4k7IID6d2frdRQHxYdf7oxsgV2QxBQIi5t0Nm9ExEQuKz2CI0TNWHaPw2PiCtdud7
	/BlL0OvjJWqF7p1GiNS8hbBJqGiq6wvPu80wNuDBZn4bNtKGvBE2dSNwTFvy2FdgZ8DkiHRJ103fu
	19+4RaCNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGQAw-0002kd-R6; Thu, 10 Sep 2020 17:15:58 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGQAu-0002jJ-1T
 for linux-mtd@lists.infradead.org; Thu, 10 Sep 2020 17:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599758152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V5RVkZoHNNgO8iRkts2uQucFzF0PqLciDsVyoi9bgfc=;
 b=Vqh1YREuDnGDHlUQI8FhTpJBgjFTUerDdqwuKT1SuiG0skGf/NIcWSsNHz/GGineP6h9JZ
 cYFtj4W+OkQUSJwbk9gUdpHz7YPzikC8puh+hmMlxBa+69LnSIIHOKu5teGf/hc3lZG568
 18Gu9RDSAG38TVjI0UuMb1HP7sV4uqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-HnAUMfNAM0OMvyN4RsRhjA-1; Thu, 10 Sep 2020 13:15:48 -0400
X-MC-Unique: HnAUMfNAM0OMvyN4RsRhjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7CFB802B72;
 Thu, 10 Sep 2020 17:15:45 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 061BB60BFA;
 Thu, 10 Sep 2020 17:15:42 +0000 (UTC)
Date: Thu, 10 Sep 2020 13:15:41 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/14] block: lift setting the readahead size into the
 block layer
Message-ID: <20200910171541.GB21919@redhat.com>
References: <20200726150333.305527-1-hch@lst.de>
 <20200726150333.305527-7-hch@lst.de>
 <20200826220737.GA25613@redhat.com> <20200902151144.GA1738@lst.de>
 <20200902162007.GB5513@redhat.com> <20200910092813.GA27229@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910092813.GA27229@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_131556_118175_DFB47262 
X-CRM114-Status: GOOD (  34.66  )
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

On Thu, Sep 10 2020 at  5:28am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> On Wed, Sep 02, 2020 at 12:20:07PM -0400, Mike Snitzer wrote:
> > On Wed, Sep 02 2020 at 11:11am -0400,
> > Christoph Hellwig <hch@lst.de> wrote:
> > 
> > > On Wed, Aug 26, 2020 at 06:07:38PM -0400, Mike Snitzer wrote:
> > > > On Sun, Jul 26 2020 at 11:03am -0400,
> > > > Christoph Hellwig <hch@lst.de> wrote:
> > > > 
> > > > > Drivers shouldn't really mess with the readahead size, as that is a VM
> > > > > concept.  Instead set it based on the optimal I/O size by lifting the
> > > > > algorithm from the md driver when registering the disk.  Also set
> > > > > bdi->io_pages there as well by applying the same scheme based on
> > > > > max_sectors.
> > > > > 
> > > > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > > > ---
> > > > >  block/blk-settings.c         |  5 ++---
> > > > >  block/blk-sysfs.c            |  1 -
> > > > >  block/genhd.c                | 13 +++++++++++--
> > > > >  drivers/block/aoe/aoeblk.c   |  2 --
> > > > >  drivers/block/drbd/drbd_nl.c | 12 +-----------
> > > > >  drivers/md/bcache/super.c    |  4 ----
> > > > >  drivers/md/dm-table.c        |  3 ---
> > > > >  drivers/md/raid0.c           | 16 ----------------
> > > > >  drivers/md/raid10.c          | 24 +-----------------------
> > > > >  drivers/md/raid5.c           | 13 +------------
> > > > >  10 files changed, 16 insertions(+), 77 deletions(-)
> > > > 
> > > > 
> > > > In general these changes need a solid audit relative to stacking
> > > > drivers.  That is, the limits stacking methods (blk_stack_limits)
> > > > vs lower level allocation methods (__device_add_disk).
> > > > 
> > > > You optimized for lowlevel __device_add_disk establishing the bdi's
> > > > ra_pages and io_pages.  That is at the beginning of disk allocation,
> > > > well before any build up of stacking driver's queue_io_opt() -- which
> > > > was previously done in disk_stack_limits or driver specific methods
> > > > (e.g. dm_table_set_restrictions) that are called _after_ all the limits
> > > > stacking occurs.
> > > > 
> > > > By inverting the setting of the bdi's ra_pages and io_pages to be done
> > > > so early in __device_add_disk it'll break properly setting these values
> > > > for at least DM afaict.
> > > 
> > > ra_pages never got inherited by stacking drivers, check it by modifying
> > > it on an underlying device and then creating a trivial dm or md one.
> > 
> > Sure, not saying that it did.  But if the goal is to set ra_pages based
> > on io_opt then to do that correctly on stacking drivers it must be done
> > in terms of limits stacking right?  Or at least done at a location that
> > is after the limits stacking has occurred?  So should DM just open-code
> > setting ra_pages like it did for io_pages?
> > 
> > Because setting ra_pages in __device_add_disk() is way too early for DM
> > -- given it uses device_add_disk_no_queue_reg via add_disk_no_queue_reg
> > at DM device creation (before stacking all underlying devices' limits).
> 
> I'll move it to blk_register_queue, which should work just fine.

That'll work for initial DM table load as part of DM device creation
(dm_setup_md_queue).  But it won't account for DM table reloads that
might change underlying devices on a live DM device (done using
__bind).

Both dm_setup_md_queue() and __bind() call dm_table_set_restrictions()
to set/update queue_limits.  It feels like __bind() will need to call a
new block helper to set/update parts of queue_limits (e.g. ra_pages and
io_pages).

Any chance you're open to factoring out that block function as an
exported symbol for use by blk_register_queue() and code like DM's
__bind()?

Thanks,
Mike


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
