Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A821C10F05
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPDBkn5n5ZMYRHletUSnz7dOWCcjJZuyjImf2ykLeH4=; b=vDxn+5vGs5IwAM
	MPTasBJb7WNGGCmqxLr3eo6ZQbKc1WQsacimCrv/LpRxrs45mevkJEM1WCP8woy2vqbSQF6dXq3vG
	E4b/ahfRc9MldpeizcyixVNEtm2nzE1xR6YQRIfqV6K5NQeTxNd5DmogJV3sjuNwsMTqlQ0x8rpM/
	pvXeCWLT6AMrjQnNo4/PQCyNSBG/5lmN8ot9w731Oo9I2li2DrN8BO/azIdkCIVdeyDHCwEjdSsuD
	IfhElemJzjcgc9pk0f+j6RVRFijjzKJM+jAKy3a1Y8o+RIcwrO36FGsmpANenAIvH1I8hRMTEdlir
	wuJY7YJcc7g4RBZHMkAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBcLS-00Fp3u-0s;
	Fri, 08 Dec 2023 15:00:50 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBcLP-00Fp2w-0W
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 15:00:48 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d9e993d94dso470855a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 08 Dec 2023 07:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702047645; x=1702652445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhQWuvNrfy0nDTet/URpa1HIQtUWnl4nOPZplCeKz7Q=;
        b=ZhmYp4kwCuqCuC+jzGOFRmvkRA1rMsmdYpYEWUAz3NTyjLrZPw9bEQydlxpm6AV40Z
         lt5wkKdohMo0xlDlljy0PdxF1dfM5qxUnkQk3MErI4awGe65iakkmun1f9U3S0y/4/c+
         2JR4k+A4jI4VRFf0rbTum/5ejYOwqinRndYh3XCDqnPfmKPW0vUX5+sD9+lm6DbKil13
         GcSC9gsTSP1Opt21yt7s6AHburB4EOh39fU/YV1RfL8UVygPXHt2o+WNhqwy+65VNU8V
         o4rPkUCS7FoIVef7pUY9cwCVd/1WH8RiwvYkIE/twaEeFUtrGLqRymDKgcrK7CDBf5S0
         de2w==
X-Gm-Message-State: AOJu0YzuyaUheObv4EqhEmZi4QeoO8/lngCDG5Gr93JZpW1Pg1MVN1du
	c2DrI9EkBP8Ssh2D1JIIMw==
X-Google-Smtp-Source: AGHT+IFNLtyInrOf9nIFSbmfUtQCKSgkpfe0CHZ/yGXwzd/BlzrMLoh/hXXynLP9bXaT2VnqR+WYNQ==
X-Received: by 2002:a05:6830:110f:b0:6d9:ef4a:82db with SMTP id w15-20020a056830110f00b006d9ef4a82dbmr203527otq.13.1702047644628;
        Fri, 08 Dec 2023 07:00:44 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bn20-20020a0568300c9400b006d9e756fac2sm283283otb.51.2023.12.08.07.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:00:43 -0800 (PST)
Received: (nullmailer pid 1287216 invoked by uid 1000);
	Fri, 08 Dec 2023 15:00:42 -0000
Date: Fri, 8 Dec 2023 09:00:42 -0600
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman
 compatible
Message-ID: <20231208150042.GA1278773-robh@kernel.org>
References: <20231116172859.393744-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231116172859.393744-1-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_070047_202777_E7F08C28 
X-CRM114-Status: GOOD (  24.08  )
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

On Thu, Nov 16, 2023 at 10:28:50AM -0700, Simon Glass wrote:
> Add a compatible string for binman, so we can extend fixed-partitions
> in various ways.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> (no changes since v5)
> 
> Changes in v5:
> - Add #address/size-cells and parternProperties
> - Drop $ref to fixed-partitions.yaml
> - Drop 'select: false'
> 
> Changes in v4:
> - Change subject line
> 
> Changes in v3:
> - Drop fixed-partition additional compatible string
> - Drop fixed-partitions from the example
> - Mention use of compatible instead of label
> 
> Changes in v2:
> - Drop mention of 'enhanced features' in fixed-partitions.yaml
> - Mention Binman input and output properties
> - Use plain partition@xxx for the node name
> 
>  .../bindings/mtd/partitions/binman.yaml       | 68 +++++++++++++++++++
>  .../bindings/mtd/partitions/partitions.yaml   |  1 +
>  MAINTAINERS                                   |  5 ++
>  3 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> new file mode 100644
> index 000000000000..329217550a98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2023 Google LLC
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/binman.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binman firmware layout
> +
> +maintainers:
> +  - Simon Glass <sjg@chromium.org>
> +
> +description: |
> +  The binman node provides a layout for firmware, used when packaging firmware
> +  from multiple projects. It is based on fixed-partitions, with some
> +  extensions, but uses 'compatible' to indicate the contents of the node, to
> +  avoid perturbing or confusing existing installations which use 'label' for a
> +  particular purpose.
> +
> +  Binman supports properties used as inputs to the firmware-packaging process,
> +  such as those which control alignment of partitions. This binding addresses
> +  these 'input' properties. For example, it is common for the 'reg' property
> +  (an 'output' property) to be set by Binman, based on the alignment requested
> +  in the input.
> +
> +  Once processing is complete, input properties have mostly served their
> +  purpose, at least until the firmware is repacked later, e.g. due to a
> +  firmware update. The 'fixed-partitions' binding should provide enough
> +  information to read the firmware at runtime, including decompression if
> +  needed.

How is this going to work exactly? binman reads these nodes and then 
writes out 'fixed-partitions' nodes. But then you've lost the binman 
specifc parts needed for repacking.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
