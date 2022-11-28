Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC38C4321E
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 07:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNyzBnRYfpT5rx2nzTRXrbrsGhDaNPmnOdJUFq+tLmI=; b=l/1cMiUI+KH3pt
	YL8qzfpeYVIhMumVr0xRUYy/PVU1AwcHN+H5ZYOcMELbQdhAJ9yrhCVcOk4VzK3I787c1+xcV3mP0
	BCsgOPeplUSASzPxkXkgv4/qjzhylkHuC9YmhJPEO9frHn8qlcl3PKyRfAOgnpNhBmxnRgxxZkmKP
	n1ymIRmjS1sgaLQbt8pPg5rJh3rMBIBsZISnuvkyoP2xtQFzukGzVMSZT9OI9lN0tp/a/rbwlVdwR
	IAHcULrCxzq15per/bfmxjCFgbekte30gMou/RfY5uk3sqkrMnHBg7R/llEWxrYrQ2xP/lWbw8Rfd
	kmNuI5zRu9wiQYrFIxbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozYi6-00HMjy-3r; Mon, 28 Nov 2022 07:37:50 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozYhx-00HMcD-4j
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2022 07:37:47 +0000
Received: by mail-qt1-f182.google.com with SMTP id h24so6128854qta.9
        for <linux-mtd@lists.infradead.org>; Sun, 27 Nov 2022 23:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mf6PpFgRdbUWXFIJ6gzSU4wMby+2q9WODUFq2erIU/Y=;
        b=w7YJUzcwzfQ5fb0KjYYQp1OWLHJ8fP3eTOqo9PbQOw7RpI3Qgj20kBjGt1zYjA0GqG
         HaE4oHJev2c5Xk+tK3Q95NukNMzi3+Jtj5s3mxQ/dyVNmPA9cFp3UiVwMf07QOiKYYDs
         qwS4tvv++KHh5UMMqo6xAIj14mx28UtnuktZv2kJsDym3jvxjwMOBGskEXfGsJjpwnTa
         sktJcEcXYUvxjxZZWN5S/WLj1JWGXkoGs9YQw+DBFRLlfWeqD/OhDrdekRdQ/POpMlTq
         8GI0iztH+WY8U8zDDFwKn3UOUHHX+yyVFySrUiFNybqHzthOi8yqqmJq2DO86hr22LlB
         lBQQ==
X-Gm-Message-State: ANoB5plW20HWYPGZy21WGNGyOlFuNKo27DoOUBIY/LT8+m9/ceFMcPVg
	R3D46G9CXJ2Npp5XPUEdXAQkrsZaxLTiQA==
X-Google-Smtp-Source: AA0mqf6fEe0tabAg1VfoJ2lOn4krpujnmhFeGQnRgYH0PuYmgmnyw6D3CpRgKre0mXOMj8DT6ltp8Q==
X-Received: by 2002:ac8:7dcf:0:b0:3a5:6652:4414 with SMTP id c15-20020ac87dcf000000b003a566524414mr29661910qte.645.1669621059138;
        Sun, 27 Nov 2022 23:37:39 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id n1-20020a05620a294100b006fa16fe93bbsm7989859qkp.15.2022.11.27.23.37.38
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 23:37:38 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id j196so12255497ybj.2
        for <linux-mtd@lists.infradead.org>; Sun, 27 Nov 2022 23:37:38 -0800 (PST)
X-Received: by 2002:a5b:24b:0:b0:6ca:3b11:8d76 with SMTP id
 g11-20020a5b024b000000b006ca3b118d76mr28827047ybp.202.1669621058200; Sun, 27
 Nov 2022 23:37:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669213027.git.geert+renesas@glider.be> <b500e42c-f782-79c6-70ce-650e4ea32c54@linaro.org>
 <a75b604c-a671-d2c5-7160-74dcb8a4fa2e@linaro.org>
In-Reply-To: <a75b604c-a671-d2c5-7160-74dcb8a4fa2e@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Nov 2022 08:37:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgmxVxKbTxXO90XaaL5-qf6WnEwbTwU+ZmSEcuzOFEgA@mail.gmail.com>
Message-ID: <CAMuHMdVgmxVxKbTxXO90XaaL5-qf6WnEwbTwU+ZmSEcuzOFEgA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Rebind fixes and misc cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_233741_243884_FF8C825B 
X-CRM114-Status: GOOD (  23.33  )
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

On Sun, Nov 27, 2022 at 10:34 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 27/11/2022 22:31, Krzysztof Kozlowski wrote:
> > On 23/11/2022 15:41, Geert Uytterhoeven wrote:
> >> The Renesas RPC-IF provides either HyperFlash or SPI host access.
> >> To handle this, three drivers are used:
> >>   1. The RPC-IF core diver,
> >>   2. An HyperFlash child driver,
> >>   3. An SPI child driver.
> >
> > Thank you for the patch.
> > It is too late in the cycle for me to pick it up. I will take it after
> > the merge window.
>
> Optionally, if you want to push it via Renesas SoC tree and there are no
> conflicts with existing two patches, then these look good:

It's too late for the Renesas tree, too.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Otherwise, I'll pick them up after the merge window.

Thanks!

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
