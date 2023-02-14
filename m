Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1531CC05027
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Feb 2023 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQ/HJzEEubmvs7zFM46UAtqLEKkLhyMsChrhppXQ7Bg=; b=ddwYDtpH/A8wzX
	jHeWlIZFtrrsdKpXM8lL1t/PEQqGg1M1Pq3dLXvRC2c6CcpQUw7dfRLzdwLdhBJvSiAmITvhufvK4
	jsrd/xCNkhvEeHHtuQoeIrLk1MGMEkjaaecgc1L9BPnY5C1dv2jQTpYN8yr/gK6oWrKGes/iGTN3l
	gqg8MKW/0NrdXcmYyVsFvdb7Fy1U2sbkypR64OFVoY71NppwC6jlKPgIKNa6z+m7q5pFh+SgCXXfx
	MQ+yy/Cgnbtlfb7S692Gy2YjqygraXtnqNR4EDebHY7n8Ux0W9iypez2fF3HSSA57zys3FGzHtefs
	+FCOorYW3XCGN7KEhTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRx8e-002WIN-H2; Tue, 14 Feb 2023 15:22:36 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRx8Y-002WEl-NZ
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2023 15:22:32 +0000
Received: by mail-qt1-f181.google.com with SMTP id w3so17779429qts.7
        for <linux-mtd@lists.infradead.org>; Tue, 14 Feb 2023 07:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SHQ35UeliM91D1wLKZjKtKGrS2DGLJ/hyCLpMmalEE=;
        b=Gx3w3h3BwOauXZoIRHZZjNCFUrTBUvNJdLNaxK6OVTJkrJ8OSSFXVjafS16U2eAPzD
         dyVCYVY+eZmBuZqV42IBUsD3QSw03NPcv4GGg6fH3zQyQDFkkJ4p6Jnylh8JZg2JuZ2m
         4XZtrHcC8qAvKR45Gw5jvQAtW1MiD47j7PgOLeOIMjKjfIqRT7RCAiAP0fQDolbhut7E
         bbkq+9jSicceNYfhfoo/edSE0ahL03zzcG2qvhbhD3K6rlau8mEkmZ9dDzoBXfyx2o3R
         9ejITY2GyBCAwVSYxulHDvBtXHptzjsJ9pPnVYqaqxq86bxWys2gwY1VKN+SvFTyyeuF
         nIEw==
X-Gm-Message-State: AO0yUKWnbUKh+Qfy/hHkIZWf9SBvW4d8OIuOnmnPZRlqSPGwJ1IxD+3S
	EtCdF7P8+hXjH6GLjL6RpffXI4JwnB8hqzgr
X-Google-Smtp-Source: AK7set9QAPRpOWYSm+P9a0a1rxdmGJLHvcA+WiPUOKuIdnGURx6jhrVpmbFnMjQ/cHXcqUHvRXaeUQ==
X-Received: by 2002:a05:622a:14cf:b0:3b8:3391:bde5 with SMTP id u15-20020a05622a14cf00b003b83391bde5mr3903008qtx.26.1676388148113;
        Tue, 14 Feb 2023 07:22:28 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id q1-20020ac84101000000b003b9dca4cdf4sm11362450qtl.83.2023.02.14.07.22.26
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 07:22:27 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id x71so17643129ybg.6
        for <linux-mtd@lists.infradead.org>; Tue, 14 Feb 2023 07:22:26 -0800 (PST)
X-Received: by 2002:a05:6902:14d:b0:921:783:f2f5 with SMTP id
 p13-20020a056902014d00b009210783f2f5mr231912ybh.574.1676388146523; Tue, 14
 Feb 2023 07:22:26 -0800 (PST)
MIME-Version: 1.0
References: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
 <20230214154433.6a421c51@xps-13>
In-Reply-To: <20230214154433.6a421c51@xps-13>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2023 16:22:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVK7vOTNMF53SvHn8LtiHX7MSN-Fp80jngSsosYBhhrHQ@mail.gmail.com>
Message-ID: <CAMuHMdVK7vOTNMF53SvHn8LtiHX7MSN-Fp80jngSsosYBhhrHQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_072230_797902_B54DC5F3 
X-CRM114-Status: GOOD (  30.80  )
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

Hi Miquel,

On Tue, Feb 14, 2023 at 3:44 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> geert+renesas@glider.be wrote on Tue, 14 Feb 2023 15:26:43 +0100:
> > SPI EEPROMs typically support both SPI Mode 0 (CPOL=CPHA=0) and Mode 3
> > (CPOL=CPHA=1).  However, using the latter is currently flagged as an
> > error by "make dtbs_check", e.g.:
> >
> >     arch/arm/boot/dts/r8a7791-koelsch.dtb: flash@0: Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
> >           From schema: Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> >
> > Fix this by documenting support for CPOL=CPHA=1.
> >
> > Fixes: 233363aba72ac638 ("spi/panel: dt-bindings: drop CPHA and CPOL from common properties")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > index f86255ce13af0871..bb62ac4585822982 100644
> > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > @@ -76,6 +76,13 @@ properties:
> >        If "broken-flash-reset" is present then having this property does not
> >        make any difference.
> >
> > +  spi-cpol: true
> > +  spi-cpha: true
>
> I see that spi-cpol and spi-cpha are described in spi-controller.yaml
> which references spi-peripheral-props.yaml, but jedec,spi-nor.yaml
> only references spi-peripheral-props.yaml leading to spi-cpol and
> spi-cpha not being recognized as valid properties.
>
> Wouldn't it be cleaner to to have these two properties defined in
> spi-peripheral-props.yaml instead?

They were moved out of that file by the commit referenced in the
Fixes: tag above, because they are not supported by all SPI targets.
It's the responsibility of the SPI target bindings to list what is supported.

>
> > +
> > +dependencies:
> > +  spi-cpol: [ spi-cpha ]
> > +  spi-cpha: [ spi-cpol ]
> > +
> >  unevaluatedProperties: false
> >
> >  examples:

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
