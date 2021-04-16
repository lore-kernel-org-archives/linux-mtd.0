Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB877C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 18:45:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C77C6137D
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 18:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C77C6137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1aRjY7MELVh7+2xPSCLjWB6YD0AuAXuuDAcoBFNo9JI=; b=k/cplYe9vptWwCizguhYmE/Pm
	rLw+A8APUzagoNKmfxKiDQr/OVsUzA3wXoPM5cG8G4+AhibZ+Z/fkXqLF5/8U3A8nyemX84i5Witv
	NOex7OFyuHXS0S6Gj5msBQSgVWdRAXBe93wqFCEBQUleKlyXtk17F+ITFacynwIdXKEaz1hjW3cxn
	CN+DvBeL9H9ly/lxQ5vFRrQtgmSqtCSf/0ct90h1pNGiEdW7sS6qRMR8KKjSjV382IJP4VWkVCrI2
	HFjSrdMTC26FIU2EFj0Ywu2lAo2cB4BmxCzvEFbve3YVWGwBrLBWI9CA6iojFLj784s1UeV550ECN
	NvAy4PUIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXTSC-0037U9-4b; Fri, 16 Apr 2021 18:44:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTS8-0037Tp-UQ
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 18:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ue4U2hx4gZY/OfTJKPiXwVwHVj/Jmgf89NK50uKXHBU=; b=VMGdH1liaqjB45+itT1vrxD8P1
 ztHK6Om8bBH1cunJEL+a2N5KoBEZE/Krl/FkBwiPq4GJzDnZRQNjTDT2lbQfeJQEtrzU8oox31f1K
 TrfLroxAZC9DGtlN/r4ybOhToM3p6zVFuNtFfxVVQpPGedJU63a3TqCqL3rExWqNfWMn17RfgvFFl
 /rBzoaTuLsppQ8sCYUu1a5f7qRyBxnvOlT2jz5YgT8kTvyHceD1kKsPjn0AqbX9awhN143DQhMHX4
 PHu5tQg8gCWOe9HqyHjeED3Fg6uGlgeOBLiTbqrcY9WVY7woEt0u/TaDL/qEhNEwqZxZwAQcgL1yE
 7kPxuixw==;
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTS6-009dNJ-FT
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 18:44:27 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso24693213otb.13
 for <linux-mtd@lists.infradead.org>; Fri, 16 Apr 2021 11:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ue4U2hx4gZY/OfTJKPiXwVwHVj/Jmgf89NK50uKXHBU=;
 b=XB4j+6XVZgbId+iJ1qEmufCUjdz7w87XCSSsrY6RUXFCb00cKvMvOjoIk9LTSfo8KA
 Oz7bO7FQ+jSKglQr6BWAucxpXOo7O8ras8F2y1W4zMt6JNJdbsc6XOL7bERDqD7CmTTP
 KZxlbURL/yS3slZVW8ycDKPbXhAvz5skayIWak2sNs1wyzmW87VsXr9MCJsBtPLmjTuZ
 mP43RkaNSDOZHGZC3DySIHsTT/F5vhGfSXFpzoJlC96LbK1quXjafAxNedZEs6rJ9/Kn
 cGrQ/HDvgI3GyHBdf1MKa8yuPhqsyTmNPQW2ZBshwVw7sB6d7Mb3pVoGWUFjPXxG3Ccd
 nAMA==
X-Gm-Message-State: AOAM530MHJZTihNJvyOyB3pYjEeAIU6s3XGKUrtDQfIErZ8jx0brxqKt
 pDiMhd8p7pCrEZ7rPS2+Dw==
X-Google-Smtp-Source: ABdhPJxNPTL5ESroEEmdFOQGYr1QURmiCb9UHAC1h/YFKMa6RSflMjttW9oHM1p5jnwbn/9BkOgxFg==
X-Received: by 2002:a9d:4d01:: with SMTP id n1mr4821124otf.336.1618598665577; 
 Fri, 16 Apr 2021 11:44:25 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l5sm911863otr.72.2021.04.16.11.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:44:24 -0700 (PDT)
Received: (nullmailer pid 3730968 invoked by uid 1000);
 Fri, 16 Apr 2021 18:44:23 -0000
Date: Fri, 16 Apr 2021 13:44:23 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/5] mtd: core: OTP nvmem provider support
Message-ID: <20210416184423.GA3715339@robh.at.kernel.org>
References: <20210416114928.27758-1-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416114928.27758-1-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_114426_544643_AA136B0C 
X-CRM114-Status: GOOD (  17.56  )
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

On Fri, Apr 16, 2021 at 01:49:23PM +0200, Michael Walle wrote:
> The goal is to fetch a (base) MAC address from the OTP region of a SPI NOR
> flash.
> 
> This is the first part, where I try to add the nvmem provider support to
> the MTD core.
> 
> I'm not sure about the device tree bindings. Consider the following two
> variants:
> 
> (1)
>     flash@0 {
>         ..
> 
>         otp {
>             compatible = "mtd-user-otp";

mtd is a linuxism. Why not just 'nvmem-cells' here or as a fallback if 
we come up with a better name? 

>             #address-cells = <1>;
>             #size-cells = <1>;
> 
>             serial-number@0 {
>                 reg = <0x0 0x8>;
>             };
>         };
>     };
> 
> (2)
>     flash@0 {
>         ..
> 
>         otp {
>             compatible = "mtd-user-otp";
>             #address-cells = <1>;
>             #size-cells = <1>;
> 
> 			some-useful-name {
>                 compatible = "nvmem-cells";
> 
>                 serial-number@0 {
>                     reg = <0x0 0x8>;
>                 };
> 			};
>         };
>     };
> 
> Both bindings use a subnode "opt[-N]". We cannot have the nvmem cells as
> children to the flash node because of the legacy partition binding.
> 
> (1) seems to be the form which is used almost everywhere in the kernel.
> That is, the nvmem cells are just children of the parent node.
> 
> (2) seem to be more natural, because there might also be other properties
> inside the otp subnode and might be more future-proof.
> 
> At the moment this patch implements (1).

I think approach (1) seems fine.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
