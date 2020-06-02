Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B07C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 06:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CD122072F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 06:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hyUqfkMc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cKJ0Ua8V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CD122072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wMBXdYtoJRDX93viVLoQR6oed6frevahkTuA/fAFjQ=; b=hyUqfkMctrL/Ed
	AbliU/IxOHDDyFZsrBgt/v6pNPjJossd2kJuGJxzezQCrWnBXt7IBH1ZLBPSvMTjvDil917WVed4Y
	CAgH7z1sqAFj/QsMzworpm+SYBvmtUfCx2Jp4qSEhDFHwpuby8nuPP8ZT15sfT+DU5ElwRThdP7Th
	Hq3YjT9umRhMmUZoopSg1uUtWXPtxVV0MlmimHpif2QoQXYxwE7UafqcorQmLQf+AdGRGN4W6BpOz
	LJyLkHcd7zqCecK1L4GP9eb0NnFWeAWlx4AP5/anpPybd9BYbZRhJ+/Ko7AnV0TIzAKgzwV1qG/L0
	DMRt1sJATPX1cSbVnWZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg0hH-00072Q-KM; Tue, 02 Jun 2020 06:46:51 +0000
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg0h9-00071N-LP
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2020 06:46:49 +0000
Received: by mail-vk1-xa42.google.com with SMTP id m18so627077vkk.9
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jun 2020 23:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=po5KhSQTeo32/YVK41COchciTQ5Axh4/cuzyzfj7k8Y=;
 b=cKJ0Ua8VUyJPxTXav2T7v9Iap1uoLnK2FAfVwkXDm6QLkxuY2sRpJQ8/gjoSeD9I5F
 GtO1vc4iUY2sO/v2w6oGyi5KRwIXLd1/+tDtPljWs4g3XWjZx5uh9Q+dlz0A91L5eCCd
 gm+FvNbqO9Lrbd39hqeFozWz1NVGptqVi4kJuPAq9ysg+mFnC+b8I1ySRNQI21vhUCE9
 Bk5QLuGj6X6NurT6EzvGQb09ELdfs6SRHqOoL1GK7A1WT89qM8fRz0JA9VYMYmiTNg16
 7Tn2UsWhITskp/GIcxh/YPUkgspoIh+IZ6MDzyvf7gtl3KGdfCShIH84jeLf+yCTRYUa
 6VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=po5KhSQTeo32/YVK41COchciTQ5Axh4/cuzyzfj7k8Y=;
 b=n1vKlFCr9EYWhk0KBJ+6jQvcw9TmqzEzNxcEE6zXbmkm2g0+4UvwUQQZ9/lAE5ET7l
 J9QM5ftI+64KCkUVbSKAJwxDmDf+SGdneeGbQXlVfXFSVOVYo0/wbGA6wU3GX8b9rwGj
 OoaRlsJJbRIrMzGfBxPtRWFMlfoB74h9QYOxsSrack6h6r8YvC9Gm//EQiIvcdGbXoWx
 DiZ1HLUodtiEvDmoe7Q6wiLg5yYtFwADI2H6wLfnDXt4E4CQ7EW2I2NmfbCtm/0M8qAM
 /1mh90yMqxVStDnlNkWIW9YJVBQb0hs/gx+hneS5YnXpYT+mPnmQ8AQZRxIAhGXgd6im
 Morg==
X-Gm-Message-State: AOAM532PohnFZZp0EiWfQt2dYHhxeBvYWyq1nr2lNTtyxsrONuoh/MAt
 Bn6zj/ModHjMWtNpm3+Mf87lKfRQ/a8nUMgl3iZbjg==
X-Google-Smtp-Source: ABdhPJwk2Bn3ClGMFwno2UudGxk3fxDlJ6UnRjdygaD9Zp+7Cb47KxvzLjYfdTNTDbz6LB5+4cgoo5UQLmemmh+F/HQ=
X-Received: by 2002:ac5:cc44:: with SMTP id l4mr8633992vkm.43.1591080402504;
 Mon, 01 Jun 2020 23:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200528081003.238804-1-linus.walleij@linaro.org>
 <20200601074957.GE1181806@T590>
 <CACRpkdYL4-Z=kaS+RfniVr=Sn-yOf+=CKMJDsn=eTK3atmGohg@mail.gmail.com>
 <20200601115818.GB1190838@T590>
 <CAPDyKFq2paDu9ogEFh6VXWq8___FLeEaNyBWhkMSdpZYpEytQQ@mail.gmail.com>
 <7f9aaf69b24b794ca4c9c126eb2394862e276c73.camel@wdc.com>
 <6bda7563-fc47-e049-ed55-265f58ae522c@kernel.dk>
In-Reply-To: <6bda7563-fc47-e049-ed55-265f58ae522c@kernel.dk>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Jun 2020 08:46:06 +0200
Message-ID: <CAPDyKFoNQwmtrw1Ka=M6SKbnKbD_aapkmLBZ-Ji-YgSFEhT5ow@mail.gmail.com>
Subject: Re: [PATCH] block: Flag elevators suitable for single queue
To: Jens Axboe <axboe@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_234645_181916_4CCAA3ED 
X-CRM114-Status: GOOD (  30.35  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "paolo.valente@linaro.org" <paolo.valente@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "ming.lei@redhat.com" <ming.lei@redhat.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "jthumshirn@suse.de" <jthumshirn@suse.de>, "hch@lst.de" <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2 Jun 2020 at 01:45, Jens Axboe <axboe@kernel.dk> wrote:
>
> On 6/1/20 5:37 PM, Damien Le Moal wrote:
> > On Mon, 2020-06-01 at 14:53 +0200, Ulf Hansson wrote:
> >> On Mon, 1 Jun 2020 at 13:58, Ming Lei <ming.lei@redhat.com> wrote:
> >>> On Mon, Jun 01, 2020 at 01:36:54PM +0200, Linus Walleij wrote:
> >>>> On Mon, Jun 1, 2020 at 9:50 AM Ming Lei <ming.lei@redhat.com> wrote:
> >>>>> On Thu, May 28, 2020 at 10:10:03AM +0200, Linus Walleij wrote:
> >>>>>> The Kyber block scheduler is not suitable for single hardware
> >>>>>> queue devices, so add a new flag for single hardware queue
> >>>>>> devices and add that to the deadline and BFQ schedulers
> >>>>>> so the Kyber scheduler will not be selected for single queue
> >>>>>> devices.
> >>>>>
> >>>>> The above may not be true for some single hw queue high performance HBA(
> >>>>> such as megasas), which can get better performance from none, so it is
> >>>>> reasonable to get better performance from kyber, see 6ce3dd6eec11 ("blk-mq:
> >>>>> issue directly if hw queue isn't busy in case of 'none'"), and the
> >>>>> following link:
> >>>>>
> >>>>> https://lore.kernel.org/linux-block/20180710010331.27479-1-ming.lei@redhat.com/
> >>>>
> >>>> I see, but isn't the case rather that none is preferred and kyber gives
> >>>> the same characteristics because it's not standing in the way
> >>>> as much?
> >>>
> >>> Kyber has its own characteristic, such as fair read & write, better
> >>> IO merge. And the decision on scheduler isn't only related with device,
> >>> but also with workloads.
> >>>
> >>>> It looks like if we should add a special flag for these devices with
> >>>> very fast single queues so they can say "I prefer none", do you
> >>>> agree?
> >>>
> >>> I am not sure if it is easy to add such flag, because it isn't only
> >>> related with HBA, but also with the attached disks.
> >>>
> >>
> >> In general I don't mind the idea of giving hints from lower layer
> >> block devices, about what kind of scheduling algorithm that could make
> >> sense (as long it's on a reasonable granularity).
> >>
> >> If I understand your point correctly, what you are saying is that it
> >> isn't easy or even possible for some block devices HWs. However, that
> >> should be fine, as it wouldn't be mandatory to set this kind of flags,
> >> but
> >> instead could help where we see it fit, right?
> >
> > The elevator features flag was implemented not as a hint, but as hard
> > requirements for elevators that are needed (mandatory) for a particular
> > device type for correct operation. By correct operation, I mean "no IO
> > errors or weird behavior resulting in errors such as timeouts". Until
> > now, the only hard requirement we have is for zoned block devices which
> > need mq-deadline to guarantee in-order dispatch of write commands (for
> > sequential zones writing).
> >
> > We definitely could add hint flags to better help the block layer
> > decide on the default optimal elevator for a particular device type,
> > but as is, the elevator features will completely prevent the use of any
> > other elevator that does not have the feature set. Those elevators will
> > not be seen in /sys/block/<dev>/queue/scheduler. This may be a little
> > too much for hint level rather than hard requirement.
> >
> > Furthermore, as Ming said, this depends on the HBA too rather than just
> > the device itself. E.g. the smartpqi driver (Microsemi SAS HBAs)
> > exposes single hard-disks as well as fast RAID arrays as multi-queue
> > devices. While kyber may make sense for the latter, it probably does
> > not make much sense for the former.
> >
> > In kernel vs udev rules for setting the optimal elevator for a
> > particular device type should also be considered.
>
> Agree, the elevator flags are hard requirements, which doesn't match
> what this patch is trying to do. There's absolutely nothing wrong with
> using none or kyber on single queue devices, hence it should be possible
> to configure it as such.

I agree, the elevator flags as is, currently don't work for giving
hints from lower block layers. However, I still think it would be
worth exploring the idea that is brought up here.

The point is, even if it's perfectly fine to use kyber for MMC/SD, for
example, it would make little sense as BFQ performs better on this
type of single queue storage device. So, why solely rely on userspace
udev rules, when we can, in-kernel, help to decide what is the best
configuration?

Kind regards
Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
