Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7C4C369D7
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 12:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IOUaFL+9ajC/b2rl1SzP2s2WuJaGE2/kklH4Xgix30=; b=VTVQTOCpux6QU/
	JKzxXHxZ77cBcEw3zeXYM8cGEL/cBFQvvBCVGKOfI32WEuC9WDclIqLcbPgNIruYkbS6hFAfFvk+s
	ID12IZyqiSMTDDfeLKkw/r6FJsSfflrcPd+aGhh3p73IRHkecflPlVVYpKL5PF541vddjZAnVTFrY
	L3/hN/sg08piHkMTpfpRLOg1pZuDRfG3Ca3Wbcnr7aHpf685ZNZhliQBm72yol4Lg+JgyHgGL8Qcz
	rwHTsSZVuRTDUd6lKt+ttx2RY8hS1pDEjTMHfqXQVyJ53MQ4f1EY2zOJEz33adL/+1NZj5wFfptCU
	i2aQ/GEWbrOYZzh89C4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stQy3-000000055uD-1tbB;
	Wed, 25 Sep 2024 12:18:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQmf-0000000524a-3EMs
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 12:06:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so6531632f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727265976; x=1727870776; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GFGu7JG+fN86SqEPQDV5t2R/+6V1TMtaekXfpbj35vo=;
        b=cdv9o8apX5XJGrIpagEI5XcMHZ5RxfEJBkPJEsuRoV3P5rCy5N7gCGJ6Wzqx3d436W
         FOuaM4L58WoOrGcGPiFo3LnFncvHSvFuAKfxE4mFTfZT5SxkcYk4w6DNuE/lzhPNVusA
         QPzZHIAuBNnc+KNIfJegmVeLN0LNOWCpRA3O5VIYZcoPTzxa3Ym262NxqBkBvyUzi4U0
         fM68XSwkfh0Jtq1YWflRSyFO7+BhJ9uks2G2dev8ZRTFbTTpaNdm46w34PKCn1d9d/vE
         kVfSsVDKeqjFdS8y92SZGWWrGHt1btrSlBFqnOwW8Hr3bql3Ueu1lR7JDXZWH91/D6dZ
         69yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727265976; x=1727870776;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFGu7JG+fN86SqEPQDV5t2R/+6V1TMtaekXfpbj35vo=;
        b=Lmwy3GA52H6Smj7bPlvFrzyRAGN6OK+Wvs4Fm19Ein29C/Kg+AP5fxGsnMRtDfBeOP
         AwsGtqpaGuemsIFY7aXgp2gkZBDo9FAGgd6l4ePhJhd+6Hhz7Wt20jXvZyWDxVUosL9A
         ynXx+aw70JRfqm+WfXCv/eGWQ8/Oyd9Vvlc75BNqv+orMiYuxJGGZUJzubRlta7YQRLY
         3cdgUSmoO4epXjxHHuA8xEZ6529iEqE2qLQV5Af5KUpshD5NDTxoKJ+3vwWxqzBNzCia
         8tZTYHfBUCcS413NZYIHth2rqZYysUDRMR29q3l2BneHIUJRxTGsBwL96dAGQmSrXCVb
         IoyA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5pLmWx3nOf9M9UeuMKYtluU/79oDeFCH+t1okgww5wBHuKfVSkP6q0RienQrXpbNjeMTWuu58/Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ039OXr0ronvL6hhcUfIGEiMeuSHEx1R65syQ0RboPSKxcmZS
	0vIUvFeKf6ANbnzitfEeZmvs+98duEGzt+ZR9qg3mf0VMHwQf62K
X-Google-Smtp-Source: AGHT+IHui2T3XvdVgwebU7tifxGbADu36lPdixerBRDLTCO+Id/czkCJ54OP+u092S/jZ28BuBXgyg==
X-Received: by 2002:a5d:660a:0:b0:374:bcdc:6257 with SMTP id ffacd0b85a97d-37cc24c687dmr2345251f8f.54.1727265975674;
        Wed, 25 Sep 2024 05:06:15 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8b55sm3823201f8f.17.2024.09.25.05.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 05:06:15 -0700 (PDT)
Message-ID: <66f3fcb7.5d0a0220.3ca4c2.ba83@mx.google.com>
X-Google-Original-Message-ID: <ZvP8s3zhrBtvmnYz@Ansuel-XPS.>
Date: Wed, 25 Sep 2024 14:06:11 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>,
	upstream@airoha.com
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add Documentation for Airoha
 fixed-partitions
References: <20240925101422.8373-1-ansuelsmth@gmail.com>
 <20240925101422.8373-3-ansuelsmth@gmail.com>
 <20240925133003.619c40c4@xps-13>
 <66f3f58e.5d0a0220.5d655.b48a@mx.google.com>
 <20240925135256.32d3a0f7@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925135256.32d3a0f7@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_050618_172634_FCE994A1 
X-CRM114-Status: GOOD (  44.41  )
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

On Wed, Sep 25, 2024 at 01:52:56PM +0200, Miquel Raynal wrote:
> Hi Christian,
> 
> ansuelsmth@gmail.com wrote on Wed, 25 Sep 2024 13:35:38 +0200:
> 
> > On Wed, Sep 25, 2024 at 01:30:03PM +0200, Miquel Raynal wrote:
> > > Hi Christian,
> > > 
> > > ansuelsmth@gmail.com wrote on Wed, 25 Sep 2024 12:13:58 +0200:
> > >   
> > > > Add Documentation for Airoha fixed-partitions compatibles.
> > > > 
> > > > Airoha based SoC declare a dedicated partition at the end of the flash to
> > > > store calibration and device specific data, in addition to fixed
> > > > partitions.
> > > > 
> > > > The offset of this special partition is not well defined as a custom bad
> > > > block management driver is used that reserve space at the end of the flash.
> > > > 
> > > > This binding allows defining all fixed partitions and marking the last one
> > > > to detect the correct offset.
> > > > 
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > ---
> > > >  .../partitions/airoha,fixed-partitions.yaml   | 80 +++++++++++++++++++
> > > >  .../bindings/mtd/partitions/partitions.yaml   |  1 +
> > > >  2 files changed, 81 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
> > > > new file mode 100644
> > > > index 000000000000..a45df51065af
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
> > > > @@ -0,0 +1,80 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/mtd/partitions/airoha,fixed-partitions.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Airoha SoC partitioning
> > > > +
> > > > +description: |
> > > > +  Airoha based SoC declare a dedicated partition at the end of the flash to
> > > > +  store calibration and device specific data, in addition to fixed partitions.
> > > > +
> > > > +  The offset of this special partition is not well defined as a custom bad block
> > > > +  management driver is used that reserve space at the end of the flash.
> > > > +
> > > > +  This binding allows defining all fixed partitions and marking the last one to
> > > > +  detect the correct offset from the new end of the flash.
> > > > +
> > > > +maintainers:
> > > > +  - Christian Marangi <ansuelsmth@gmail.com>
> > > > +
> > > > +select: false
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: airoha,fixed-partitions
> > > > +
> > > > +  "#address-cells":
> > > > +    enum: [ 1, 2 ]
> > > > +
> > > > +  "#size-cells":
> > > > +    enum: [ 1, 2 ]
> > > > +
> > > > +patternProperties:
> > > > +  "^partition@[0-9a-f]+$":
> > > > +    $ref: partition.yaml#
> > > > +    properties:
> > > > +      compatible:
> > > > +        const: airoha,dynamic-art
> > > > +    unevaluatedProperties: false
> > > > +
> > > > +required:
> > > > +  - "#address-cells"
> > > > +  - "#size-cells"
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    partitions {
> > > > +        compatible = "airoha,fixed-partitions";
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <1>;
> > > > +
> > > > +        partition@0 {
> > > > +          label = "bootloader";
> > > > +          reg = <0x00000000 0x00080000>;
> > > > +        };
> > > > +
> > > > +        partition@80000 {
> > > > +          label = "tclinux";
> > > > +          reg = <0x00080000 0x02800000>;
> > > > +        };
> > > > +
> > > > +        partition@2880000 {
> > > > +          label = "tclinux_slave";
> > > > +          reg = <0x02880000 0x02800000>;
> > > > +        };
> > > > +
> > > > +        partition@5080000 {
> > > > +          label = "rootfs_data";
> > > > +          reg = <0x5080000 0x00800000>;
> > > > +        };
> > > > +
> > > > +        partition@ffffffff {
> > > > +          compatible = "airoha,dynamic-art";
> > > > +          label = "art";
> > > > +          reg = <0xffffffff 0x00300000>;  
> > > 
> > > I'm a little bit puzzled by this kind of information which is known to
> > > be wrong. As the partition offset and size must be dynamically
> > > calculated, this reg property (as well as the size parameter of the
> > > previous one) are notably wrong. I guess we are not fully constrained
> > > by the fixed-partitions schema here, so could we avoid the reg property
> > > in the airoha,dynamic-art partition? Maybe we also need a #define for a
> > > specific placeholder in the penultimate reg property too (for the size).
> > >  
> > 
> > Maybe instead of reg we can use a property like size?
> > 
> > Can you better elaborate the suggestion about the #define?
> > 
> > Do you mean for case where the last partition might overlap
> > with the penultimate? Honestly in such case I would error hard, that
> > case happen when too much space is reserved and that is a
> > misconfiguration of the system (developer error)
> 
> That's not what I mean.
> 
> In the above case you say partition "partition@5080000" is 0x800000
> bytes long. This is obviously wrong otherwise you would know where the
> art partition starts. And right after you're saying partition
> "partition@ffffffff" starts at 0xffffffff and is 0x300000 bytes long.
> This is also wrong because 0xffffffff is not a valid start address and
> IIUC 0x300000 is also unknown and dynamically derived.
> 
> So for the art partition my advise if you know nothing about the
> start/length is to just skip the reg property. For the previous
> partition I'd maybe use a definition (whose name is to discuss) instead
> of the wrong size argument (the start offset being correct on his side).
>

Ok probably the description isn't clear enough. The missing info that
require this parser is the flash end.

Following the example we know the size of rootfs_data and start offset
AND we know the size of the ART partition.

There might be a space in the middle unused between the rootfs_data
partition and the art partition. What is derived is the starting offset
of the art partition that is flash end - art partition size.
(where flash end change and is not always the same due to how the special
bad block managament table reserved space is handled)

This is why 0xffffffff, used as a dummy offset to signal it will be parsed at
runtime. On second tought tho maybe using this dummy offset is wrong and
I should just have something like

length = <0x300000>;

Is it clear now? Sorry for any confusion.

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
