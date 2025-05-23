Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DECC54ED0
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LhN/URRQAeH/HCSvt2Wgx2M/jGSVsZArp7Xxz0Ke1Lw=; b=2eBJvNCYlvVPJ0ZPrva2Ihjhgr
	JKxxucxEkhaRGyQrH0kwnif6w1CfBjyE5xsOYJSy+rG1l+9/2MB7qdUvzXRffPlyg0j4eOO/NxmJN
	mOTQq0U7ZYiP97pK/9L6H7eie616vF7NJlwendDVgFyK1No4yDXm8fRWP+YWhhI6hB54zQOuZbIcA
	0YFr1RgA7tAqzhNkUYETpi5RZYN/ou6OBb+O20SH4HjNq+UD5J8H3IUnw8SPWZAgEpF1BxUmChwTT
	nZfGO2Std4Xlny9PKoW/5oOkK6soYxI1x3Ntf3C9lipb8UGNKELePOiX2ZkKPHWR/xSWmvVehF10R
	iFV9/LAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRQC-00000003noh-2rh8;
	Fri, 23 May 2025 12:22:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRQC-00000003noT-02dI;
	Fri, 23 May 2025 12:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=S1tj6JHyTCr64/k2qHsMvHy0p06r1zvCBnmnNdomCd0=; b=k1XZOApAlqwEyweTIFkYtvVl7N
	5SHUEDtC3xTdCr58Ms1wjQof+IpsdsPXLQR/diJWw6TS2oXaT7U2xmYcKMi+5tnjlCG5KMz/0243Y
	1K50Oh1f99rdqtFxf0VMSDFecODzRUznuIxlcE/D5b5LxaIm4vapXiHWLLrkXNS3xI+b7NLW+JSkB
	jqVN8KVaj3XUaZZsOSEUWIIR7A/jobUVzRB+yulvFJuYSfKEk57OFD6JVXFntMGG5EMaWe4pcK+aj
	PZSMmfV3ZL7Bx1SHkq1lizSK671fnHm0GpPZXi3EelLZKjz2rdIaYYtO+pilgDaXmmUcJ3ngrFYVp
	Ag780jCA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIRQ8-00000001JG5-2aLv;
	Fri, 23 May 2025 12:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E5845C7108;
	Fri, 23 May 2025 12:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46CFC4CEE9;
	Fri, 23 May 2025 12:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748002956;
	bh=rW2jpoyMNgaGm8EWhJUy3TcoK0eOE2uriwlxOl2jhXg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PViedXozxV4KuKw/DZvEgGhS4x+3hm6GJeKtSNKyfofJu0AlPWicnAIY59xH4EhxM
	 lqKUirX6LLaDstxlJ6SXebXeUAgMYIRHzdWKUzTx7C8AHTTxytwPjN6O4X+1MTk19j
	 9UT7RJnSenAI0ZId4k9h37k300K1gXhLKvqFfKTPdt0aJAw/FMiOqb+oWVQFepQYsR
	 l+EZU5u/TulUzNrrElYCmZt9WCwERA1zQVyQESL4snH2jkt/XsFZqspPfWK/ZN3uGS
	 S+JKrKbPJLPkKtrkzsBtx9kmLMJQr0Au5X7tLFRfyYCb9SoAE/ke/VqcbzwtFAcKPh
	 7HVnMyfAkT1ig==
Date: Fri, 23 May 2025 07:22:34 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor+dt@kernel.org>, 
 Mark Brown <broonie@kernel.org>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 Alexandre Ghiti <alex@ghiti.fr>, dlan@gentoo.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, sophgo@lists.linux.dev, 
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, 
 Longbin Li <looong.bin@gmail.com>, ziyao@disroot.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <mwalle@kernel.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
To: Zixian Zeng <sycamoremoon376@gmail.com>
In-Reply-To: <20250523-sfg-spifmc-v1-1-4cf16cf3fd2a@gmail.com>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
 <20250523-sfg-spifmc-v1-1-4cf16cf3fd2a@gmail.com>
Message-Id: <174800295404.1369155.8184258827735093868.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add bindings for SOPHGO SG2042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_132241_014684_1DB9F0D4 
X-CRM114-Status: GOOD (  11.70  )
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


On Fri, 23 May 2025 18:54:49 +0800, Zixian Zeng wrote:
> Add bindings for the SOPHGO SG2042 SPI-NOR flash controller,
> which is compatible with SOPHGO SG2044.
> 
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/spi-sg2044-nor.example.dtb: spi@1000000 (sophgo,sg2044-spifmc-nor): compatible:0: 'sophgo,sg2044-spifmc-nor' is not one of ['sophgo,sg2042-spifmc-nor']
	from schema $id: http://devicetree.org/schemas/spi/spi-sg2044-nor.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/spi-sg2044-nor.example.dtb: spi@1000000 (sophgo,sg2044-spifmc-nor): compatible: ['sophgo,sg2044-spifmc-nor'] is too short
	from schema $id: http://devicetree.org/schemas/spi/spi-sg2044-nor.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/spi-sg2044-nor.example.dtb: spi@1000000 (sophgo,sg2044-spifmc-nor): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/spi-sg2044-nor.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250523-sfg-spifmc-v1-1-4cf16cf3fd2a@gmail.com

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
