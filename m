Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E19C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 19:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYj/u9Fmylm7bCSeSuf3NM6PuwYnhRocfGjAn5ZvhSc=; b=hlUBfoalXE1A1U
	dAXjn0vJ6qZCFKF2wjT8po8ZzTiWBppz7VzJnLmQHUVE2wjyzQ8wfHfJTMdSM1Lu7bXw1DWpaglR4
	vgFwoQStMfw87MEmoZJOM89U3EuaFux7YqdAtBAIf2H4shI/YemJKPB5YCtXgaCSJkEKrQ8ImCohW
	AAhlI3zabY5U45L0ANrEixnAcMmHFzANGo/4QyU6bia/3AitqYfa7qzpeCkpfPTTxVbGla/0U9GAO
	2ihfKlkCt16maEGiCf6l/aDc3N/sJne5HddnC42eyKq4Mm073WAywhsuO8WC9MUC6iWm51nCBTnoH
	Q+9g/3ytkZ9iyoUNMxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n07IM-00BEdk-Rx; Wed, 22 Dec 2021 19:29:02 +0000
Received: from mail-qv1-f54.google.com ([209.85.219.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n07IJ-00BEcu-Sc
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 19:29:01 +0000
Received: by mail-qv1-f54.google.com with SMTP id fq10so3203833qvb.10
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 11:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9JLlzL6JkLMvYS8qsLxxlj+RLmlEabUucYr74EUim5s=;
 b=IRC5kmI8FX41EDlROBdtJzRVN/aFOZDbwgkGLQYyEEMpVViwNgngAEXil/xli73AZ2
 XhUe9GqG6wwzKyjMl+kQXpDL8JKrHpWN+5USxGJ2Z0nqz4+DlmvS4KP2xiyquBYOZPdR
 ZrDC2SlSrWdmGOcgX+NHt5WW/bd1vgtuO6+9rsyDV4nqeLp8SwIackkSWPlT6+eF2FgZ
 LLuRblznaXKsK5onFz0T4tNXw21/gLdB99YnzlS16rVepnXlIUyC+WVRZLitYG/BCGr6
 DDncExEI6KBdbGGgYSzTUvx3QQDsUaRQNDBE+3AsoQgHz3MUEuHVncuv1ZmVlI47exrd
 rGeQ==
X-Gm-Message-State: AOAM5324iajmB8PejoJYy0xq+P9I77NzxS/LblcrjkZSgvh+gGbHbUIA
 6eQxw959C9jUqQLOAFaYRg==
X-Google-Smtp-Source: ABdhPJy0xCxfPK2k14T0nQonufth8X5fCM724vTU/sv3JASArUBgc6mnYEe955x2Jj6M3C+2a+Vymg==
X-Received: by 2002:ad4:48c5:: with SMTP id v5mr3737347qvx.64.1640201337574;
 Wed, 22 Dec 2021 11:28:57 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id ay42sm2473637qkb.40.2021.12.22.11.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 11:28:56 -0800 (PST)
Received: (nullmailer pid 2562386 invoked by uid 1000);
 Wed, 22 Dec 2021 19:28:55 -0000
Date: Wed, 22 Dec 2021 15:28:55 -0400
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
Message-ID: <YcN8d1xA1sx2llzk@robh.at.kernel.org>
References: <20211221170058.18333-1-miquel.raynal@bootlin.com>
 <20211221170058.18333-3-miquel.raynal@bootlin.com>
 <YcN3y/gelGcH5/Be@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcN3y/gelGcH5/Be@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_112859_948884_44342B1E 
X-CRM114-Status: GOOD (  19.71  )
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

On Wed, Dec 22, 2021 at 03:08:59PM -0400, Rob Herring wrote:
> On Tue, Dec 21, 2021 at 06:00:57PM +0100, Miquel Raynal wrote:
> > Describe two new memories modes:
> > - A stacked mode when the bus is common but the address space extended
> >   with an additinals wires.
> > - A parallel mode with parallel busses accessing parallel flashes where
> >   the data is spread.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> > 
> > Hello Rob,
> > 
> > I know the below does not pass the tests (at least the example patch 3
> > does not pass) but I believe the issue is probably on the tooling side
> > because the exact same thing with uing32-array instead is accepted. The
> > problem comes from the minItems/maxItems lines. Without them, this is
> > okay. The maxItems btw matches the "good enough value for now" idea.
> > 
> > The errors I get are:
> > 
> > $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/spi-controller.yaml
> >   LINT    Documentation/devicetree/bindings
> >   CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
> >   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
> >   DTEX    Documentation/devicetree/bindings/spi/spi-controller.example.dts
> >   DTC     Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml
> >   CHECK   Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml
> > /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: spi@80010000: flash@2:stacked-memories: [[268435456, 268435456]] is too short
> > 	From schema: /src/Documentation/devicetree/bindings/spi/spi-controller.yaml
> > /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: spi@80010000: flash@2:stacked-memories: [[268435456, 268435456]] is too short
> > 	From schema: /src/Documentation/devicetree/bindings/spi/mxs-spi.yaml
> > /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: spi@80010000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'display@0', 'sensor@1', 'flash@2' were unexpected)
> > 	From schema: /src/Documentation/devicetree/bindings/spi/mxs-spi.yaml
> > /src/Documentation/devicetree/bindings/spi/spi-controller.example.dt.yaml: flash@2: stacked-memories: [[268435456, 268435456]] is too short
> > 	From schema: /src/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> 
> I'm not seeing any of these. Are you up to date with dtschema?

NM, I was missing a patch and now see it. It is indeed a tool problem. 
I'll work on a fix.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
