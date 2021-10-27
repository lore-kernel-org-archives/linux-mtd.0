Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7094AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 07:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342D360F5A
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 07:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 342D360F5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puVycDOuv/aivLQfHrjqBzAHrPWhZYcV5+APSNHUvT8=; b=Mk/dxqO1yRlGBe
	IPQxgZTjgJaRZ4RYeAAxZPnOag8A2jw1bCPlNqFPH+75EPBevZiFAhYgWRiK6+iR0JY7Ql0zrs2Ts
	nJQg9iJYLqkRV4DVCb04dRBsdqr0R1euzCZWO0BsgWgRtRI5gn2qgAmdGlZAvfRt6AlBTvQB47jDg
	HUfBRKlJe6FDzzoUZ3T+cRPgZ6bGND7W3Akud5nHD/6NSCBEwQ2J/nli84yXaFmMeYfMgYthvud28
	X//L93zw/0lH+sLeBiUpwjpa8T0tYhcK6gPMZYo0tgYIkx7AJGcp7MwfRo+n3D6YTIh5q7DoAQPXA
	dNMQtzyXqdU8iWKjOvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfdFm-0048iH-NE; Wed, 27 Oct 2021 07:21:42 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfdFj-0048go-Hi
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 07:21:40 +0000
Received: by mail-ua1-f48.google.com with SMTP id o26so3141581uab.5
 for <linux-mtd@lists.infradead.org>; Wed, 27 Oct 2021 00:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XEkFa+Ku/oXy3Y71Wa/RXXm6+I0giMexz18AaglX7hA=;
 b=sIsbsFDVZxDU7Prh6N5tk8BjRS7hrdZWR4ZaCeHk8mEgG8g99ocpZS4Y1xb4odqbNK
 0rxQDOpWMAyiQjSxJTrVDwiYSXWixVWRwYcBdib6Ai2u39tXRw1beZVmGdv0yNXPGF7G
 IPPFq1Trze3GbRCjvdm5H1ohoyHUJLJp0wlaUuoWCsDGyFeZQYrqMyrl0ivOQjHdJwhP
 5MCUycyfGRRV7A7s2NXnQhnNlvDkJGgZvEHH8TQ8lUNu9f95ci6BMBEpjvkbwgmygAJ2
 IJwETZDLXtYCUrBPgOrWRTXkANgO1YryLOUQu2An4Lo55YikJJVpp4MNL6Ias7uP0psM
 6Vdg==
X-Gm-Message-State: AOAM530M7i+yE+3+nKx/L69b+lx5ypBWmNZ2iyI3hc+fDbqwbDslk+QE
 G7HuxFXMHEoFSf05yjlNZ0ignkIqHGyGtQ==
X-Google-Smtp-Source: ABdhPJzOrtrx8vQpspJ40jLJ8tiRT2uFUKblWHj69kD+HuRVmGHpC2Vtm0lLfU2IxShmYnqkrqsjaw==
X-Received: by 2002:a67:ae47:: with SMTP id u7mr29444427vsh.7.1635319297889;
 Wed, 27 Oct 2021 00:21:37 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id m34sm10655937uad.5.2021.10.27.00.21.36
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 00:21:36 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id h4so3183623uaw.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 Oct 2021 00:21:36 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0e:: with SMTP id
 b14mr747714vsu.41.1635319295910; 
 Wed, 27 Oct 2021 00:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUjsVRwB0_TH5HD8CrPsM15K1RLatP_ABODMe2bQ4C2ow@mail.gmail.com>
In-Reply-To: <CAMuHMdUjsVRwB0_TH5HD8CrPsM15K1RLatP_ABODMe2bQ4C2ow@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Oct 2021 09:21:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4HfLUfDk2eZkBugP_ysL3w+qvZqKSR3e47HG4RTggXw@mail.gmail.com>
Message-ID: <CAMuHMdX4HfLUfDk2eZkBugP_ysL3w+qvZqKSR3e47HG4RTggXw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] memory: renesas-rpc-if: Return error in case
 devm_ioremap_resource() fails
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Chris Brandt <Chris.Brandt@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_002139_613523_CAA20DCE 
X-CRM114-Status: GOOD (  28.19  )
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

On Wed, Oct 27, 2021 at 9:17 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Oct 25, 2021 at 10:57 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Make sure we return error in case devm_ioremap_resource() fails for dirmap
> > resource.
> >
> > Fixes: ca7d8b980b67 ("memory: add Renesas RPC-IF driver")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Thanks for your patch!
>
> > --- a/drivers/memory/renesas-rpc-if.c
> > +++ b/drivers/memory/renesas-rpc-if.c
> > @@ -243,7 +243,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
> >         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dirmap");
> >         rpc->dirmap = devm_ioremap_resource(&pdev->dev, res);
> >         if (IS_ERR(rpc->dirmap))
> > -               rpc->dirmap = NULL;
> > +               return PTR_ERR(rpc->dirmap);
>
> IIRC, it was intentional to make the dirmap optional (because the
> device can be used without and/or because some variants on other SoCs
> lack it?).  Unfortunately this is not reflected in the DT bindings
> (yet?).  All code using the dirmap does check if rpc->dirmap is
> valid first.
>
> >         rpc->size = resource_size(res);

Of course this will crash if the dirmap is not present, so for now it's better
to just bail out.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> >
> >         rpc->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);

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
