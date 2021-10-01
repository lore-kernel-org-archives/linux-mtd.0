Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A52C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 12:54:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE9261A83
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 12:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDE9261A83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Qt3071bLHweLShFpcSJcczjb/GAnCphPH4bZhuXH5/s=; b=Di8cihJE3Xa/n3seMbkTg3LzVI
	krq1M/S/H75VX9b4pT2xYw2O2mC2Pq5Dn8j35zo6RWoVqZfPxgOkhBYbGjh5jlPuQYuGcB8etzakC
	+WRN9lNaADUkLFzcRMWKDKh/FPu4h/mnB2XAwombLAkdNnZpFml3ggvDTTCf7sE18sPyTHV0aVwzw
	O8Fwi+JGrG39tFsKCToIu0MLROD2gRrlspaibRAqyL2EO5313tKDLlB0KCXOtaKifxBKgR3JWfui2
	11T8Puefcdced0psZN7Exo59hdzyiKKtc2eDaDTWHqYk3VkjSjkxrJsReqGQnTpbQ50Bd0z2FvRGZ
	ioXvV9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWI37-000N3k-4m; Fri, 01 Oct 2021 12:54:01 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWI34-000N2y-IB
 for linux-mtd@lists.infradead.org; Fri, 01 Oct 2021 12:53:59 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id u32so20217858ybd.9
 for <linux-mtd@lists.infradead.org>; Fri, 01 Oct 2021 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=c+kURNAAkSIIC5kx7+rU/IV/731k5cWXXDLuC8d6BG4=;
 b=CmoIj3+u5w6xdONToKlV8fG3jt47szGOKyPvH/oQSmMrhDRpA8wd8iTvAlViEFKcnE
 ptqm7Fz8WTn/hYmhdBPUDI1pxU0BYKkaR0/Qx8uZUoU+s3AAdg43N+opw7vvcoUBvudJ
 m+uduBukHAN126diABfdvwqCUu8S1uMeCv0z18Ca5Zu4h03H1g9e86piwSsC+VlqydfB
 1pa456Rj02ulpijkQ9gFPtgOj7I+wxDjs//egaMSMWCNeOwmIMK8omDMPNLwztTIljWz
 xbj4chFNRP/5Cm+zzHbNY0jKWhjRwdrHGn6hdZmAHKH1SW/MBKDTKU5BDE7ZJCuZg+4u
 K0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=c+kURNAAkSIIC5kx7+rU/IV/731k5cWXXDLuC8d6BG4=;
 b=Z6fhwWT8tURSlFkU6UPFbHulLFFJaWjAHAoVITcUuarRylhyiDF1xXty/RBQcjRMbu
 ahUXEeqqY6nE/DG1YuZmJZ2pMhNNOKLmAiiqHrq+dalZZAtdKS0V8Eu7VHVsMlp5AYV2
 EqY+zhe/Mkis9/r8WVEBeKNlzRPmYcFmbePxo+gZBRHW/UxqtGaDnF0ELBfe/p6tzr/y
 j1GgrguYHbr7oi/3h4WxIy704+g2dUKmVuPtGFg8aiz1tS98dPraKfN82M0w0Ou8CDN8
 puAe0IlUnLBRv7iLjeGyh1nrMueWNFMhErU6IXLnI0VCvLvkG9pu7E3kh+pESLrcyllz
 cFmQ==
X-Gm-Message-State: AOAM530K04etKY+zYlDTRwuTX85y3mpotg0m2zhvDAC7c7AtuN529kUz
 zhhqr2GBV9VQ71tplkKY/Yw77a8Vz/AaPFN2uu8=
X-Google-Smtp-Source: ABdhPJyoKAv0iarnUd7y3IYOy1Ztcq0Ch+N3p78eU2QqNjTH5HmI6jvK5PHdjjklcXIMiPSKYoLlsTnwZhQsST5T+GE=
X-Received: by 2002:a25:c08a:: with SMTP id c132mr5971448ybf.49.1633092837128; 
 Fri, 01 Oct 2021 05:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YVXMc1A4D/y4kjim@shikoro>
 <CA+V-a8sDSsyTGfTeQfG_ZhfrJHCm+2kBTEDWaoFMTgsMOmxEgQ@mail.gmail.com>
 <YVbM3z7x+D0MCkTF@ninjato>
 <CA+V-a8uyQmW3+4hAt4534spKeQHDoeZzuJJE4RY70KLZfYOXoA@mail.gmail.com>
 <YVb5RXvh9agIS7MG@ninjato>
In-Reply-To: <YVb5RXvh9agIS7MG@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Oct 2021 13:53:30 +0100
Message-ID: <CA+V-a8vQ2EoMW18aEq5Ssa71M6VvA6YtOzU2UAe7L1Puorr07Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] memory: renesas-rpc-if: Add support for RZ/G2L
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org, 
 linux-spi <linux-spi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_055358_639449_4CC39EFB 
X-CRM114-Status: GOOD (  23.21  )
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

Hi Wolfram,

On Fri, Oct 1, 2021 at 1:04 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> I checked the G2L datasheet and reconsidered. It is better if your patch
> goes in first. That means...
>
> > > > > Is RPCIF_CMNCR_IO3FV and RPCIF_CMNCR_IO2FV actually documented in your
> > > > > datasheets? I am asking because I have a patch pending to remove writing
> > > > > to undocumented locations. So, I was aboout to remove the IO3FV and
> > > > > IO2FV macros.
> > > > >
> > > > Yes they are documented, you should be able to download the HW manual from [1]
> > >
> > > Great, then I will keep them!
>
> ... that you could change the comments here from "undocumented" to
> "documened for G2L" or similar.
>
> > > > > > +             regmap_read(rpc->regmap, RPCIF_PHYCNT, &dummy);
> > > > > > +             dummy &= ~RPCIF_PHYCNT_PHYMEM_MASK;
> > > > > > +             dummy |= RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260;
> > > > > > +             regmap_write(rpc->regmap, RPCIF_PHYCNT, dummy);
> > > > >
> > > > > regmap_update_bits?
> > > > >
> > > > Im a bit hesitant to use regmap_update_bits() here as some of the bits
> > > > are not documented.
>
> Here you can keep your code as is. I will change it afterwards if needed
> once I clarified all undocumented locations.
>
Thanks, will re-spin the patches with comments fixed.

> Thanks and have a nice weekend,
>
You too.

Cheers,
Prabhakar

>    Wolfram
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
