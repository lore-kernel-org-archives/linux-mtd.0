Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59466C369D2
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 11:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhL9+qp9elE+bR+Nb1K784TyTRq7UvsLQUhYuUdMmIY=; b=1B6e5fpEfvcH7J
	pn31eIH3B7aLWvqDuwEjzKKl2qhYZiaUlODe8otjjy579iNnmILIVqHWBbLeIGaepjaX8UiwNnC5P
	/Vj++f0kdx6q9dnjKPD2S7DAd2mHjmKT5odi12fotgb7cZitGZL9GdCKYopnSnq3xAOR3LVhSJozR
	lscAu4evHFdelfycaFegtKwM+g6UgjBlVZ3Y52W00/vADSkDl9+gJyp2YZVv+5Ds+MlEkHBmdMdT5
	nXHzLsXY85VKHT8h7TQA21QXE0AQQU1trU+nCH6tg45/flBvG5RnbxTYuNbtuxzacJtmHl0n6sCtz
	EPN0cItmZpIVXMBaMExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stQJA-00000004tFB-05AE;
	Wed, 25 Sep 2024 11:35:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQJ7-00000004tEn-05cl
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 11:35:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so57539535e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 04:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727264143; x=1727868943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qWs4MKWn4IG5TDYW4mkeYaUP9TdSrJm2s49LW7b6huE=;
        b=Sa+wJ5Tz5vyX5FNAXhIYJZL5joZdxlq4mqgyJU98/EhaULfYar5+JZNqy6BykNJBf2
         pIZ9C6iwC1PBOgXe3q8Es+IOP+8EYHkSL1+Osx5krlt96KUTyTeDLrOuvdg5+YgNJO9p
         0i14bGU4L/6QC6+7pnur9va0KUVg3LalW/SXVvu/D5iIBDOhxJq8Lig1yiBIipKs/cHk
         yhgsksyTJfdG+CWAsHEOB6hMwg9Fd+jZU3TzsmQMCxJFIZ/sKSJD+iVxZJ0VdI/lED6n
         ZgJHQ8YjqbFxAwqb2ZrcOFf5th2flvXPzDghHUZ+XtEmxBfdvFFrbMUfEqOjCPVFIDou
         +2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727264143; x=1727868943;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWs4MKWn4IG5TDYW4mkeYaUP9TdSrJm2s49LW7b6huE=;
        b=OTZensHo8M1KiqCI8G2THXt5I+tq7s/HBWaJHdJ5CVGLt0A/JXbh55MSn6DaemnzbM
         qMwk1DuSts5DvjFp1wH0r3+Xy3kaS/+ltFe7IYZHynsBQr5ymOkRZEcTGkgfTIXUDy4a
         WV2VXIUmTpRZa03YHk9kUYLLOFj5fQN2a1xPkVLWppQrsuy7SBGlVMAZbvQU5UcPOscG
         DTmKBHSXjpWW2FK/js8KLrVkpI4Ipch31ppZOt7H3b2kjsMxX7iF3+X+4U+6W08EyheJ
         7k77lEXQTDH5u6NrGuo27nNusuT/UowGebLF2fpR+IfNl4c+8hgKKJ0uzoCEFI68J14t
         RT+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7703k6klhrZuHPW8KiDWAFYaXU/GzXht6UCsTEYhZ3L6Qvx+bxAv445ge2loR7AoYu8UNTXhIPco=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPw1d+jKRNVkd+TXvuo8RR3VPwu5OWU2sjYIv31iTyst0/dS9k
	oYyR+aflvyHp1RvHoR/PVeHYtqOw75w/lUKLgWVUTWkgkHIzJSZ2
X-Google-Smtp-Source: AGHT+IHRdPtqmM9PLpkqO4zrDeiSAfnuAfG5Sq385VHJ2FgMeMRF8IuH66Jm6m6MGMrtVGh0FU9tAA==
X-Received: by 2002:a5d:4b07:0:b0:374:c1bd:f7c0 with SMTP id ffacd0b85a97d-37cc2479fa9mr1649530f8f.22.1727264142558;
        Wed, 25 Sep 2024 04:35:42 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc32add1sm3713658f8f.114.2024.09.25.04.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:35:42 -0700 (PDT)
Message-ID: <66f3f58e.5d0a0220.5d655.b48a@mx.google.com>
X-Google-Original-Message-ID: <ZvP1isSJk2ebHdLz@Ansuel-XPS.>
Date: Wed, 25 Sep 2024 13:35:38 +0200
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925133003.619c40c4@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_043545_089818_23F0952E 
X-CRM114-Status: GOOD (  30.23  )
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

On Wed, Sep 25, 2024 at 01:30:03PM +0200, Miquel Raynal wrote:
> Hi Christian,
> 
> ansuelsmth@gmail.com wrote on Wed, 25 Sep 2024 12:13:58 +0200:
> 
> > Add Documentation for Airoha fixed-partitions compatibles.
> > 
> > Airoha based SoC declare a dedicated partition at the end of the flash to
> > store calibration and device specific data, in addition to fixed
> > partitions.
> > 
> > The offset of this special partition is not well defined as a custom bad
> > block management driver is used that reserve space at the end of the flash.
> > 
> > This binding allows defining all fixed partitions and marking the last one
> > to detect the correct offset.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../partitions/airoha,fixed-partitions.yaml   | 80 +++++++++++++++++++
> >  .../bindings/mtd/partitions/partitions.yaml   |  1 +
> >  2 files changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
> > new file mode 100644
> > index 000000000000..a45df51065af
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/partitions/airoha,fixed-partitions.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha SoC partitioning
> > +
> > +description: |
> > +  Airoha based SoC declare a dedicated partition at the end of the flash to
> > +  store calibration and device specific data, in addition to fixed partitions.
> > +
> > +  The offset of this special partition is not well defined as a custom bad block
> > +  management driver is used that reserve space at the end of the flash.
> > +
> > +  This binding allows defining all fixed partitions and marking the last one to
> > +  detect the correct offset from the new end of the flash.
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +select: false
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,fixed-partitions
> > +
> > +  "#address-cells":
> > +    enum: [ 1, 2 ]
> > +
> > +  "#size-cells":
> > +    enum: [ 1, 2 ]
> > +
> > +patternProperties:
> > +  "^partition@[0-9a-f]+$":
> > +    $ref: partition.yaml#
> > +    properties:
> > +      compatible:
> > +        const: airoha,dynamic-art
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    partitions {
> > +        compatible = "airoha,fixed-partitions";
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        partition@0 {
> > +          label = "bootloader";
> > +          reg = <0x00000000 0x00080000>;
> > +        };
> > +
> > +        partition@80000 {
> > +          label = "tclinux";
> > +          reg = <0x00080000 0x02800000>;
> > +        };
> > +
> > +        partition@2880000 {
> > +          label = "tclinux_slave";
> > +          reg = <0x02880000 0x02800000>;
> > +        };
> > +
> > +        partition@5080000 {
> > +          label = "rootfs_data";
> > +          reg = <0x5080000 0x00800000>;
> > +        };
> > +
> > +        partition@ffffffff {
> > +          compatible = "airoha,dynamic-art";
> > +          label = "art";
> > +          reg = <0xffffffff 0x00300000>;
> 
> I'm a little bit puzzled by this kind of information which is known to
> be wrong. As the partition offset and size must be dynamically
> calculated, this reg property (as well as the size parameter of the
> previous one) are notably wrong. I guess we are not fully constrained
> by the fixed-partitions schema here, so could we avoid the reg property
> in the airoha,dynamic-art partition? Maybe we also need a #define for a
> specific placeholder in the penultimate reg property too (for the size).
>

Maybe instead of reg we can use a property like size?

Can you better elaborate the suggestion about the #define?

Do you mean for case where the last partition might overlap
with the penultimate? Honestly in such case I would error hard, that
case happen when too much space is reserved and that is a
misconfiguration of the system (developer error)

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
