Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F8EC83F04
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jul 2025 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y0sHgHESSowAXdDFrqaGo3g8ww86xzPj01ddvnpsssk=; b=X9MJnCoiHER0PPJ5Onea8/Ldj8
	ErbaF5hSGy07dN3UL3mhIwcoYKa+r1DrAlM1Q6ZKJrldlkC7MzEXQ8gMe9nF1Hvu6Fp0TLNrO7z3L
	4DxH5l5M0MUd3/pg0wHqizh0gMvK6oCWnq0oU73EI/tEwggtW1muSZkU8RVGD5pzTPGARlvWyXTh9
	fPSFpGdbCGMqMCiSGwvZgpxjwr4GF1Fp/hbFN7fFy2Uzl8QSGaJvkFi8DVcLcnB0ifMR15SBCbhlT
	i/6KSTXrlrY6g+//ZXX7n8xScCAhmWlIgJWCA4+pP0/+We5/QK3Idv9CB8/6Hv7+pg6gMiw09qoJJ
	Mm1cM2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyk9-00000008fal-2UaQ;
	Wed, 02 Jul 2025 14:47:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxVn-00000008SWD-1UPE;
	Wed, 02 Jul 2025 13:28:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7213A535E2;
	Wed,  2 Jul 2025 13:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A67C4CEED;
	Wed,  2 Jul 2025 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462910;
	bh=s7dPMDSNFCaxgnmXl3jsTNsiVKnZxD23neqgWnhUH6E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cnaI9L1OWTrKRNlCI4KsY+Atqx8R1kDdC5c/OC0xo5+PomSudEdO3KrPRFL96mhLP
	 0E4qYktzHnRZlW+fyuxxpATSfRKYuRLdco3vymq0BtAOy0r7Kvk2kiRg0WvOLCYl71
	 46ilTbvTphSUThoDDK9ohos5adiyiuZAjH0EpZ8c9qd1rBOnERdg1u7M8uEOE4vrFW
	 +aFWXdGSZCVS/QriSL9i5YCbq8NzVfvlxHG406eE7MM4EZ22diFt3vc+dhJi0LlWnV
	 lnOMRN8L9txAdDGVTGDkvBxrxI8iJk3G1NxkoUdlwq+xN0UFXWXqwp3fOrBupViVcV
	 XKjYst3PKGJqQ==
Date: Wed, 02 Jul 2025 08:28:29 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vladimir Zapolskiy <vz@mleia.com>, linux-mtd@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, imx@lists.linux.dev, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250701212525.3106709-1-Frank.Li@nxp.com>
References: <20250701212525.3106709-1-Frank.Li@nxp.com>
Message-Id: <175146290703.1131376.6667811203278241042.robh@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: mtd: convert lpc32xx-mlc.txt to
 yaml format
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062831_463007_1E896F48 
X-CRM114-Status: GOOD (  13.59  )
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


On Tue, 01 Jul 2025 17:25:24 -0400, Frank Li wrote:
> Convert lpc32xx-mlc.txt to yaml format.
> 
> Additional changes:
> - replace _ with - in property names.
> - add missed clocks to align lpc32xx.dtsi.
> - allow partitions subnode.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - remove nand-controller.yaml.
> - add clocks
> - update examples to align lpc32xx.dtsi
> - add partitions although no mlc users under upstream tree. It should be
> similar with slc case.
> ---
>  .../devicetree/bindings/mtd/lpc32xx-mlc.txt   | 50 -----------
>  .../bindings/mtd/nxp,lpc3220-mlc.yaml         | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.example.dtb: nand-controller@200a8000 (nxp,lpc3220-mlc): '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.example.dtb: nand-controller@200a8000 (nxp,lpc3220-mlc): '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250701212525.3106709-1-Frank.Li@nxp.com

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
