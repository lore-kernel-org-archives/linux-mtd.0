Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB83C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:44:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A1AD610D0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A1AD610D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7cPC+wZZoULYgta43XVSQlqFj75W1cj+8SdnlWqT0k=; b=CA5EIQ5uTQC8J9
	23aay7F95PSm+RYI0MCVDUBOQxsIkzUKYpwrF44W4ervN4tdM2CBJrG7zarnHwr4XBFMjVRD6lK9k
	7VcKGArvcVTKAq0FMLTwppegyygeUCZtE3pWWg8/BBTiEZSyQE/y6cJbFtqkUzSo/KAV/ciFLV8AO
	tiilpp6u9srJQsUEiHCoQuMNT9wIGxCTSOjAJbZEDwY/E+12Eqw6zFLyhprGZulbVhK3MC25Jneep
	lFrpN8DxG7ZlF30EOZ3Hkhd0nEWrm4184ofW7PwMnoRolLORxFv7HfdnlTC923mIPZyr2Efc4zuzA
	xMlYbsmecaFw7fSUpo6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnzUe-009oEw-1M; Fri, 19 Nov 2021 08:43:36 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnzUb-009oDX-5W; Fri, 19 Nov 2021 08:43:34 +0000
Received: by mail-ua1-f47.google.com with SMTP id r15so19778793uao.3;
 Fri, 19 Nov 2021 00:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8WOd2SODEE+htCsUwpfTOfsY7kLZIEqXetxyg07nI8k=;
 b=yanTCB0CHnqcV/LXBgbvr47xkRotXj1zwGb73ypBe5jImVcw/J7VdXyjt1vZgqLmyg
 Sh2rKH9stkeTPAZN/fi7EhNSbIs6TINP0K3WGxc4IKJnP6auDuwXogvPoJgUeicQ2Him
 SL0iObMONjF68APLBYnVjvAcOBNIbz5vHvNMedwu9Hq8k9IOyRnN/rJNcOu5qGIF/R1V
 YCxF7Qv0nmcgODUb+J4K8Go1sB6mH6QQOCJLtKvPtuoT7dldIlwONHRFxslqUb2G9I1D
 9SHbeo8diWpsrY+T244gQ4o0Um48/o3UU3wFnARUWUQylxQO+H9S/fYScvF0ifkx3ndP
 tXBQ==
X-Gm-Message-State: AOAM530pVmw9nnXSAnZuLItHizevuQ1+TidPbxGglgU21hrZrAVfH4CP
 tFK92QllDLd79wwtt6/5sO8pU1AC7+ueHw==
X-Google-Smtp-Source: ABdhPJyaSzQF0uUy3LEJa4TeW3vJWtLS6EJhvZRSYYZFSFYM7OVTpHj7dQ02ZQTgQfvZjsRPauEpdQ==
X-Received: by 2002:ab0:378b:: with SMTP id d11mr47024985uav.61.1637311411616; 
 Fri, 19 Nov 2021 00:43:31 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id c9sm1500135uaf.12.2021.11.19.00.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 00:43:30 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id b17so19858644uas.0;
 Fri, 19 Nov 2021 00:43:30 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr46605103uae.122.1637311410025; 
 Fri, 19 Nov 2021 00:43:30 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-2-miquel.raynal@bootlin.com>
 <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
In-Reply-To: <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Nov 2021 09:43:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMJ+KMSCWRs3KpzMnf2KkQjbXqFPH9ceJ5y04mQzv6=w@mail.gmail.com>
Message-ID: <CAMuHMdWMJ+KMSCWRs3KpzMnf2KkQjbXqFPH9ceJ5y04mQzv6=w@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1 NAND
 controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, 
 Milan Stevanovic <milan.stevanovic@se.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Gareth Williams <gareth.williams.jx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_004333_230695_A60A424F 
X-CRM114-Status: GOOD (  24.29  )
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

On Fri, Nov 19, 2021 at 9:41 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> > Add a Yaml description for this Renesas NAND controller bindings.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/renesas,r9a06g032-nand-controller.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/N1x NAND flash controller device tree bindings
> > +
> > +maintainers:
> > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > +
> > +allOf:
> > +  - $ref: "nand-controller.yaml"
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a06g032-nand-controller
>
> As the NAND Flash Controller is present on all of RZ/N1D, RZ/N1S,
> and RZ/N1L, I think you should add a family-specific compatible value
> "renesas,rzn1-nand-controller" as a fallback.

And please rename the file to renesas,rzn1-nand-controller.yaml.

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
