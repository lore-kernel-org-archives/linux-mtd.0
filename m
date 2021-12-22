Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEABC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 19:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcEdHIJcnomiBBOtlD9pVKeNq5DhO1dGkk+VGmKAvQ4=; b=y3WJFSojZyns2I
	heOGC3TtcdusyLjXKqwgR5gith8E6L2EWz+GxZir4wQNeIcqCS92M3/z5wRBigeCDE5M7yfrlzJUE
	hMkadglUp4mmLYMOHnUSeEA1knRv7Acej6NESnnGxaP6Ea6VK2PbllVIxwnL8kxCiFS9ZA6F4vTod
	w/6vZY1k/xl7IfCvuQnTw//aw/fY7l/uas1mP0wRIsdUWV55igzZnsFDLoi6oFPfTIehrxEw4p7WJ
	uQ43DaCy3bKW0OqiRp0W4IJxzg1xtzZtus+QwuvDKTuQ71ZlplVSnzgJ3qOQDr3wu+/nyexA0LVYL
	kDb5I+U8iFFsK0d44mFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n07Jw-00BEyT-JO; Wed, 22 Dec 2021 19:30:40 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n07Jt-00BExP-04
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 19:30:38 +0000
Received: by mail-qk1-f178.google.com with SMTP id m186so3344530qkb.4
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 11:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EQ5clRItjzdQ2JTUj7nt608zvWfdp4GJggrfSEY9ADI=;
 b=jUgkwf9VxUbjJjIIUjM2gw9kMFsO3ysqS74tZJQ5FwLf5BmETD8nyBWNKWBGkVbdfl
 Ffimsvjo6psfRjnECqLgvg538gRptH4xAsrmxNd/PSr3vhc59ZD+HoLb+jwHQj2XiVzD
 e5Xq/zkIjpqIKt9XV7xAcRKHp9y4jKYX2Z1Xjfd2+ZLpeUXdNQVuOXrpiD7S3euMg8hp
 tlLn3TnRGpHRdzjg1FDaciiH9b5fGGtcAtU7YHN8nRX6d3eIzwxHOYHl0ZRnvhMeJO0c
 QwAGpg7v7c6lL8Ee/VpIrl4w7GAqxCGfnvEM6xYIcoDgjJ0jEGy7h+hUsRH2pIpEy2vQ
 fwOA==
X-Gm-Message-State: AOAM533Y4d0JCo5vNzRnsYpsOoiu3duU5ObqNx+MHHKSDFCqdHhW+ApG
 kvFolReVzPM/CRfXG5NWOw==
X-Google-Smtp-Source: ABdhPJyYfBrWJNIz29wi2pj6bdHbgGZbKC3mazPyPS3o68gSADuEbyZiGdfiqpXize4GypruElh3lQ==
X-Received: by 2002:a05:620a:40d5:: with SMTP id
 g21mr3079216qko.478.1640201435457; 
 Wed, 22 Dec 2021 11:30:35 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id w63sm2335013qkd.88.2021.12.22.11.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 11:30:34 -0800 (PST)
Received: (nullmailer pid 2564998 invoked by uid 1000);
 Wed, 22 Dec 2021 19:30:32 -0000
Date: Wed, 22 Dec 2021 15:30:32 -0400
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor.Ambarus@microchip.com, devicetree@vger.kernel.org, monstr@monstr.eu,
 thomas.petazzoni@bootlin.com, broonie@kernel.org, linux-spi@vger.kernel.org,
 richard@nod.at, vigneshr@ti.com, p.yadav@ti.com, michael@walle.cc,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Message-ID: <YcN82JIbFzi1N8r2@robh.at.kernel.org>
References: <20211221170058.18333-1-miquel.raynal@bootlin.com>
 <20211221170058.18333-3-miquel.raynal@bootlin.com>
 <a11a0650-4624-0a9f-d0a5-c45393fead7c@microchip.com>
 <20211222090542.43dfe12e@xps13>
 <be9d451a-6451-be58-1c2a-a9aea7f67c56@microchip.com>
 <20211222093523.30f8ae7c@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211222093523.30f8ae7c@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_113037_073674_9EDF1930 
X-CRM114-Status: GOOD (  32.92  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Dec 22, 2021 at 09:35:58AM +0100, Miquel Raynal wrote:
> Hi Tudor,
> =

> Tudor.Ambarus@microchip.com wrote on Wed, 22 Dec 2021 08:22:05 +0000:
> > On 12/22/21 10:05 AM, Miquel Raynal wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you kno=
w the content is safe
> > > =

> > > Hello Tudor,  =

> > =

> > Hi!
> > =

> > > =

> > > Tudor.Ambarus@microchip.com wrote on Wed, 22 Dec 2021 07:52:44 +0000:
> > >   =

> > >> On 12/21/21 7:00 PM, Miquel Raynal wrote:  =

> > >>> EXTERNAL EMAIL: Do not click links or open attachments unless you k=
now the content is safe
> > >>>
> > >>> Describe two new memories modes:
> > >>> - A stacked mode when the bus is common but the address space exten=
ded
> > >>>   with an additinals wires.
> > >>> - A parallel mode with parallel busses accessing parallel flashes w=
here
> > >>>   the data is spread.
> > >>>
> > >>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > >>> ---
> > >>>
> > >>> Hello Rob,
> > >>>
> > >>> I know the below does not pass the tests (at least the example patc=
h 3
> > >>> does not pass) but I believe the issue is probably on the tooling s=
ide
> > >>> because the exact same thing with uing32-array instead is accepted.=
 The
> > >>> problem comes from the minItems/maxItems lines. Without them, this =
is
> > >>> okay. The maxItems btw matches the "good enough value for now" idea.
> > >>>
> > >>> The errors I get are:
> > >>>
> > >>> $ make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/=
bindings/spi/spi-controller.yaml
> > >>>   LINT    Documentation/devicetree/bindings
> > >>>   CHKDT   Documentation/devicetree/bindings/processed-schema-exampl=
es.json
> > >>>   SCHEMA  Documentation/devicetree/bindings/processed-schema-exampl=
es.json
> > >>>   DTEX    Documentation/devicetree/bindings/spi/spi-controller.exam=
ple.dts
> > >>>   DTC     Documentation/devicetree/bindings/spi/spi-controller.exam=
ple.dt.yaml
> > >>>   CHECK   Documentation/devicetree/bindings/spi/spi-controller.exam=
ple.dt.yaml
> > >>> /src/Documentation/devicetree/bindings/spi/spi-controller.example.d=
t.yaml: spi@80010000: flash@2:stacked-memories: [[268435456, 268435456]] is=
 too short
> > >>>         From schema: /src/Documentation/devicetree/bindings/spi/spi=
-controller.yaml
> > >>> /src/Documentation/devicetree/bindings/spi/spi-controller.example.d=
t.yaml: spi@80010000: flash@2:stacked-memories: [[268435456, 268435456]] is=
 too short
> > >>>         From schema: /src/Documentation/devicetree/bindings/spi/mxs=
-spi.yaml
> > >>> /src/Documentation/devicetree/bindings/spi/spi-controller.example.d=
t.yaml: spi@80010000: Unevaluated properties are not allowed ('#address-cel=
ls', '#size-cells', 'display@0', 'sensor@1', 'flash@2' were unexpected)
> > >>>         From schema: /src/Documentation/devicetree/bindings/spi/mxs=
-spi.yaml
> > >>> /src/Documentation/devicetree/bindings/spi/spi-controller.example.d=
t.yaml: flash@2: stacked-memories: [[268435456, 268435456]] is too short
> > >>>         From schema: /src/Documentation/devicetree/bindings/mtd/jed=
ec,spi-nor.yaml
> > >>>
> > >>>
> > >>>  .../bindings/spi/spi-peripheral-props.yaml    | 25 +++++++++++++++=
++++
> > >>>  1 file changed, 25 insertions(+)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-p=
rops.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> > >>> index 5dd209206e88..fedb7ae98ff6 100644
> > >>> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.ya=
ml
> > >>> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.ya=
ml
> > >>> @@ -82,6 +82,31 @@ properties:
> > >>>      description:
> > >>>        Delay, in microseconds, after a write transfer.
> > >>>
> > >>> +  stacked-memories:
> > >>> +    description: Several SPI memories can be wired in stacked mode.
> > >>> +      This basically means that either a device features several c=
hip
> > >>> +      selects, or that different devices must be seen as a single
> > >>> +      bigger chip. This basically doubles (or more) the total addr=
ess
> > >>> +      space with only a single additional wire, while still needing
> > >>> +      to repeat the commands when crossing a chip boundary. The si=
ze of
> > >>> +      each chip should be provided as members of the array.
> > >>> +    $ref: /schemas/types.yaml#/definitions/uint64-array
> > >>> +    minItems: 2
> > >>> +    maxItems: 4  =

> > >>
> > >> Why do we define maxItems? Can't we remove this restriction?  =

> > > =

> > > Rob usually prefers to bound properties, that's why we often see "good
> > > enough values for now" in the bindings. If it's no longer the case it=
's  =

> > =

> > right, I saw it.
> > =

> > > fine to drop the maxItems property.  =

> > =

> > There's no such hardware limitation as far as I know, that's why I've
> > asked. Maybe Rob can advise.
> =

> Yes, I'll follow what Rob thinks its best:
> - keeping maxItems: 4 (as it is), which is a good enough value

That's what I already suggested, though I would have expected a bigger =

value. For example, something more than the cost or electrical limit of =

what's practical. I don't know that is though. We don't want to be =

updating it frequently.

> - dropping the maxItems here because in the end no bounding is necessary

This will implicitly set the max to 2 based on minItems. That's because =

most of the time we want an exact number of entries.

> - using maxItems: 2 to match the SPI CS even though in theory these two
>   numbers are not correlated (stacked-memories might very well be
>   used by other non SPI memories as well).
> =

> BTW if you're fine with the proposal your Ack is welcome ;)
> =

> Thanks,
> Miqu=E8l
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
