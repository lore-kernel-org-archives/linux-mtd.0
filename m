Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71D6C00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hECCXzE+bZ1k/GK6XUlKRRQDmd7lVG9cxNHtEFcKe4=; b=QtOlSj3U5RDQsv
	p3u1YmVMCaLNfHP1WF1xl7oHdyD29RBD3jhsYOyVYEo7UmI9ibLCkxQTIA3LmMT3k3ecyDD6oQtIL
	xnIqEN1PnwQR+pyS47cKVdnSxZLmWYnlTA8+H+k/boQhDhJKcyAQiontAA86ksNYWrYEc97YM7JSj
	DWAuIJ5LBB7/nqpvY1wtNIVmt+rWxLex5y3300Hz7hAqvMl+sAEcnhc848PMO+OsftfO1E74WCQrl
	TKzaeVSwUE799/wBU+7tXmUY6sxJdttgDm1ylcRH7bnmohWDsFH4OPq5ZDsbsF4oL9WncPrwxcbQl
	M15/tt/acZgc3K5WQzxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvK5M-00ARTH-1d;
	Tue, 24 Oct 2023 16:16:52 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvK5I-00ARSS-1J
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 16:16:49 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6ce29d1db6eso2644819a34.1
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 09:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698164206; x=1698769006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXPrvqhlemMI7g9xIhmWAAMr6+6qbQ1ZU0REA78QcHI=;
        b=CnUIG/+/q4oKXuAeACWtYb432/fUpvFPq3m12BMxWy/kSf5XnTqTa2jtLcQNgMrfOH
         53gfC8nENPrQMxFsByS3GnMewEkVEal0K7WfLWvtXUXEHQhHCXLmj0NQ2NeNx6xGOlsx
         ZLjEq3XkG4Ou3Zn7LWcpjqPcr0Q9R9C50HYJeHWZCgfTr6KM943WWeX7+NtVv5+9GVlw
         +05tJse9rwiFd8WCxd4IHL+8SUZNEftTmbrRxw25YNy3BXcSO8CsIzMJ+V3yz29r4nif
         M9cIkM45+d9UgT6wYl5lj4wSfX/dIfE0zl3bqM+POeH/Y5sJCUh4XlVDsvLUkjJyvLLq
         xNbg==
X-Gm-Message-State: AOJu0Yya+DLyVDwBcS5JnNyqn3FsON+qIPFw044foLwUcD2kecJmBUbe
	dAQ3tHydh+SCn/yxNBwDmw==
X-Google-Smtp-Source: AGHT+IHcKt9w7bZiBt4/3rwDVdR83Ok9yFwzHM6Yw+yCPtpOKiwL2Yodvx6SUVggzi+iygsVFKZgpg==
X-Received: by 2002:a05:6808:1306:b0:3b2:e379:c11d with SMTP id y6-20020a056808130600b003b2e379c11dmr10337541oiv.22.1698164206547;
        Tue, 24 Oct 2023 09:16:46 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k2-20020a544702000000b003b2f2724c48sm1975040oik.11.2023.10.24.09.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 09:16:45 -0700 (PDT)
Received: (nullmailer pid 4031785 invoked by uid 1000);
	Tue, 24 Oct 2023 16:16:44 -0000
Date: Tue, 24 Oct 2023 11:16:44 -0500
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: binman-partition: Add binman
 compatibles
Message-ID: <20231024161644.GB3707756-robh@kernel.org>
References: <20231009220436.2164245-1-sjg@chromium.org>
 <20231009220436.2164245-2-sjg@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009220436.2164245-2-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_091648_444697_190290E2 
X-CRM114-Status: GOOD (  24.40  )
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

On Mon, Oct 09, 2023 at 04:04:14PM -0600, Simon Glass wrote:
> Add two compatible for binman entries, as a starting point for the
> schema.
> 
> Note that, after discussion on v2, we decided to keep the existing
> meaning of label so as not to require changes to existing userspace
> software when moving to use binman nodes to specify the firmware
> layout.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v4:
> - Correct selection of multiple compatible strings
> 
> Changes in v3:
> - Drop fixed-partitions from the example
> - Use compatible instead of label
> 
> Changes in v2:
> - Use plain partition@xxx for the node name
> 
>  .../mtd/partitions/binman-partition.yaml      | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> new file mode 100644
> index 000000000000..35a320359ec1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2023 Google LLC
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/binman-partition.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binman partition
> +
> +maintainers:
> +  - Simon Glass <sjg@chromium.org>
> +
> +select: false

So this schema is never used. 'select: false' is only useful if 
something else if referencing the schema.

> +
> +description: |
> +  This corresponds to a binman 'entry'. It is a single partition which holds
> +  data of a defined type.
> +
> +allOf:
> +  - $ref: /schemas/mtd/partitions/partition.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: binman,entry     # generic binman entry

'binman' is not a vendor. You could add it if you think that's useful. 
Probably not with only 1 case...

> +      - items:
> +          - const: u-boot       # u-boot.bin from U-Boot project
> +          - const: atf-bl31     # bl31.bin or bl31.elf from TF-A project

Probably should use the new 'tfa' rather than old 'atf'. Is this the 
only binary for TFA? The naming seems inconsistent in that every image 
goes in (or can go in) a bl?? section. Why does TFA have it but u-boot 
doesn't? Perhaps BL?? is orthogonal to defining what is in each 
partition. Perhaps someone more familar with all this than I am can 
comment.

Once you actually test this, you'll find you are specifying:

compatible = "u-boot", "atf-bl31";


> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    partitions {
> +        compatible = "binman";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        partition@100000 {
> +            compatible = "u-boot";
> +            reg = <0x100000 0xf00000>;
> +        };
> +
> +        partition@200000 {
> +            compatible = "atf-bl31";
> +            reg = <0x200000 0x100000>;
> +        };
> +    };
> -- 
> 2.42.0.609.gbb76f46606-goog
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
