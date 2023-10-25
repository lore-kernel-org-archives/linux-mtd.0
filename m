Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99A6C07545
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 12:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkz+eRLrLEFRjB0B7M+dUBw4RK+HyEAgGhAOKBaKipk=; b=GlmjPZDH5KAArd
	9GcOfgxK+461a7b1//+7ecdIWtpVKRZnKLwsmuCcZvHAW7o2DBwhkpsWF3n6vRUP4FaqlnoPqFoAB
	2ZJ+eqCl9tdx29IqvKApGdhOWegzwKChVUvxKXnN/BxbayrcZJeX0SqHNAeNNL74GZFOq0G2k6mp7
	NQVp5gOHLSlY7RMv5tvRUp/D1JY6mwXZ0EGK0g67eTUT2DihM+1l1PWuRMcihfE6DkOw1UJz0EYgK
	0jpb2LDWBi7ygWqEhU6QRCwKeNOwnDEWfxHLH74OOQtYOBm9fW/v2hqPkf76Eqp26kPXtbOKHY4+C
	EbdmeZd8LErBVbL8dbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcjr-00CGwD-1g;
	Wed, 25 Oct 2023 12:11:55 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcjn-00CGuc-1y
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 12:11:53 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1d544a4a2f2so3632474fac.3
        for <linux-mtd@lists.infradead.org>; Wed, 25 Oct 2023 05:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698235909; x=1698840709;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HCPxgs4NDh+ho3+ibefi5n2+RrXmyVlZVu+Q51te2v4=;
        b=XtuvQP5eGLTaYglCkxmDfMrpFoeXbBOLrmj6eyHdrVbkHZ8nb9EpmSEj/zljUxNNk0
         zK0ojIVKFaXX08acZ/Ze2ro4h5vytu2NjMK7dmSpbnkHF1WvhMnFy0PMPKpqxaMzKJK9
         dj5OOxPO8izEEBCK+vf9a277Uwz573ZD0g+9urPbTU7BdmlUDHbtdtl0zFlkWi39kztV
         LgaiQTSb2WqCw0j1U9J90rq6RaaGDCQMf1NPRm89xM3ahDV0Whd7JEoRw7BIbrbHOWyl
         +dWgFRhzHSXA9CrMieWmrXXnD57Y7qhASs7Atmj9bXySiPgAY3Ti1N92MAJrGfGT50Hm
         l1Kg==
X-Gm-Message-State: AOJu0YxBOMV1pzolKN39f4alpjb48P6zOkBfmbSmXBfk9wUfj11z61PZ
	xQRPj+d4Jo6iYjviMoOLeg==
X-Google-Smtp-Source: AGHT+IHK4CWlhFUcrr2tQOB6IBVUM5SaULgdBfzfqNt/82aSi0iQDTiGIhgrsbRNKvEcKAMBHVkAfA==
X-Received: by 2002:a05:6871:78a:b0:1e9:d25d:3cb0 with SMTP id o10-20020a056871078a00b001e9d25d3cb0mr18681753oap.21.1698235908781;
        Wed, 25 Oct 2023 05:11:48 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id nd25-20020a056871441900b001dcfaba6d22sm2620513oab.46.2023.10.25.05.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 05:11:48 -0700 (PDT)
Received: (nullmailer pid 3367369 invoked by uid 1000);
	Wed, 25 Oct 2023 12:11:47 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, Richard Weinberger <richard@nod.at>
In-Reply-To: <20231024213940.3590507-2-sjg@chromium.org>
References: <20231024213940.3590507-1-sjg@chromium.org>
 <20231024213940.3590507-2-sjg@chromium.org>
Message-Id: <169818808080.999988.12536383382799868342.robh@kernel.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: mtd: binman-partition: Add binman
 compatibles
Date: Wed, 25 Oct 2023 07:11:47 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_051151_648751_94A27947 
X-CRM114-Status: GOOD (  18.37  )
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


On Wed, 25 Oct 2023 10:39:17 +1300, Simon Glass wrote:
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
>  .../mtd/partitions/binman-partition.yaml      | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml: properties:compatible: [{'enum': ['binman,entry', 'u-boot', 'tfa-bl31']}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml: properties:compatible: [{'enum': ['binman,entry', 'u-boot', 'tfa-bl31']}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Documentation/devicetree/bindings/mtd/partitions/binman-partition.example.dtb: /example-0/partitions/partition@100000: failed to match any schema with compatible: ['u-boot']
Documentation/devicetree/bindings/mtd/partitions/binman-partition.example.dtb: /example-0/partitions/partition@200000: failed to match any schema with compatible: ['tfa-bl31']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231024213940.3590507-2-sjg@chromium.org

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
