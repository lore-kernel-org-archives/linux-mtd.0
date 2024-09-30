Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ABACF6497
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+09iS3koSZT7+Ma3Z+NOJgkzmgo5dWvXtSR61xkVF70=; b=aenc14JRX0fb6F
	Upq6zmfFaVeGhcU/VzHOA6w8ewBCaYJcI+RjFIx+zHqVBiM+AjjuEZ4SS0v/PayhiYULzC6ltHemN
	Zn4cjKB+/n0kmbB4XVk2vdd0gb1sPr4f4x2p1tK9J+27OVu7biLYxGihAWGp1/Ku27MSP/TkjLw0t
	Gr3+pNSL/5ydFKEBCkPMZ7rkPs3lilz27xIG94GUhNd+KoWG3+VxDiEyNCsfveLUtDb8K0Xc0972Q
	eCuI5uSGgxRSfrv1+a6A7qw6tl19kqgZSRLH/HM47uGvgdhLUHBrl9ENIAREyO2P2AS/f2Q3+LnvS
	s2oHZUGJg/VHoQb0kKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDMp-0000000GfEX-1Jet;
	Mon, 30 Sep 2024 10:10:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svDMN-0000000GfBR-3PiT
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 10:10:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so31907195e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727691030; x=1728295830; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y8rM4vaCgNhaV0OL1RGwyXhfJ2KpUtBg+F/ROraRtak=;
        b=KF0EGZeYPXtv3GhoYD0lDH0PKFAR8dfvV0PrSO896IFu0/4TrUZ5KzKLJ+ROu07oG8
         NK63JSWFjK08llU78ARFDyayepJskyz5ptSnnurSMsBloyKmZKZ0HHC80tbWcmdGYjgQ
         E5BTz1Bh3o69uG9jVQsZOmx+9MX0LhzcQHWi/TURXktGzAJRGj0inhIAv6wR0+4GwkyU
         G5A09IRZX7efLSl+Sd9AgK8Ut/n+kZv6P/kWSQwEAseNCmaFonjVAtOhcLqUP/nCa3ZF
         aNfu7fU3ztCWi+PqcIAA+pRwpFVSGQEDmqOPGyGxCsi5RCFPcNP06jW05ybMJQmQROQK
         /bCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727691030; x=1728295830;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8rM4vaCgNhaV0OL1RGwyXhfJ2KpUtBg+F/ROraRtak=;
        b=stV1JN5RMfbs4M3d5ocNKNnlVOU3GdSKlFII4zkfdekBwt+LTAQwXszL2ir3TZ4D9a
         xjv6UJq3sR4YKKJausMZaWJ4zrVk4zdm/XNcNag3DtVu40UC4QbbGxMhzTytCK594M9Y
         pQrA/Fp9CURCAD8EzD6QTJy2tU4FHc9jJFnfq+Ljn52DHan0WWdinW9eO/ZRlnffjH62
         FhelKK5NUrDyONXc04WftP5d9weEXivpwyLuw0p2nUw7kDmQ4tUApNnHBkd4WPs0smWr
         A/SRvDYLK5tUNHpo12/iMQHwNeSw3R5ey5j1D9XDJfFO4s4fiyCTo1KM74BK/dU+8V8C
         vZIg==
X-Forwarded-Encrypted: i=1; AJvYcCVI/KoAeSe9ryXl5IQzsXkwNsqfVWxg+HfczbSV0X58xIYVrgWxCdF0rvUEHzJOFTxorgIJ47V2IG0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxB+HlJNS4QUQz4NuaJgBOeqGUefpKGuPmHRMP1bKrfa1V53fAk
	ykN5X3peU+GVGFOhXZ1ebqzPjAzFjkugAXjKoUKTXMkMfUdrCsB1
X-Google-Smtp-Source: AGHT+IForZE+pZqxxqdfv6Tm5Wx3aKxtf2heafNKQrlGZqGJXBKs6oQZ0PV9/fIbGL4uQ3QmDirm7A==
X-Received: by 2002:a05:600c:3ca6:b0:426:6710:223c with SMTP id 5b1f17b1804b1-42f584128f9mr78677545e9.9.1727691029809;
        Mon, 30 Sep 2024 03:10:29 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575e322sm8597501f8f.110.2024.09.30.03.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:10:29 -0700 (PDT)
Message-ID: <66fa7915.050a0220.1da288.aeca@mx.google.com>
X-Google-Original-Message-ID: <Zvp5DQVxOxhe5bGk@Ansuel-XPS.>
Date: Mon, 30 Sep 2024 12:10:21 +0200
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
 <66f3fcb7.5d0a0220.3ca4c2.ba83@mx.google.com>
 <20240930114819.609f9341@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930114819.609f9341@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_031031_886455_308268A0 
X-CRM114-Status: GOOD (  53.76  )
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

On Mon, Sep 30, 2024 at 11:48:19AM +0200, Miquel Raynal wrote:
> Hi Christian,
> 
> ansuelsmth@gmail.com wrote on Wed, 25 Sep 2024 14:06:11 +0200:
> 
> > On Wed, Sep 25, 2024 at 01:52:56PM +0200, Miquel Raynal wrote:
> > > Hi Christian,
> > > 
> > > ansuelsmth@gmail.com wrote on Wed, 25 Sep 2024 13:35:38 +0200:
> > >   
> > > > On Wed, Sep 25, 2024 at 01:30:03PM +0200, Miquel Raynal wrote:  
> > > > > Hi Christian,
> > > > > 
> > > > > ansuelsmth@gmail.com wrote on Wed, 25 Sep 2024 12:13:58 +0200:
> > > > >     
> > > > > > Add Documentation for Airoha fixed-partitions compatibles.
> > > > > > 
> > > > > > Airoha based SoC declare a dedicated partition at the end of the flash to
> > > > > > store calibration and device specific data, in addition to fixed
> > > > > > partitions.
> > > > > > 
> > > > > > The offset of this special partition is not well defined as a custom bad
> > > > > > block management driver is used that reserve space at the end of the flash.
> > > > > > 
> > > > > > This binding allows defining all fixed partitions and marking the last one
> > > > > > to detect the correct offset.
> > > > > > 
> > > > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > > > ---
> > > > > >  .../partitions/airoha,fixed-partitions.yaml   | 80 +++++++++++++++++++
> > > > > >  .../bindings/mtd/partitions/partitions.yaml   |  1 +
> > > > > >  2 files changed, 81 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..a45df51065af
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
> > > > > > @@ -0,0 +1,80 @@
> > > > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/mtd/partitions/airoha,fixed-partitions.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Airoha SoC partitioning
> > > > > > +
> > > > > > +description: |
> > > > > > +  Airoha based SoC declare a dedicated partition at the end of the flash to
> > > > > > +  store calibration and device specific data, in addition to fixed partitions.
> > > > > > +
> > > > > > +  The offset of this special partition is not well defined as a custom bad block
> > > > > > +  management driver is used that reserve space at the end of the flash.
> > > > > > +
> > > > > > +  This binding allows defining all fixed partitions and marking the last one to
> > > > > > +  detect the correct offset from the new end of the flash.
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Christian Marangi <ansuelsmth@gmail.com>
> > > > > > +
> > > > > > +select: false
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: airoha,fixed-partitions
> > > > > > +
> > > > > > +  "#address-cells":
> > > > > > +    enum: [ 1, 2 ]
> > > > > > +
> > > > > > +  "#size-cells":
> > > > > > +    enum: [ 1, 2 ]
> > > > > > +
> > > > > > +patternProperties:
> > > > > > +  "^partition@[0-9a-f]+$":
> > > > > > +    $ref: partition.yaml#
> > > > > > +    properties:
> > > > > > +      compatible:
> > > > > > +        const: airoha,dynamic-art
> > > > > > +    unevaluatedProperties: false
> > > > > > +
> > > > > > +required:
> > > > > > +  - "#address-cells"
> > > > > > +  - "#size-cells"
> > > > > > +
> > > > > > +additionalProperties: false
> > > > > > +
> > > > > > +examples:
> > > > > > +  - |
> > > > > > +    partitions {
> > > > > > +        compatible = "airoha,fixed-partitions";
> > > > > > +        #address-cells = <1>;
> > > > > > +        #size-cells = <1>;
> > > > > > +
> > > > > > +        partition@0 {
> > > > > > +          label = "bootloader";
> > > > > > +          reg = <0x00000000 0x00080000>;
> > > > > > +        };
> > > > > > +
> > > > > > +        partition@80000 {
> > > > > > +          label = "tclinux";
> > > > > > +          reg = <0x00080000 0x02800000>;
> > > > > > +        };
> > > > > > +
> > > > > > +        partition@2880000 {
> > > > > > +          label = "tclinux_slave";
> > > > > > +          reg = <0x02880000 0x02800000>;
> > > > > > +        };
> > > > > > +
> > > > > > +        partition@5080000 {
> > > > > > +          label = "rootfs_data";
> > > > > > +          reg = <0x5080000 0x00800000>;
> > > > > > +        };
> > > > > > +
> > > > > > +        partition@ffffffff {
> > > > > > +          compatible = "airoha,dynamic-art";
> > > > > > +          label = "art";
> > > > > > +          reg = <0xffffffff 0x00300000>;    
> > > > > 
> > > > > I'm a little bit puzzled by this kind of information which is known to
> > > > > be wrong. As the partition offset and size must be dynamically
> > > > > calculated, this reg property (as well as the size parameter of the
> > > > > previous one) are notably wrong. I guess we are not fully constrained
> > > > > by the fixed-partitions schema here, so could we avoid the reg property
> > > > > in the airoha,dynamic-art partition? Maybe we also need a #define for a
> > > > > specific placeholder in the penultimate reg property too (for the size).
> > > > >    
> > > > 
> > > > Maybe instead of reg we can use a property like size?
> > > > 
> > > > Can you better elaborate the suggestion about the #define?
> > > > 
> > > > Do you mean for case where the last partition might overlap
> > > > with the penultimate? Honestly in such case I would error hard, that
> > > > case happen when too much space is reserved and that is a
> > > > misconfiguration of the system (developer error)  
> > > 
> > > That's not what I mean.
> > > 
> > > In the above case you say partition "partition@5080000" is 0x800000
> > > bytes long. This is obviously wrong otherwise you would know where the
> > > art partition starts. And right after you're saying partition
> > > "partition@ffffffff" starts at 0xffffffff and is 0x300000 bytes long.
> > > This is also wrong because 0xffffffff is not a valid start address and
> > > IIUC 0x300000 is also unknown and dynamically derived.
> > > 
> > > So for the art partition my advise if you know nothing about the
> > > start/length is to just skip the reg property. For the previous
> > > partition I'd maybe use a definition (whose name is to discuss) instead
> > > of the wrong size argument (the start offset being correct on his side).
> > >  
> > 
> > Ok probably the description isn't clear enough. The missing info that
> > require this parser is the flash end.
> > 
> > Following the example we know the size of rootfs_data and start offset
> > AND we know the size of the ART partition.
> > 
> > There might be a space in the middle unused between the rootfs_data
> > partition and the art partition. What is derived is the starting offset
> > of the art partition that is flash end - art partition size.
> > (where flash end change and is not always the same due to how the special
> > bad block managament table reserved space is handled)
> > 
> > This is why 0xffffffff, used as a dummy offset to signal it will be parsed at
> > runtime. On second tought tho maybe using this dummy offset is wrong and
> > I should just have something like
> > 
> > length = <0x300000>;
> > 
> > Is it clear now? Sorry for any confusion.
> 
> I'm sorry but not really. You know the end of the physical device and
> the size of the ART partition, so you must know its start as well?
>

Before the system boot we know:
- size of the ART partition
- real size of the physical device (512mb... 1G... 64mb...)

When the physical device is probed (nand) a special driver is loaded
(before mtd parsing logic) that change the physical size of the device
(mtd->size) as at the end of the nand some space is reserved for bad
block management and other metadata info.

So on the mtd parsing logic we know:
- size of the ART partitiomn
- new size of the physical device (512-reserved space...)

And we calculate the start offset of the ART partition.

It's very difficult to know what is the new size of the physical device
after the driver change it as it might change based on the internal
configuration of the driver itself.

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
