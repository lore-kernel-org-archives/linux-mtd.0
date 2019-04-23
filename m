Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37DCC10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:25:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E50520843
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YB3mDptg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="P91ZeAMh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E50520843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIF6HEC01J93HYQFZCa3yij49wVDsEBdxsbaRIyxY38=; b=YB3mDptgNT7LHa
	xXxsZUO4+XAGUrrgoVfqlsxQHHvZ11EwPj4MCpAiaJ2cUop4Sj0s5r4+s+Cw1X4uHbURsOgD5Rwo1
	ogHprnKPAPUZnhOr1FccyUIZPfW3hy0tQrTijXyGzNBIGbltIfbqDCfY1hpshCpBx1Eoq73qu3cf2
	rblxbFRE1Deaek+38SLwdezmlWJ6YLlE42q61U6M0ygyWsTqCxV4EZsDN8HRgOS1q43X3e5WQSxSD
	7egi/qTqg8iXCkBT1/BRejQ1mdsSOfhOQysL+gd9Cs01NjXrc3cfCBE1iUF/IwfO6T0r0dncQGrVX
	KIC++sbypOhiHySRi5HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIm42-0004jR-V4; Tue, 23 Apr 2019 03:25:46 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIm2r-00023y-Ci; Tue, 23 Apr 2019 03:25:19 +0000
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id x3N3OCQR004631;
 Tue, 23 Apr 2019 12:24:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x3N3OCQR004631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555989853;
 bh=ZaFZ1e3X9NvA8jIq/O0HE8feh53sYwHuO++fFuOS9nA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P91ZeAMhtMqYylWUwrm0osI7w4pI/iDlLSWG/rgtuV4n4+wggoIrtADSDmDO1F8IT
 9SwLYRNBLbn0b744T8wkCcKdwRp1bFydxoBb/Ez/b9cQ25oEEeJ8fGba2msUkgzzN7
 RVgAZWUxJsGwNQ1bWOAqoinA3tgIU6FXaJx5B1L/jq2wQU/LA3xl6qMAHwZmrwSwQr
 zRfXO4olxBoW18m482H250QJqKYOMqrg5Rb5U/oSnXgQXE947uj84smCxuOU3bNZk6
 XQX+9jSnBFsERD0tttKHFup0w0hnVx0NFKRLwUi8nadx+s4K1Nt/08Gj7JqtqRc3FH
 xGxtXeWji4Okg==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id g8so4295554uaj.0;
 Mon, 22 Apr 2019 20:24:13 -0700 (PDT)
X-Gm-Message-State: APjAAAUzytPaQWPGziw/tul3Y5ZPhR6wxuGr36fGAe3xkK6/SGEAo5EI
 OAup1lO5acTPVdob8YMl07Cn46Vl4is2Viup7Ek=
X-Google-Smtp-Source: APXvYqy2+X5gAZU5b5JBqG8lKaQqh8mqoq4bQSgIgGHvQKLEeXzwh1sBxjABZmsDHRTa0MRWHTkc9sQeXvoau4eItSo=
X-Received: by 2002:ab0:7008:: with SMTP id k8mr11599996ual.40.1555989851968; 
 Mon, 22 Apr 2019 20:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190419094754.24667-1-yamada.masahiro@socionext.com>
 <20190419094754.24667-7-yamada.masahiro@socionext.com>
 <CA+7wUsygTo=AN_giku_X6_a4mQWdJL48RoVbVB4hBqkZSKkP0Q@mail.gmail.com>
In-Reply-To: <CA+7wUsygTo=AN_giku_X6_a4mQWdJL48RoVbVB4hBqkZSKkP0Q@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 23 Apr 2019 12:23:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQjQKu9GFyCyDJsQcyQjbeSGoJJPJV8YEtSXuV9JDqhqQ@mail.gmail.com>
Message-ID: <CAK7LNAQjQKu9GFyCyDJsQcyQjbeSGoJJPJV8YEtSXuV9JDqhqQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] MIPS: mark __fls() as __always_inline
To: Mathieu Malaterre <malat@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_202434_221946_AEC6B11B 
X-CRM114-Status: GOOD (  10.69  )
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
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 X86 ML <x86@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Apr 20, 2019 at 12:45 AM Mathieu Malaterre <malat@debian.org> wrote:
>
> Hi,
>
> On Fri, Apr 19, 2019 at 12:06 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > This prepares to move CONFIG_OPTIMIZE_INLINING from x86 to a common
> > place. We need to eliminate potential issues beforehand.
> >
> > If it is enabled for mips, the following errors are reported:
> >
> > arch/mips/mm/sc-mips.o: In function `mips_sc_prefetch_enable.part.2':
> > sc-mips.c:(.text+0x98): undefined reference to `mips_gcr_base'
> > sc-mips.c:(.text+0x9c): undefined reference to `mips_gcr_base'
> > sc-mips.c:(.text+0xbc): undefined reference to `mips_gcr_base'
> > sc-mips.c:(.text+0xc8): undefined reference to `mips_gcr_base'
> > sc-mips.c:(.text+0xdc): undefined reference to `mips_gcr_base'
> > arch/mips/mm/sc-mips.o:sc-mips.c:(.text.unlikely+0x44): more undefined references to `mips_gcr_base'
>
> Tested with success on ppc32/G4. But on CI20 (ci20_defconfig from
> master), I get:


Thanks for the test!

OK, I saw this error for ci20_defconfig.

I inline'd __ffs() to fix it
and sumitted v3.

Thank you.



>   MODPOST vmlinux.o
> mipsel-linux-gnu-ld: arch/mips/kernel/traps.o: in function
> `addr_gcr_err_control':
> /home/mathieu/tmp/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:169:
> undefined reference to `mips_gcr_base'
> mipsel-linux-gnu-ld:
> /home/mathieu/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:169:
> undefined reference to `mips_gcr_base'
> mipsel-linux-gnu-ld: arch/mips/mm/sc-mips.o: in function
> `addr_gcr_l2_pft_control':
> /home/mathieu/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:246:
> undefined reference to `mips_gcr_base'
> mipsel-linux-gnu-ld:
> /home/mathieu/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:246:
> undefined reference to `mips_gcr_base'
> mipsel-linux-gnu-ld:
> /home/mathieu/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:246:
> undefined reference to `mips_gcr_base'
> mipsel-linux-gnu-ld:
> arch/mips/mm/sc-mips.o:/home/mathieu/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:246:
> more undefined references to `mips_gcr_base' follow




-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
