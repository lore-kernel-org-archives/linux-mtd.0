Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC27C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 10:26:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45FBB20870
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 10:26:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kKmZKnbR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45FBB20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3nUySbFre2SlGwZwGv3MYHmMNnGN7ixtGpz8ga0q48=; b=kKmZKnbRqMc/Q1
	+BeL9jclUcq0+cYs1eLU/67NNStDtQjLDvWBDhAk0KFB7RHiZ3H/8CkNeVtr9DCa/uRQbKvdCQgdN
	+zwDa9gQwCllIU07W2kfK4HHGDpoyELqNtStvBrp8t3L7hwEhyX5ICnag56GrDJ3zOreIdsh524Hd
	RocuFeAmnSZPsmfzFNJbz8SjJMAsI5NSEHtQGYb8VkBR17cZ68DsR6Wf7QOafmrw8U2nVfeUDn/SH
	4tMVqKADQ9tLXPOTADPY7fNgrek3M8zMkTPrkZgg0F8/N+ftG4vrJA/EpDjWNGcmxVmLH3M95cQ3c
	69sas08xNBCSb3gc1CdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Mnn-0000Pp-LG; Mon, 25 Mar 2019 10:25:59 +0000
Received: from mail-qt1-f194.google.com ([209.85.160.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Mnj-0000On-5g; Mon, 25 Mar 2019 10:25:58 +0000
Received: by mail-qt1-f194.google.com with SMTP id x12so9553639qts.7;
 Mon, 25 Mar 2019 03:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uptj+eh0cd0E1jTQT2RebCWvCgUIjjYNwZDO+zjMQlo=;
 b=RY71CJs7ymzzYVpTU9eshnMGk8pC9/Tl4GjwV0hH6QRHDqfJc7ZEr1j0b+xVrDO1KC
 eVRDvEZC+Nl4YKYYHPzjyMVKxTHF10arkLzxhQ1Bai/sSdgaLMvoVvrEyYjCn5egV4M8
 /9Co+Nzz+wCM5oTmPTLxYeP18yY1thoOq5qSeESJVu7jT7zoWPrSBhR/tXtEFvCPsOUm
 wdopj1PADS2b5fzNDQu+AYGI5e1eC3j8OlX7mpiS5UVACn714wW+fXYusmVR2Pb/Pndb
 YX1g/cpERMmcLLN8p4IiKVY74ztEP6b+IFv0ZiFqC5ccgTg6rHvkrciSXLTldzov00A5
 kLjA==
X-Gm-Message-State: APjAAAVJS7c5Mv293uTzqQ49JgeemoCT2YVX0wGIT9JMqLiuUzL5QJ1R
 dNTKcd9UUXSFipCFMGMcgQtg28tJSOTM5LYchtoeow==
X-Google-Smtp-Source: APXvYqzGC36CS17RsbRIMSM2NUx4KUTTuXGfJCXxY4s1a67ibbIU6+K0CM3qgDFINgtkxQIR4biGlim06jrN/EGtVB0=
X-Received: by 2002:ac8:2692:: with SMTP id 18mr19682479qto.343.1553509551667; 
 Mon, 25 Mar 2019 03:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK8P3a3BG_mxYxxCx4S_+ZKAer_+5FpmkzLk0VrACZekuD=2GQ@mail.gmail.com>
 <CAK8P3a0GEYTbw5XCwzVeZe_-pGF=7e=1kXhH3U+fidnMZeP0CA@mail.gmail.com>
 <CAK7LNAQvvCVsQtd9ZYkechOSCg4HAeZFaNXCgaBbWWxBYXOgaQ@mail.gmail.com>
 <CAK8P3a1P812avY8reSSguYB0jPzgjs+30dSJpKZCnWwzyLoSVQ@mail.gmail.com>
 <CAK7LNARatcRQ2u0JhiZHx4qU+mzS=SUv-kj7F-7-Vx--RFX5tw@mail.gmail.com>
In-Reply-To: <CAK7LNARatcRQ2u0JhiZHx4qU+mzS=SUv-kj7F-7-Vx--RFX5tw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Mar 2019 11:25:33 +0100
Message-ID: <CAK8P3a1QQeK1cBN2O8=p+zceQ7tw-ovYtWq6sBeavDucDWA7Lg@mail.gmail.com>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_032555_217224_BD13B96F 
X-CRM114-Status: GOOD (  12.75  )
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

On Mon, Mar 25, 2019 at 8:55 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Mon, Mar 25, 2019 at 4:33 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Mon, Mar 25, 2019 at 7:11 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > > I do not know why to reproduce it,
> > > but is "__init __noreturn" more sensible than
> > > "__always_inline" here?
> >
> > It's in a header file, so it has to be 'inline'. We could make it
> > static inline __init __noreturn,
>
> Yes, I like 'static inline __init __noreturn'
>
> > but I don't see an advantage over
> > __always_inline there.
>
> __always_inline takes away the compiler's freedom.
>
> I'd like to leave it up to the compiler where possible.

Ok, fair enough.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
