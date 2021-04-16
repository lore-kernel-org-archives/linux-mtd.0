Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CEEC433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 18:47:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72237611AF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 18:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72237611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OVZNBWcOFoC/xM5X96YQtIT4ny8QBhjl9SUbGC6pYso=; b=NNbJhMoTlx06B+i3Iih+9bGdr
	J/oMreqTOlTi+QvnOFVSjVf19yP9J0my1JLImwKSn4xAiuKb87gPozoSghJiKI8R/bNmCX1+8mE6N
	B1IcSpFXj+P1G6lZ03bBZCfgZ2PdX0BGiTOL9K++K1EO2IFpd44RXGux6z0kHnP0o4BquGawJuqCB
	3eWwg0Hzpfj+zbqoQnvJVwYVSKLkTXz0dsVTj4pTS+LW4bs7x6Gv7m6uy3WE5zOsjfdXpkWUdMULJ
	HkK28jYAkjGLdyMupiNh7NX1GTp6eof6urI8tWJu2+xndQQF8QqbeSKWv1v/eg3L1SqypRCJSGc3Y
	3dGnUKvFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXTU1-0037kH-5x; Fri, 16 Apr 2021 18:46:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTTz-0037jl-B8
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 18:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=etRLZlwfrAw/ObAL86CRzvNdPZ4wzFCSG0hWaLZVyQQ=; b=lLa0DZBIvEsZrA5faocl8jkFoZ
 odPrlkFotHwW7in0/AJsnhVslSSy2cdAXmyYced8Y332WxqKO4RYAqM9+NM8PO2yw+GOZwx8tuY+f
 P+coZuNPScLDeN8DSrfoYHP1VaUp9wHc1yhbn9VkD28MXLMBN1btA2GORJT+6OGzL4y4ucxo7pnrF
 MthOGAeG7BoGwHoLwFPJnaRyg8eKrV3uVAIG/bmIG9M0WOwEHTig1Vv/VskphI+9ATUeTv8iAOlzR
 XyjMj3r38U+KAu8tFa4aRUsj57yMPgi4xI2CY4wifti6elkz9nDE4PfpaBzhEfQObIFdxRXYXbVYp
 wFOo0XMw==;
Received: from mail-oo1-f53.google.com ([209.85.161.53])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTTt-009dQ9-G3
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 18:46:22 +0000
Received: by mail-oo1-f53.google.com with SMTP id
 y23-20020a4ade170000b02901e6250b3be6so3853051oot.5
 for <linux-mtd@lists.infradead.org>; Fri, 16 Apr 2021 11:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=etRLZlwfrAw/ObAL86CRzvNdPZ4wzFCSG0hWaLZVyQQ=;
 b=sUkSTXVIMMwcrcbpOIwKDNIQQBlQY9ZCSd2hIigYFHcMVslkhfKY2drPMu36/4RKeY
 w0TC1To1BunE2YJsi08gXoGutLpaTcMMTwjD/sn46ZYAalkyuRfDHIwgLNSrKbK6WyA9
 iEPNxlg9hqF8dIKPYBSFKDXAr5vKx0lbR5X/5GZhS/0J/H3kD/MZ1ITJ53mhGj6SAZ1z
 Rsh7eHfRL73UutVq8JgGjjzerWDhgIx2snvkywW6AduZZOCVVFW1UUYd8zYLnCZn1O4h
 c9WR8qUQ8XmZUZQUyVIRi4nG/WVa+rr8bteANLbidVGIFO8AjPs2cx1ImX7Lg+XBQzBJ
 OCxw==
X-Gm-Message-State: AOAM530jo1zaIzuS4CSOauPVfn0TvJR5bb96g8OYOYky/ZFNynPmFua/
 UbBJmxEhApXkxQROVCO/aQ==
X-Google-Smtp-Source: ABdhPJzM+rTbpoSYC8X7T8dgCSFTM86qBDJb19n9iGSJidvKf3L/X2rk0r8MR/j+ieTN7E1NrqOfkA==
X-Received: by 2002:a4a:8c4f:: with SMTP id v15mr4358271ooj.25.1618598776489; 
 Fri, 16 Apr 2021 11:46:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m133sm1539286oia.22.2021.04.16.11.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:46:14 -0700 (PDT)
Received: (nullmailer pid 3733903 invoked by uid 1000);
 Fri, 16 Apr 2021 18:46:13 -0000
Date: Fri, 16 Apr 2021 13:46:13 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 3/5] dt-bindings: mtd: add OTP bindings
Message-ID: <20210416184613.GA3731279@robh.at.kernel.org>
References: <20210416114928.27758-1-michael@walle.cc>
 <20210416114928.27758-4-michael@walle.cc>
 <1618597801.604723.3708338.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1618597801.604723.3708338.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_114617_579611_54FD94AC 
X-CRM114-Status: GOOD (  18.61  )
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

On Fri, Apr 16, 2021 at 01:30:01PM -0500, Rob Herring wrote:
> On Fri, 16 Apr 2021 13:49:26 +0200, Michael Walle wrote:
> > Flash devices can have one-time-programmable regions. Add a nvmem
> > binding so they can be used as a nvmem provider.
> > 
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > ---
> > Changes since RFC:
> >  - added missing "$"
> >  - dropped first example
> >  - use real device compatibles
> > 
> >    Please note, that this will lead to an error without patch 4/5, which
> >    introduces that property for the jedec,spi-nor. Should I keep it
> >    seperate or should I squash that patch into this one?
> > 
> >  .../devicetree/bindings/mtd/mtd.yaml          | 50 +++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/mtd.example.dt.yaml: flash@0: 'otp-1', 'otp-2' do not match any of the regexes: '^partition@', 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml

Don't worry about this one if the series passes. There's not really a 
good way to avoid it other than moving the example.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
