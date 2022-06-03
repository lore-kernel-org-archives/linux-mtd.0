Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE900C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 22:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y774QRoDfWlt1fbaQCgkuhpo9+ClE7MMrlES7AY8nVc=; b=Ctt4iZS8EdBWTG
	8mXDGMKfc3ZWy/bRkeZjg6Y8KWsg0dvJaquACGWg35XBAqw2oX0gYOQSamevyDAkz2WLP1pvfWyiP
	L4B9QCP7JM0guwbtx1jGwjO2vXisOGow/kaN7t7aQyOxtEZrZSnyoEWF4SJhsnZmiQPkLc7hqFpFR
	N0LMA+FbiAOUeE01rVYgcDV5oD9eu5UmZ64Ezgh6WA9pREsCN1E7Lw1/s2B+99gMc/VpUEhkib1YS
	RqqrcfoDohspyjpJDsMAwdPR0U3UslVrVlVS95hN25bkJdRysBpLwlkBrgpkApzotlSp0739c5CNa
	8bYjewZXsBJTxvXpQ0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxGF5-009CLd-VI; Fri, 03 Jun 2022 22:58:08 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxGF3-009CKX-5z
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 22:58:07 +0000
Received: by mail-ej1-x62d.google.com with SMTP id me5so18036796ejb.2
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jun 2022 15:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to;
        bh=PnckWO74d/7Q4bv/WHEShYziYt8MdAaOh0LdhpS4ztI=;
        b=CsdL0VQysM+4vfSbVRE331WqUcffxZOw7nK5PGhBnBhw6F2Lll3I+zE6LutnKCaJYe
         vzErnTHDVOIwx2Lwtlk1h1HuwsvFqV+wNiOucOvnfOXMkgBaxLaWr+z0IdPT1tYJ4Vmd
         H8OgIJi+SgOc5SVv3el+9z87qkXIx1mHlCoruEnDw8GTIH2/SC6MRUKeuFFCtOfipnQW
         ViFQg2n6MHO7Uai5BgQQcUVmB1irfjqvFWE5+VhPzBVxD1kD6FyXGDkO8XFWMbW7b+vz
         zzKbbIeCrLesKM6ScD4vNBe4EahOCSs6XGpfkFagqY85Klewsjgx7ZczTPLQKYGcaANM
         QcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=PnckWO74d/7Q4bv/WHEShYziYt8MdAaOh0LdhpS4ztI=;
        b=SHoG2PhgrICOOzzn5d5oCoS5BJ++tfN8a3voODkxZVrJT2iaFEK3JiUl/WGPUYDlKR
         1Sg/tm26WNZCK/HZJqiH4/Hq6pdiJxZwBUCmMZcbT0mWThfRx2bNL7gEqkV45fOrJ/Sr
         hc3qDKAzHbsNqbbrHkeO3MQbkEvMp7qTjUjUEjwT8Wu/NRiKutE0mb38sQ+sMRBmJQht
         cWNXwmNeU8jY8mP9huRrpUQDKWRY+0AVC/IWOALzOK6AO4Hm4bo8HkPblA3VZrnVOsh+
         ZYC+YCcAxSzqubS7l4jn6KrFZc2soFUgvlljGdv10seW0yS6KUNE+FKdfBQddpIp0ceB
         LRjg==
X-Gm-Message-State: AOAM533IQ+hVHMyb2ZUgI/WJTMG3dI4VipS8deroJ7kum367Q9WcUOZs
	bVGGS0uMHCcncMJuxr6NGqQ=
X-Google-Smtp-Source: ABdhPJyNxgIV5vX4E6J4scTzq2NCyH4+XBeGXJV92zyuDI2zF+1BoC+HpcPQBPx0YncClQChKjsgBg==
X-Received: by 2002:a17:907:2d8e:b0:6fe:b423:9693 with SMTP id gt14-20020a1709072d8e00b006feb4239693mr10271149ejc.698.1654297081325;
        Fri, 03 Jun 2022 15:58:01 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id e2-20020a1709062d4200b006fec2097d53sm3291683eji.118.2022.06.03.15.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 15:58:00 -0700 (PDT)
Message-ID: <629a91f8.1c69fb81.371aa.1d32@mx.google.com>
X-Google-Original-Message-ID: <YpqR9jYTMyCSBOTq@Ansuel-xps.>
Date: Sat, 4 Jun 2022 00:57:58 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: mtd: partitions: Document new
 dynamic-partition nodes
References: <20220518233258.5483-1-ansuelsmth@gmail.com>
 <20220518233258.5483-2-ansuelsmth@gmail.com>
 <20220601210655.GA380852-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220601210655.GA380852-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_155805_268845_02B354BE 
X-CRM114-Status: GOOD (  39.78  )
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

On Wed, Jun 01, 2022 at 04:06:55PM -0500, Rob Herring wrote:
> On Thu, May 19, 2022 at 01:32:57AM +0200, Ansuel Smith wrote:
> > Document new dynamic-partition nodes used to provide an OF node for
> > partition registred at runtime by parsers. This is required for nvmem
> > system to declare and detect nvmem-cells.
> > 
> > With these special partitions, the reg / offset is not required.
> > The label binding is used to match the partition allocated by the
> > parser at runtime and the parser will provide reg and offset of the mtd.
> > 
> > NVMEM will use the data from the parser and provide the NVMEM cells
> > declared in the DTS, "connecting" the dynamic partition with a
> > static declaration of cells in them.
> > 
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> >  .../mtd/partitions/dynamic-partition.yaml     | 57 +++++++++++++++++++
> >  .../mtd/partitions/qcom,smem-part.yaml        |  4 ++
> >  2 files changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml
> > new file mode 100644
> > index 000000000000..f57d7b9cae7f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/partitions/dynamic-partition.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Dynamic Partition
> > +
> > +description: |
> > +  This binding describes a single flash partition that is dynamically allocated
> > +  by a dedicated parser that is not a fixed-partition parser.
> > +
> > +  Each child of the parser partition node is then compared and if a match with
> > +  the provided label is found then the OF node is assigned.
> > +
> > +  These special partition definition can be used to give a dynamic partition
> > +  an OF node to declare NVMEM cells. An example is declaring the partition
> > +  label and all the NVMEM cells in it. The parser will detect the correct reg
> > +  and offset and the NVMEM will register the cells in it based on the data
> > +  extracted by the parser.
> > +
> > +maintainers:
> > +  - Ansuel Smith <ansuelsmth@gmail.com>
> > +
> > +properties:
> > +  label:
> > +    description: The label / name for the partition assigned by the parser at
> > +      runtime. This is needed for sybsystem like NVMEM to define cells and
> 
> typo
> 
> > +      register with this OF node.
> > +
> > +required:
> > +  - label
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    flash {
> > +      partitions {
> > +        compatible = "qcom,smem-part";
> > +
> > +        partition-art {
> > +          compatible = "nvmem-cells";
> > +          #address-cells = <1>;
> > +          #size-cells = <1>;
> > +          label = "0:art";
> > +
> > +          macaddr_art_0: macaddr@0 {
> > +            reg = <0x0 0x6>;
> > +          };
> > +
> > +          macaddr_art_6: macaddr@6 {
> > +            reg = <0x6 0x6>;
> > +          };
> 
> There's a problem with the schema structure for this which is a common 
> problem where we have parent and child nodes with parent defined 
> properties in the child nodes (label in this case). The issue is that 
> there is not a single schema applied to the child node which contains 
> all possible properties sub-node names. This is necessary to check for 
> extra, undocumented properties using unevaluatedProperties. The creation 
> of spi-periphera-props.yaml is an example of how to address this. I 
> suspect that all the partition schemas may need similar restructuring.
> 
> The nvmem-cells schema may happen to already have 'label', so it happens 
> to work (that and unevaluatedProperties is probably missing in places).
> 
> Given this schema is really just one property which is already 
> documented for 'partition' nodes, all we really need is to say is if 
> 'reg' is not present, then 'label' is required:
> 
> if:
>   not:
>     required: [ reg ]
> then:
>   required: [ label ]
> 
>

Just to make sure. The correct way to implement this would be drop the
current dynamic-partition schema and expand the partition.yaml with the
additional if and the extra stuff in the description.
Wanted to keep the 2 thing separated but if necessary I will follow this
path.

> > +        };
> > +      };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > index cf3f8c1e035d..b6fa25949fe2 100644
> > --- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > @@ -19,6 +19,10 @@ properties:
> >    compatible:
> >      const: qcom,smem-part
> >  
> > +patternProperties:
> > +  "^partition-[0-9a-z]+$":
> > +    $ref: dynamic-partition.yaml#
> > +
> >  required:
> >    - compatible
> >  
> > -- 
> > 2.34.1
> > 
> > 

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
