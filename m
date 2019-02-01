Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE8FC282D8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 09:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF2520863
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 09:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LkAgENsR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFF2520863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcZbPhewAWvExgLU/jqZcnJ1LJXkVToidBZ/ZqCBaMg=; b=LkAgENsRxnQpDm
	o708x7F/W/GYg+IlZ9ALIxn2kH23tdtSSa5zS+Az6CaAZi8KB+SzPUQPsrrF/+chRbP11j/Xj6iwn
	mLAsDFObfgELEvtnBcutyD7WuMs0PdUhnhyW9VzD7HcgLZfRy2LBh5aPwn6uGQMj6cSKhiI+RFA3l
	djPh65NtHRY9HRl60IIiWyLloVZzfQNQ3E8YMmAwuxW3grjKmrZUTz0AU52989ND6FDevahy6t2uH
	EELJdUjjIlsyuSdWKikMYBYZ5aUaJu9SofmJyXv7ODRXj4m1uD9TMzkGfYFVmryOAtwLJg4j9LND6
	jYSdTI2KnnvA2jKvexug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpUj3-0008Ar-Vs; Fri, 01 Feb 2019 09:03:05 +0000
Received: from mail-ua1-f67.google.com ([209.85.222.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpUj0-0008AT-9x
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2019 09:03:03 +0000
Received: by mail-ua1-f67.google.com with SMTP id t8so1995961uap.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2019 01:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I3qJljro1nVkVo2DsSAgty5BGY0HtgwQrfjOKnGzE8s=;
 b=Cy+7Dw52z6UNfq4TvsBMwn1Qd4wYBGpBqN7fLcqd1uI+5QFDM2xepr5A51Dprfqphs
 8OYHEXc9ZMy5fFTX4cMUswqaJzd6c+4ynSe6GiQ9zXQZJrAYfvGp8w9Awqf/gGKlbqB6
 1O602rxdrjNrCKFJMdMbCw5QTBJyRxFg5Dl4LOlNsisRlUMj1reQaj+MISj6VSXpoEyy
 cmrBNTTyyNVSDJ0OwSzAi602UaY4oz+w2mk5m+67IaWFJdPPM/ZfugQ3A4gP97f716Sn
 Om2Gqdf6o3F4Cr2XR5pI5fQouNsZ9DiHeHwEr2ouKg+lakDSeNulrecTrsEjZV3bhblc
 kt2w==
X-Gm-Message-State: AJcUukc/0ENRO5JMuPbdvBxYv2JDBKkClIjg79TZ3lCVZcsPpodIQW/h
 t5sFSSlGiV9SZu4wnDnvoT8w/eI2gNv0nY7ZFQI=
X-Google-Smtp-Source: ALg8bN6LXc0VsbZteK97HwhPHZRCofooOad8p9IWqMlT88KS3WZVNUSmwjZ7XTRArRIayk5fdVnbjVv4BetnGVnQEDI=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr16344929uap.0.1549011779854; 
 Fri, 01 Feb 2019 01:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20190102143654.24362-1-bbrezillon@kernel.org>
 <20190102143654.24362-2-bbrezillon@kernel.org>
 <CAMuHMdV-=_0htu9w1xK25RVWgnRaXVR-R-oXc7f-Y_cC9SR25A@mail.gmail.com>
 <20190122133159.2033844c@bbrezillon> <20190129120337.08754bac@bbrezillon>
 <CAMuHMdXVszyR_fkjmy5RpEDW3L-Ewr_tOK3o07OEm2uh4_aSRA@mail.gmail.com>
 <20190130095237.1a6a598f@bbrezillon>
 <CAMuHMdUgcgayOo=bhEZsuWMcRavjsweFPo1=KmcGa=PYxEoRNQ@mail.gmail.com>
 <20190130101036.0e63fec6@bbrezillon>
 <CAMuHMdWsYnLZP7=rO=xaDE4TbPr=XTphad6vaaRi=WrdOMSn8A@mail.gmail.com>
 <20190201095004.65763e0c@bbrezillon>
In-Reply-To: <20190201095004.65763e0c@bbrezillon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Feb 2019 10:02:47 +0100
Message-ID: <CAMuHMdW32jVG8p8+9XwDE=Uyu1eEdG261TSd2onZeaVXmPjehw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: Check add_mtd_device() ret code
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_010302_340832_468FC540 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On Fri, Feb 1, 2019 at 9:50 AM Boris Brezillon <bbrezillon@kernel.org> wrote:
> On Wed, 30 Jan 2019 10:16:33 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > A tree based on last week's l2-mtd/master, i.e. lacking commit f7fd818cca0cea3d
> > ("mtd: Remove empty lines at end of sysfs related functions").
> >
> > This is the one triggering:
> >
> >         if (WARN_ON((!mtd->erasesize || !mtd->_erase) &&
> >                     !(mtd->flags & MTD_NO_ERASE)))
> >                 return -EINVAL;
>
> Do you think you'll have time to test [1]? I'd like to make that patch
> part of my fixes PR if possible. If you can't, that's fine, just let me
> know.

Sure, I will, after FOSDEM ;-)

> [1]http://patchwork.ozlabs.org/patch/1033458/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
