Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CB1C54E58
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 22:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yWMstgHSypKvG+yVzKiua9ee99PJ/PyfCCbD+JSZE2Y=; b=v6Zx/Y+3UyZWISIbgssa+3LUM5
	w93aVmARTYOJXsVvRRkWBCQvdYk7Ma7Qare/TQTtFQw8GxgT3zx3ExEhfLlkVV5oOz74ISRYClfH2
	dvmsug0aQnfRMdHHl5HEyG5BfIkJrusBOqkHYQXKIJtbzZ0Ai30KFPk8RFtMx3VPpzD/nUvQPJODr
	FqaciiPrb+XG8DB44gN69Z/8FPbDbO64DT8GmlaydJtvtTzi1kt3/GycWb5jjEQTI/UpyGIa77CAB
	t2yi9q45w8VV9Lya7n36qBkz2SEh/U6KILSw5zvyqb2o+Ckk1SO1M10YTTGQbNpY05k2vzoJoSrEi
	Dqor85/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlGDN-00000001lxj-06Yc;
	Fri, 15 Mar 2024 22:39:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlGDF-00000001lwT-3CgT
	for linux-mtd@lists.infradead.org;
	Fri, 15 Mar 2024 22:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0E428CE20D3;
	Fri, 15 Mar 2024 22:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28387C433F1;
	Fri, 15 Mar 2024 22:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710542375;
	bh=7AGoxyZRNwhWGRoTX0vozA4l+C5nDgnZKf/FebfvTaM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=EhVlUuzJAcqLU0r1H2j4kr9URd7T6xVe8pbRCDtZAKanIlZ0r2DagcWdPI5uqeoqg
	 9cQYNI8hjHYRZyK0m5KrCHu8hR0Lwra7Sclv3UC7lMbG7Xuw31s00jilt07Fm2xoA3
	 BWkr09TCiS+x625sOJKABC6q+IUrp84D/AqlK8vf5GEXR0fMUv8rbebvThQQunjOpZ
	 3bFr96dJ6ZksmJ33F0oJkVZp7aDUTJsiagVdIe6q+GmIr6pyUTvPPYp6WKu5IoJ0bR
	 OH2ksIE5X8P9EBF78g4XZi8CLONMncZW2hMQljMhhix1aPqsT/if2h8GlWFUa5xUzQ
	 AoJBZ5qknUmTg==
Date: Fri, 15 Mar 2024 16:39:34 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <mwalle@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20240315204521.28613-1-sjg@chromium.org>
References: <20240315204521.28613-1-sjg@chromium.org>
Message-Id: <171054237303.2017019.6117263925348911387.robh@kernel.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: fixed-partitions: Add
 alignment properties
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_153942_433850_6201F9FF 
X-CRM114-Status: GOOD (  18.07  )
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


On Sat, 16 Mar 2024 09:45:20 +1300, Simon Glass wrote:
> Add three properties for controlling alignment of partitions, aka
> 'entries' in fixed-partition.
> 
> For now there is no explicit mention of hierarchy, so a 'section' is
> just the 'fixed-partitions' node.
> 
> These new properties are inputs to the Binman packaging process, but are
> also needed if the firmware is repacked, to ensure that alignment
> constraints are not violated. Therefore they are provided as part of
> the schema.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> (no changes since v7)
> 
> Changes in v7:
> - Drop patch 'Add binman compatible'
> - Put the alignment properties into the fixed-partition binding
> 
> Changes in v6:
> - Correct schema-validation errors missed due to older dt-schema
>   (enum fix and reg addition)
> 
> Changes in v5:
> - Add value ranges
> - Consistently mention alignment must be power-of-2
> - Mention that alignment refers to bytes
> 
> Changes in v2:
> - Fix 'a' typo in commit message
> 
>  .../bindings/mtd/partitions/partition.yaml    | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mtd/partitions/partition.example.dtb: /example-0/partitions/partition@100000: failed to match any schema with compatible: ['u-boot']
Documentation/devicetree/bindings/mtd/partitions/partition.example.dtb: /example-0/partitions/partition@200000: failed to match any schema with compatible: ['tfa-bl31']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240315204521.28613-1-sjg@chromium.org

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
