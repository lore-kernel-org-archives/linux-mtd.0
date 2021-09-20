Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E81C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 21:17:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17BD161184
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 21:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17BD161184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kbdz26rtxUlu1/ymQAyYDQ9elkJBf8Q7WLWm7EC45go=; b=DoJUqTmXfxxgTI
	AvYCfWHJbpLR+hwfVlLhF5Oqy1coB8St6e6KGnAvRlcGdIsEEmDQcivm69wpgfqrD/FUGNkNIT23Y
	3EpRrJuxoJDmLHqmzb4l9dfQ0FZ1PxzJ5i29lF6E43U5nOfbiU2gM3o5dAeHseulvFgSMvc/0H4fj
	/QTri2WjCXJcJKWMXAx7q1OlKXZanxqnkp+YMJ6QAwoVABMjkF5ArhdZqCOx4mSi3lcNhBk6U+NAE
	+vbA1b3NPCKut/CEIRWTM/BsPYLdyVwxsRNTNK1PoPyrgJP3EvCwS6Qpp4rsJlB+CFdUexwCAzVsz
	tQAxZcf/u8RRX/WSig9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSQep-0039MR-8n; Mon, 20 Sep 2021 21:16:59 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSQem-0039Lo-Bm
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 21:16:58 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so6640602otx.3
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 14:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pDoO1eNc1NTHogLdYUD9nVb5nV1LrqSfsmfysobQaT4=;
 b=QhlDkejXqFZRWW87JHEsZZI5xvrwMRRhf+cBV4g6FAhJ7T9E7DEtJEfpFfxKEhxeYU
 /zqmhbXTflbUEwWV6c9HQ7xEOD5vynt9GkbDcrHNSp9EMDbvVWfFwUW3oxbm5PBd3Lph
 lhYyTcehqjgPmsMyxtBWH06Ia+rcv8GrWnlJm/HNbLCVTsts8hnwwRuG3j9zfkqKDeuh
 bNsMrSiuB0WzPoQhEtnGLHJXBcKfbi9fiZD7cw3qzojAE6tKKWW2yeJ4wWqGRGWITtO6
 ypAL2a84S/4ElzHmYJT8bNNUJwAEWFd/BZpcG09kRFNwGKSR01mZVnitjewth87qhwan
 AMsQ==
X-Gm-Message-State: AOAM533zdkOit6XItWdhM6bfov+VAGolYvlk4pD2ZBuJqJ1D2eFl7NWm
 wZwVp48FnTv/BStyyHLrkQ==
X-Google-Smtp-Source: ABdhPJwgM1Zno5vb1ov2P0RomgoqPf3fWk0ZwdFXPRmp8uvBGNSDGDoqkdBmCWe15JjdW2tDaLW4zA==
X-Received: by 2002:a9d:719e:: with SMTP id o30mr22262620otj.20.1632172615469; 
 Mon, 20 Sep 2021 14:16:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c37sm3611930otu.60.2021.09.20.14.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:16:54 -0700 (PDT)
Received: (nullmailer pid 781168 invoked by uid 1000);
 Mon, 20 Sep 2021 21:16:53 -0000
Date: Mon, 20 Sep 2021 16:16:53 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Apurva Nandan <a-nandan@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, michael@walle.cc
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nand: Convert to DT schema
 format
Message-ID: <YUj6RUNYDoWA30Ln@robh.at.kernel.org>
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-2-a-nandan@ti.com>
 <20210920150651.vvdhennblwhdi3jw@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920150651.vvdhennblwhdi3jw@mobilestation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_141656_453689_1736A0D6 
X-CRM114-Status: GOOD (  33.83  )
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

On Mon, Sep 20, 2021 at 06:06:51PM +0300, Serge Semin wrote:
> Hello Apurva
> 
> On Mon, Sep 20, 2021 at 07:57:12PM +0530, Apurva Nandan wrote:
> > Convert spi-nand.txt binding to YAML format with an added example.
> > 
> > Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> > ---
> >  .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
> >  .../devicetree/bindings/mtd/spi-nand.yaml     | 62 +++++++++++++++++++
> >  2 files changed, 62 insertions(+), 5 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
> >  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml
> 
> Thanks for the bindings conversion patch. There are several comments
> below. But before addressing them it would be better to also get a
> response from Rob.
> 
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt b/Documentation/devicetree/bindings/mtd/spi-nand.txt
> > deleted file mode 100644
> > index 8b51f3b6d55c..000000000000
> > --- a/Documentation/devicetree/bindings/mtd/spi-nand.txt
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -SPI NAND flash
> > -
> > -Required properties:
> > -- compatible: should be "spi-nand"
> > -- reg: should encode the chip-select line used to access the NAND chip
> > diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.yaml b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> > new file mode 100644
> > index 000000000000..601beba8d971
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> > @@ -0,0 +1,62 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SPI NAND flash
> > +
> > +maintainers:
> > +  - Apurva Nandan <a-nandan@ti.com>
> > +
> > +allOf:
> > +  - $ref: "mtd.yaml#"
> > +
> > +properties:
> > +  compatible:
> > +    const: spi-nand
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> 
> > +  spi-max-frequency: true
> > +  spi-rx-bus-width: true
> > +  spi-tx-bus-width: true
> > +  rx-sample-delay-ns: true
> 
> Since it's an SPI-client device there are more than these properties
> could be set for it. See the SPI-controller bindings schema:
> Documentation/devicetree/bindings/spi/spi-controller.yaml
> So there is two possible ways to make it more generic:
> 1) Detach the spi-client part from the spi-controller.yaml bindings
> into a dedicated DT-schema file and refer to that new scheme from
> here.

Yes, as mentioned there's patches doing this. But the above is fine. 
There's some value in defining here which properties are valid.

> 2) Forget about these controller-specific properties and let the
> parental SPI-controller bindings parsing them. Of course there must be
> at least one of the next properties declared for it to work:
> {unevaluatedProperties, additionalProperties}.
> 
> It's up to Rob to decided which approach is better though...
> 
> > +
> > +  '#address-cells': true
> > +  '#size-cells': true
> 
> Aren't they always equal to 1?

No SPI nand devices >4GB?

> 
> > +
> > +additionalProperties:
> > +  type: object
> 
> I'd suggest to elaborate the way the partition sub-nodes looks
> like, for instance, the node names, supported compatible names,
> labels, etc.

That should probably all be in mtd.yaml. The question here is whether 
partitions are always under a 'partitions' node. Maybe this is new 
enough that only the new way has to be supported. Though if mtd.yaml 
supported both forms, allowing both all the time is okay IMO.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
