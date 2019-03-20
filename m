Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7172BC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 09:42:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 406452175B
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 09:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rQIEtVaG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 406452175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFqO43I+5ufuj32I6wW2f/ZoqiUblrJywcea3OdJPno=; b=rQIEtVaGy7N7HH
	0KQRuP4I9/o2q8RHKIFvCXjnOuShWaiW28/F4Uq1chZRrI0KJbqTb7aopL3CAVwZn/I1bh1Wh23+m
	0f/6sDRYu6SIpwmIpy2+UpsJrSw5Fst9JEC+F3mADfap+3+8iQFYuyQIeOvFCVP28sB1QhdNXS3VD
	4f1yvjZqbcBjpFWKW7t/UrBtyI5ng6qhkVVJxCKI/NabPFZHT4CNVfYIV5BM9URHetzaWJSDXrcdA
	hGL7cd8HTXSzuc0fHrZGhXyXwOAv3vNt97a6UEdJxkk6YjjTNFe/0/1XmVshi8uLT8XeTD3zAH+32
	UGXODH+kVmOPEVJ1BX/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Xja-0001dF-Eh; Wed, 20 Mar 2019 09:42:06 +0000
Received: from mail-qk1-f195.google.com ([209.85.222.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6XjW-0001ct-7m; Wed, 20 Mar 2019 09:42:04 +0000
Received: by mail-qk1-f195.google.com with SMTP id b74so13668337qkg.9;
 Wed, 20 Mar 2019 02:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wcem8o0HHIzqutiHXBbDWombZs0tH1uJm1IkFEOS1gM=;
 b=TitKRlYAfFIWhSn2G0xNb7QiuhWW7oSlirRuGAcTCYPpOwjY7k657eeeedOYlnSYkN
 2HH8DiUNyam9SQEnA7h+KjuURiDXIAxB4MP44LvHeCOYCu27HfoX5+iKImS+gG1keJ74
 wp5BGUYK2nbnJmn849bMXChF3MV6Y729QF3KIm+MI0RIg+GYXofkTNBsuPvXKBpaVYGj
 J0jwnYWCxBkzkuNA/SZpHR6FTE4U8GWlu46zJJPyz+MWHjMmvEXwc38ogIcnz18h8IaN
 kmEe6TYXdoj9zkN38/ha3DVdkxZ4t1yD0yJOi6wH3gnEArVjG6DlJuD/ZrSETAQtQWbc
 /J3g==
X-Gm-Message-State: APjAAAVuM9QuXomtpJdU88PiKUT5Us1SWdK0G4nJYhKjsHVI3Cr8LISq
 22DTVWgllJrPCR8tbTjIWwhC9rQexZi6Khs+5Lc=
X-Google-Smtp-Source: APXvYqzQSLM2qs76g1mPFR6+NFZQ+VxO7eK9lVtHjHmQgwnJhO043jU8NlghsFKH8kP1B/2Ljhps92bIbDCGPPfMWi4=
X-Received: by 2002:ae9:dec2:: with SMTP id s185mr5394316qkf.107.1553074920561; 
 Wed, 20 Mar 2019 02:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Mar 2019 10:41:43 +0100
Message-ID: <CAK8P3a3BG_mxYxxCx4S_+ZKAer_+5FpmkzLk0VrACZekuD=2GQ@mail.gmail.com>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_024202_280175_803193DD 
X-CRM114-Status: GOOD (  16.14  )
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

On Wed, Mar 20, 2019 at 7:21 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Commit 60a3cdd06394 ("x86: add optimized inlining") introduced
> CONFIG_OPTIMIZE_INLINING, but it has been available only for x86.
>
> The idea is obviously arch-agnostic although we need some code fixups.
> This commit moves the config entry from arch/x86/Kconfig.debug to
> lib/Kconfig.debug so that all architectures (except MIPS for now) can
> benefit from it.
>
> At this moment, I added "depends on !MIPS" because fixing 0day bot reports
> for MIPS was complex to me.
>
> I tested this patch on my arm/arm64 boards.
>
> This can make a huge difference in kernel image size especially when
> CONFIG_OPTIMIZE_FOR_SIZE is enabled.
>
> For example, I got 3.5% smaller arm64 kernel image for v5.1-rc1.
>
>   dec       file
>   18983424  arch/arm64/boot/Image.before
>   18321920  arch/arm64/boot/Image.after
>
> This also slightly improves the "Kernel hacking" Kconfig menu.
> Commit e61aca5158a8 ("Merge branch 'kconfig-diet' from Dave Hansen')
> mentioned this config option would be a good fit in the "compiler option"
> menu. I did so.

I think this is a good idea in general, but it is likely to cause a lot of
new warnings. Especially the -Wmaybe-uninitialized warnings get
new false positives every time we get substantially different inlining
decisions.

I've added your patch to my randconfig test setup and will let you
know if I see anything noticeable. I'm currently testing clang-arm32,
clang-arm64 and gcc-x86.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
