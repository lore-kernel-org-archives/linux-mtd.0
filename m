Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C00C10F03
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 06:42:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1661720657
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 06:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jcr+4B3i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="B5BHmYRn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1661720657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZcKJxXI/hdDaMKjTrnUhk352USbWP0QLENp27zylvk=; b=Jcr+4B3iLscsso
	ldpUTzeqrMQGb6sVmdu9UQ/DxEYuzIj0ohZsyVb+X5J+rAVgdrDu9R48CpzmusWaohWmOX0/9/Zgy
	INcz0Uez4WdPW4Dz7x2wdAL8wNzKr6zgRwQ3pVW+8oocW281DmZ0v90hWGhorcHNb74+N9o5rtRuY
	86u6Z0hA5MM/zzxWeCIkTWX8n21P/WgUPsfFyelMapBd/det8Q3Tr72ITLLkB52e6ouQI2gYjSUDM
	2A1LwidhgdbxxG1/yxJ7dp9yhgLjIAgUTZhaskQVZy/u9xz8C0X5v7Vkm+BcCOU0l0GURXpEqZTrA
	PvbCKynZiRdzuIl3rJkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8JJr-00077t-EF; Mon, 25 Mar 2019 06:42:51 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8JJc-00070s-QI; Mon, 25 Mar 2019 06:42:45 +0000
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x2P6gHm2018455;
 Mon, 25 Mar 2019 15:42:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x2P6gHm2018455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1553496138;
 bh=LgQdWuJL8bNmI1YWcIHsJUQQGbgjm968J3Ixazu7mco=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B5BHmYRn07ugANaqhyD5xO4JbB9Xbz4/RyPosjdApvptYCTdEHZJwF4S/cef5s3XL
 xgr8JBi3F9QqIHdtJhkDHV0z2ik2eS34K8r222LAa4L/PtKmua1/9+L9UcyHa15gEQ
 6troHDwfJJTRiGa1fvlcjYN8vUOLXMNKJnanzZqOvs3D5IEbf21ZetR2KbePZGg7Vy
 TGuZ3a2dWHy0yJS3E28btdsw7vDYtaA4a1fhUfSmr6wO/ZzS+1yqeaGTTL6AssOukR
 S9yWqFekaN0j2MMugIJLNVROpX/aiU2iaZRc/QLBJTo0AHLiKWAuZBU6YLJSPc3xGb
 j/OxosQ7PJ0ug==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id j184so4711141vsd.11;
 Sun, 24 Mar 2019 23:42:17 -0700 (PDT)
X-Gm-Message-State: APjAAAWsk28pbI+kK8w8H6kmTqVtIiNQkwbSz+tlFb7hOyAf/NhPq08k
 m3CRf4Tw41PoRFQ7Yfctxoa53z/LChw2NfkDMok=
X-Google-Smtp-Source: APXvYqyyUgsfjkb2CI6m0F2jXuyjGsa3FI80DxdTqPDcKBaFVGYLQUc0UBXUPhXDlcgUWlgSzTRT1EpoZhGotWfYWKM=
X-Received: by 2002:a67:74cd:: with SMTP id
 p196mr13915498vsc.215.1553496136642; 
 Sun, 24 Mar 2019 23:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
 <20190321080133.GB3916@osiris>
In-Reply-To: <20190321080133.GB3916@osiris>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 25 Mar 2019 15:41:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR0JxvKOEOE6-SvFWzAueZL0qb6XaANDud0pVa_Ew3NWg@mail.gmail.com>
Message-ID: <CAK7LNAR0JxvKOEOE6-SvFWzAueZL0qb6XaANDud0pVa_Ew3NWg@mail.gmail.com>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
To: Heiko Carstens <heiko.carstens@de.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_234238_592614_55AA0693 
X-CRM114-Status: GOOD (  18.45  )
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
 Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
 X86 ML <x86@kernel.org>, linux-mips@vger.kernel.org,
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

Hi Heiko,


On Thu, Mar 21, 2019 at 5:02 PM Heiko Carstens
<heiko.carstens@de.ibm.com> wrote:
>
> On Wed, Mar 20, 2019 at 03:20:27PM +0900, Masahiro Yamada wrote:
> > Commit 60a3cdd06394 ("x86: add optimized inlining") introduced
> > CONFIG_OPTIMIZE_INLINING, but it has been available only for x86.
> >
> > The idea is obviously arch-agnostic although we need some code fixups.
> > This commit moves the config entry from arch/x86/Kconfig.debug to
> > lib/Kconfig.debug so that all architectures (except MIPS for now) can
> > benefit from it.
> >
> > At this moment, I added "depends on !MIPS" because fixing 0day bot reports
> > for MIPS was complex to me.
> >
> > I tested this patch on my arm/arm64 boards.
> >
> > This can make a huge difference in kernel image size especially when
> > CONFIG_OPTIMIZE_FOR_SIZE is enabled.
> >
> > For example, I got 3.5% smaller arm64 kernel image for v5.1-rc1.
> >
> >   dec       file
> >   18983424  arch/arm64/boot/Image.before
> >   18321920  arch/arm64/boot/Image.after
>
> Well, this will change, since now people (have to) start adding
> __always_inline annotations on all architectures, most likely until
> all have about the same amount of annotations like x86. This will
> reduce the benefit.


If people start to replace inline with __always_inline here and there,
yes, the difference will be reduced.

Perhaps, we might end up with fixing dozens of places or so,
but I guess we would still get benefit.


> Not sure if it's really a win that we get the inline vs
> __always_inline discussion now on all architectures.


This feature is not x86-specific.

I prefer "do it for all arches or don't do it at all"
instead of the half-baked state.

If we force inlining for the 'inline' marker
there is no point of having __always_inline.


-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
