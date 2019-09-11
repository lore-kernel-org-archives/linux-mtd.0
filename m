Return-Path: <SRS0=ZCmB=XG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B546FC49ED7
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 02:38:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 890182171F
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 02:38:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DT02164f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="gkWwj7F8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 890182171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWYPEVCaDRV6KDsuqwuZVfQf9bKeFfPk949JwEsppHA=; b=DT02164fmwvaTb
	hwJiJ9D+DZ8UrdTRKv6Jm7W8VWQ9YmTUs/TH5bV1ymSIal9zDy1EWHdHyB00sTyIPULufIdETFtP+
	dWiR3DvQT7gpijA41GFK56NVICaxFhSAYz8MaTkzWp2znhCCi5YhC4eoavr2BZDmBRikZF9k8qwxP
	kZADsdJu/zB/sjXAQjBZw9HckU92tfc3KbP3IgYpr4fl4hskaABKdU0Ixp6g/3O2q8KJa1cw1ZbRD
	+PIa+HWNWEuiBuzSqByN2gEmfoLZjP5K6X7ridp78gKye/GkSe2F5unLJaDlUPZ5nk2dOy3oGU6JQ
	BjU4RctUUpgL8HhoM+iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7sWr-00033g-Fc; Wed, 11 Sep 2019 02:38:45 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7sWn-00033I-3L
 for linux-mtd@lists.infradead.org; Wed, 11 Sep 2019 02:38:43 +0000
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x8B2cNb7008199
 for <linux-mtd@lists.infradead.org>; Wed, 11 Sep 2019 11:38:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x8B2cNb7008199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1568169504;
 bh=kwm81c9IMZEMWqWCh4SEaGMBY3UA4Ym5AXJ3YOtA5+I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gkWwj7F8G/wo4Fy6nqR+udXeWowvSIst1s1XT04yX5p1iJT5hgDROjFLlpFD9dUT5
 lXhupRLz7k1IUOIBAFbAphRdeWc4I3mZy/SDBp9xIwG5OWFieKCGHM5xx45UIE7dMj
 Zw7P7f1+Vu3GFEC4ff0LiFNWexeeXb6PEuWt/xKr1q84n3fpy1xLgSJDaSsZYl49KC
 oXfya6hUNiPF0H+kR/vubD+N27RITpQMjFFESuzM4yz1+O8K6T+f9m3MQHDN+vkCWK
 2bmqXe183DwxSAtMMdE1MbEp5BWkB/gpGAtyQGHjqCYMmAnSZWMjvuHT/3s95/8a/x
 W+d3AUGj84rPw==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id q9so12735263vsl.4
 for <linux-mtd@lists.infradead.org>; Tue, 10 Sep 2019 19:38:23 -0700 (PDT)
X-Gm-Message-State: APjAAAXZteaLCZKpQz/HZldmrKecAIVmHzhl46Jj5NLxMNMWswVzxD6V
 USztLj0RCiDrjggT+fGvqncVBwIw455u5rJuK7I=
X-Google-Smtp-Source: APXvYqwVMpAGBP9ZGdeflRgNSfdoIpeK9RuiTyzaWElh1Uu6Vn8S2OVwOzzEoLHCiBvcHRI9SAzQptRMW33EuaC6e40=
X-Received: by 2002:a67:dc86:: with SMTP id g6mr12744040vsk.181.1568169502363; 
 Tue, 10 Sep 2019 19:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <5143724.5TqzkYX0oI@dabox>
 <CAK7LNAR8xtURiCoJC0eWLFw0q+78Eb_axoOzWH+JNugf-24Qig@mail.gmail.com>
 <3020870.hsMMj5ogRZ@dabox> <9bb2fb0e-a9e7-c389-f9b7-42367485ff83@kernel.org>
In-Reply-To: <9bb2fb0e-a9e7-c389-f9b7-42367485ff83@kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 11 Sep 2019 11:37:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNARCPwqY+YmUzsHkABpshzzS3tC=fDgp4vZjVgBwS+LKJw@mail.gmail.com>
Message-ID: <CAK7LNARCPwqY+YmUzsHkABpshzzS3tC=fDgp4vZjVgBwS+LKJw@mail.gmail.com>
Subject: Re: mtd raw nand denali.c broken for Intel/Altera Cyclone V
To: Dinh Nguyen <dinguyen@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_193841_476990_C0CB0FF4 
X-CRM114-Status: GOOD (  26.24  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tim Sander <tim@krieglstein.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Dinh,

On Wed, Sep 11, 2019 at 12:22 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
>
>
>
> On 9/10/19 8:48 AM, Tim Sander wrote:
> > Hi
> >
> > I have noticed that my SPF records where not in place after moving the server,
> > so it seems the mail didn't go to the mailing list. Hopefully that's fixed now.
> >
> > Am Dienstag, 10. September 2019, 09:16:37 CEST schrieb Masahiro Yamada:
> >> On Fri, Sep 6, 2019 at 9:39 PM Tim Sander <tim@krieglstein.org> wrote:
> >>> Hi
> >>>
> >>> I have noticed that there multiple breakages piling up for the denali nand
> >>> driver on the Intel/Altera Cyclone V. Unfortunately i had no time to track
> >>> the mainline kernel closely. So the breakage seems to pile up. I am a
> >>> little disapointed that Intel is not on the lookout that the kernel works
> >>> on the chips they are selling. I was really happy about the state of the
> >>> platform before concerning mainline support.
> >>>
> >>> The failure starts with kernel 4.19 or stable kernel release 4.18.19. The
> >>> commit is ba4a1b62a2d742df9e9c607ac53b3bf33496508f.
> >>
> >> Just for clarification, this corresponds to
> >> 0d55c668b218a1db68b5044bce4de74e1bd0f0c8 upstream.
> >>
> >>> The problem here is that
> >>> our platform works with a zero in the SPARE_AREA_SKIP_BYTES register.
> >>
> >> Please clarify the scope of "our platform".
> >> (Only you, or your company, or every individual using this chip?)
> > The company i work for uses this chip as a base for multiple products.
> >
> >> First, SPARE_AREA_SKIP_BYTES is not the property of the hardware.
> >> Rather, it is about the OOB layout, in other words, this parameter
> >> is defined by software.
> >>
> >> For example, U-Boot supports the Denali NAND driver.
> >> The SPARE_AREA_SKIP_BYTES is a user-configurable parameter:
> >> https://github.com/u-boot/u-boot/blob/v2019.10-rc3/drivers/mtd/nand/raw/Kcon
> >> fig#L112
> >>
> >>
> >> Your platform works with a zero in the SPARE_AREA_SKIP_BYTES register
> >> because the NAND chip on the board was initialized with a zero
> >> set to the SPARE_AREA_SKIP_BYTES register.
> >>
> >> If the NAND chip had been initialized with 8
> >> set to the SPARE_AREA_SKIP_BYTES register, it would have
> >> been working with 8 to the SPARE_AREA_SKIP_BYTES.
> >>
> >> The Boot ROM is the only (semi-)software that is unconfigurable by users,
> >> so the value of SPARE_AREA_SKIP_BYTES should be aligned with
> >> the boot ROM.
> >> I recommend you to check the spec of the boot ROM.
> > We boot from NOR flash. That's why i didn't see a problem booting probably.
> >
> >> (The maintainer of the platform, Dihn is CC'ed,
> >> so I hope he will jump in)
> > Yes i hope so too.
> >
>
> I don't have access to a NAND device at the moment. I'll try to find one
> and debug.
>
> Dinh


Dinh,
Do you have answers for the following questions?


- Does the SOCFPGA boot ROM support the NAND boot mode?

- If so, which value does it use for SPARE_AREA_SKIP_BYTES?




-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
