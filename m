Return-Path: <SRS0=qEsD=TR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1CBC04E84
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 04:25:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89B652083E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 04:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DINBdRI+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="MjmYEj/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89B652083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ak2C6GdKFcGCa9b0Nhvufo6wmSSLeQ8UW10cSG7IU2c=; b=DINBdRI+8L0Fsv
	tFppUyEhmw1tfD4unRp8cAiEFrS1k+7g3XcgX0G9ZUXaAShmY0pM99Bm7w0zvdI8saDkeTYCRdo0C
	CQ1LzRA0UUZUBbirv4POX/l7QZ6jAE9/fWL8459YYgIXqcMR8FhlOOEm/H7e7d7nGrU0HYxfXKF/M
	qKcctH+Ija7+0X/uBWJgUSUNKaSRCjc7PKArMgeRDa57W8qWWDnnaJmmBdFhHN7tiIc5yi7da4mNh
	61ACGdd2lfefynqyHqfwNggGFoGIedVVBDf7NTT0TCdzHad3ck9qUi6Z+z1ZVdZJGpLXCtjk9T/A5
	dcelZ91jy4IBw1SKPpGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRUQZ-0002ml-RI; Fri, 17 May 2019 04:25:03 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRUQQ-0002e9-2W; Fri, 17 May 2019 04:24:55 +0000
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x4H4OWNh014153;
 Fri, 17 May 2019 13:24:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x4H4OWNh014153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1558067073;
 bh=XSdURHr+DFj73XgjlE8DVqoSorih7QO9jSg+HW1D8TM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MjmYEj/7xZIYGboJToCEBgv5PN/8CD6sDWZgip2cIfkO7e3Ii9sfP5C3OkJ+w+bmf
 nV6cmWzKaBSSjsZhyrn4bys5Y4Q6I+OEw7Kw5shBSlS1idFvlydMF1XAeStprazHXe
 YEbmOvO03hshhgHZXMzPoXOKrUM23BsqSOjE9eL/rkptHR8OUhQKwyp/IklD0+/Dl9
 owyazsPp24tpqnpga80RjHHMgFR00FgPaqDWKyOVGScKcv6zoiLl/Anuo6IiuxTxjf
 qbtJQzYFIsrlK27Oe+MJKRLUUuHhjaC4kJm7cNQh1CbYjHyDzVm4085SMLX6fx2uBd
 H18+0yFykqaGg==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id y6so3808901vsb.0;
 Thu, 16 May 2019 21:24:32 -0700 (PDT)
X-Gm-Message-State: APjAAAVrQa16sujJSWSLfr0pzONVmh+ZwZg5tymfva0UR41fsULkJgIV
 8n3omE5X02TvnNH1Sia1+dqjx7GXCohV8dDjYlk=
X-Google-Smtp-Source: APXvYqwRom2nfToM4jL1gKybhnXBZPLM/8GRypEcR2drcSxkNBd5y+Id9rfE+eiIpAnAfm5gkg5AbPeOHdYPagE+d9M=
X-Received: by 2002:a67:ad0f:: with SMTP id t15mr7896301vsl.179.1558067071748; 
 Thu, 16 May 2019 21:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
 <20190423034959.13525-5-yamada.masahiro@socionext.com>
 <aa73f81d-5d5a-a1d2-5239-3e8eb1278ec4@redhat.com>
In-Reply-To: <aa73f81d-5d5a-a1d2-5239-3e8eb1278ec4@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 17 May 2019 13:23:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAST5y9Khg0BBz6W0mekPpuLPwWa9nPvvVENidWhHZ-avw@mail.gmail.com>
Message-ID: <CAK7LNAST5y9Khg0BBz6W0mekPpuLPwWa9nPvvVENidWhHZ-avw@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 04/11] s390/cpacf: mark scpacf_query() as
 __always_inline
To: Laura Abbott <labbott@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_212454_337277_8B6914E1 
X-CRM114-Status: GOOD (  11.55  )
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
 Christophe Leroy <christophe.leroy@c-s.fr>, Arnd Bergmann <arnd@arndb.de>,
 linux-s390 <linux-s390@vger.kernel.org>, Mathieu Malaterre <malat@debian.org>,
 X86 ML <x86@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mips@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, May 17, 2019 at 8:01 AM Laura Abbott <labbott@redhat.com> wrote:
>
> On 4/22/19 8:49 PM, Masahiro Yamada wrote:
> > This prepares to move CONFIG_OPTIMIZE_INLINING from x86 to a common
> > place. We need to eliminate potential issues beforehand.
> >
> > If it is enabled for s390, the following error is reported:
> >
> > In file included from arch/s390/crypto/des_s390.c:19:
> > ./arch/s390/include/asm/cpacf.h: In function 'cpacf_query':
> > ./arch/s390/include/asm/cpacf.h:170:2: warning: asm operand 3 probably doesn't match constraints
> >    asm volatile(
> >    ^~~
> > ./arch/s390/include/asm/cpacf.h:170:2: error: impossible constraint in 'asm'
> >
>
> This also seems to still be broken, again with gcc 9.1.1
>
> BUILDSTDERR: In file included from arch/s390/crypto/prng.c:29:
> BUILDSTDERR: ./arch/s390/include/asm/cpacf.h: In function 'cpacf_query_func':
> BUILDSTDERR: ./arch/s390/include/asm/cpacf.h:170:2: warning: asm operand 3 probably doesn't match constraints
> BUILDSTDERR:   170 |  asm volatile(
> BUILDSTDERR:       |  ^~~
> BUILDSTDERR: ./arch/s390/include/asm/cpacf.h:170:2: error: impossible constraint in 'asm'
>
> I realized we're still carrying a patch to add -fno-section-anchors
> but it's a similar failure to powerpc.


Christophe had already pointed out potential issues for "i" constraint,
and I have fixups in hand:

See
https://lkml.org/lkml/2019/5/3/459


My plan was to send it after all of my base patches
were merged.

This s390 cparf.h is included in the TODO list.

Will fix soon.

Thanks.

-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
