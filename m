Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812E4C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 19:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIze8fw7q6sr2/7Sq1Ofc4vmHzwWYRMSwLcNE1wObjc=; b=NJi5EqVkw+Itp6
	Ls4ZbDhUVMbeOaZDRjP0w8SXA2REcYR27Cydqpjn1oqFwB3FyQkIMMxh2ctKUMzEltkHkVtPNdchM
	jEnM3QGHoqWhbcVdcb9k+d/03z/LqbV0EjtqfLQLiOBDBYd0tY+/ZlWeXGS0/77I2ECxpCZRvrUNH
	ykixUILYJLM8ppIwcKFSMhXZoZY8SBwI5n9NwIg90R9dIe3wuYXu+gm0b1zDofChjbdHFAB4TMsOK
	ysqosbJ9L/MyroZAS6Y59HDe3pi++IefobVk/T5SDJgW4+BHGJcyG5kswpYAuCCtLFGZOr/+6q+7m
	1BPiP/PkDGMPRXH+pD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n06z4-00BCKN-Pm; Wed, 22 Dec 2021 19:09:06 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n06z2-00BCJq-3P
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 19:09:05 +0000
Received: by mail-qk1-f181.google.com with SMTP id l11so3244965qke.11
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 11:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tyJ75PdIZRPYqc1qFXz30jQrZAv9clyNlJRO4OktcXA=;
 b=Vr3KgOjIfNrnsZP+IuNTB3h87E4QFNyLmM6Is/FR2+fIWO43Aa+YM9qS85Ge3StlzJ
 gBD8YmbhPfOpmyrbWzikpl1viH8PpzgQFzWPpzRBaV2wsQMYBeAwS0OMEGfOPCJNJMoJ
 cUegH9T0m1XHg9TQlUqBxZzexSvEY5x9t+gkJTIEcBl6JVDjiVoaA4p6ly5XJ0GiinAO
 IQbXqceeikZYTp8NocbIomWZFCc3VJI/f7v0AckMi6WkOu+t/gbqCjz21UzwE0gPOMFM
 ZppLm5x10sO5rJNJElqFq3G3eIVR3Ljiky0fe8r08zdBeqVFb1CsK/Pzgzks+d8AP3e1
 BqHg==
X-Gm-Message-State: AOAM5316sILSf9YuVluy3E7o7CLwpTH2kYRvdwH4WI9NUZIV67R0nkw1
 FyLgclh7qep6+uJ/S9Quqg==
X-Google-Smtp-Source: ABdhPJzsJQ9a7vww9S4gJzF6yBE2P2CkUmEENsV5AilTQ+5G7lfExKnyMXVokY+ytYbtDy+izFuXeg==
X-Received: by 2002:a05:620a:1358:: with SMTP id
 c24mr2694388qkl.699.1640200141655; 
 Wed, 22 Dec 2021 11:09:01 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id q15sm2313155qkj.108.2021.12.22.11.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 11:09:01 -0800 (PST)
Received: (nullmailer pid 2529650 invoked by uid 1000);
 Wed, 22 Dec 2021 19:08:59 -0000
Date: Wed, 22 Dec 2021 15:08:59 -0400
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Message-ID: <YcN3y/gelGcH5/Be@robh.at.kernel.org>
References: <20211221170058.18333-1-miquel.raynal@bootlin.com>
 <20211221170058.18333-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221170058.18333-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_110904_171586_0103B6FC 
X-CRM114-Status: GOOD (  15.83  )
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

On Tue, Dec 21, 2021 at 06:00:57PM +0100, Miquel Raynal wrote:
> Describe two new memories modes:
> - A stacked mode when the bus is common but the address space extended
>   with an additinals wires.
> - A parallel mode with parallel busses accessing parallel flashes where
>   the data is spread.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Hello Rob,
> 
> I know the below does not pass the tests (at least the example patch 3
> does not pass) but I believe the issue is probably on the tooling side
> because the exact same thing with uing32-array instead is accepted. The
> problem comes from the minItems/maxItems lines. Without them, this is
> okay. The maxItems btw matches the "good enough value for now" idea.
> 
> The errors I get are:
> 
> $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/spi-controller.yaml
>   LINT    Documentation/devicetree/bindings
>   CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
>   DTEX    Documentation/devicetree/bindings/spi/spi-controller.example.dts
>   DTC     Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml
> /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: spi@80010000: flash@2:stacked-memories: [[268435456, 268435456]] is too short
> 	From schema: /src/Documentation/devicetree/bindings/spi/spi-controller.yaml
> /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: spi@80010000: flash@2:stacked-memories: [[268435456, 268435456]] is too short
> 	From schema: /src/Documentation/devicetree/bindings/spi/mxs-spi.yaml
> /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: spi@80010000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'display@0', 'sensor@1', 'flash@2' were unexpected)
> 	From schema: /src/Documentation/devicetree/bindings/spi/mxs-spi.yaml
> /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: flash@2: stacked-memories: [[268435456, 268435456]] is too short
> 	From schema: /src/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml

I'm not seeing any of these. Are you up to date with dtschema?

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
