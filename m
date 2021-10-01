Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A0FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 08:03:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D055361A6F
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 08:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D055361A6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jkxN2Bl/8CQoj9GIt0LRWI7D+78A9/mWFZ7uz+xE/Dw=; b=vJ5GGv3bvbXuGcYvgIUaMN2VlW
	Pa2Xgq93ZtM7xdYtRIlynmUHv95zbMUQlS8lfyfe6BXWl50CBq3HoUX58S/P9EOohTlI15YYAdGG5
	O6LT7bTnIrchab4FrHRvX382692Xqu3li1Vp0xdxBw4KYnXaPqQnx1Z4xH5N6fInNpRScrpZXRXWR
	oxXe6qconZnzgp3+20My7qG6vt05me02KWxlrA/uZMV/drXpEtGPDb9zg9kTDVNUG3mZ/awlrNsUd
	BJ/TX0kOFECvydGP5Q8UBDb93YBNuwNSpUK485oXWZ2PfL5Wsh+Pm+ocD95+JPGgYSCWrf+l7yeI5
	MFwawQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWDV6-00Gxoa-Qq; Fri, 01 Oct 2021 08:02:36 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWDV4-00Gxo0-6I
 for linux-mtd@lists.infradead.org; Fri, 01 Oct 2021 08:02:35 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id v10so18757288ybq.7
 for <linux-mtd@lists.infradead.org>; Fri, 01 Oct 2021 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=iXAtNm3MaeSAViv8FbXNKxnICMX5iqycQz5HxnThtRI=;
 b=Zk4T+m66GYQ1CRsRurqkFu7lkvaEmg1wDknACxkzpMicIYhX8i/CoTUjX7i5OYVxIB
 w8EM/pxHtXo81HWPjtvFAYK/qZ0cQ9ZTrrRZKK+d/cHAU2DPADLk3ns30aTr2YdOqVsm
 8dJCyAzTiMiPixhJKgscB9X533yKU2N828H6y3Z9H/copWhcODhuNi3fEnRx+3xkLBiF
 I0fGnsZSZ46fXTv7ClN53r1InJ7+gDLKhbEOXK0r5hbvSf9kWX4X7V3tyoGfkUgoPrgG
 fub6hD7pc2wWHZuWQIHPU1a45EFCgV1nb9X3EPCKoby4nxmrAR2RdsEMwc9xPvSqn4xF
 si1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=iXAtNm3MaeSAViv8FbXNKxnICMX5iqycQz5HxnThtRI=;
 b=Id1XrlVMUsVRKDi3X8ZRggxln3oPr0nbiy8ina1nZScCoDDrsatf/yR9OIhalIo/u2
 d70ZjXEeM2t2bgdmD2yJmmH7E/AyoEBWX5s7kEguAlGLAHGkIL2l5Qv6RS5dYysdTQpj
 Ah9CreVWny0x8QvEa0R9PFNOU6VMMeeGP+pk8bdlVo+KWDEITGJA+c4V5bbIDe34nf6d
 qOMUP6XKB3RmzZk8wEljevfR8nh4/Akx8l2HXI6R5Ry/UkkxquNGoSO5giHKwVWLY/Jr
 5U36RIOWRMNd2Ts6In0KVtCkRJSoZh27WnS54c8hk9yjrnUVV+60IPGdw82qS80m5abC
 aCAA==
X-Gm-Message-State: AOAM531BYiRHklR5z778rTxam8PUbZ9IEta1Xi0TSdpnVw1/QC+zNZ1N
 AeTWxc1RSZRacueJoTn7W11+iMddEXzHnT9gulE=
X-Google-Smtp-Source: ABdhPJyg5/kS7DOVYejKI/QD6YDrZTyTm0+TOQS+y7BnCHJaDMliZlHOtX/hL7s9U8TTquH5K2BwEkP86jcm3348YNo=
X-Received: by 2002:a25:e044:: with SMTP id x65mr4446608ybg.131.1633075352741; 
 Fri, 01 Oct 2021 01:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YVXMc1A4D/y4kjim@shikoro>
In-Reply-To: <YVXMc1A4D/y4kjim@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Oct 2021 09:02:06 +0100
Message-ID: <CA+V-a8sDSsyTGfTeQfG_ZhfrJHCm+2kBTEDWaoFMTgsMOmxEgQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] memory: renesas-rpc-if: Add support for RZ/G2L
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
X-CRM114-CacheID: sfid-20211001_010234_289077_F85DDE07 
X-CRM114-Status: GOOD (  25.19  )
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

On Thu, Sep 30, 2021 at 3:40 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> >  #define RPCIF_CMNCR_IO3FV(val)       (((val) & 0x3) << 14) /* undocumented */
> >  #define RPCIF_CMNCR_IO2FV(val)       (((val) & 0x3) << 12) /* undocumented */
> >  #define RPCIF_CMNCR_IO0FV(val)       (((val) & 0x3) << 8)
> > -#define RPCIF_CMNCR_IOFV_HIZ (RPCIF_CMNCR_IO0FV(3) | RPCIF_CMNCR_IO2FV(3) | \
> > -                              RPCIF_CMNCR_IO3FV(3))
> > +#define RPCIF_CMNCR_IOFV_HIZ(val) (RPCIF_CMNCR_IO0FV(val) | RPCIF_CMNCR_IO2FV(val) | \
> > +                              RPCIF_CMNCR_IO3FV(val))
>
> Is RPCIF_CMNCR_IO3FV and RPCIF_CMNCR_IO2FV actually documented in your
> datasheets? I am asking because I have a patch pending to remove writing
> to undocumented locations. So, I was aboout to remove the IO3FV and
> IO2FV macros.
>
Yes they are documented, you should be able to download the HW manual from [1]

> > +#define RPCIF_PHYADJ1                0x0070  /* R/W */
> > +#define RPCIF_PHYADJ2                0x0074  /* R/W */
>
> Those are named 'PHYADD' and 'PHYWR' in the Gen3 documentation. They are
> only available on a few of the Gen3 SoCs. I think the Gen3 namings make
> more sense because then it becomes easily understandable that the
> registers are used to write something to the PHY.
>
Agreed, will re-name it as per Gen3.

> > +#define RPCIF_PHYCNT_CKSEL(v)        (((v) & 0x3) << 16)
>
> We should add a comment here that these bits are only valid for G2L...
>
Will do.

> >  #define RPCIF_PHYCNT_STRTIM(v)       (((v) & 0x7) << 15)
>
> and these only for Gen3.
>
ditto.

>
> > +static void rpcif_timing_adjust_sdr(struct rpcif *rpc)
> > +{
> > +     u32 data;
> > +
> > +     regmap_write(rpc->regmap, RPCIF_PHYADJ2, 0xA5390000);
> > +     regmap_write(rpc->regmap, RPCIF_PHYADJ1, 0x80000000);
> > +     regmap_write(rpc->regmap, RPCIF_PHYADJ2, 0x00008080);
> > +     regmap_write(rpc->regmap, RPCIF_PHYADJ1, 0x80000022);
> > +     regmap_write(rpc->regmap, RPCIF_PHYADJ2, 0x00008080);
> > +     regmap_write(rpc->regmap, RPCIF_PHYADJ1, 0x80000024);
>
> Can't we have defines for these magic values? At least in my latest Gen3
> documentation, these values are explained.
>
RZ/G2L manual doesn't explain these bits. Let me refer to R-Car Gen3
and define them as macros.

> > +
> > +     regmap_read(rpc->regmap, RPCIF_PHYCNT, &data);
> > +     regmap_write(rpc->regmap, RPCIF_PHYCNT, data | RPCIF_PHYCNT_CKSEL(3));
>
> regmap_update_bits?
>
will do.

> > +     if (rpc->type == RPCIF_RCAR_GEN3) {
> > +             regmap_write(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_STRTIM(7) |
> > +                          RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260);
> > +     } else {
> > +             regmap_read(rpc->regmap, RPCIF_PHYCNT, &dummy);
> > +             dummy &= ~RPCIF_PHYCNT_PHYMEM_MASK;
> > +             dummy |= RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260;
> > +             regmap_write(rpc->regmap, RPCIF_PHYCNT, dummy);
>
> regmap_update_bits?
>
Im a bit hesitant to use regmap_update_bits() here as some of the bits
are not documented.

[1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-arm-based-high-end-32-64-bit-mpus/rzg2l-general-purpose-microprocessors-dual-core-arm-cortex-a55-12-ghz-cpus-3d-graphics-and-video-codec

Cheers,
Prabhakar

> Rest looks good.
>
> Thanks and happy hacking!
>
>    Wolfram
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
