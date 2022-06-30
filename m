Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0F7C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jun 2022 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQp3Tr7/p8R8CcrS0qr3EC8jh0jQ7hiLQPxDTnL2kF4=; b=q41l6E+VVIG8oK
	vzemGbTWwSk8zjrQC7n04LCU3Jtu8gyC/jKunGXLGhR9xMOC/AgGCshRpA26oAXwIkkdPwMdq1t9e
	sxTgLm7OCtqQ+855Kcoiw2jClqXvdKDSN5RaQs1Z/91MhSgiiY65qBs7/HvY5r6xcRxATCCQHJA6r
	UueTkl7Fssk32acxoTmxxrR1nth60yZwMPmAKsIZCEclSPOuM09pFMEo0K98lYoPPVo0DVF6PHdp1
	AB7kCBcZzXxXbeDXcojHXXc96WUkj+NYn06uHKJo+WUvz7kPzn6Sm6seT1bSC98SML3L1ujZuJzze
	8zFgaErnrR7x/OKxO4KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6qHA-00GCFh-2X; Thu, 30 Jun 2022 09:15:52 +0000
Received: from mail-qv1-f42.google.com ([209.85.219.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6qH7-00GCDw-BA
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2022 09:15:50 +0000
Received: by mail-qv1-f42.google.com with SMTP id y14so28744790qvs.10
        for <linux-mtd@lists.infradead.org>; Thu, 30 Jun 2022 02:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E9Vssd5sS4spcwdMP9Swa2WTwEcZk2KwnOex4FXzpQQ=;
        b=jEpS0zI4qWYtazorjo8ICfFHcF/aW65nGRy7KcZtXlECSxM+oBbmr0jYgCnTlej8eh
         LFYocJnIqBsOULlNLoJzYLcJ5wd4Odpby0J8vR1BtF0skc+nM7h4459MubONKtc9Y9de
         7+HqcM7/P51qM0N6MecnqsSvSP7GmbUJ+lXxlJDPbAKxHE95cuCVaexOBOo2Hdhi9asw
         +Th1yzmTNUU38kXWwny9I1UFZsOawyPWK+5ZFNDuiaG46FSds9G3GIa1aCRvIM7FY6Da
         r90TUPE9BF6M5NOAxlEZHPJsZ+nEh2opUOph7whOjSTYjIirXR/iY6J4FNeKcnZM4TPH
         OFeA==
X-Gm-Message-State: AJIora9ZOqLG9Tn9uYCwF35xMsvWdOyNj2fR1sp7eIiDWz39qsjJaVXQ
	q7MYXNv2ZVi8/O9jz1riT6NuA6qWomSLSg==
X-Google-Smtp-Source: AGRyM1sPvmZlDy3u/Q9LqnflMr2m9kfNwNuzQ2kYXn6wwuoIW3bkVwjoaV1125BACcvXLuwApiGSQQ==
X-Received: by 2002:ac8:4e94:0:b0:31b:f600:b59f with SMTP id 20-20020ac84e94000000b0031bf600b59fmr6226012qtp.527.1656580546452;
        Thu, 30 Jun 2022 02:15:46 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id az16-20020a05620a171000b006af4a816963sm7257171qkb.133.2022.06.30.02.15.45
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 02:15:45 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id h187so30443451ybg.0
        for <linux-mtd@lists.infradead.org>; Thu, 30 Jun 2022 02:15:45 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr8111243ybu.604.1656580545430; Thu, 30
 Jun 2022 02:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656341824.git.geert+renesas@glider.be> <2fd9b9e3f60fe555d9dcad499c90e3ec869aa96e.1656341824.git.geert+renesas@glider.be>
 <c65d6a94-b5c2-e2e4-6fdb-b7982d291e01@linaro.org> <CAMuHMdW=s42sfFwimizTsNjyKue+W9NasTOG0jgjkgkoKv3wfw@mail.gmail.com>
 <bab4d845-330e-c7f0-5dac-a96caa93a39e@linaro.org> <CAMuHMdUuU4qtfYh=hpY9bWMLKAnz83Oj8f=M9_iUxmR+Zetsow@mail.gmail.com>
 <c04c3691-7be3-afc5-4f95-2b06ee402c0d@linaro.org>
In-Reply-To: <c04c3691-7be3-afc5-4f95-2b06ee402c0d@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2022 11:15:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEeLuaG_sgYZudKv8fEpExdHz4grFj8a6DuzdRng+u_w@mail.gmail.com>
Message-ID: <CAMuHMdUEeLuaG_sgYZudKv8fEpExdHz4grFj8a6DuzdRng+u_w@mail.gmail.com>
Subject: Re: [PATCH 5/7] memory: renesas-rpc-if: Move resource acquisition to .probe()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Mark Brown <broonie@kernel.org>, MTD Maling List <linux-mtd@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_021549_419009_9D7BD543 
X-CRM114-Status: GOOD (  31.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On Thu, Jun 30, 2022 at 10:48 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 29/06/2022 20:48, Geert Uytterhoeven wrote:
> >> You sure? Except rebasing I don't see that. rpcif_sw_init() received the
> >> rpcif so it had access to all fields.
> >
> > Yes I am, don't be misguided by the name of the local variable.
> > The rpcif structure is allocated by the HF or SPI child driver,
> > and thus not available in the RPC core driver's .probe() function.
> > The rpc_priv structure (as of patch 4) is allocated by the RPC core driver.
> >
> >>> I agree patches 1-3 could be moved later, if you think it is worthwhile.
> >>
> >> This would not be enough, it has to be first patch to be backportable.
> >
> > I can make it second? ;-)
>
> Why? The point is that this commit should have Fixes or Cc-stable tag.
> If you make it depending on other non-backportable commit, stable folks
> cannot pull it automatically.

Because the current driver structure does not allow us to fix the
problem in a simple way.  Hence the need for patch 4 first.

> > Note that that still precludes (easily) backporting s2ram support.
>
> But S2R is a feature so it won't be backported...

Working rebind is a feature, too?

Actually non-working s2ram is worse, as it returns corrupted data
(haven't dared to try writing after s2ram yet ;-),  while non-working
rebind means you just cannot access the device anymore.

But note there are still issues with s2ram...

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
