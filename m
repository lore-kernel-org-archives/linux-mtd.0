Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8F2C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWj/97IHQ0sZkFE2xcGUl0JYFyCeEFLuaIp4kI2OFVs=; b=rOkf2tl7BKB/Jn
	qfGnLrgNH4F7IRGCHN93OlqrDvbqFcaYAZA7FpVWWMT12jRsaeS7891z+WfwxJu8v04TsWLmKyZMa
	ICzpAKoOjy8h7arhpWASlkZafceqZOlPUZqBB+IJOMAuyUN/61Dh/6HjCXSURrBvIavFxRE+sOBmd
	6jyVK+/knxNkegoa43rvjSAESKxUaJtd0DPDng1JJd2SqaZCpJAYhpeHp1uSpstvy7ek5IlKkP/Jf
	i2XHZo1y7A3zFrF0lcOvi71xTvlUU9cX6jLNZTn1Pu3B+TWKYUK8JzBMuEWdTPOPgJBHHhF30A/Rt
	PXPjRmDg9gA9XASUsdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCu7-001Nh7-8d; Mon, 06 Jun 2022 13:36:23 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCu3-001Nfn-Ky
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 13:36:21 +0000
Received: by mail-io1-f43.google.com with SMTP id i201so6590823ioa.6
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2022 06:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aJMNgSVQO447NKXH868O96uQGEnseJ7a42xNt19YMwo=;
        b=mt5MQ4NU69cCcNeJYlztT1eCJTYFLcHh2FEbNAHMHjzFDQXK+0/7oZVpLrzhXMcCsL
         ifYk6u60dKpsvzpDVdoaZXs5C/5OMI6W6wW9ICqhX3dEjQbLLDPCcbILJMdkNXDgED+L
         khME/c7Zdbh/4ygfq/bw2qN0941lweRRWe8Jhz3ras4SDrufbTMQ4E01TDyVHO4cOCef
         YHS7uDZONMvWVV9s7NBAfth3KaDEtrt6XRHSOaPJGdY/t5KYPy0hEYNJxEiJPNWlqc1z
         hAdcOaHZz0+fMSdOUOToewJyZgQzoK94uGlSzPU0e1v/bMz0kZg5RgDx82yZYu2+LZe1
         uRhQ==
X-Gm-Message-State: AOAM530S2bBuPk+jPLsWyuJvvJCJDyi2uoB8Odke4aCjB4BC0lRjD8nq
	UZFo71J4gBynH4MBzCgxMA==
X-Google-Smtp-Source: ABdhPJyoIGcPS/tcQCUeUiTpd10BgFpTIxTSxmM6wQT++mb2LRlADkkBEpMSvmUjbTnpBQkuyzwdPA==
X-Received: by 2002:a6b:3115:0:b0:660:d5f1:e3b6 with SMTP id j21-20020a6b3115000000b00660d5f1e3b6mr11581406ioa.99.1654522577516;
        Mon, 06 Jun 2022 06:36:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y16-20020a02bb10000000b003314a583804sm5678560jan.20.2022.06.06.06.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:36:16 -0700 (PDT)
Received: (nullmailer pid 601560 invoked by uid 1000);
	Mon, 06 Jun 2022 13:36:15 -0000
Date: Mon, 6 Jun 2022 08:36:15 -0500
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: mtd: partitions: Document new
 dynamic-partition nodes
Message-ID: <20220606133615.GA564610-robh@kernel.org>
References: <20220518233258.5483-1-ansuelsmth@gmail.com>
 <20220518233258.5483-2-ansuelsmth@gmail.com>
 <20220601210655.GA380852-robh@kernel.org>
 <629a91f8.1c69fb81.371aa.1d32@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <629a91f8.1c69fb81.371aa.1d32@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_063619_727225_75C22C9F 
X-CRM114-Status: GOOD (  42.88  )
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

On Sat, Jun 04, 2022 at 12:57:58AM +0200, Ansuel Smith wrote:
> On Wed, Jun 01, 2022 at 04:06:55PM -0500, Rob Herring wrote:
> > On Thu, May 19, 2022 at 01:32:57AM +0200, Ansuel Smith wrote:
> > > Document new dynamic-partition nodes used to provide an OF node for
> > > partition registred at runtime by parsers. This is required for nvmem
> > > system to declare and detect nvmem-cells.
> > > 
> > > With these special partitions, the reg / offset is not required.
> > > The label binding is used to match the partition allocated by the
> > > parser at runtime and the parser will provide reg and offset of the mtd.
> > > 
> > > NVMEM will use the data from the parser and provide the NVMEM cells
> > > declared in the DTS, "connecting" the dynamic partition with a
> > > static declaration of cells in them.
> > > 
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >  .../mtd/partitions/dynamic-partition.yaml     | 57 +++++++++++++++++++
> > >  .../mtd/partitions/qcom,smem-part.yaml        |  4 ++
> > >  2 files changed, 61 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml
> > > new file mode 100644
> > > index 000000000000..f57d7b9cae7f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mtd/partitions/dynamic-partition.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Dynamic Partition
> > > +
> > > +description: |
> > > +  This binding describes a single flash partition that is dynamically allocated
> > > +  by a dedicated parser that is not a fixed-partition parser.
> > > +
> > > +  Each child of the parser partition node is then compared and if a match with
> > > +  the provided label is found then the OF node is assigned.
> > > +
> > > +  These special partition definition can be used to give a dynamic partition
> > > +  an OF node to declare NVMEM cells. An example is declaring the partition
> > > +  label and all the NVMEM cells in it. The parser will detect the correct reg
> > > +  and offset and the NVMEM will register the cells in it based on the data
> > > +  extracted by the parser.
> > > +
> > > +maintainers:
> > > +  - Ansuel Smith <ansuelsmth@gmail.com>
> > > +
> > > +properties:
> > > +  label:
> > > +    description: The label / name for the partition assigned by the parser at
> > > +      runtime. This is needed for sybsystem like NVMEM to define cells and
> > 
> > typo
> > 
> > > +      register with this OF node.
> > > +
> > > +required:
> > > +  - label
> > > +
> > > +additionalProperties: true
> > > +
> > > +examples:
> > > +  - |
> > > +    flash {
> > > +      partitions {
> > > +        compatible = "qcom,smem-part";
> > > +
> > > +        partition-art {
> > > +          compatible = "nvmem-cells";
> > > +          #address-cells = <1>;
> > > +          #size-cells = <1>;
> > > +          label = "0:art";
> > > +
> > > +          macaddr_art_0: macaddr@0 {
> > > +            reg = <0x0 0x6>;
> > > +          };
> > > +
> > > +          macaddr_art_6: macaddr@6 {
> > > +            reg = <0x6 0x6>;
> > > +          };
> > 
> > There's a problem with the schema structure for this which is a common 
> > problem where we have parent and child nodes with parent defined 
> > properties in the child nodes (label in this case). The issue is that 
> > there is not a single schema applied to the child node which contains 
> > all possible properties sub-node names. This is necessary to check for 
> > extra, undocumented properties using unevaluatedProperties. The creation 
> > of spi-periphera-props.yaml is an example of how to address this. I 
> > suspect that all the partition schemas may need similar restructuring.
> > 
> > The nvmem-cells schema may happen to already have 'label', so it happens 
> > to work (that and unevaluatedProperties is probably missing in places).
> > 
> > Given this schema is really just one property which is already 
> > documented for 'partition' nodes, all we really need is to say is if 
> > 'reg' is not present, then 'label' is required:
> > 
> > if:
> >   not:
> >     required: [ reg ]
> > then:
> >   required: [ label ]
> > 
> >
> 
> Just to make sure. The correct way to implement this would be drop the
> current dynamic-partition schema and expand the partition.yaml with the
> additional if and the extra stuff in the description.
> Wanted to keep the 2 thing separated but if necessary I will follow this
> path.

Yes. I agree separate would have been nice documentation wise, 
but the schema has ended having such a small difference it doesn't 
make sense anymore.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
