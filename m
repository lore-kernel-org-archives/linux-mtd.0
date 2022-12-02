Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A728C4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j72GJL+Ql+MBxIGmGOCsq18inDCJKkF3PBZHheCs4v0=; b=IgMCJDFNk4RVL6
	Xx9DS5URPNYEEo3834CDoAC/3YnV2xQqXvCxXN5YHSC20os72psW+YBEr1+8j/RX7k1XTwZ1mIiZH
	1CE1pOo4HRMCXM7VBrJi+sA4LqeYjJH0MiWAVirQTgX4Juf9eq7CkgaCkypXfaakSOPZPlbLtscVM
	NCJLzO5LlgBg5ESOucMGZtWDU/afUVAlUrcCcps3PC0w12deJHcwoLRBOM84O2y0nElHUhzKGK822
	prYZBHTkEO9wAhr2gmXG0sOCXXkNnUgkrCLFmzNdMPK00ANu9J943dL+0HGVvBvOuJoR/eK7hffU9
	Hu2REkMSHojD65Rabk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16WZ-00Gi8m-Q4; Fri, 02 Dec 2022 13:56:19 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16WW-00Gi66-P2
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2022 13:56:18 +0000
Received: by mail-qt1-f176.google.com with SMTP id fz10so5148730qtb.3
        for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2022 05:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXuttiq+R35t3Lo1CqjcwEovWJl6+re6p/cH4Ee/PUs=;
        b=lwBni16P1YKLiNzjpXU1L7zhUQ4bRqvIQiubmD90OenKQuVJJusqG10gVHIIPv9q9G
         Ho0TqwTcQmJJ4Fzu4C4tRd6zgGbWrhkXGLZqPnZjVb7P2o+Q+vvs7EVTyCOxRZZHE6T4
         E8qxGSr6er0RG2siKZHCw5I0WbW4UxQXkEg7363BauL9U94XFrQd4OIgLjiEU5GiqJnm
         3Miidhl945XTjZWyURIKEOQF2CdKhhxPbixhpXNeqeHp3BvQyRA1nM90PTsLaY4bJPjP
         mY7HFmOt9jkbZZquBn6R/L+IjhwHYP4JDBIw3HD9ikWICNK4+4nISkiUNgDgQQ0Txj6T
         ZRnQ==
X-Gm-Message-State: ANoB5pkN0CZeJFuxi9LGy1LoP+Y+Bt5KxU+RJ1QH1+aC7sPkmhj0znpG
	pI3BMcJDoGNHVn8oq1zCt23YfAnl1uLKKA==
X-Google-Smtp-Source: AA0mqf7kOA6C8twfnx+pCCkaz9DypLvLfIUQH4f4RKjqKPKxUi6L/aY53hTSNlTZsWK19ZQ1Mm2oQQ==
X-Received: by 2002:a05:620a:12c9:b0:6f1:1ca:1b59 with SMTP id e9-20020a05620a12c900b006f101ca1b59mr46240712qkl.528.1669989374071;
        Fri, 02 Dec 2022 05:56:14 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id k3-20020a05620a414300b006f9c2be0b4bsm5454607qko.135.2022.12.02.05.56.13
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 05:56:13 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3cbdd6c00adso49085797b3.11
        for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2022 05:56:13 -0800 (PST)
X-Received: by 2002:a81:1486:0:b0:36b:56d3:71b8 with SMTP id
 128-20020a811486000000b0036b56d371b8mr1834074ywu.384.1669989373149; Fri, 02
 Dec 2022 05:56:13 -0800 (PST)
MIME-Version: 1.0
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
In-Reply-To: <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Dec 2022 14:56:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
Message-ID: <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_055616_837346_0E902FD3 
X-CRM114-Status: GOOD (  27.09  )
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

Hi Michael,

On Fri, Dec 2, 2022 at 2:50 PM Michael Walle <michael@walle.cc> wrote:
> Am 2022-12-02 14:37, schrieb Geert Uytterhoeven:
> > Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
> > FLASHes.
> >
> > Merge the new entries with the existing entry for MT25QU02G.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > mt25qu512a is already in active use, causing "make dtbs_check" errors.
> > mt25qu256a is supported by the Linux spi-nor driver, but there are no
> > upstream users yet.
>
> Is it encouraged to use the specific compatible with SPI-NOR flashes?
> As far as I know it isn't. The spi-nor subsys tries hard to identify
> any flashes at runtime and any additional information in the device tree
> is used as a last resort (just for flashes which doesn't support the
> read jedec id command yet). And usually boards have different sources
> for flash chips, so hardcoding a particular part in the device tree
> doesn't make sense.

Thanks, I am aware there have been pushbacks when trying to
document more compatible values.

IMHO either all or none of them should be documented.
If device-specific compatible values are discouraged, the bindings
should be updated to reflect that, and document a single compatible
value ("jedec,spi-nor") only.

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
