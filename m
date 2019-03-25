Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D25C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 07:33:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D34B220854
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 07:33:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZQF69mG0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D34B220854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWwIkWieIovozDF/sOGNeZnXzGCcKKXmFlFouPOxVps=; b=ZQF69mG0cJrdg+
	3rpnPn6HUWlsmPvxzlFEop3Lt9COC3gyPmwHOPRVY/rYBdQ3PdhOAXMen6Hp5T9NcA7yJebml6Jgu
	lw3Uz3YfBdFWLCnjMUbEOnOfQFjiUPez52mdonRPVgYmjIIA/mn2xsQUPLWACuY79bKLAcLyYtguh
	qlZXDFuJyC43C04fg6uXyZwuqaq/b1zOJgARK2SLX8NHr0pS5hVXbUzoLVDYzQzVyvShMb2Ji4acE
	Bp/MQ7vNT4fOO3a+Ax8YzCGwAqRnkVAyDnZrGHW2ZKQVeFPxFwzOu+o9itU8Cvx/Ys0lMtV9MY3/v
	YX511Kw/MzSQcVd5XFtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8K6b-0000nf-8I; Mon, 25 Mar 2019 07:33:13 +0000
Received: from mail-qt1-f193.google.com ([209.85.160.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8K6W-0000mc-2M; Mon, 25 Mar 2019 07:33:11 +0000
Received: by mail-qt1-f193.google.com with SMTP id v20so9094032qtv.12;
 Mon, 25 Mar 2019 00:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1MqoVO4GdF3K6sehfp7D7I5RtwnxGYYTVEiIQ0OI5sQ=;
 b=QN1Pz1A2b7guxeX+kLtDJhSFnlvqQShSuZ9IiQx8KlFrOk22dddMbXVNWcnbnQ0ztS
 gCczUcNsz2GTY0iAXD2Io4xJAWe6mSnnQzmtvU/aB+lGTHffJ2Wkn13CkqchABqCyNxZ
 tlOsbNhiUYg9DBDV6s8wA7SrzxgTgUksLbIZVGYAHQ9uoghqnaHoC5PE9pvBsHcxgeHl
 p09TD/bs5UqNTHycs2KLd+aas1tYSUBLwGisN5+SQAXxa7ebpbVceQsWSOpJZdcbXn1Q
 WJG6m0cBlUKr8PNr29ol//lSX5NO6zxixt4ApZWDAZ7Pp5ANyltNt48Op3M7N9Rp4SDD
 7Aew==
X-Gm-Message-State: APjAAAUZA3xiXSgmGzQVczi6x+OH5J9pAAJuqUpWABD6up4tN2cpnwDE
 6wUDgkOIwu9K7LUmUHVo+sd2Wgr2BTq9oMcte68=
X-Google-Smtp-Source: APXvYqxKEsoDhNlT5+1LqguQotzzoYfh33c3j/RJW0lHblejN8SPJQgxr41seRZPVPQ7PbwWXyRFPtHB2ovD82Zw4eY=
X-Received: by 2002:a0c:9487:: with SMTP id j7mr18527311qvj.180.1553499185439; 
 Mon, 25 Mar 2019 00:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK8P3a3BG_mxYxxCx4S_+ZKAer_+5FpmkzLk0VrACZekuD=2GQ@mail.gmail.com>
 <CAK8P3a0GEYTbw5XCwzVeZe_-pGF=7e=1kXhH3U+fidnMZeP0CA@mail.gmail.com>
 <CAK7LNAQvvCVsQtd9ZYkechOSCg4HAeZFaNXCgaBbWWxBYXOgaQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQvvCVsQtd9ZYkechOSCg4HAeZFaNXCgaBbWWxBYXOgaQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Mar 2019 08:32:48 +0100
Message-ID: <CAK8P3a1P812avY8reSSguYB0jPzgjs+30dSJpKZCnWwzyLoSVQ@mail.gmail.com>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_003308_111654_A2C40DB1 
X-CRM114-Status: GOOD (  16.73  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Dave Hansen <dave@sr71.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>, linux-mips@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 7:11 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Wed, Mar 20, 2019 at 10:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Mar 20, 2019 at 10:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > I've added your patch to my randconfig test setup and will let you
> > > know if I see anything noticeable. I'm currently testing clang-arm32,
> > > clang-arm64 and gcc-x86.
> >
> > This is the only additional bug that has come up so far:
> >
> > `.exit.text' referenced in section `.alt.smp.init' of
> > drivers/char/ipmi/ipmi_msghandler.o: defined in discarded section
> > `exit.text' of drivers/char/ipmi/ipmi_msghandler.o
> >
> > diff --git a/arch/arm/kernel/atags.h b/arch/arm/kernel/atags.h
> > index 201100226301..84b12e33104d 100644
> > --- a/arch/arm/kernel/atags.h
> > +++ b/arch/arm/kernel/atags.h
> > @@ -5,7 +5,7 @@ void convert_to_tag_list(struct tag *tags);
> >  const struct machine_desc *setup_machine_tags(phys_addr_t __atags_pointer,
> >         unsigned int machine_nr);
> >  #else
> > -static inline const struct machine_desc *
> > +static __always_inline const struct machine_desc *
> >  setup_machine_tags(phys_addr_t __atags_pointer, unsigned int machine_nr)
> >  {
> >         early_print("no ATAGS support: can't continue\n");
> >
>
>
> I do not know why to reproduce it,
> but is "__init __noreturn" more sensible than
> "__always_inline" here?

It's in a header file, so it has to be 'inline'. We could make it
static inline __init __noreturn, but I don't see an advantage over
__always_inline there.

        Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
