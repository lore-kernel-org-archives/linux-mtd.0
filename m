Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF3EC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jan 2022 00:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8TjIFpd5YTembdxfGoStjTcMtFhQG0NrqCioq56SW4=; b=PQj9SUWPm9a36p
	Plmwb3zG1i+rUd8rcbSiJX40QLc9j6xInhAOqhy+ISa8agi5Z3Z9igMCU0Ygib4O3aBoz6sQPdq5a
	OfMSYZMg2qfoyiIlmG0lJb3koQE77QyCj9NF5OhN/FVwLc6ulsBaO9H9ADE1IiQoY6dj2pWxZqIvW
	xeH08A5L5fi/0sdEjAsjei9Bsu5lWisYWRmYraeJNqfwt9jTULg1VsHf4yjdu8npxlHudARBmnIYH
	ipLCIkvgJkfTGdnJAF0geZGH9/xn8RCRBV1TgKlr6bGtP20jxzIoKUGYINUKjsl2NraSojl7VRQck
	QjciFwZ+AH/ffOIOfbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB4I6-00GJ6y-8S; Sat, 22 Jan 2022 00:30:02 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB4I2-00GJ6B-Tu
 for linux-mtd@lists.infradead.org; Sat, 22 Jan 2022 00:30:00 +0000
Received: by mail-ed1-x52d.google.com with SMTP id l5so28409989edv.3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jan 2022 16:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:from:to:cc:subject:references:mime-version
 :content-disposition:in-reply-to;
 bh=mhD6j/BV1CQACD/fChlzg0PMSKEU6I+hrwON9lOSoaA=;
 b=g50zwZ2TmnjXt74lE/EXTPRa3IITbq/SiEjWV1PgYyj5+i6Wq1FQW2/R0Jwe1K0iFN
 zB1eCkLt4GFHtD/M3qfnj+ue8IS/rUa9VpD8a2PQlhh2DPeiFt41Gmq5HY432AIo6W8S
 fL0B9KIdr1uguqx1eKi9XHlE+Q/jQVHHR5ey14DqXDHkx368Dr1BpjL9N9ZCQLzmMD5K
 P2hpb7/PvIGYxdv4qAchBOFbPbd4qH51JMVQQJ9oKzjVRySskUWKdF8Mg17LqtNJHGIp
 stGLHuYyU8/wmeIK12G2tDWuU7TCbT71+dSwb3zVEcJOgBXlUrdYv9b6ckPbLj3mDDgJ
 O5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:from:to:cc:subject:references
 :mime-version:content-disposition:in-reply-to;
 bh=mhD6j/BV1CQACD/fChlzg0PMSKEU6I+hrwON9lOSoaA=;
 b=JbMM2P2ZaO9bXH61n9DaoQWCx9vhWvIwYlwvAsCrO3IhzRozP7zkYYacOE7eXpt4Gx
 EsLbT5wr8aPJ01USEK6sT6phskDrdvg97kpmd7OSnxID/Oxp5v2gR7IyvUK78nV5f4AG
 QwL5nFahN1mXy1p+QcM2TliX1aBx3lA0k5SqiOijaHi1u33IJ+/z2NGDPGY9Ure+2F2/
 o26nHjK9p+l9gZq/9pZEDAYnYUbv1RhoiCce92fYCU/udgXzLjXnMsDaiwRMWsjMTsFO
 F9Yd6raSKDpSnVsw+Flqa4qbsf8S8nmYx9khKMedVURVTsnuYNFHc7azz2C1jplKqGYl
 JANw==
X-Gm-Message-State: AOAM533Qvc63AzMpKuryYaRWBglgWjX3AU31kRnLnv5Xuy93iDo5cuOt
 q2ffpoqX/CdlMtSHHYS5abg=
X-Google-Smtp-Source: ABdhPJzln0O4ug/lcLhyvm40eWjLPCGLP1BzVZ2x6EKwVhPolqK4Jw7UDqb94ZXrvHPPUc9y2zoXDQ==
X-Received: by 2002:a05:6402:4490:: with SMTP id
 er16mr6153231edb.203.1642811397071; 
 Fri, 21 Jan 2022 16:29:57 -0800 (PST)
Received: from Ansuel-xps. (93-42-71-246.ip85.fastwebnet.it. [93.42.71.246])
 by smtp.gmail.com with ESMTPSA id r15sm2426733ejz.72.2022.01.21.16.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 16:29:56 -0800 (PST)
Message-ID: <61eb5004.1c69fb81.43dc1.b0f4@mx.google.com>
X-Google-Original-Message-ID: <YetQAqxfEctby2cl@Ansuel-xps.>
Date: Sat, 22 Jan 2022 01:29:54 +0100
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: partitions: Document new
 dynamic-partitions node
References: <20220120202615.28076-1-ansuelsmth@gmail.com>
 <20220120202615.28076-2-ansuelsmth@gmail.com>
 <YeoRJlTbILNtZgoW@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YeoRJlTbILNtZgoW@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_162959_005096_FBC12C23 
X-CRM114-Status: GOOD (  33.85  )
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

On Thu, Jan 20, 2022 at 07:49:26PM -0600, Rob Herring wrote:
> On Thu, Jan 20, 2022 at 09:26:14PM +0100, Ansuel Smith wrote:
> > Document new dynamic-partitions node used to provide an of node for
> > partition registred at runtime by parsers. This is required for nvmem
> > system to declare and detect nvmem-cells.
> 
> So you have some discoverable way to find all the partitions and the 
> nvmem cells are at an unknown (to the DT) location, but still need to be 
> described in DT?
>

Example: smem partition layout is saved in the bootloader and static. To
know the layout just boot the device and extract it. Aside from this the
naming convention is ""standard"" (example the standard nvmem location
for this is named 0:art)

What needs to be described in the DT is the cell offset and the
partition name (the location)

NVMEM doesn't support this and honestly I can't think of a simple and
direct way to solve this. Considering partition in this case are just
filled at runtime and they doesn't change (or at worst the partition
offset change but NEVER the name) it seems a good way to fix this by
describing a nvmem cells partition name and assign a of node to the
runtime filled partition.

> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> >  .../mtd/partitions/dynamic-partitions.yaml    | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
> > new file mode 100644
> > index 000000000000..7528e49f2d7e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/partitions/dynamic-partitions.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Dynamic partitions
> > +
> > +description: |
> > +  This binding can be used on platforms which have partitions registered at
> > +  runtime by parsers or partition table present on the flash. Example are
> > +  partitions declared from smem parser or cmdlinepart. This will create an
> 
> Some information in DT and some on the cmdline seems broken to me. Pick 
> one or the other.
> 

Converting a system from cmdline to fixedpartition is problematic
if the cmdline is dynamic. Example some system have dual partition and
are handled by editing the cmdline partition description. In this
cmdline tho the nvmem cell of our interest doesn't change and we can use
this new implemenation to add support for nvmem cells.

So really there are some case where nvmem won't work and it's not
possible to provide a correct configuration for nvmem to work correctly.

Is it that bad to have information in the DT about nvmem cells for a
partition named with a particular label that won't change.

> > +  of node for these dynamic partition where systems like Nvmem can get a
> > +  reference to register nvmem-cells.
> > +
> > +  The partition table should be a node named "dynamic-partitions".
> > +  Partitions are then defined as subnodes. Only the label is required
> > +  as any other data will be taken from the parser.
> > +
> > +maintainers:
> > +  - Ansuel Smith <ansuelsmth@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: dynamic-partitions
> 
> This is useless. This tells me nothing about the what's in the 
> partitions.
> 
> > +
> > +patternProperties:
> > +  "@[0-9a-f]+$":
> > +    $ref: "partition.yaml#"
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    partitions {
> > +        compatible = "qcom,smem";
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +    };
> > +
> > +    dynamic-partitions {
> > +      compatible = "dynamic-partitions";
> > +
> > +      art: art {
> > +        label = "0:art";
> > +        read-only;
> > +        compatible = "nvmem-cells";
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        macaddr_art_0: macaddr@0 {
> > +          reg = <0x0 0x6>;
> > +        };
> > +
> > +        macaddr_art_6: macaddr@6 {
> > +          reg = <0x6 0x6>;
> > +        };
> > +      };
> > +    };
> > -- 
> > 2.33.1
> > 
> > 

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
