Return-Path: <SRS0=GzCT=TQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772BBC04AAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 15:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4154720657
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 15:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nyXkmaGa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4154720657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rockwellcollins.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3d1NSlqJhAjsqSMcjIIpWjQpULUrXtqJfepZXlZQOo=; b=nyXkmaGas7vdmL
	wAUrNoNNpZfRY9YHlLNdyWL1zT6pibpZhHNbF5ERE+7Y18qzmktTQhjTwdkVyCsm17BF8yXfNDvgy
	j9F8KdC9AieU71whHtQ0YyHzBmrhJuC/fw3ISDsoNXGGtyXHUjm9Y99HpK/97Hq93X8zvNlrrK+mF
	KvuXvDG+gUwFifPcw/h1Pk5105ZGrcClluJYMdt+WhmuXVP9xI9rh/QFBsozgdRqBBpFuGcV9HPZG
	1FsONbGuH9v6fo8uWjP48WUm7Q+23EdD7TKBWwlZzJWknGXcFamtDThxM7VZ94Qd4HW2wHKfSiH4G
	2bcz0EWs0Dosp8p3Uxkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRI4C-000655-0r; Thu, 16 May 2019 15:13:08 +0000
Received: from da1vs03.rockwellcollins.com ([205.175.227.47])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRI49-00064k-O1
 for linux-mtd@lists.infradead.org; Thu, 16 May 2019 15:13:07 +0000
X-RC-All-From: , 205.175.227.20, No hostname, brandon.maier@rockwellcollins.com,
 Brandon Maier <brandon.maier@rockwellcollins.com>, , 
X-RC-Attachments: , ,
X-RC-RemoteIP: 205.175.227.20
X-RC-RemoteHost: No hostname
X-RC-IP-Hostname: da1ip03.rockwellcollins.com
X-RC-IP-MID: 19709762
X-RC-IP-Group: GOOGLE_RELAYED
X-RC-IP-Policy: $GOOGLE_RELAYED
X-RC-IP-SBRS: None
Received: from unknown (HELO mail-ot1-f69.google.com) ([205.175.227.20])
 by da1vs03.rockwellcollins.com with ESMTP/TLS/AES128-GCM-SHA256;
 16 May 2019 10:13:02 -0500
Received: by mail-ot1-f69.google.com with SMTP id 68so1790221otu.18
 for <linux-mtd@lists.infradead.org>; Thu, 16 May 2019 08:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UjGNvPNXHeOIKGGK/hT2Ssn559itRwpPS1s/+UomawM=;
 b=hdGhhvL+Ca43//YPVi7FaKMwBT9U4snMqfHJs41d7AiBFuge6JqEiy4mSqyizKu+Zk
 cbsoS/Mri/VR97pZ7aj4ipZawJwA0fDBXbfZzAJ61aMYsValmVnwYi01TDiZjI8AhngX
 KBD62Q2/pk3LhTwlgLkP5T93GOAm+AEsvzwckkMc+RcEJs/6OYi2EzSy42m+EV2v6wZd
 ZVKacfusHylTleh8HwfLUKQnRiGFQAuX3bg4ihXKE12qVNHzOP7nNbRQYIQpmpxl+9y+
 pWNEGDUIZACyHtjwj8cGQ2hSYUy4G1LJ4f2FLTGnNGzDYSsSNffNvzqB5fyCHeFuP8BH
 pBLA==
X-Gm-Message-State: APjAAAV9ErCRJ8rTD4dFnqftNHi0wfVT+xfZRO2iES+Xb91Y8hjE7jy3
 YHOKRjPVcgm/MHsw9YXfAIhN3S4tsMz0SMety1zWfuzNDqwyvwOA+ScA1cG3OdYX4xNhyHVjd1Q
 SFjnWlkdZOy3e8/OTgCXRAY+cJKDM7yB/CSaUYEJ5BjG8uC8UA3lB7R4IfBH+
X-Received: by 2002:a9d:7383:: with SMTP id j3mr22069720otk.124.1558019582002; 
 Thu, 16 May 2019 08:13:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNa2s1wbEMmXuWKqz7XyPJro2cO1L2qYYg8vp0e4MYhB15r7n66x/+zks7K2Un1F64Ck5gdIo6BQquXN2LbRs=
X-Received: by 2002:a9d:7383:: with SMTP id j3mr22069685otk.124.1558019581606; 
 Thu, 16 May 2019 08:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <1556914418-40288-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1556914418-40288-2-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAFLxGvxgQb1iCTdHbFWz6VmMU1mjnGOadkHtLvA68Jaa0BS=bg@mail.gmail.com>
 <CAFLxGvxoO7mMdH5dMKgqzz49qq-M49jSPi5SpmnA1RScgBmj5w@mail.gmail.com>
In-Reply-To: <CAFLxGvxoO7mMdH5dMKgqzz49qq-M49jSPi5SpmnA1RScgBmj5w@mail.gmail.com>
From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Thu, 16 May 2019 10:12:45 -0500
Message-ID: <CA+fik51C43hnuWNFYFfzxivMVFrMZ9hN=jsLbQOWb9qcm0fAxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] jffs2: Add sync to underlying mtd device when file
 system is synced
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_081305_849258_B67E3FA5 
X-CRM114-Status: GOOD (  18.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Clayton is out currently, but I can comment on what he had told me.

On Thu, May 16, 2019 at 6:05 AM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Mon, May 6, 2019 at 12:22 AM Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> >
> > On Fri, May 3, 2019 at 10:14 PM Clayton Shotwell
> > <clayton.shotwell@rockwellcollins.com> wrote:
> > >
> > > Need to ensure the underlying flash does not cache anything even though
> > > the file system thinks it's synced back.
> > >
> > > Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> > > ---
> > >  fs/jffs2/super.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> > > index 05d892c..4341565 100644
> > > --- a/fs/jffs2/super.c
> > > +++ b/fs/jffs2/super.c
> > > @@ -111,6 +111,7 @@ static int jffs2_sync_fs(struct super_block *sb, int wait)
> > >         mutex_lock(&c->alloc_sem);
> > >         jffs2_flush_wbuf_pad(c);
> > >         mutex_unlock(&c->alloc_sem);
> > > +       mtd_sync(c->mtd);
> >
> > This needs a more detailed explanation.
> > mtd_sync() is not cheap, so you make syncfs() more expensive.
> >
> > Please explain what failure you are facing without mtd_sync().
> > jffs2 is supposed to recover from a power failure at any time, just like ubifs.

The system exhibiting problems runs jffs2 on a gluebi device. Our
software sync()'s the jffs2 at certain points so that it's safe if
power is cut. The jffs2 always recovers the filesystem after power
cut, but sometimes data written before the sync() call gets lost.

These patches attempt to solve this problem by 1) calling _sync() on
the underlying mtd device after writing to flush any buffers in the
mtd, and 2) adding a _sync() callback to gluebi so that if something
syncs the mtd device, we sync any blocks associated with it.

>
> Ping?
>
> --
> Thanks,
> //richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
