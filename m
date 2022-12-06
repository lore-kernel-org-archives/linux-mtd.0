Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC33C3A5A7
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KP6pup7Ey/bRp9TUElwprfT0E1eI78fC2v0X+Yw31xk=; b=0t6oSpGzhnOvm1
	yjhxgQG1OQoZlHCZ9FbvKP8fR5ST2RKRA8ozXCObTuFleZGpZtEHXgNA+DAuLzKscH9hKBW7VvzwB
	fLE6srCbOdjHIKc0dvBzUybewg2YYjjT4FS92jHjaZt6B8bK4IENtMH31xjRzVgSaGM3gkkOPOhsc
	xVrZZMGlJsGNoS7sQivNPSjicJXmxhNAnYMYRCmn/A9qqY1QM/44XJIP0h3iAAnNS8xsf/nR0NdY+
	9wYcCu9gzrlhYUhZiQoP39vAu62zecJVdDdPuqYmZcyexOZKnI+TGa/KBJ62UZIPrVVe8IeZax2ao
	r8Ej51Pbr9rUQjiwn4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TO5-004uSX-LJ; Tue, 06 Dec 2022 08:33:13 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TO0-004uQd-Nz
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2022 08:33:10 +0000
Received: by mail-qv1-f45.google.com with SMTP id s14so9925212qvo.11
        for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2022 00:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufiPGRxn+u+eF7V9lbnW/2wOS52DtOLgEOMLvePrXwg=;
        b=AGoszs+3zXs8H5uPSKEMyq4+EbBl9QJYtWfjQkBOaJUkMsPkMumqSOpG/DvXwewalW
         nvf34s/M7r4Lc3CThMPSVomfIykU8f41phLLOEaZidWZWOT4MGW+TqtblgI+J49x3ZSD
         6o2RN0CBY3CTt7jrIHIqrnFsFObb9/DwzTdeiFlUbodXZa8dOhLKjsQ3E37fBw3dQjg9
         HW344avem9q+WQIgre6jQEvm7dHj1PADLklUGnKAuqX/kn1DX3PMEC1rFGbcAS+RZ80i
         tL3hkSUBWjgfJv+9feWKdcRvXW+Sc4gR0ZHnygTV4vcsjVLv+i1XZgjEwl/pHc9b/ndI
         +uPg==
X-Gm-Message-State: ANoB5pmI99DxIif2mR8Fh7Q+9OSW2VkAQzF8kn9Dle2aXdI6sT/OO/5/
	HpeiCnXZeqgpQ8PPwNEllXwvc+/lU+kOsQ==
X-Google-Smtp-Source: AA0mqf5ntO7p8fyTO1/Dfmf8+gxg2BAfK2DhMzRo+WGErpm2/9KxFJkbWoj4qOSRTb+3TKq0mejiWw==
X-Received: by 2002:ad4:5811:0:b0:4c7:8952:630b with SMTP id dd17-20020ad45811000000b004c78952630bmr216551qvb.126.1670315585647;
        Tue, 06 Dec 2022 00:33:05 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id w42-20020a05622a192a00b003431446588fsm11092788qtc.5.2022.12.06.00.33.04
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 00:33:05 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-3b56782b3f6so144113257b3.13
        for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2022 00:33:04 -0800 (PST)
X-Received: by 2002:a81:1486:0:b0:36b:56d3:71b8 with SMTP id
 128-20020a811486000000b0036b56d371b8mr16028867ywu.384.1670315584377; Tue, 06
 Dec 2022 00:33:04 -0800 (PST)
MIME-Version: 1.0
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc> <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
 <20221205163306.GB2012644-robh@kernel.org>
In-Reply-To: <20221205163306.GB2012644-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Dec 2022 09:32:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
Message-ID: <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
To: Rob Herring <robh@kernel.org>
Cc: Michael Walle <michael@walle.cc>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_003308_797490_AF87DCD1 
X-CRM114-Status: GOOD (  33.57  )
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

Hi Rob,

On Mon, Dec 5, 2022 at 5:33 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, Dec 02, 2022 at 02:56:01PM +0100, Geert Uytterhoeven wrote:
> > On Fri, Dec 2, 2022 at 2:50 PM Michael Walle <michael@walle.cc> wrote:
> > > Am 2022-12-02 14:37, schrieb Geert Uytterhoeven:
> > > > Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
> > > > FLASHes.
> > > >
> > > > Merge the new entries with the existing entry for MT25QU02G.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > mt25qu512a is already in active use, causing "make dtbs_check" errors.
> > > > mt25qu256a is supported by the Linux spi-nor driver, but there are no
> > > > upstream users yet.
> > >
> > > Is it encouraged to use the specific compatible with SPI-NOR flashes?
> > > As far as I know it isn't. The spi-nor subsys tries hard to identify
> > > any flashes at runtime and any additional information in the device tree
> > > is used as a last resort (just for flashes which doesn't support the
> > > read jedec id command yet). And usually boards have different sources
> > > for flash chips, so hardcoding a particular part in the device tree
> > > doesn't make sense.
> >
> > Thanks, I am aware there have been pushbacks when trying to
> > document more compatible values.
> >
> > IMHO either all or none of them should be documented.
> > If device-specific compatible values are discouraged, the bindings
> > should be updated to reflect that, and document a single compatible
> > value ("jedec,spi-nor") only.
>
> That's already allowed, so there's your answer.

It's indeed allowed, but the alternative is documented, too (for some
values).

> The caveat is don't be adding them later to your DT when you find an
> issue and new quirk properties will probably be rejected.

Adding them later to your DT when you find an issue makes no sense,
as that breaks compatibility with older DTBs.

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
