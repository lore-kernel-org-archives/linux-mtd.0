Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E495C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 14:15:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A6B8619F6
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 14:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A6B8619F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xQimavxMwMGbbAn2fC1qVcQJFdyNuvZXnkJDlCXLA/4=; b=dmY+0vhR10jLfkG7NNuoChSt86
	6Pe0yvKz569qII3+QoqngJcz7AkETAt1u1BmG8jg174Ac/XJGRcX8BxuuWw18emkmho07iW4AXsTi
	KWYEUFd2l2ZszmMzcAhbhuiPdaY2WjKQJYWqjscNcSIIzPiI4zJO4v3cpAc3S0nK+xF+p7h23tyRv
	EgGbJ63xAi4z27MgO5Jg9t4C7TfOeVrpRUpxGPkmysEgGng5cI5AEEh+PpZECZxXF+WAJI8LksrQV
	S7zdt05Y2VxF1k/qf2PhDyK8ucAsV6XJyWPQwtm+gR0NJ6hs/QTIMK2ElSWZCB8sclRsgpDZEYBpJ
	SlCvKF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVwpn-00EfbW-2D; Thu, 30 Sep 2021 14:14:51 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVwpi-00EfZt-E1
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 14:14:50 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id w19so13583465ybs.3
 for <linux-mtd@lists.infradead.org>; Thu, 30 Sep 2021 07:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ZlbycwSf8KOr9C6VK23OEuQLUHZlOjmRvD/2nI+bi60=;
 b=qRw2oV9iT78NoUU/Q9Q3Lnvh5rS5ozP/5a1m+D4kjfwoecvjLBUUFkLUYkOwQSDHb8
 ka+qyVuNq/ZvtFYz9cDlqySWoAPpnE4s3sSLM2V138w9/5IkxMMmfF+LLX7h4cC4jCit
 NRGkC9xzlxxq958GPMfid91BbrWEVwFvfkqf3u/VG93EyyZaa90+Gv7TTIHn0QpgwhfN
 1uLqgdZONUrFwfHyAP00QWLmU41n/WFRUhOitn2YsrKnnNKsBsr4rx/6zx87xyDTF6Uc
 PfK4hiFkkpNJudR0I7dI8F4fX+28JUrH8hAKTaiAr2gq0YuBhNL6MoypSfbIQpXZuzEB
 BCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ZlbycwSf8KOr9C6VK23OEuQLUHZlOjmRvD/2nI+bi60=;
 b=JBpVHO77RPkZISFqCHhcZEW/nzAx11hzzX3kzuYsLrBwDswEMmVViu6f3ZzW3EtTwG
 og2tm5SjUymgvIavvOEF0fiq8vw2DTU9bnpy7+LmNlO4DgRGmlq+v0aKzazp6EwFMElX
 ELus8/JDj4sZKheHH5Eq8HYoLtNl0im4P1bNU+Uew7uR/9Vq76gRvny0HGKr3SiGMstM
 hG7S7nQ8bU023z37TrVygyL8i0OKcZ+UWZkJG8tSJjAy3ygUmJI32SIvo8C/LEZ2jMRU
 Rx1OEHCVFkJPb1todd+CtJ5E+ggPbroCllXFIwFhrKOih3SJpcl6nu27SwTRGGhh0O7o
 uyVw==
X-Gm-Message-State: AOAM532XY9ymt2dEf9tVn+DcHMyaGXKF3ysMI7AaWOpFcGRyXr2BiY5T
 DmE1RSyynaHDmErOh3FiYi3ITGP5NXkkjISuOWQ=
X-Google-Smtp-Source: ABdhPJwDD9Ku5kP4Ry+rJnrmuQRjtBKCt6klOYFciW0L2yTusRSqoya/lMiX4S851JiUivmDNoRAfnptDMxmsEOJv20=
X-Received: by 2002:a25:1c02:: with SMTP id c2mr7377845ybc.218.1633011284452; 
 Thu, 30 Sep 2021 07:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YVXBwx7rxJLRhlTI@shikoro>
In-Reply-To: <YVXBwx7rxJLRhlTI@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 Sep 2021 15:14:18 +0100
Message-ID: <CA+V-a8sZ0qudhbV7Fart-puNQO-ZHhDEG3OdRH=w_dbTHy2A7g@mail.gmail.com>
Subject: Re: [PATCH 5/6] memory: renesas-rpc-if: Drop usage of
 RPCIF_DIRMAP_SIZE macro
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
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
 Prabhakar <prabhakar.csengg@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_071446_512288_50B815FC 
X-CRM114-Status: GOOD (  24.50  )
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

Thank you for the review.

On Thu, Sep 30, 2021 at 2:55 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Sep 28, 2021 at 03:07:20PM +0100, Lad Prabhakar wrote:
> > RPCIF_DIRMAP_SIZE may differ on various SoC's. Instead of using
> > RPCIF_DIRMAP_SIZE macro use resource size to get dirmap size
> > which is already part of struct rpcif.
> >
> > Also make sure we return error in case devm_ioremap_resource()
> > fails for dirmap.
> >
> > Fixes: ca7d8b980b67 ("memory: add Renesas RPC-IF driver")
> > Fixes: 59e27d7c94aa ("memory: renesas-rpc-if: fix possible NULL pointer dereference of resource")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> In general, all fine. I just think this should be split into two
> patches:
>
Sure will split this into two.

> > @@ -147,8 +147,6 @@
> >  #define RPCIF_PHYINT         0x0088  /* R/W */
> >  #define RPCIF_PHYINT_WPVAL   BIT(1)
> >
> > -#define RPCIF_DIRMAP_SIZE    0x4000000
> > -
> >  static const struct regmap_range rpcif_volatile_ranges[] = {
> >       regmap_reg_range(RPCIF_SMRDR0, RPCIF_SMRDR1),
> >       regmap_reg_range(RPCIF_SMWDR0, RPCIF_SMWDR1),
> > @@ -547,8 +545,8 @@ EXPORT_SYMBOL(rpcif_manual_xfer);
> >
> >  ssize_t rpcif_dirmap_read(struct rpcif *rpc, u64 offs, size_t len, void *buf)
> >  {
> > -     loff_t from = offs & (RPCIF_DIRMAP_SIZE - 1);
> > -     size_t size = RPCIF_DIRMAP_SIZE - from;
> > +     loff_t from = offs & (rpc->size - 1);
> > +     size_t size = rpc->size - from;
> >
> >       if (len > size)
> >               len = size;
>
> This is the second patch to split which fixes ca7d8b980b67.
>
Will split this change into a second patch but wont add a fixes tag see below..

>
> > @@ -244,7 +242,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
> >       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dirmap");
> >       rpc->dirmap = devm_ioremap_resource(&pdev->dev, res);
> >       if (IS_ERR(rpc->dirmap))
> > -             rpc->dirmap = NULL;
> > +             return PTR_ERR(rpc->dirmap);
> >       rpc->size = resource_size(res);
> >
> >       rpc->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>
> This is the first patch to split which fixes 59e27d7c94aa.
>
> Makes sense?
>
Both the fixes would apply to the first patch itself i.e. when
resource_size was added in ca7d8b980b67 and later in 59e27d7c94aa
resource_size was moved online below (this would cause kernel panic
res is NULL). Do you agree?

> If you agree, you can add my tag already to the new patches:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
Sure will add your RB tag.

Cheers,
Prabhakar

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
