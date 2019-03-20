Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C08C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 13:04:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47CB52146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 13:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IoNaOKvW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47CB52146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxVuljIXfvGWyJoe6Ni0X5kWLtT34YOSP4EK9TnMb7E=; b=IoNaOKvWnGSSiv
	YImLkWm38sHST/nDPz9uOhe6QSdsbhc62fznUMpdh4IH6F5ZLpFjXfLPvWJPSzAtrWOcHyWHEXxTt
	c3iIz4D3k5HnRQHSSjJyF29iVPGyPyHUphvH9h0bTum0TDVLFkjq93BhgYDh5N99gSr7LifarWiWo
	Qw27nfs/a2T99w3EO/53c5j1d28qzw5bLvwzDjnoGIu44nQpw8U4Sn4LR+kz4NN8+cqi+53d1n69w
	8HiG+eQTz5PYelCm0FavAf/faf1fzYuLM8UmMroaXHMKK/7+96M0a5m8nswr3yiNEJMEj3+34p2T1
	XEO0Nl97UYURzm8U7Ogg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6atr-0007ud-Up; Wed, 20 Mar 2019 13:04:55 +0000
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6atp-0007ty-Bi; Wed, 20 Mar 2019 13:04:55 +0000
Received: by mail-qt1-f196.google.com with SMTP id k14so2374365qtb.0;
 Wed, 20 Mar 2019 06:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+wddUSSDius11UZyiAbEzXtYgG8gvmxfQ0FLbE4Ctdg=;
 b=d3YGBci4p15qrii8eiBh7kq9BsGOGOIv7uqJAXAOy5uDvIasJngiioDHURRh/o+Yjg
 k3eduKAbVtZXeanttsn8AisINcS+/fwQOgZQtqEwp4AqAq43b3cu4A2UvErWEMmkBlt/
 6ZFV7OfszjgC+Kkkoyhynyxh5dzwLl6u8ahRseH0nKT2TKuXH3SYdPcPSt8TV/UQkg8b
 Pujo21xt0FHpdCvCYiJOOHCt/Kh8yB7EXHjNq2jD9MzUJuE0GWTXRAqH9+0zDE9PTe8i
 Cl9gqFi2mG8HP6F5fXbQuFjW4rT+SAadSFJStERobaVqJXb/Hfkbis4vX9PYBpg3rqBj
 UrJg==
X-Gm-Message-State: APjAAAWTSyv4Y2PScObleNHqYgVmcCnH9ThunhG5yoeb4PJU3ZFIsZFr
 740hZjwd1iidCxxwuTwJlEOvqxHtHd7tRH8WHOIsKqQW
X-Google-Smtp-Source: APXvYqySSLwR+4OGaKtI9pztTfCuIlZ5by7SMM6vCOJotO2MKZcP5LG/Y6qq4L04GPO5POq+Cxc1GPkYZ29VIKVxXF4=
X-Received: by 2002:ac8:2692:: with SMTP id 18mr4684094qto.343.1553087091631; 
 Wed, 20 Mar 2019 06:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAQu9hmeSgKO_B1LhXqq9Z923H25HXNS9XYNvFi55WrFYw@mail.gmail.com>
 <CAK8P3a0-7LRE4ByO2Uf4tb5mR49SbZzBu0AgHpS=03FAMWFLgQ@mail.gmail.com>
 <CAK7LNATjXoNrbt2SSgR4omiQEBppOkF6mdcVJjpw2B+ihGQvGw@mail.gmail.com>
In-Reply-To: <CAK7LNATjXoNrbt2SSgR4omiQEBppOkF6mdcVJjpw2B+ihGQvGw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Mar 2019 14:04:34 +0100
Message-ID: <CAK8P3a3Y+r95FNpHjPznD5g1PSS=OuYdzT8VH9XNY2DTUhB-Tw@mail.gmail.com>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_060453_404407_3E3EA102 
X-CRM114-Status: GOOD (  19.85  )
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
 Michael Ellerman <mpe@ellerman.id.au>, X86 ML <x86@kernel.org>,
 linux-mips@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 11:19 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Wed, Mar 20, 2019 at 6:39 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Mar 20, 2019 at 7:41 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> >
> > > It is unclear to me how to fix it.
> > > That's why I ended up with "depends on !MIPS".
> > >
> > >
> > >   MODPOST vmlinux.o
> > > arch/mips/mm/sc-mips.o: In function `mips_sc_prefetch_enable.part.2':
> > > sc-mips.c:(.text+0x98): undefined reference to `mips_gcr_base'
> > > sc-mips.c:(.text+0x9c): undefined reference to `mips_gcr_base'
> > > sc-mips.c:(.text+0xbc): undefined reference to `mips_gcr_base'
> > > sc-mips.c:(.text+0xc8): undefined reference to `mips_gcr_base'
> > > sc-mips.c:(.text+0xdc): undefined reference to `mips_gcr_base'
> > > arch/mips/mm/sc-mips.o:sc-mips.c:(.text.unlikely+0x44): more undefined
> > > references to `mips_gcr_base'
> > >
> > >
> > > Perhaps, MIPS folks may know how to fix it.
> >
> > I would guess like this:
> >
> > diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
> > index 8bc5df49b0e1..a27483fedb7d 100644
> > --- a/arch/mips/include/asm/mips-cm.h
> > +++ b/arch/mips/include/asm/mips-cm.h
> > @@ -79,7 +79,7 @@ static inline int mips_cm_probe(void)
> >   *
> >   * Returns true if a CM is present in the system, else false.
> >   */
> > -static inline bool mips_cm_present(void)
> > +static __always_inline bool mips_cm_present(void)
> >  {
> >  #ifdef CONFIG_MIPS_CM
> >         return mips_gcr_base != NULL;
> > @@ -93,7 +93,7 @@ static inline bool mips_cm_present(void)
> >   *
> >   * Returns true if the system implements an L2-only sync region, else false.
> >   */
> > -static inline bool mips_cm_has_l2sync(void)
> > +static __always_inline bool mips_cm_has_l2sync(void)
> >  {
> >  #ifdef CONFIG_MIPS_CM
> >         return mips_cm_l2sync_base != NULL;
> >
>
>
> Thanks, I applied the above, but I still see
>  undefined reference to `mips_gcr_base'
>
>
> I attached .config to produce this error.
>
> I use prebuilt mips-linux-gcc from
> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/8.1.0/

I got to this patch experimentally, it fixes the problem for me:

diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 394673991bab..d70d02da038b 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -181,7 +181,7 @@ static int __init mips_sc_probe_cm3(void)
        return 0;
 }

-static inline int __init mips_sc_probe(void)
+static __always_inline int __init mips_sc_probe(void)
 {
        struct cpuinfo_mips *c = &current_cpu_data;
        unsigned int config1, config2;
diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
index 830c93a010c3..186c28463bf3 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -548,7 +548,7 @@ static inline unsigned long __fls(unsigned long word)
  * Returns 0..SZLONG-1
  * Undefined if no bit exists, so code should check against 0 first.
  */
-static inline unsigned long __ffs(unsigned long word)
+static __always_inline unsigned long __ffs(unsigned long word)
 {
        return __fls(word & -word);
 }


It does look like a gcc bug though, as at least some of the references
are from a function that got split out from an inlined function but that
has no remaining call sites.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
