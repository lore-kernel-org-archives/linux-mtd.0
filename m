Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEBFC10F1B
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Dec 2022 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPAAZDWuqTdluETCDNE2BDSkAYqZ4jQgBp93/GIr7Cs=; b=2ewHpbvozOwYzt
	u5FC/5itrnbwa6zGxK8qHzX/uJcN3LgGxwzjc0B1qYWn5W61vYjbPxNznpBdqaFJoU1dYR0P4Q+Es
	ski+I9zKYXio4RPaB8IXLrSrz9MPS85vJqCzA6VzRI222xbuL25Xt9NpvO5fprqFKaZX7dkLbl3Vn
	5crXPPVr3Vk8nR/E5bRx9M+xV4yH4ZluyvjUUUFUjM6Zaip66X3LzbYr+cdL3jQG6Aw6bjQJDgl0F
	HE1BKLhLQqXI5kAccJkEYhoIdm41c9yqWWYWVNA0Ot2FojMsmq5a1RuEEvtuUaGKbxP9SKBnfGFkf
	bj7QK/2P6Cw9S9fVuYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5y7-00Beym-6e; Tue, 27 Dec 2022 09:09:55 +0000
Received: from mail-qv1-f46.google.com ([209.85.219.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5y3-00Bew1-52
	for linux-mtd@lists.infradead.org; Tue, 27 Dec 2022 09:09:53 +0000
Received: by mail-qv1-f46.google.com with SMTP id pp21so8791910qvb.5
        for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2022 01:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyk7cPGA30ht9CIHOHoD2wEIGOPlfpDmF3Sx7wsll0k=;
        b=b+cwOukYxABtmXEgFTZSSoklJ2xeEitnlvrgUKd8cXwNkejJQo5LcbKi7oqd7kStiZ
         S5Y3XQT1eS/p7TkRsgA/RJuA4DI+ZHM1tW2SZwnjBeSuKrZrtZseGbarygpoKdOwtzJy
         h7t5dfYLIgmMl8+2p2W0Zri3wbjhH8glg/owiDEMu71WtLWkFXblAybS6fjwG03iJ7Tt
         lA90/ZTINzm3smte1jKI0s+GbhmBw1AgcECYU/3HRc1AMmsZNib+q85IRaFzYPC2ijAS
         M4CaqYzrp5f4lrpFW72Bu22UxaPtzyf9e7dQpEMfhlkjTBb6BrS/qxT6IgFfASNxPuuG
         dTSQ==
X-Gm-Message-State: AFqh2kroOOPWWQwTCBuPTLDPWBP3VVUvDZt4SRjiBEHzpm54/qWJHAxF
	hi+6CREaKAYHIhDXPIe8/ODw3m3Tz4/Sdw==
X-Google-Smtp-Source: AMrXdXsSdhXFh+NputGzj7Rx1y+b6GysWwEMz1IpNnH67Th9BZENYwrQsDf3SodvL/XpzdQMHqIw3Q==
X-Received: by 2002:a05:6214:3b06:b0:4c7:935f:c888 with SMTP id nm6-20020a0562143b0600b004c7935fc888mr25708660qvb.42.1672132188536;
        Tue, 27 Dec 2022 01:09:48 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id w29-20020a05620a0e9d00b006ec62032d3dsm9090653qkm.30.2022.12.27.01.09.47
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 01:09:47 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id e141so13799450ybh.3
        for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2022 01:09:47 -0800 (PST)
X-Received: by 2002:a25:3143:0:b0:77a:b5f3:d0ac with SMTP id
 x64-20020a253143000000b0077ab5f3d0acmr584880ybx.202.1672132187403; Tue, 27
 Dec 2022 01:09:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669213027.git.geert+renesas@glider.be> <167213158107.15520.15699943919910529014.b4-ty@linaro.org>
 <2d62f33e-69d4-064c-f226-2d38396f0e9e@linaro.org>
In-Reply-To: <2d62f33e-69d4-064c-f226-2d38396f0e9e@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Dec 2022 10:09:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUT4eW0KPV8DD40kPD0Cr+QudBfOxfhKy9iWnrcGBSM0Q@mail.gmail.com>
Message-ID: <CAMuHMdUT4eW0KPV8DD40kPD0Cr+QudBfOxfhKy9iWnrcGBSM0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Rebind fixes and misc cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Mark Brown <broonie@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-renesas-soc@vger.kernel.org, 
	linux-spi@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_010951_370172_4E7BE926 
X-CRM114-Status: GOOD (  21.29  )
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

On Tue, Dec 27, 2022 at 10:06 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 27/12/2022 09:59, Krzysztof Kozlowski wrote:
> > On Wed, 23 Nov 2022 15:41:16 +0100, Geert Uytterhoeven wrote:
> >> The Renesas RPC-IF provides either HyperFlash or SPI host access.
> >> To handle this, three drivers are used:
> >>   1. The RPC-IF core diver,
> >>   2. An HyperFlash child driver,
> >>   3. An SPI child driver.
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/6] memory: renesas-rpc-if: Split-off private data from struct rpcif
> >       https://git.kernel.org/krzk/linux-mem-ctrl/c/f8fa9cb3fb16e06514fec0bac58996015dedc453
>
> Missing checkpatch. I corrected now:
> WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1>
> ("<title line>")' - ie: 'Fixes: ca7d8b980b67 ("memory: add Renesas
> RPC-IF driver")'

Oh well... Merry Xmas ;-)

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
