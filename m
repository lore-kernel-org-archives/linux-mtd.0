Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23BBC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 07:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5906B60F9B
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 07:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5906B60F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WO7lGji+mZkos/zOSUQe0Tg1s0ZCl0vxJGArJefA78=; b=3QqhskfP+9Qm60
	5sd+TpXMrFBNQkkDgBVvuhyATDP//PNeaKCwwh/nd3DO4HB8iyJqcxllWOp/Gb6umsahXcfdH+2AS
	IBH1j5ZmhYqzCF6G9AGP1Np02NJlmxpZpbkiZuj8heVWtk8V+hMFx38RXAOHBcTvUEfViTkXRjBF0
	FxfeX68IQuz92T/l/xP0TjwrsJ0AX07VV36hWN5JUGLpoZxye3JiH5ZHSu0O4M0IIH/Z1xnW1HgBa
	rIvExHyiWutk8vZQoW9sIe6VNtpwDreyX6CqQDbBd0UGrAyFjZ5bef5nzbpG8So7MFYfFN8F5I7MU
	/WPJ3/lSlDsmE7rYA5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfdCD-00481e-PC; Wed, 27 Oct 2021 07:18:01 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfdC6-0047zo-Ea
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 07:18:00 +0000
Received: by mail-vk1-f179.google.com with SMTP id d128so357196vkf.11
 for <linux-mtd@lists.infradead.org>; Wed, 27 Oct 2021 00:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m3UqDuembNDHkRgC1yENIlEFdMz5fJYXnnqTuaz01pQ=;
 b=0Izt9/dP7r0MgvB/pvXpwGNEu53J1Zq9jZTz60QZQo8tavelWFDoTzS+PWA+qxDnS+
 SA6sg7v631Zos2IE52myhv9O9PFCYNxAX38gXLbihWcwrof4lyxlHmE+Yr84PfQVsPLJ
 nKYqcTokkQrVRkwo9+jPl9S1DDU8ulGgBx7E2LigipPjZO+FJookrEbikxfe5ZMp8ls3
 oFwgx+iwXSrEAYr0rXuI/V3BH4AzewoSOwrpYN8IXcxxbQ5ys4wKYaJDcTcdifF+FD+X
 ox46fVHAX/UX4PJQjd/3RWgDyL+jnbmTL5P/poTKEpeP9Ug5Y1NXmxpeQvvR/SMXinR1
 OtBg==
X-Gm-Message-State: AOAM530CQExxZNzfd3LF9De9rEQL4ogqkzhrePXqvSnNSUdoxVZ9+kKw
 pw/aPLAxkEI1N/eh3pvYDfCVxIPf69IWlA==
X-Google-Smtp-Source: ABdhPJwEFeYj7r4UB1g+mer2UR1VqQhEeBEslwrtmFpQDvUYVf3gaZqRdNWHmN9YDDrajZw0FsJDvg==
X-Received: by 2002:a05:6122:8d6:: with SMTP id
 22mr28549527vkg.21.1635319072315; 
 Wed, 27 Oct 2021 00:17:52 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171])
 by smtp.gmail.com with ESMTPSA id p69sm553436uap.1.2021.10.27.00.17.50
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 00:17:50 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id bc10so922443vkb.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 Oct 2021 00:17:50 -0700 (PDT)
X-Received: by 2002:a1f:1841:: with SMTP id 62mr27839915vky.26.1635319070166; 
 Wed, 27 Oct 2021 00:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211025205631.21151-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Oct 2021 09:17:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjsVRwB0_TH5HD8CrPsM15K1RLatP_ABODMe2bQ4C2ow@mail.gmail.com>
Message-ID: <CAMuHMdUjsVRwB0_TH5HD8CrPsM15K1RLatP_ABODMe2bQ4C2ow@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211027_001754_509602_7211AB5D 
X-CRM114-Status: GOOD (  23.10  )
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

Hi Prabhakar,

CC seebe

On Mon, Oct 25, 2021 at 10:57 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Make sure we return error in case devm_ioremap_resource() fails for dirmap
> resource.
>
> Fixes: ca7d8b980b67 ("memory: add Renesas RPC-IF driver")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c
> @@ -243,7 +243,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dirmap");
>         rpc->dirmap = devm_ioremap_resource(&pdev->dev, res);
>         if (IS_ERR(rpc->dirmap))
> -               rpc->dirmap = NULL;
> +               return PTR_ERR(rpc->dirmap);

IIRC, it was intentional to make the dirmap optional (because the
device can be used without and/or because some variants on other SoCs
lack it?).  Unfortunately this is not reflected in the DT bindings
(yet?).  All code using the dirmap does check if rpc->dirmap is
valid first.

>         rpc->size = resource_size(res);
>
>         rpc->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);

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
