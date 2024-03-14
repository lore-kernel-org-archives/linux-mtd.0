Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C416C5475B
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2024 03:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NuKhEeQZFABuPHBrKpx5iEO6YxggvdUfpn6vbnwmIBs=; b=Jl06g881/OjCCWofr/vvfLwb63
	363u1i94M67NoF9TMUkk95cmr71ZpkzMmZp+u1qaz7EJi5nE/tClZirnAdOziEs8hqCYchBJjFXt9
	dWedimiNEHPbF/7J7Q4G4IgxjcB30rseOjW5hlFJI1HGbU3CSzeSuIBIUM74a+7cm0aiurqbpaJH6
	FIsc/uNQX/bfcwYoVGwQvUMN79rxQaCCB0BFit/NwqgM34s8M60CQK+QxooLn4esPAgN3WcYzMpqv
	YP7XRwfPI0adK83zirb2DmE5qHStUg0Ku487zTwP7U7GGj3Fsxev/RjzO57QSlR5AkQQftXzi93zl
	HwY4RcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkcAQ-0000000Crnw-0GFy;
	Thu, 14 Mar 2024 03:54:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkcAN-0000000CrnK-1VfA
	for linux-mtd@lists.infradead.org;
	Thu, 14 Mar 2024 03:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5EAC613EA;
	Thu, 14 Mar 2024 03:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F853C43390;
	Thu, 14 Mar 2024 03:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710388440;
	bh=rcgMvEmq2ixSXP+IeYxrksDnBiZXb7HZ9xOUnpCsZkE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=MbiWQZRakVgAofeGA4wacxNF3uc+0FIUDo5NOCA98EEofSdUtDcbQVDP9Ofg52eBt
	 LyPkoLbsru/kJ9DwXlY45Hh+tezGiE9dyOpbgx4JhdqveuDQxINtB7uz3mjSPkqyON
	 jsA1LBYy3dTIgqQZ364sUYFeSJh0VBxUBH4k1tL7fj5f6yLUPnx2Zk1FM9YdIFi5Py
	 QfHDn0UqgaMpcKpJkb3DwcXrutH0q92PL/rcgw6u7hhz/Z83gJveGboK4GSV1UB5IG
	 yRO4xFQGiFAtuSg4aroDJoZOZlYTboM7rjER3Y6Ei8k1qFt6U4eKO3Uz4BDRo9X7rY
	 8h9WH2wKi8q6g==
Date: Wed, 13 Mar 2024 21:53:59 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
 Conor Dooley <conor+dt@kernel.org>, Richard Weinberger <richard@nod.at>, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>, devicetree@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20240314021754.84557-1-sjg@chromium.org>
References: <20240314021754.84557-1-sjg@chromium.org>
Message-Id: <171038843809.1875072.5117887571496305012.robh@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: mtd: fixed-partition: Add binman
 compatibles
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_205403_665778_FB4A646D 
X-CRM114-Status: GOOD (  17.85  )
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


On Thu, 14 Mar 2024 15:17:53 +1300, Simon Glass wrote:
> Add two compatibles for binman entries, as a starting point for the
> schema.
> 
> Note that, after discussion on v2, we decided to keep the existing
> meaning of label so as not to require changes to existing userspace
> software when moving to use binman nodes to specify the firmware
> layout.
> 
> Note also that, after discussion on v6, we decided to use the same
> 'fixed-partition' schema for the binman features, so this version
> adds a new 'binman.yaml' file providing the new compatibles to the
> existing partition.yaml binding.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v7:
> - Adjust MAINTAINERS entry
> - Put compatible strings into the 'fixed-partition' binding
> 
> Changes in v5:
> - Add mention of why 'binman' is the vendor
> - Drop  'select: false'
> - Tidy up the compatible setings
> - Use 'tfa-bl31' instead of 'atf-bl31'
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
>  .../bindings/mtd/partitions/binman.yaml       | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/partitions/binman.example.dtb: partition@100000: Unevaluated properties are not allowed ('align-end', 'align-size' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/partitions/binman.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/partitions/binman.example.dtb: partition@200000: Unevaluated properties are not allowed ('align' was unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/partitions/binman.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240314021754.84557-1-sjg@chromium.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
