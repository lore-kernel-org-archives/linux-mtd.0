Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210DECE7A88
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Sep 2023 02:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YM6F6NNb/Sf6TxI9EYkIjmhKIPUfb8WHRC0CZvtSF4g=; b=cZfwSer0IaFKxO
	07++tSMrnGGqXB9vDMXSvfjTZhi/dHQCkKvZYyNziZBUs7vWeBnD2FybG4LbAQRvyPyHeck/TElkx
	Qp+0nv5PAoaHAYWYSJWA5OJ1FMrnkm7CZR5m5fUzvomstKhn8nuauRSy1IXVkyKaGJfCe93souvvu
	FsLDCHBu5GpII//v5TeSpsF7O0V3kx4iay8FIQ9wafa0jwI2T5LhXoUm5R8KKbwHOmFv1ug1vxjRu
	w9334SEKbNP1WEWjrn+Zm13U8l8yeWu0DdGiUnzBx3yJg43GAstwhS9TKgtCK49EqOMpCRTpcyEjj
	FAusJoX9xKxnDnDGTE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjs20-00AE8V-3B;
	Sat, 23 Sep 2023 02:06:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjs1x-00AE6v-0M
	for linux-mtd@lists.infradead.org;
	Sat, 23 Sep 2023 02:06:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 96A8FCE253C;
	Sat, 23 Sep 2023 02:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A12C433C7;
	Sat, 23 Sep 2023 02:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695434754;
	bh=p6evCoFssqFuGsisKlNTxes4uUL1dao28ODNmXXWwJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KqvuwPYIlU0o0FKqDw41Ed2qxZ8lElH59XB+Vi/GW5MuBI5qmAzwM+zZKsqV1gthF
	 8f7rG1IP5BNrS6RBjH5ki9Gbas0sUFXNCldkOdRZz6nVIxf6TQ76WLxB48UVL7Avwm
	 tlayms+kBx/vf1bNm5XdjOarL+TYkjrV5jQCVdPlv9DgOKiDTsdm6S9rK0Oo2QSMPl
	 d+Nc5MBcszqecggWXWG/4UXJe9u5+wE475gSzr7ZekkkQ2Bkw+aJDQJE6gZGBTw/en
	 7w87A+xEbuO+FA82VJztyVBH07WzXuYb8Y0Tzbe34K4BOkGISOBYsjUw7i724fyFJO
	 FJ6d6gES9PhXA==
Received: (nullmailer pid 118963 invoked by uid 1000);
	Sat, 23 Sep 2023 02:05:52 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nick Terrell <terrelln@fb.com>, Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Dhruva Gole <d-gole@ti.com>, Pratyush Yadav <ptyadav@amazon.de>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>, linux-mtd@lists.infradead.org
In-Reply-To: <20230922193417.1697379-1-sjg@chromium.org>
References: <20230922193417.1697379-1-sjg@chromium.org>
Message-Id: <169543475215.118855.13530210565205347052.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mtd: Add a schema for binman
Date: Fri, 22 Sep 2023 21:05:52 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_190601_522624_06555D87 
X-CRM114-Status: GOOD (  18.79  )
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


On Fri, 22 Sep 2023 13:34:15 -0600, Simon Glass wrote:
> Binman[1] is a tool for creating firmware images. It allows you to
> combine various binaries and place them in an output file.
> 
> Binman uses a DT schema to describe an image, in enough detail that
> it can be automatically built from component parts, disassembled,
> replaced, listed, etc.
> 
> Images are typically stored in flash, which is why this binding is
> targeted at mtd. Previous discussion is at [2] [3].
> 
> This is only a starting point, an attempt to align on the best way to
> add this to the schema.
> 
> [1] https://u-boot.readthedocs.io/en/stable/develop/package/binman.html
> [2] https://lore.kernel.org/u-boot/20230821180220.2724080-3-sjg@chromium.org/
> [3] https://www.spinics.net/lists/devicetree/msg626149.html
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Use "binman" for compatible instead of "u-boot,binman"
> - Significantly rework the patch
> - Use make dt_binding_check DT_SCHEMA_FILES=Documentation/../partitions
> 
>  .../bindings/mtd/partitions/binman.yaml       | 59 ++++++++++++++++++
>  .../mtd/partitions/binman/atf-bl31.yaml       | 43 +++++++++++++
>  .../bindings/mtd/partitions/binman/entry.yaml | 62 +++++++++++++++++++
>  .../mtd/partitions/binman/u-boot.yaml         | 43 +++++++++++++
>  .../bindings/mtd/partitions/partitions.yaml   |  1 +
>  MAINTAINERS                                   |  5 ++
>  6 files changed, 213 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman/atf-bl31.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman/u-boot.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mtd/partitions/binman/atf-bl31.example.dtb: /example-0/binman/partition@0: failed to match any schema with compatible: ['binman,entry']
Documentation/devicetree/bindings/mtd/partitions/binman/entry.example.dtb: /example-0/binman/partition@0: failed to match any schema with compatible: ['binman,entry']
Documentation/devicetree/bindings/mtd/partitions/binman/entry.example.dtb: /example-0/binman/partition@100000: failed to match any schema with compatible: ['binman,entry']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230922193417.1697379-1-sjg@chromium.org

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
