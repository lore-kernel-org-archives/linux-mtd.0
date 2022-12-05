Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4F6C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 16:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rC+gmYH1Vf5xd4XB2tvNKutLxAhX5pXhHNqI1OI8vqE=; b=sBF15cr5M0MGH9
	UHn94ADd/iZOiaq3mpYjCdXT1FZWpfWJ5AcMfTyG+LsB0p9ROqtEnd7r1pwmvjK91qOEbzbUyIipu
	NnmscLf1OY7HcJb9Ky30ED25mADvdIgr3qp1/ex5DrehkGqQCGYgbnOLTcDg33tc+FUfp+M8/4m8e
	v6UktXRlu3z9xKY38Y3GLMV2rtVDj6D+LXR46c4zFiSGvhltF0hrkwovvlw7jCEe//5GLtxGGOVLt
	1yyx9QUvtlz2aRENJv2rULgOQN1cgv5H32X8kyfswm6eYRv/37R8ERKjZQLtcn+a0ucL0VZnJrI2v
	umL0Vj4RERTofpXy0ouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EP0-006Vid-Tw; Mon, 05 Dec 2022 16:33:10 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EOy-006VgM-FR
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2022 16:33:09 +0000
Received: by mail-oi1-f169.google.com with SMTP id t62so13621420oib.12
        for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2022 08:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqhqp0ZXnkI0q0Biib9w/buyr5MoNs1FLwzcB1Vt6bM=;
        b=J9Z4etp3FP50WTVU59Ul/8pShIPIvFpSvTautqTrY217OmJiEqfSB6fyTxIRnsT+bF
         2kWxJQRHudEC1guzKxabRG1TI0lwDOD1mxA5DyuGNtIahmwwziRVs0MXreEZXQ4kU3js
         pPx7rafpXgmJJbl9uwVgwNkBEQNKWBavairbNFHHgsxnc2MvK/Cu/0C/5aHhnUT/Y97T
         zsmjLCKsjL0Bc+XLzOdzogoWTIOdUi3uQOUdteldDFQU0NnARZiqNrx+R//jeZUrm1b4
         xiHZf16qhEfP2e4ukKo2KXQ28nIfl27k78FnZExxY3zfJC18Wp3tWfhtl1M5xUVgIzfg
         q1wg==
X-Gm-Message-State: ANoB5pn8SI88nZn+KbhxOdQ5tv6iaVbhXM8e5s/PjkOP8ApGpfSn3PuS
	glReUmkYMPm5+CD96kCtdg==
X-Google-Smtp-Source: AA0mqf4MvfbOP05MYi3I90IViiSBgYnNTh5GEOHb/N8V1hTeGsbZjHM0XH27IkGpGsVY9fC3KRZDQA==
X-Received: by 2002:a54:451a:0:b0:35b:3f80:32e8 with SMTP id l26-20020a54451a000000b0035b3f8032e8mr29418287oil.177.1670257987238;
        Mon, 05 Dec 2022 08:33:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j2-20020a4a9442000000b0049f0671a23asm6803680ooi.9.2022.12.05.08.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 08:33:06 -0800 (PST)
Received: (nullmailer pid 2034077 invoked by uid 1000);
	Mon, 05 Dec 2022 16:33:06 -0000
Date: Mon, 5 Dec 2022 10:33:06 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Walle <michael@walle.cc>, Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
Message-ID: <20221205163306.GB2012644-robh@kernel.org>
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
 <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_083308_570933_2BADF46D 
X-CRM114-Status: GOOD (  23.47  )
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

On Fri, Dec 02, 2022 at 02:56:01PM +0100, Geert Uytterhoeven wrote:
> Hi Michael,
> 
> On Fri, Dec 2, 2022 at 2:50 PM Michael Walle <michael@walle.cc> wrote:
> > Am 2022-12-02 14:37, schrieb Geert Uytterhoeven:
> > > Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
> > > FLASHes.
> > >
> > > Merge the new entries with the existing entry for MT25QU02G.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > mt25qu512a is already in active use, causing "make dtbs_check" errors.
> > > mt25qu256a is supported by the Linux spi-nor driver, but there are no
> > > upstream users yet.
> >
> > Is it encouraged to use the specific compatible with SPI-NOR flashes?
> > As far as I know it isn't. The spi-nor subsys tries hard to identify
> > any flashes at runtime and any additional information in the device tree
> > is used as a last resort (just for flashes which doesn't support the
> > read jedec id command yet). And usually boards have different sources
> > for flash chips, so hardcoding a particular part in the device tree
> > doesn't make sense.
> 
> Thanks, I am aware there have been pushbacks when trying to
> document more compatible values.
> 
> IMHO either all or none of them should be documented.
> If device-specific compatible values are discouraged, the bindings
> should be updated to reflect that, and document a single compatible
> value ("jedec,spi-nor") only.

That's already allowed, so there's your answer.

The caveat is don't be adding them later to your DT when you find an 
issue and new quirk properties will probably be rejected.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
