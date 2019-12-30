Return-Path: <SRS0=iF+I=2U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E20C2D0C2
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 17:32:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C87A206DB
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 17:32:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mgWnif3r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="O6DM8LvB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C87A206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOhVB/Isji1W5kT2Ht3qxRumqBjYwZCUwXmNSJ/MLCM=; b=mgWnif3rrgDWlD
	YsssIBDWR0WFo1PNx3iIWINIpBbcSCs7iUzPnBhBbrx+HfBBj5KD/CQnoACsA8YGAFcmN6VVvDHV9
	phQofIiyuXqqie+mcD7sK3X2Gb1/0ysMVi+ToON/FDp3dCsW480ZeGg3tUrxlY/EJoWcg47cwcGO7
	u+VmcEL1+yQSrTs7AuSMnC9Q+GSzKERvjxn8TPkM0MHaCFCFjYb1R5Quv1PdHmwdsiDa1JojUpqTO
	FdsbSctde24ypJSVXOV+dlCVPWXOHZOGZYphvXwli0Q+ZgSaOGxczH7u5YobPWWxvPMcyVk/Ym11g
	Y2avURAUPkK4g1SHSZMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilyts-0005eZ-Q5; Mon, 30 Dec 2019 17:32:16 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilytn-0005ds-8t
 for linux-mtd@lists.infradead.org; Mon, 30 Dec 2019 17:32:15 +0000
Received: by mail-ua1-x942.google.com with SMTP id a12so11376042uan.0
 for <linux-mtd@lists.infradead.org>; Mon, 30 Dec 2019 09:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/t4eEDQXrq14A1vQpddygGpfoa7iZX2MNXj4hB5D73M=;
 b=O6DM8LvBL46DL8sFAs5l/YmXUIF18eOJL5SX02JJfd5ZIqPl6VAxQkd6PLGg7jqrk5
 PR9B335gzSFo7ksi7CC/8/vBUXE/8jfoSvhbrVjAqxO2Gps2+itugzD9NpU11sdSriec
 DqSfXgEsI5ErjPbjBceKEw1QH56u5siOVm5MQ30PZ2bb1R0JNOP4K+/lpuHq5E67AylK
 PyCVBOMqcdXMR9hmcKPQ2Nm6c5dhfthhxOP0wTYLKwYam6Lgczp2XeFIWcXJ2mqYguIS
 njcvGLLyA88bGR01VFd10+4GkkwuQbjqSMncn2HqV/QFsOpS+UgAtOTV4KUV0ga4IDY3
 NN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/t4eEDQXrq14A1vQpddygGpfoa7iZX2MNXj4hB5D73M=;
 b=RbRKaMmcln6zvt1ZRyRXB1kyEqfHjDgzyVnatXstdOPeG4c1mRZ0QfIrPp1xhMvqbb
 nY9ibblXw3OqBjnqNpTGuzIR9Kyhy/vfcDK5agN3u5Mub8Lbkd5xlvBRES7lQ/0VtmIm
 99LmyWRpz6NxQlqe9ki7R5dtQnc+KgzCSuu7043IUyXmhRD6FnMx0S9BAo7NIvuEHB5q
 /7flVMSjhq690/vdHfWTUDz/MNL62xxs6QYmxbgqEZZcUrCsrx6MIuS0Vf476HXfArRG
 TSF5FgqA/c35i9KDp/LBIguhUpo2B4GcIUpE4O/YDahbaQksBuEIly9WkNQ4D4vD9OF1
 Pa2A==
X-Gm-Message-State: APjAAAVQozIqBLGybN41kU9UhLWb7I+MtyyB41gDbalLBiAh0612YF4C
 1bVYEUOupcMen8rSR1I9bNRzRssYFVAEiZPFeSVB0g==
X-Google-Smtp-Source: APXvYqzZLBKSw+hcXDAJutdY3buo9ooPPz0SVuuSln7y2Ah2im/ghOsNuEfG/X6SjW2PX/goRqEVkFM/CBEnD/3c75g=
X-Received: by 2002:ab0:374a:: with SMTP id i10mr27723465uat.97.1577727129709; 
 Mon, 30 Dec 2019 09:32:09 -0800 (PST)
MIME-Version: 1.0
References: <CAF_dkJA2DFr3Vgk5ie=V5YitZr8HaiXWuQ+SKsHzzmLBFnhyeg@mail.gmail.com>
 <23922253.ayd0uQntjt@blindfold>
 <CAO1O6se0aPh2FScDStqrK50PPipBbsgEnEPbMHvOdXt2cbxtvA@mail.gmail.com>
In-Reply-To: <CAO1O6se0aPh2FScDStqrK50PPipBbsgEnEPbMHvOdXt2cbxtvA@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 30 Dec 2019 14:31:58 -0300
Message-ID: <CAAEAJfCfYV6F4L00m=P60BFdENyhY1CsD3yC-jpOx=kKLL88Kw@mail.gmail.com>
Subject: Re: [PATCH 1/1] ubi: Allow ubiblock devices nodes to be created by
 volume name instead of volume ID.
To: Emil Lenngren <emil.lenngren@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_093211_447183_6CCEF2F8 
X-CRM114-Status: GOOD (  18.41  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Patrick Doyle <wpdster@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Emil, Patrick, Richard:

I just came across this patch.

On Wed, 14 Aug 2019 at 09:35, Emil Lenngren <emil.lenngren@gmail.com> wrote:
>
> Hi,
>
> Den tors 4 apr. 2019 kl 21:43 skrev Richard Weinberger <richard@nod.at>:
> >
> > Am Donnerstag, 4. April 2019, 17:29:16 CEST schrieb Patrick Doyle:
> > > Add support for CONFIG_MTD_UBI_BLOCK_BY_NAME, which enables ubi block
> > > devices to be named by their volume name: /dev/ubiblock%d_%s rather than
> > > their volume ID /dev/ubiblock%d_%d, so that one can mount e.g. a root
> > > filesystem by UBI name instead of volume ID.  UBI volumes can be renamed
> > > on-the-fly in user space. This allows the root file system to be swapped
> > > from an "A" volume to a "B" volume without having to change the mount
> > > options.
> >
> > Isn't this why we have udev, to create fancy by-id/by-path/... naming conventions?
> >
> > Thanks,
> > //richard
>
> I actually implemented the same change some time ago, for the exact
> same reason (swapping two volumes and then reboot). Referring to an
> ubi volume by name is more convenient than volume numbers, since names
> can be changed and numbers can't.

Arggh, it is such a shame that we missed this when we
designed UBI block!

As you have noticed, atomically changing UBI volume names
is an important UBI feature, extensively used for implementing
safe firmware upgrades.

So, naturally, the device choice should have been based on the
name, and not on the volume ID.

Regarding, the "use a initramfs" I've been there, carrying an
initramfs for the sole purpose of finding the volume with the
name you want, mounting and pivoting. Looking back,
I can say this was a big, fat PITA.

And it's _not_ about boot time or anything like that.
It's about increasing the number of components
(in this case, an entire rootfs) that system integrators
have to maintain, keep track of, and worry about.

I'm not at all surprised hacking a downstream is easier for
embedded developers, and I'm sorry we didn't see thought
about this use case back then.

> Is it maybe possible to define both /dev/ubiblock%d_%d and
> /dev/ubiblock%d_%s at the same time?

Nope, this won't fly.

The sad news is that it's not easy to fix. The patch proposed
by Patrick is a no-go, because we don't want to increase
the number of configuration options for something like this.

Configuration options increase the combinations that you
need to test, and so we try to avoid them as much as possible.

We can't change any default behavior either, as it will
have an impact on existing systems.

What we _could_ do, is extend the current syntax, passing
a format string to the kernel. Something like this, provided
a ubi0_0 volume, named "rootA".

ubi.block=0,0,ubiblock${dev.id}_${vol.id}

would create block device as "/dev/ubiblock0_0".

Where as, ubi.block=0,0,ubiblock${dev.id}${vol.name}

would create block device as "/dev/ubiblock0_rootA".

Knowing Richard's stand in the initramfs camp, I'm sure
he's eyes are in flames right now :-)

Does this make any sense... or it is pure insanity?

Thanks (also sorry),
Ezequiel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
