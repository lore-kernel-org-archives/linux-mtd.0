Return-Path: <SRS0=1hFJ=W5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C58C3A59B
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 07:54:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A7522CF4
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 07:54:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pel0vG5a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05A7522CF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03nzzSXmUemJbkyvdWxsakX5zyEyMdx0+zUY+ApNQUQ=; b=Pel0vG5av08gb5
	VAbximYtu2SIAhsU1BUu+2loiwKyJCaROBTQI4Ut0mTzA2pZovlfyWVTotpngAhY7aY40wF4WMXa8
	WSLjtGpJFwND1Y5dQ08ZUsb9hxrwU/ivP1lrqiGXi+K+lhvDILgR789BJVKEme+5FerRNJN4g/BRc
	x15eXdC6yef1Gql0tbS7SzbQ47zUV1ouPzmQIrOeEiKo7MpV7ZogSzh6nsoByxa44hUR19vhqJSYL
	9fXJTyox5wttnfuixlAdmg4qyCP3aQ4RdFGxt5VPWAJU5HZYLV25Fg98DbHOup/DG8JXRUSEtiSyg
	iJKJn+cV66AVIPKknkDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4hAp-0000Po-S2; Mon, 02 Sep 2019 07:54:52 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4h9G-0007kd-1F; Mon, 02 Sep 2019 07:53:15 +0000
Received: by mail-ot1-f66.google.com with SMTP id g16so906889otp.12;
 Mon, 02 Sep 2019 00:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eXerReUtklcQDMDiAd2B7yy5/iYyeA9QfRGIULHn46Y=;
 b=BqJbzqx/bqpKT9f66oFCVyZrK/uucwjs4N3enBw3eDy6U7SBlRyzq6dFlbb++WH4RO
 PbYJp0FrtEtA4say6fUx7NDcR4EPK2gkDKGSG82lJUGZtKPWD0HHNl/RqKqlB2Z952EE
 4ASyxznXZP/X0RGv3s3FvFMMUQnQEAJP7d6fsYeZC6BJ9O2XHZ/CNQsalsTH14Sbb1mK
 DmLxxG1zuC1Zl1D8K8Q2JB4Np5osxMyL+ZVeaTI6HtOCBvX8MqyZqNxkLucXwHDX9Ggt
 0y2jDf6OY2RVcUIJNPQwwwuye1dhHYk6av76fO+R2fcz1Q753lJTwwWxEgrdLItbg6IS
 3/gQ==
X-Gm-Message-State: APjAAAVrO/6vGF4/lv7hQ55mS6+R90F9QXIsbZn+1BWkCnbPfCtwsNC6
 tppz8P73UAOmrvd0utmJPpxepzHc0E2uVmR9XtY=
X-Google-Smtp-Source: APXvYqwnZmuBQPAycR4wh+MzLxpLnaIqn9yYtJhnEginGgy5iGXJS00OPV33e9x6cT87GYQg3tA+HlJbqb3xbqDiJRA=
X-Received: by 2002:a9d:61c3:: with SMTP id h3mr14729198otk.39.1567410792636; 
 Mon, 02 Sep 2019 00:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-9-hch@lst.de>
 <CAMuHMdWyXGjokWi7tn9JHCTz9YMb_vHn6XKeE7KzH5n-54Sy0A@mail.gmail.com>
 <20190830160620.GD26887@lst.de>
In-Reply-To: <20190830160620.GD26887@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Sep 2019 09:53:01 +0200
Message-ID: <CAMuHMdXB=DWyu=Y25gih5poeanVnhLEP2MXoozvxdEY6op32FA@mail.gmail.com>
Subject: Re: [PATCH 08/26] m68k: simplify ioremap_nocache
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_005314_154377_492CA570 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Christoph,

On Fri, Aug 30, 2019 at 6:06 PM Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Aug 19, 2019 at 10:56:02AM +0200, Geert Uytterhoeven wrote:
> > On Sat, Aug 17, 2019 at 9:48 AM Christoph Hellwig <hch@lst.de> wrote:
> > > Just define ioremap_nocache to ioremap instead of duplicating the
> > > inline.  Also defined ioremap_uc in terms of ioremap instead of
> > > the using a double indirection.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Do you mind picking this up through the m68k tree?

Sure. Applied and queued for v5.4.

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
