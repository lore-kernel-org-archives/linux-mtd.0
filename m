Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D83C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 13:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95341213F2
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 13:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uVYxI5wH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95341213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7aq3AKRNUKPAJhBtOX6OAeJCg84r0VAhZgPwr/aUfyk=; b=uVYxI5wHAu/FWH
	fDeyXKOahikx+RWeyL2ho1UUITSOfnHP6omq74FPGl/PRY5uFbsLdin11ACMTNLGZweX+zSr/lDEv
	Otf19PXrxEAU3gnkP2Sm3vxaSRZk6H51F3nR0P1A8avND5ANl5QV0JcVP4YReZFOR9mfO5liJ9Exz
	G1Yo4KhN1szw8MUfDHvNJxKu9hPhCZuOXn9TacscH7EumfXhsdy/fFqIETsG90RAJms3yIA7tMZ4C
	xM04exN0xUi2aB+1rTr1lkNL9gOFf3tPMvhwt+laDvBI3WQxlBnuseHugM0bZ2fbXjr18AO1zMUJc
	NTO8vqSqLsdchGrUBwDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6bMP-0001vq-F3; Wed, 20 Mar 2019 13:34:25 +0000
Received: from mail-qt1-f194.google.com ([209.85.160.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6bMM-0001uj-RN; Wed, 20 Mar 2019 13:34:24 +0000
Received: by mail-qt1-f194.google.com with SMTP id z16so1030865qtn.4;
 Wed, 20 Mar 2019 06:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lxb+cto02BIatCH7Gsn3jweAO4W1kfw2CVhMuPz2fqU=;
 b=N7YVhl+SIIEbzzowlVWSgyDW7Vyt16XlgImTyZ7pwl9GZHxL5dmRS9lUOM3bahmSB6
 X+Y6EAT45LN40CJii+Afcl0oOH/0P9bqgOcoLEu0K+aLbzGfjCZ/sbVxgX0vQgrOn2O3
 wv6BlYRPOAYbjq5Ng6jRiV7yPbkfOfKPVKrDlXmhWpUpiaMDnLg3Ad9TGsaUEHYoH5By
 AzRgG24Sv0hte1iG8zTXXEQE8lLYiIv7e3esQf+4agHguAlYAPPRY80X0qjge6jp5LuP
 cTacqYFuYOoCoVrGUCY4GJzdItqooDrYJf6ZqRjV1SntV8fU+lOc8+P6+aSaYtGjYowb
 JI3w==
X-Gm-Message-State: APjAAAUWKIBt8VkkzTkwqeFEgFeqHwx8T549FOE9y35V7nNWJKUjfcsI
 9zcNpjPdp0TghRD5XEjFZG5wIKsHomrHFMQRwrU=
X-Google-Smtp-Source: APXvYqz9MW7CJwO9dJ+S+7Q1aJsu3zP2Bpyeyex9t6Dgx6Q7wQ4uZyS7kKe5y9Us8CNX6vU0d8jy9lg1/AmI+RSWdPc=
X-Received: by 2002:a0c:9487:: with SMTP id j7mr1278926qvj.180.1553088860133; 
 Wed, 20 Mar 2019 06:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK8P3a3BG_mxYxxCx4S_+ZKAer_+5FpmkzLk0VrACZekuD=2GQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3BG_mxYxxCx4S_+ZKAer_+5FpmkzLk0VrACZekuD=2GQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Mar 2019 14:34:02 +0100
Message-ID: <CAK8P3a0GEYTbw5XCwzVeZe_-pGF=7e=1kXhH3U+fidnMZeP0CA@mail.gmail.com>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_063422_887399_B410CCAD 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

On Wed, Mar 20, 2019 at 10:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> I've added your patch to my randconfig test setup and will let you
> know if I see anything noticeable. I'm currently testing clang-arm32,
> clang-arm64 and gcc-x86.

This is the only additional bug that has come up so far:

`.exit.text' referenced in section `.alt.smp.init' of
drivers/char/ipmi/ipmi_msghandler.o: defined in discarded section
`exit.text' of drivers/char/ipmi/ipmi_msghandler.o

diff --git a/arch/arm/kernel/atags.h b/arch/arm/kernel/atags.h
index 201100226301..84b12e33104d 100644
--- a/arch/arm/kernel/atags.h
+++ b/arch/arm/kernel/atags.h
@@ -5,7 +5,7 @@ void convert_to_tag_list(struct tag *tags);
 const struct machine_desc *setup_machine_tags(phys_addr_t __atags_pointer,
        unsigned int machine_nr);
 #else
-static inline const struct machine_desc *
+static __always_inline const struct machine_desc *
 setup_machine_tags(phys_addr_t __atags_pointer, unsigned int machine_nr)
 {
        early_print("no ATAGS support: can't continue\n");

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
