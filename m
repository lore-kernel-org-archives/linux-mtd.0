Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59105C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 01:53:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEEBD64D99
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 01:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEEBD64D99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F0EPQ3e/WVrDnve4g5Mgpv7Dbt1qdWvutX2r/s7AIjw=; b=IL3zoC11Ss+UgyaBW1+HlPVn+
	iVlkrtplki6Ag2Pyo8cIs/ZjOdPBQGkRO181tSExkIk9GBVGMNc8rjsBJeBhRRb+9cX1jBYExZqfA
	/ks/ZQz3X76RY9CV6lbjN7ZPInzhMXlofyPrr5T2b0RTtb9MwzrTXMP2xXzDehLs7Ruypw8okvVxE
	frRyUFa50ef71W3gzAwfEsoMdq2ILociWFEAYXYCf7bfhAG/YFTn26omUOWwXzjQr8Ok6AdKTZNAo
	ApAzebevXoqflqJsrEfZXqSoI/sBK8/SEDqYMxbSy6VUEa+5N7NDr5HCHeet7mOeFX3NMQd1zwDV7
	NL8ZMqm7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKAVS-008DKY-KS; Thu, 11 Mar 2021 01:52:54 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKAVP-008DJy-4b
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 01:52:53 +0000
Received: by mail-ej1-x62e.google.com with SMTP id p7so31537845eju.6
 for <linux-mtd@lists.infradead.org>; Wed, 10 Mar 2021 17:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QB223bp1Em333GDTsTwQxut+5emCQUk41ySuZ8lYHAE=;
 b=0OYveGf86C+r/sdX0HC+/3/RiOVvrtXNqI+AmOQQ1OK5Upm360KO8UBgkuDumsmE9r
 qa5zv21/Vj/ZJRbDbvWLRwjxW4KG+81UKLHeQAtQt/K4KBbC1sNvrV0r222i1Nrs5jFb
 XE2D05GWJ1l0kppMlHgH5KHNFYW15GmSQ8uMNURDFwwkzYKsPQIIKEXPrxBD82Q+cSxC
 nvgbcf6rGICIe4hGw3DU4I7xwhTqX7HZIRS06uZjK7m5kOkanyyO+S+eZHWbDm8hxNyE
 u4rVL1geDQdDXlDEfpuv7TU2fBpN47+56frbhNulAxn4hBs7qnIZCjB0te+d0/N0bTtw
 Lt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QB223bp1Em333GDTsTwQxut+5emCQUk41ySuZ8lYHAE=;
 b=kmGW3YYbKGEpZjwTUyySFDLddxOU6KhVjxzagqNoUR9paVvGiW6GiF/+mGYl9t4gM8
 q8LpXZx8Bxs2Svh/lyn2lIGEh7MB/SXVYw6XGhkjphz0WbUQMAoScepuhMzJayUIg0V+
 TYil6ALLFICOgTo4pCo15to5An8AG9ozHjy6bZRFZYkC6RQdI9UN603HCRC/kZHEPQDe
 k8B+PM3YoEOvZNevca2Jv3TgkdXyyfutPjwC2/S0PYiupHEC2+V2pZ27tkVIprbgtmGx
 W931ejUBF8et42Z3aZxe6GfOI+7PRN7OJtiXz52tvqz3f+qdNZrPvuzksbjTvvW6QUGj
 vFHA==
X-Gm-Message-State: AOAM530TTI6uf0l1TQjUPj5h7mQlD+/QkUgEiwOajbbTeSibO8SKMn4L
 hHbk3S5GlNtF4ICAUrSARdTEbXVaANxgB4Z6h6oSvceZMzfUQOd7
X-Google-Smtp-Source: ABdhPJwM9E9CqbfvXxPoIKdz6VLrM5ta6QNyhypWzaZANcUDgeMODn401RQk09cF1Hv4rRhXjiVJoF+GhaPv/kkrIMI=
X-Received: by 2002:a17:906:789:: with SMTP id l9mr709774ejc.161.1615427570161; 
 Wed, 10 Mar 2021 17:52:50 -0800 (PST)
MIME-Version: 1.0
References: <20210309220014.22205-1-tharvey@gateworks.com>
 <8ca5c54140d69307f3c08ca85a09f0b5@walle.cc>
In-Reply-To: <8ca5c54140d69307f3c08ca85a09f0b5@walle.cc>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 10 Mar 2021 17:52:38 -0800
Message-ID: <CAJ+vNU3_q_kmZKrr0V5_1zgDSWrSneL0nBJhch33Ku0xRqC5Ug@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: at25: add Fujitsu MB85RS4MT
To: Michael Walle <michael@walle.cc>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_015251_296278_B6418D28 
X-CRM114-Status: GOOD (  18.60  )
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

On Tue, Mar 9, 2021 at 2:59 PM Michael Walle <michael@walle.cc> wrote:
>
> Hi Tim,
>
> Am 2021-03-09 23:00, schrieb Tim Harvey:
> > Document the compatible value for the Fujitsu MB85RS4MT SPI
> > FRAM EEPROM device so that it can be used in DTS files.
> >
> > This is a 512KiB FRAM EEPROM.
> >
> > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > ---
> >  Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/eeprom/at25.yaml
> > b/Documentation/devicetree/bindings/eeprom/at25.yaml
> > index 6a2dc8b3ed14..f594db72b711 100644
> > --- a/Documentation/devicetree/bindings/eeprom/at25.yaml
> > +++ b/Documentation/devicetree/bindings/eeprom/at25.yaml
> > @@ -26,6 +26,7 @@ properties:
> >                - anvo,anv32e61w
> >                - atmel,at25256B
> >                - fujitsu,mb85rs1mt
> > +              - fujitsu,mb85rs4mt
> >                - fujitsu,mb85rs64
> >                - microchip,at25160bn
> >                - microchip,25lc040
>
> Hm, the driver is spi-nor but this is for the at25 driver. Is
> this correct? Doesn't it work if you just add the ID to
> spi-nor/fujitsu.c and use 'compatible = "jedec,spi-nor' ?
>

Michael,

Yes it works just fine as 'compatible = "jedec,spi-nor"' and that
makes sense. I'll drop this patch and update my device-tree
accordingly.

Thanks,

Tim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
