Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122A1C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 17:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdU2rsB8ooCQpfqfJgqy2ZkfD9gNUMf0RMwniC83hH0=; b=TdG2hbiOLvNEz2
	/SWTp9A8vjeji3QLw2MjaMUWe2Cd8SvqceSq29vvXX3Lb9tGyJ/hs+p0aGL8dvAbqX/8uxLVrataa
	wynwb5cPtxvkzJ6/XdPHnsAvZpcDwgABKUSrTJZ2LUoGzZBbYz1s0mVrvDdc3Is2Ss+HRZPsbFrLX
	Zy2U6lxpe18bA1vwyO58F0LRMSNCIV0st4NMLaTmEOFlwaeyW75o3MaZmCSMsk1esnEuIOlvNV6ew
	Ho3RApswW+BiiOOMyu2Rg4f02UdEhHPPe4slF9G3s8flWHSJ8P9eO2fHixADMSAMSg7ymma4fIes8
	lk0/eOmazTMOa29v3kvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAyM-007Sii-Cj; Thu, 10 Nov 2022 17:04:14 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAy7-007SZA-EZ
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 17:04:01 +0000
Received: by mail-oi1-f180.google.com with SMTP id r76so2399978oie.13
        for <linux-mtd@lists.infradead.org>; Thu, 10 Nov 2022 09:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZauaV7R0boEkRS/4cI0JRTPB10EksAIDg3xneN7uxuA=;
        b=o3s5tBMH2CrCqBnuQT5nDaE+Q7mw3zUHaOOYerZEi3aHmDDlIXxIgKXXhFSC7s5fKi
         o7Yh9jg6Q9x8vhy5VdqNkEfsXYazZZjOo5wjR7Thpq74okrx4QS1sJIV6aq3I1iSsiZd
         m92tByMR5IK5Ein5+cpRruFFoGXMi0RxCfe+cvNBlH784P4ooZ5AZcuIQ9q/2itIjzsm
         xD+8NJB4OZN0lGDagjVb5ohxUDPqmHXuE5Sgh3S9oBRc3um3X9KAk5RVOHcqKibElpxw
         6aQcKq2iBaaXK5Q342qBqnbVlBa/itOt+H+p1YoFuTO9RG3ZjDzS5gjqFPar4DGN0hxX
         n/mA==
X-Gm-Message-State: ACrzQf039pdzLJCLCV2feRMC5o+hwaI8C2aXHxKpA4GwOXu1K6zMElYc
	fmUML4NKAm53MLmZwZAOVw==
X-Google-Smtp-Source: AMsMyM4Yp3iUigocKbqApqt4C7F98cB6rCXK14bs5kCUOlF50IIvWusqDG+oqGMm+h7ibPBmrFzsiw==
X-Received: by 2002:a05:6808:1ab4:b0:35a:60a3:77d8 with SMTP id bm52-20020a0568081ab400b0035a60a377d8mr1436363oib.127.1668099837994;
        Thu, 10 Nov 2022 09:03:57 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g37-20020a9d2da8000000b0066cacb8343bsm56352otb.41.2022.11.10.09.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 09:03:57 -0800 (PST)
Received: (nullmailer pid 532546 invoked by uid 1000);
	Thu, 10 Nov 2022 17:03:59 -0000
Date: Thu, 10 Nov 2022 11:03:59 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/17] Improve MTD bindings
Message-ID: <20221110170359.GA528639-robh@kernel.org>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_090359_530927_C871EFB7 
X-CRM114-Status: GOOD (  25.22  )
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

On Fri, Nov 04, 2022 at 05:47:01PM +0100, Miquel Raynal wrote:
> Hello,
> =

> During a yaml conversion review, Krzysztof opened the discussion about
> the links and references made between the different files in the mtd
> bindings. I figured out some minimal changes might be needed to properly
> reference everything correctly and ensure we constrain as much as
> possible the existing bindings. That is what I tried to do here.
> =

> The idea is:
> * partition.yaml defines one MTD partition
> * parsers/*.yaml define partition parsers (mainly compatibles)
> * mtd.yaml contains the generic definition of any mtd device (nand,
>   spi-nand, spi-nor, nor, sram, etc), in particular, it defines the
>   various partition formats (legacy and current) and references
>   partition.yaml as well as a list of all the possible parsers within a
>   "partitions" node.
> * nand-chip.yaml, jedec,spi-nor, mtd-physmap.yaml all describe real
>   instances of mtd device, each of them with a different underlying
>   technology, they reference mtd.yaml =

> * nand-controller.yaml has subnodes which reference nand-chip.yaml.
> * Specific NAND controller bindings reference nand-controller.yaml.
> =

> I've tested each and every patch with the following command and it
> worked fine:
> $ make dt_binding_check -j10 DT_CHECKER_FLAG=3D-m DT_SCHEMA_FILES=3Dmtd/
> =

> Comments welcome of course :-)
> =

> Cheers,
> Miqu=E8l
> =

> Changes in v2:
> * Fixed all the missing references to partitions.txt.
> * Created a proper partitions.yaml file to cut the logic
> * Constrained #{address,size}-cells to 1 or 2.
> * Used the description advised by Rob to list all the possible partition
>   parsers without having to actually duplicate the compatibles.
> * Deprecated the #{address,size}-cells properties when relevant.
> * Fixed a regex pattern to match all sram device node names (including
>   ones defined under memory-controllers.
> * Added a comment on another "additionalProperties: true" situation.
> * Dropped even more duplicated properties.
> * Fixed a few typos (like s/phymap/physmap/).
> * Changed qcom,smem-part partition type.
> * Standardized the style in the various examples.
> * Improved the nvmem-cells file as well.
> * Added an example to the sunxi-nand bindings.
> =

> Miquel Raynal (17):
>   dt-bindings: mtd: Clarify all partition subnodes
>   dt-bindings: mtd: Remove useless file about partitions
>   dt-bindings: mtd: nand-chip: Reference mtd.yaml
>   dt-bindings: mtd: nand: Drop common properties already defined in
>     generic files
>   dt-bindings: mtd: nand: Standardize the child node name
>   dt-bindings: mtd: ingenic: Mark partitions in the controller node as
>     deprecated
>   dt-bindings: mtd: onenand: Mention the expected node name
>   dt-bindings: mtd: sunxi-nand: Add an example to validate the bindings
>   dt-bindings: mtd: spi-nor: Drop common properties
>   dt-bindings: mtd: physmap: Reuse the generic definitions
>   dt-bindings: mtd: partitions: Constrain the list of parsers
>   dt-bindings: mtd: partitions: Change qcom,smem-part partition type
>   dt-bindings: mtd: nvmem-cells: Fix example
>   dt-bindings: mtd: nvmem-cells: Inherit from MTD partitions
>   dt-bindings: mtd: Argue in favor of keeping additionalProperties set
>     to true
>   dt-bindings: mtd: Drop object types when referencing other files
>   dt-bindings: mtd: Standardize the style in the examples

Other than my comment on patch 13, for the series:

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
