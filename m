Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7A6CE7D0B
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 10:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWi3tIFth66Hlje8J9tRTIB9QUaE2YYowhkV2Tsz7AA=; b=WSiOCeHoTp72W9
	on5/GsaiNe9JSFCwsREV3Gql75ZcwZuamW0NGxuClDvJWH5wvdvL1hF3RWgh4WDcwdkRVZdSvH300
	wPQxIZy8+7bTIMJ96LsZOK0yEEeOVE4Z8HP/IS0E8rIA2sMtEaNGn629w8Y+Qfvtyq3xywI2A9Hgu
	anI+pO/+9sxnAx9Uche7rTKYvoGxDAaiYLBL12KnS1O/mfC2KuLEQr5z0VyjX+N8GDQJD1D7ztyLu
	kMGXxx66gKFphSKkoDGtSUuOpG6VSTotnEM3nAET1g/lBORC4D7eR7Js5R6GFCEHXjrVI/+7doV2I
	RSGwvyVQzxQ+75TJwoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sva8w-00000002Lp1-2Dpd;
	Tue, 01 Oct 2024 10:30:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sva7n-00000002LdM-15jJ
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 10:29:01 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37cd1ccaf71so2628050f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2024 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727778537; x=1728383337; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XxxaxknpIr+rYBfvQOLwgicD/hlb/iC9+wZ3tE8jGrk=;
        b=S0JZPddvrZHiVKOKmri9RNSe2F9k4691F8dwlmChbjzDFHIyxfTl6paDHKJYdXnVs9
         tKdN4fDHuHFpY3bnVqbZoQ0wT2yuQV+AUK8g6CWQuzQhmKnGVEXOygoN8vdfbUQfMOGn
         DBtpWUsktmQmItwGlpWiWH745sgRSTo8iC/fEyJhKMTGGVy/al7UnGppw78n6ar+H+2e
         PLwDqW8RuRVzRGxYz7DwkK2fTC92a6AGKpByl3TlY2fIPQXkXXWBZYHJDmGZ1ThXFuN4
         IyINPYcMdtKISqrGKDMNuVc4OHY9zxSB29HPKuH2qA9V+l82hwQ+lhvo9lCzqfgF0ZR3
         zwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727778537; x=1728383337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxxaxknpIr+rYBfvQOLwgicD/hlb/iC9+wZ3tE8jGrk=;
        b=CPZfNjVb+E0AOgJ947FVIe95S8eBWzP5MdhaRGaJD465ij6+LZMiWgz9ZhSqCDEq8B
         hHOfUukkr2FZM9UZcDCqYHRsgq4Zwet7tiYHGTJqP3b1yrSR9/79+h68cfTfzeQtmtCr
         l+Lw8hnyiH5q9qf+n+hR4x9azT4VyKKMkWR4V3apIkxCW0jdrEqb7L21+IplZ7IrG5qh
         vchJsVvxrjmG3cWtJVDmE2OryCEYfllBD+I5wiPS/wcSQnGMk2NaiaAcRBVEyHfmHN6n
         dAGp3gAj0KXiNAGdsDzbFWx74fa0qt2/sa/KJiiUTMoWWZK/hMCGI9QZtKmgH8MhsALv
         VmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSAbD/f8nlrY8vCHBdvldvVpl7M9cqG47FuhG9E8cpfA7vEELQJrALU3qQzGTMCT85SDsKAzsAj9Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmHemCEfCbXSSdrLDmVTjp8/eACSsm22UgAosMVQ9VKncChcFJ
	qmwUCp5ez6g/ozdFMtp+gxoxLneeIn8orjT7cuMcs/swCjChNRQL
X-Google-Smtp-Source: AGHT+IGKollpdraY9TlsQu6ZSshUlo/5yR2eEYDo1CRP7REYF+jzfTN9M2CEbhYPINZAKREV3K3hmg==
X-Received: by 2002:adf:ae19:0:b0:374:cc89:174b with SMTP id ffacd0b85a97d-37cf289c56fmr1384753f8f.4.1727778537127;
        Tue, 01 Oct 2024 03:28:57 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575de73sm11383189f8f.115.2024.10.01.03.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 03:28:56 -0700 (PDT)
Message-ID: <66fbcee8.df0a0220.2ad0cb.4f6a@mx.google.com>
X-Google-Original-Message-ID: <ZvvO4-N6wVe-f33I@Ansuel-XPS.>
Date: Tue, 1 Oct 2024 12:28:51 +0200
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
 <66fa7915.050a0220.1da288.aeca@mx.google.com>
 <20241001104225.67483dab@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241001104225.67483dab@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_032859_338286_5D8903DE 
X-CRM114-Status: GOOD (  67.07  )
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

On Tue, Oct 01, 2024 at 10:42:25AM +0200, Miquel Raynal wrote:
> Hi Christian,
> =

> ansuelsmth@gmail.com wrote on Mon, 30 Sep 2024 12:10:21 +0200:
> =

> > On Mon, Sep 30, 2024 at 11:48:19AM +0200, Miquel Raynal wrote:
> > > Hi Christian,
> > > =

> > > ansuelsmth@gmail.com wrote on Wed, 25 Sep 2024 14:06:11 +0200:
> > >   =

> > > > On Wed, Sep 25, 2024 at 01:52:56PM +0200, Miquel Raynal wrote:  =

> > > > > Hi Christian,
> > > > > =

> > > > > ansuelsmth@gmail.com wrote on Wed, 25 Sep 2024 13:35:38 +0200:
> > > > >     =

> > > > > > On Wed, Sep 25, 2024 at 01:30:03PM +0200, Miquel Raynal wrote: =
   =

> > > > > > > Hi Christian,
> > > > > > > =

> > > > > > > ansuelsmth@gmail.com wrote on Wed, 25 Sep 2024 12:13:58 +0200:
> > > > > > >       =

> > > > > > > > Add Documentation for Airoha fixed-partitions compatibles.
> > > > > > > > =

> > > > > > > > Airoha based SoC declare a dedicated partition at the end o=
f the flash to
> > > > > > > > store calibration and device specific data, in addition to =
fixed
> > > > > > > > partitions.
> > > > > > > > =

> > > > > > > > The offset of this special partition is not well defined as=
 a custom bad
> > > > > > > > block management driver is used that reserve space at the e=
nd of the flash.
> > > > > > > > =

> > > > > > > > This binding allows defining all fixed partitions and marki=
ng the last one
> > > > > > > > to detect the correct offset.
> > > > > > > > =

> > > > > > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > > > > > ---
> > > > > > > >  .../partitions/airoha,fixed-partitions.yaml   | 80 +++++++=
++++++++++++
> > > > > > > >  .../bindings/mtd/partitions/partitions.yaml   |  1 +
> > > > > > > >  2 files changed, 81 insertions(+)
> > > > > > > >  create mode 100644 Documentation/devicetree/bindings/mtd/p=
artitions/airoha,fixed-partitions.yaml
> > > > > > > > =

> > > > > > > > diff --git a/Documentation/devicetree/bindings/mtd/partitio=
ns/airoha,fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/par=
titions/airoha,fixed-partitions.yaml
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..a45df51065af
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/mtd/partitions/airo=
ha,fixed-partitions.yaml
> > > > > > > > @@ -0,0 +1,80 @@
> > > > > > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > > > > > +%YAML 1.2
> > > > > > > > +---
> > > > > > > > +$id: http://devicetree.org/schemas/mtd/partitions/airoha,f=
ixed-partitions.yaml#
> > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > +
> > > > > > > > +title: Airoha SoC partitioning
> > > > > > > > +
> > > > > > > > +description: |
> > > > > > > > +  Airoha based SoC declare a dedicated partition at the en=
d of the flash to
> > > > > > > > +  store calibration and device specific data, in addition =
to fixed partitions.
> > > > > > > > +
> > > > > > > > +  The offset of this special partition is not well defined=
 as a custom bad block
> > > > > > > > +  management driver is used that reserve space at the end =
of the flash.
> > > > > > > > +
> > > > > > > > +  This binding allows defining all fixed partitions and ma=
rking the last one to
> > > > > > > > +  detect the correct offset from the new end of the flash.
> > > > > > > > +
> > > > > > > > +maintainers:
> > > > > > > > +  - Christian Marangi <ansuelsmth@gmail.com>
> > > > > > > > +
> > > > > > > > +select: false
> > > > > > > > +
> > > > > > > > +properties:
> > > > > > > > +  compatible:
> > > > > > > > +    const: airoha,fixed-partitions
> > > > > > > > +
> > > > > > > > +  "#address-cells":
> > > > > > > > +    enum: [ 1, 2 ]
> > > > > > > > +
> > > > > > > > +  "#size-cells":
> > > > > > > > +    enum: [ 1, 2 ]
> > > > > > > > +
> > > > > > > > +patternProperties:
> > > > > > > > +  "^partition@[0-9a-f]+$":
> > > > > > > > +    $ref: partition.yaml#
> > > > > > > > +    properties:
> > > > > > > > +      compatible:
> > > > > > > > +        const: airoha,dynamic-art
> > > > > > > > +    unevaluatedProperties: false
> > > > > > > > +
> > > > > > > > +required:
> > > > > > > > +  - "#address-cells"
> > > > > > > > +  - "#size-cells"
> > > > > > > > +
> > > > > > > > +additionalProperties: false
> > > > > > > > +
> > > > > > > > +examples:
> > > > > > > > +  - |
> > > > > > > > +    partitions {
> > > > > > > > +        compatible =3D "airoha,fixed-partitions";
> > > > > > > > +        #address-cells =3D <1>;
> > > > > > > > +        #size-cells =3D <1>;
> > > > > > > > +
> > > > > > > > +        partition@0 {
> > > > > > > > +          label =3D "bootloader";
> > > > > > > > +          reg =3D <0x00000000 0x00080000>;
> > > > > > > > +        };
> > > > > > > > +
> > > > > > > > +        partition@80000 {
> > > > > > > > +          label =3D "tclinux";
> > > > > > > > +          reg =3D <0x00080000 0x02800000>;
> > > > > > > > +        };
> > > > > > > > +
> > > > > > > > +        partition@2880000 {
> > > > > > > > +          label =3D "tclinux_slave";
> > > > > > > > +          reg =3D <0x02880000 0x02800000>;
> > > > > > > > +        };
> > > > > > > > +
> > > > > > > > +        partition@5080000 {
> > > > > > > > +          label =3D "rootfs_data";
> > > > > > > > +          reg =3D <0x5080000 0x00800000>;
> > > > > > > > +        };
> > > > > > > > +
> > > > > > > > +        partition@ffffffff {
> > > > > > > > +          compatible =3D "airoha,dynamic-art";
> > > > > > > > +          label =3D "art";
> > > > > > > > +          reg =3D <0xffffffff 0x00300000>;      =

> > > > > > > =

> > > > > > > I'm a little bit puzzled by this kind of information which is=
 known to
> > > > > > > be wrong. As the partition offset and size must be dynamically
> > > > > > > calculated, this reg property (as well as the size parameter =
of the
> > > > > > > previous one) are notably wrong. I guess we are not fully con=
strained
> > > > > > > by the fixed-partitions schema here, so could we avoid the re=
g property
> > > > > > > in the airoha,dynamic-art partition? Maybe we also need a #de=
fine for a
> > > > > > > specific placeholder in the penultimate reg property too (for=
 the size).
> > > > > > >      =

> > > > > > =

> > > > > > Maybe instead of reg we can use a property like size?
> > > > > > =

> > > > > > Can you better elaborate the suggestion about the #define?
> > > > > > =

> > > > > > Do you mean for case where the last partition might overlap
> > > > > > with the penultimate? Honestly in such case I would error hard,=
 that
> > > > > > case happen when too much space is reserved and that is a
> > > > > > misconfiguration of the system (developer error)    =

> > > > > =

> > > > > That's not what I mean.
> > > > > =

> > > > > In the above case you say partition "partition@5080000" is 0x8000=
00
> > > > > bytes long. This is obviously wrong otherwise you would know wher=
e the
> > > > > art partition starts. And right after you're saying partition
> > > > > "partition@ffffffff" starts at 0xffffffff and is 0x300000 bytes l=
ong.
> > > > > This is also wrong because 0xffffffff is not a valid start addres=
s and
> > > > > IIUC 0x300000 is also unknown and dynamically derived.
> > > > > =

> > > > > So for the art partition my advise if you know nothing about the
> > > > > start/length is to just skip the reg property. For the previous
> > > > > partition I'd maybe use a definition (whose name is to discuss) i=
nstead
> > > > > of the wrong size argument (the start offset being correct on his=
 side).
> > > > >    =

> > > > =

> > > > Ok probably the description isn't clear enough. The missing info th=
at
> > > > require this parser is the flash end.
> > > > =

> > > > Following the example we know the size of rootfs_data and start off=
set
> > > > AND we know the size of the ART partition.
> > > > =

> > > > There might be a space in the middle unused between the rootfs_data
> > > > partition and the art partition. What is derived is the starting of=
fset
> > > > of the art partition that is flash end - art partition size.
> > > > (where flash end change and is not always the same due to how the s=
pecial
> > > > bad block managament table reserved space is handled)
> > > > =

> > > > This is why 0xffffffff, used as a dummy offset to signal it will be=
 parsed at
> > > > runtime. On second tought tho maybe using this dummy offset is wron=
g and
> > > > I should just have something like
> > > > =

> > > > length =3D <0x300000>;
> > > > =

> > > > Is it clear now? Sorry for any confusion.  =

> > > =

> > > I'm sorry but not really. You know the end of the physical device and
> > > the size of the ART partition, so you must know its start as well?
> > >  =

> > =

> > Before the system boot we know:
> > - size of the ART partition
> > - real size of the physical device (512mb... 1G... 64mb...)
> > =

> > When the physical device is probed (nand) a special driver is loaded
> > (before mtd parsing logic) that change the physical size of the device
> > (mtd->size) as at the end of the nand some space is reserved for bad
> > block management and other metadata info.
> =

> Here you are explaining what you intend Linux to do, right? I would
> like to understand what you are trying to solve. I dont understand why
> you need the size change, I don't understand why you don't know the
> start of the ART partition, I don't understand what the data you are
> hiding contains and who uses it :-) I'm sorry, this is too unclear yet.

Totally not a problem and thanks a lot for you keep asking them... More
than happy to clear things, I'm trying to solve a problem present on
Airoha SoC and upstreaming a correct parser for it.

What I'm trying to solve:

Correct access to this partition at the end of the flash in an automated
way.

The content of this partition is the usual ART partition found on lots of
embedded devices. MAC address, wifi calibration data, serial. Usage is
NVMEM cells and userspace with dd command to extract data from.

Airoha use something also used by some mediatek SoC. They call it BMT
and it's currently used downstream in OpenWrt and they firmware. This is
also used in the bootloader.

The usage of BMT is a custom way to handle bad blocks entirely by
software. At the end of the flash some space is reserved where info
about all the blocks of the flash are put. I'm not 100% sure about the
functionality of this but it can relocate block and do magic things to
handle bad blocks. For the scope of this change, the important info is
that after the BMT is probed, the operation of "reserving space" is done
by reducing the MTD flash size. So from the MTD subsystem, it does see a
smaller flash than it actually is.

The reserved space change! Across SoC or even devices but the BMT is a
must where it's used as bootloader makes use of it and writing to it
might confuse the bootloader corrupting data. (one block might be
flagged as bad ad data moved, BMT driver validates his table and do
operation)

We discover this the hard way at times with firmware getting corrupted
on upgrading it.

The intention of this parser is to handle this problem transparently and
easier.

The Airoha partition scheme always follow this logic:
- bootloader
- fit image (kernel+rootfs)
- fit image backup (kernel+rootfs) (optional)
- rootfs_data
- opaque data (no partition)
- ART partition (end of partition =3D start of reserved BMT)
- BMT reserved space
- end of flash

What I'm trying to solve is making it easy to calculate the offset of
the partition written before the BMT reserved space.

Feel free to ask more question about this and again thanks the help in
figuring this out.

> =

> Quoting your cover letter:
> =

> 	"This require dynamic calculation of the offset as some
> 	dedicated driver for bad block management might be used that
> 	reserve some space at the end of the flash for bad block
> 	accounting. This special driver change the end offset of the
> 	flash hence a dynamic parser is needed."
> =

> I don't know what this "dedicated driver" is, I don't understand why it
> is needed.

I hope it's clear what is the usage of this driver now. (In short a
software way to handle bad block from Mediatek that propagated to Airoha)

> =

> > So on the mtd parsing logic we know:
> > - size of the ART partitiomn
> > - new size of the physical device (512-reserved space...)
> > =

> > And we calculate the start offset of the ART partition.
> > =

> > It's very difficult to know what is the new size of the physical device
> > after the driver change it as it might change based on the internal
> > configuration of the driver itself.
> =

> Thanks,
> Miqu=E8l

-- =

	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
