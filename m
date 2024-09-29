Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9A4CF6495
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2024 13:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkQ5ZBs2o8r+0H2TIIVmPeLe9Ec0XYE+smkukvQFcFQ=; b=jx9nSuANCNj/ro
	qvoFoXm34J7uk3LhvEy50bLuPE7X0L0GJazt2QcwJo85T8+ltmOzdQdfta9W8fRwgT/AsnRPzWUOq
	kJE5H1A/4lWFQV8hukAI95qNuextp22xVUo6HYZgdyjgWya/IEmUkNMoa0wSXueUOD7f9IhhzN6qe
	0I/tnNmhTdPJBCdhN9vsNZK3aaJs5xCI2MoEwQBy7QolTNipok7tqZvD9gLB7EVAavfvAeOaj1Jx8
	Lk7Uf6cvnrfdPqLJLq1Fs+eK8YqAJ6tOHVl5d2vjrBR1r0JRT7iu0oab/YAgYr3uNF/5gw6WULIHl
	TDEFT7y2qOK5ob4EDNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sutkU-0000000Eney-2eOo;
	Sun, 29 Sep 2024 13:14:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sutkQ-0000000Enea-0rmO
	for linux-mtd@lists.infradead.org;
	Sun, 29 Sep 2024 13:14:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so28608815e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 29 Sep 2024 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727615640; x=1728220440; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tIfkI/k5mUOou3QQlG3Flb+/Aulbsc0ROAg9MJCB1rA=;
        b=XzlfdYtytsOywg2nZxiErUm7rBv12Xtov6jCp7/p9QTxPJiHNN9rsZDbFHTK25oPfL
         xNYqEwJem63tTaYjLgWwSFs+u+oFvzGcxrJDoweqeWB96HpcUC7bzwDXETqkUtkTulLZ
         yUDMgoCATaYUrdUMjugnNSG6fPaDetGwDcE/XMpjVCiOSOguM17343Uh5xLLyK9FrfJ5
         ppAIGz4JPZEgZre/x07bOmeTbzSj+auOUCFN+h7fCKd/CHZ4ZOYWkwZplK64ZLk39UrH
         u1RNJ3RdbBgSx5/vburN6alaIB5n8UnaTzO/5FbaDqgIv9hbXokmrDUOBaQUCyAOTgNv
         GdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727615640; x=1728220440;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIfkI/k5mUOou3QQlG3Flb+/Aulbsc0ROAg9MJCB1rA=;
        b=ZYJJ8rTX7HNXzLwpYn/3+vn7LnRo9Yed7MICDSFvVLvHVr2n2rhDdrtEGRfAB4LQEV
         jYaRvjwpuUApzwrKm7uXn8pT9I2rD9Pjs+F0aBjM7PEgJm9aozcGlZ2eTfREzBtZVhNC
         WZdUgi5PueWknzFe148sKkr++nLTSTGwkeJXHlfzq43ZR1KG79Pgt52OFJTAJu1WKEPA
         hsvFX2MNC7V3rvmcLef4O8a36l0/8p/96EpD9NH/UuYpvnxattU/KwT1z99mqi/w8Q6G
         lknE5xlOoia9eKK9+dAleKHtoq8Q91pJjiueNl4o/eeR806kI87Ro95A9FIErUBTd9Nj
         KjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCTEiK7A1McUNhsHGAcI14K7JFkaFpPQQC3t2BlsqMA2RMyPBngREWc1RSVyiSBZntTo5FEBEQNR4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzSSK4XHfA2yeupODZHVNOQcCy7P8K4/49q9MV12qQMIzhnAnq
	pSgVfmEV5NyPEXUCj4NRKLdcH3B4U0oKauy4P3Lmb3iZtdM5JnGU
X-Google-Smtp-Source: AGHT+IHaZE8qeiri03N0inPTGys9IBvkOvGroq5f+OgTAi0LQdMR6CD7GKs6HkbHM02iugLdROZ+NA==
X-Received: by 2002:a05:600c:3552:b0:426:6eac:8314 with SMTP id 5b1f17b1804b1-42f5840ef00mr71570555e9.1.1727615639673;
        Sun, 29 Sep 2024 06:13:59 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6875sm6837684f8f.55.2024.09.29.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 06:13:59 -0700 (PDT)
Message-ID: <66f95297.050a0220.221772.5da3@mx.google.com>
X-Google-Original-Message-ID: <ZvlSkRi60iluQduI@Ansuel-XPS.>
Date: Sun, 29 Sep 2024 15:13:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Simon Glass <sjg@chromium.org>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Li Lingfeng <lilingfeng3@huawei.com>,
	Christian Heusel <christian@heusel.eu>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [RFC PATCH v2 5/5] dt-bindings: mmc: Document support for
 partition table in mmc-card
References: <20240925214544.6114-1-ansuelsmth@gmail.com>
 <20240925214544.6114-6-ansuelsmth@gmail.com>
 <20240926141541.GA2625953-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926141541.GA2625953-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_061402_271854_2051E235 
X-CRM114-Status: GOOD (  36.83  )
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

On Thu, Sep 26, 2024 at 09:15:41AM -0500, Rob Herring wrote:
> On Wed, Sep 25, 2024 at 11:45:25PM +0200, Christian Marangi wrote:
> > Document support for defining a partition table in the mmc-card node.
> > 
> > This is needed if the eMMC doesn't have a partition table written and
> > the bootloader of the device load data by using absolute offset of the
> > block device. This is common on embedded device that have eMMC installed
> > to save space and have non removable block devices.
> > 
> > If an OF partition table is detected, any partition table written in the
> > eMMC will be ignored and won't be parsed.
> > 
> > eMMC provide a generic disk for user data and if supported (JEDEC 4.4+)
> > also provide two additional disk ("boot0" and "boot1") for special usage
> > of boot operation where normally is stored the bootloader or boot info.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../devicetree/bindings/mmc/mmc-card.yaml     | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> > index fd347126449a..58b6593a0f60 100644
> > --- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> > @@ -13,6 +13,10 @@ description: |
> >    This documents describes the devicetree bindings for a mmc-host controller
> >    child node describing a mmc-card / an eMMC.
> >  
> > +  It's possible to define a fixed partition table for an eMMC for the user
> > +  partition and one of the 2 boot partition (boot0/boot1) if supported by the
> > +  eMMC.
> > +
> >  properties:
> >    compatible:
> >      const: mmc-card
> > @@ -26,6 +30,30 @@ properties:
> >        Use this to indicate that the mmc-card has a broken hpi
> >        implementation, and that hpi should not be used.
> >  
> > +  "#address-cells":
> > +    const: 0
> > +
> > +  "#size-cells":
> > +    const: 0
> 
> Don't need these properties.
> 
> > +
> > +patternProperties:
> > +  "^partitions(-boot[01])?$":
> > +    $ref: /schemas/block/partitions/partitions.yaml
> > +
> > +    patternProperties:
> > +      "^partition@[0-9a-f]+$":
> > +        $ref: /schemas/block/partitions/partition.yaml
> > +
> > +        properties:
> > +          reg:
> > +            multipleOf: 512
> 
> I was going to suggest this, but I think it won't actually work because 
> it could be 2 cells for address and/or size.
>

While checking I was surprised for this multipleOf and was very happy to
have something like this but I also had some fear it didn't work due to
the 2 cell thing... Very sad. I will add a description to it.

The driver will validate the values anyway, at least on that part we are
on the safe side.

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
