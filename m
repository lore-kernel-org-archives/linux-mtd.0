Return-Path: <SRS0=vQrn=CL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A79C433E2
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 15:13:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA0BB20773
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 15:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BmF9JQQg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA0BB20773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D1oHCKnpYthJGk7u6NavTW0l4PDGxsnFg/NDf1bvnVk=; b=BmF9JQQg2fyFUnKIEOVQRt2Vt
	5BTIwKSAvL2xBlXWudMnGUsMMcL/A4f3FxTHimCJ7ukEwj45WysZnwP1ucRMNDqJP8/pugrVRv2IR
	pWSFd5lMYoxPjX7uAxMWrS9VouW5YyjLO565ck/tTLzIrioFbm6KwOl9NfO5N9S79nbKz4h/zkKnL
	n5kOI33956NKl4l0cd1FJIxf77755Pi7UAUJL4ddFQgbamEKo8GLM+ECDdc6cXUr16DZjVdzfcblC
	XrdOEtbz4Ydbv4alFT1N9bZOaEOdUUVTV64pMY5uWJFIo3gLH6PYOcsBeSurWZcov9hvRvfWunARX
	/+ONaiXzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDURZ-00007V-6f; Wed, 02 Sep 2020 15:13:01 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDUQP-0007r6-Vr
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2020 15:11:51 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4285B68B05; Wed,  2 Sep 2020 17:11:44 +0200 (CEST)
Date: Wed, 2 Sep 2020 17:11:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Subject: Re: [PATCH 06/14] block: lift setting the readahead size into the
 block layer
Message-ID: <20200902151144.GA1738@lst.de>
References: <20200726150333.305527-1-hch@lst.de>
 <20200726150333.305527-7-hch@lst.de> <20200826220737.GA25613@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826220737.GA25613@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_111150_228770_B8A6E541 
X-CRM114-Status: GOOD (  21.30  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 martin.petersen@oracle.com, Hans de Goede <hdegoede@redhat.com>,
 Song Liu <song@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 drbd-dev@tron.linbit.com, cgroups@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 26, 2020 at 06:07:38PM -0400, Mike Snitzer wrote:
> On Sun, Jul 26 2020 at 11:03am -0400,
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > Drivers shouldn't really mess with the readahead size, as that is a VM
> > concept.  Instead set it based on the optimal I/O size by lifting the
> > algorithm from the md driver when registering the disk.  Also set
> > bdi->io_pages there as well by applying the same scheme based on
> > max_sectors.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  block/blk-settings.c         |  5 ++---
> >  block/blk-sysfs.c            |  1 -
> >  block/genhd.c                | 13 +++++++++++--
> >  drivers/block/aoe/aoeblk.c   |  2 --
> >  drivers/block/drbd/drbd_nl.c | 12 +-----------
> >  drivers/md/bcache/super.c    |  4 ----
> >  drivers/md/dm-table.c        |  3 ---
> >  drivers/md/raid0.c           | 16 ----------------
> >  drivers/md/raid10.c          | 24 +-----------------------
> >  drivers/md/raid5.c           | 13 +------------
> >  10 files changed, 16 insertions(+), 77 deletions(-)
> 
> 
> In general these changes need a solid audit relative to stacking
> drivers.  That is, the limits stacking methods (blk_stack_limits)
> vs lower level allocation methods (__device_add_disk).
> 
> You optimized for lowlevel __device_add_disk establishing the bdi's
> ra_pages and io_pages.  That is at the beginning of disk allocation,
> well before any build up of stacking driver's queue_io_opt() -- which
> was previously done in disk_stack_limits or driver specific methods
> (e.g. dm_table_set_restrictions) that are called _after_ all the limits
> stacking occurs.
> 
> By inverting the setting of the bdi's ra_pages and io_pages to be done
> so early in __device_add_disk it'll break properly setting these values
> for at least DM afaict.

ra_pages never got inherited by stacking drivers, check it by modifying
it on an underlying device and then creating a trivial dm or md one.
And I think that is a good thing - in general we shouldn't really mess
with this thing from drivers if we can avoid it.  I've kept the legacy
aoe and md parity raid cases, out of which the first looks pretty weird
and the md one at least remotely sensible.

->io_pages is still inherited in disk_stack_limits, just like before
so no change either.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
