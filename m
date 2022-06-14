Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EF4C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jun 2022 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1nIJoh3Vsix4Ls7TlfqbW8w9c2wziPAcbht4UQioKk=; b=GDQaaBDmhYCP+q
	95V9Q0BkwxPDPKPxD2pITizwb1pV1KJOhIieYhNvW4glX5VdXjfWwfG5GfBc7zxme93crSt9cK0k4
	9skaaVSGaT0nu+H8zf7hZyBA8pXc8vKm1pTg8GePW1ymD/t5XoltDTQfKwkhb2GKGC3CcB/O3/po1
	PTmwwy9qoQPsUoq84W1ft1hALAGaFg0Q0otEbFoKgu+Lk+uVH5JWkl4Y4x5xrv0rpoNZbZS0XkD53
	eIcHrwxxau3jDLuZEtcnOQp0sn7nudvFV9LvNBaLO1v9+3qvE1qlkFpRkY+JbuNBPOG9NQNfIxZNl
	+2j9IJJxHrVtSn5Nsk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o139Y-008s52-Vt; Tue, 14 Jun 2022 09:48:05 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o139X-008rxf-0j
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2022 09:48:04 +0000
Received: by mail-ed1-x532.google.com with SMTP id z7so10774934edm.13
        for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2022 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AbWEIZKuQEPkI6mw3aStn5U0WWP1BjEat68e2PmiceA=;
        b=N1NiormT/h2pvJCji1D4eEYMeNioGpKvNXYvFBg4XQp8mZGVkkE6bBZfAm3zrDmbhb
         /bHDPI6uqMlXm4lFR2z9UjBANDyP3XAvLzHPoQqChqmwmW1lFFjCj6hPQWpjX/ib9Bls
         UdJDH606+ke3zr7VdHkLFrCmv2rrkEbETNugI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AbWEIZKuQEPkI6mw3aStn5U0WWP1BjEat68e2PmiceA=;
        b=r4cp3DBKpmomXJLrOe55uZfWffeu87Ec4oPE9M5LerB2ofY4pNXJETYix0ggF5314a
         VATp0vXv8fQFU6it4mBrF7sDhvBgG+lRMKdJK6DKPa+jkw3cCc3nfms/KyDbxMt3dBNJ
         n8Vy0KWNlNFSRSsNvEhlhA8+wU0RY4weyuToUBy53iwUMy7APYHBWBnjE7qh/lfw8orr
         JUNVUD7Hsmud5JCHXoiZ7W8xyNkv39HGMWBxEArfQWRYus5v1LvYEFOEMCMI0MpTLbn2
         snsqhVXXxojj2cx2tPen4T0SDzMwBBHTD/bxTP3nNHFZtz+FibYQ0fjnqRdSYdTbRDWn
         NZNQ==
X-Gm-Message-State: AJIora9i9GlQmPuCzk7fEH3Ek6mOyJDraEaWkhASFAXlljwdaj9iXxUR
	mgaCWD+KWsBXZiV8kD/8EfQ8v8nAZAhm9XjGd0/n3A==
X-Google-Smtp-Source: ABdhPJyXQyqWZ3hflsG2HtwWc6SYz4sFBWE+oURZh9HNdq8IrbaTBrl7OmuUmLg8S2s2rqJ2OQs3C4QaqXjhYkWpLts=
X-Received: by 2002:a05:6402:2381:b0:42d:c8fe:d7fe with SMTP id
 j1-20020a056402238100b0042dc8fed7femr4835160eda.248.1655200080686; Tue, 14
 Jun 2022 02:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <b36280be-9993-9a78-0960-4094efeed1aa@linaro.org>
 <CAMuHMdWL93+r0cofwHKj1k-gUo9nk3OzUf6gtY68sK4JNibyNg@mail.gmail.com>
 <eb5ab9553c419b8259f5494664865597b6c5d4db.camel@infradead.org>
 <CAL_JsqJ49bnBe84PXYY6caN0rxEEgL=mcWqKktzbK94McgYNfw@mail.gmail.com> <6757109d4eb065682706e455c9772259cf11e557.camel@infradead.org>
In-Reply-To: <6757109d4eb065682706e455c9772259cf11e557.camel@infradead.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Jun 2022 17:47:49 +0800
Message-ID: <CAGXv+5EbA29qfd9WPP=hawxgAKE-tSQvCsjX+-a0hmUsmWFgzA@mail.gmail.com>
Subject: Re: Getting rid of infradead.org - corrupted subjects
To: David Woodhouse <dwmw2@infradead.org>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mark@msapiro.net, 
	workflows@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	MTD Maling List <linux-mtd@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_024803_151355_F6E7B057 
X-CRM114-Status: GOOD (  14.15  )
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

On Wed, May 25, 2022 at 11:17 PM David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Wed, 2022-05-25 at 09:30 -0500, Rob Herring wrote:
> >
> > Yay!!! I should have asked years ago...
> >
> >
> >
> > Any chance the appending of footers can be stopped as it causes lore
> > to report duplicates and b4 dmarc attestation to fail?
>
> That's up to individual list owners; it's part of the per-list config.
> It's very easy to turn off.

Could you share who the owners for linux-arm-kernel@, linux-mtd@ and
linux-mediatek@, just to name a few, are?

Thanks
ChenYu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
