Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A83AC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 22:40:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B50A64F88
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 22:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B50A64F88
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uudt1DujZ3A00dUJFeW8tpcZ35UFz3DtZK6hWmSD3BI=; b=BN7cyIyYBDr69Gvjk3/vuFt9P
	rWIkrn1Lm315j5v+nNzuUiBq1YTAZfGuO6cz0+69YscOtN9jHwlggqHnGtydHYz2S7GZY7DhnLVJ/
	eHNYWsOAUtQwNxwE78t6QWNAKLFwbxnxRwNlMj3L8KSHeEt9WMbgekvecW75k2FSHuHYYKmMeJ3Q4
	GnrjRNusXJjDKgQAfe+HojJu/Mb6fXWQzreAnHYoJW5u0H5xiLjmbwF5r8laMemV731CBvBEpE8JF
	p/85ITumkAJmp5393QFk5UawFq01Vrn4rLZizrhJsxFCdGi2MpXsGKYPhqRybsz+OedsQRYCaXF52
	zXSxrku/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKTxl-00AB3F-D3; Thu, 11 Mar 2021 22:39:25 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKTxh-00AB2v-1z
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 22:39:23 +0000
Received: by mail-ed1-x534.google.com with SMTP id e7so5231380edu.10
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 14:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uoDXPuEltWUDmhb2tWhGvs+JKaUo3rAAVx8gEHgYL3A=;
 b=wNJ3p351Wwf0EhnLLfleqU4QXb5i4DQy1bkaQS34GVpfwGYK9jDNRy6PLZXw8Ouzij
 ffWdMFhQj46GRebK8TLdMvMF6e9BOFyHfZqZz+zij2D3EhmzudQKFK4De3t0Na/CLtye
 OEeIgqrLDd8YGmpcMJf/kYB7fjsUtWMn7yutV7Zih07QEj9b8xk2PpMOny2L0kEXXkAY
 otlpXQv8OT+EYrEGWOr+LuROUpAGaMO1fub6m+X0lcep+LgVhKlsxWa17RWV7D2HQyrx
 X8Ra9FE9TN6sZB4I7rii6vy9Dvkyn6b9sh4NahQhZnpUE/BSCz1rYfy1VldK4EDFOu3J
 a/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uoDXPuEltWUDmhb2tWhGvs+JKaUo3rAAVx8gEHgYL3A=;
 b=KUkyy8e9HLqFgHdylnZk61tVFg3vV9m2K4DdJFTqyUvpgLirlv6aJOgeupi90TmaAA
 Ek3UEsze/3qUEfz3+RxlWOwEuOkxOTx+P3QHeIShwacMYZeOSrU7rTJSm1KSGIPLzoLS
 1ZkYHSUhw8n/QgLPM9sdlGo4BWF4Pn1DMQEcgqTnaGACVJlWAM5VqbGOECRfMxYFRIlh
 M7XYwUkPEJIJBiGACVy4In9iw50oPeuqTpZonujZVPZpCfZeyM4U+62mKZ0bjnBpnbcj
 nYavyF5k6dFNyX3iQN/KzTKl2MoYgJWC3Ndvqo3NUASYdG/v38vZZqSz5P+EdwU+XRiI
 MW4w==
X-Gm-Message-State: AOAM533fjKfxPjpq4yNz2fHHTK8MYFK17x6L/ndVkJiTy9ruJkExRNQJ
 UtPQZjsf3x67YoxOHXvuLofj8VOkuPK7G1g0MU649g==
X-Google-Smtp-Source: ABdhPJxFCHW41oZM+KJq47cRWr1Lwi4C6YnH9CA7LscoTteL7r9GHEnz1aWgVD1O7Qa/kZr+pCxb3iU8gTrmbuxUp8M=
X-Received: by 2002:a05:6402:3486:: with SMTP id
 v6mr10850409edc.109.1615502360302; 
 Thu, 11 Mar 2021 14:39:20 -0800 (PST)
MIME-Version: 1.0
References: <20210309220014.22205-1-tharvey@gateworks.com>
 <8ca5c54140d69307f3c08ca85a09f0b5@walle.cc>
 <3d497991-1470-e188-8be2-e5992dfa914c@microchip.com>
In-Reply-To: <3d497991-1470-e188-8be2-e5992dfa914c@microchip.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 11 Mar 2021 14:39:07 -0800
Message-ID: <CAJ+vNU1urqqDKrH5HNsUz=Wb-Rtr+dMzEnJ3=gMJv6+qz29n2g@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: at25: add Fujitsu MB85RS4MT
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: Michael Walle <michael@walle.cc>, Richard Weinberger <richard@nod.at>,
 p.yadav@ti.com, vigneshr@ti.com, 
 Device Tree Mailing List <devicetree@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_223921_413136_7746ED39 
X-CRM114-Status: GOOD (  28.67  )
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

'On Tue, Mar 9, 2021 at 9:34 PM <Tudor.Ambarus@microchip.com> wrote:
>
> On 3/10/21 12:59 AM, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Hi Tim,
> >
> > Am 2021-03-09 23:00, schrieb Tim Harvey:
> >> Document the compatible value for the Fujitsu MB85RS4MT SPI
> >> FRAM EEPROM device so that it can be used in DTS files.
> >>
> >> This is a 512KiB FRAM EEPROM.
> >>
> >> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> >> ---
> >>  Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/eeprom/at25.yaml
> >> b/Documentation/devicetree/bindings/eeprom/at25.yaml
> >> index 6a2dc8b3ed14..f594db72b711 100644
> >> --- a/Documentation/devicetree/bindings/eeprom/at25.yaml
> >> +++ b/Documentation/devicetree/bindings/eeprom/at25.yaml
> >> @@ -26,6 +26,7 @@ properties:
> >>                - anvo,anv32e61w
> >>                - atmel,at25256B
> >>                - fujitsu,mb85rs1mt
> >> +              - fujitsu,mb85rs4mt
> >>                - fujitsu,mb85rs64
> >>                - microchip,at25160bn
> >>                - microchip,25lc040
> >
> > Hm, the driver is spi-nor but this is for the at25 driver. Is
> > this correct? Doesn't it work if you just add the ID to
> > spi-nor/fujitsu.c and use 'compatible = "jedec,spi-nor' ?
> >
>
> Tim,
>
> Can you try and see if you can work with this flash by setting "atmel,at25"
> compatible?

It does not work with 'atmel,at25'. I was fooled into adding it to
at25.yaml because that is where the mb85rs1mt compatible was. I
suppose at some time the drivers were split as mb85rs1mt is clearly in
the spi-nor driver now.

I will drop the patch to at25.yaml and now that I realize all I need
is 'jedec,spi-nor' I won't need any bindings patch.

>
> There are some SPI NOR-like flashes MRAMs, FRAMs, even EEPROMs, that share
> a part of opcodes of SPI NORs, but have slightly different characteristics
> (ex. no erase, no wait times for writes on FRAMs).
> See the patch series submitted by Richard, that I have stalled:
> https://patchwork.ozlabs.org/project/linux-mtd/list/?series=208584&state=*
>

This series makes sense to me. I tested it and indeed it provides a
vast performance improvement. Richards patch would collide with my
patch that adds the mb85rs4mt detection. Let me know what you're going
to do there and if you need me to rebase 'mtd: spi-nor: fujitsu: add
support for MB85RS4MT' on top of it.

Best regards,

Tim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
