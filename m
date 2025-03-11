Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43CDC28B30
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Mar 2025 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H7eDZkkIjTb/IY6Si52PB+ZuA7QW8hLcf6jUc9AQtfw=; b=AYyJDKoSA4nDRfFQdcwrpa9zu6
	M+r6vPBEBFnh3x2Hf/NsBDQTAWXeEISyfaEZ/avmyEg2fJeOVY0Ygu9gCVcX9G9SkDcNjuKBMxiYW
	cje2FBtwSis1LQf0JlX21CIjWjkklf0UaWQl48As85OU3pERPwoO01miPVfeKLvW10V8xrLKdZIrL
	5E/aHKXjFL5EZeH4eC8qVLCxNLnPR7qklwUPzI3p9mJgXjX8lbvZU1slNYiRaERn+wpgGcqlJ8fx1
	XQkRoW2/UKS1PKX8Hv3Bn6uHjeVK6f9szs4IwFh4xB2Xqe8dfcFWiNdK3tnl7J5mRR4Ts8Ajhnk5Q
	JNKPTqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts10A-000000062s7-0e5Z;
	Tue, 11 Mar 2025 14:54:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0yS-000000062Zm-47C0;
	Tue, 11 Mar 2025 14:52:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD8435C6482;
	Tue, 11 Mar 2025 14:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE29C4CEE9;
	Tue, 11 Mar 2025 14:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741704772;
	bh=przUIjrGBeRn2NFdoDvfHg0XkuwpE3kxzoY/NM9thYQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KFXE9Zeihos+lajupK4gUTerAD9SsbPG4vZhTreuJpHhiLjGkJUi22Krq41eOOrpz
	 oHd21OBdT3uLqgMu9om9jcqqHzzC+gPHTX0uCdswFtL9cp2NWHSNZYn5IW9ZPj2Im/
	 518d+YXAAQgst7dkw/SoDL/cU0PkbEZqG2OVQn9A50JhSu3fJJZKMZQChPE2R0Kw1T
	 Ose7wBG99V2VuTOS7cvHkv2DdLSOCqUXEUXg9is8tIRDRSc2dpG/4g8hCVHBA3hTgO
	 u0FM+dtZEyZ6jx+nGH/D3TalLHGxnUdSHe0otovpN6yOdRglWV6OaZKQEjCUEZaUxh
	 FFBRwmdKZNeiQ==
Date: Tue, 11 Mar 2025 09:52:50 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 richard@nod.at, miquel.raynal@bootlin.com, krzk+dt@kernel.org, 
 claudiu.beznea@tuxon.dev, vigneshr@ti.com, linux-kernel@vger.kernel.org, 
 nicolas.ferre@microchip.com, conor+dt@kernel.org, 
 alexandre.belloni@bootlin.com
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
In-Reply-To: <20250311122847.90081-2-balamanikandan.gunasundar@microchip.com>
References: <20250311122847.90081-1-balamanikandan.gunasundar@microchip.com>
 <20250311122847.90081-2-balamanikandan.gunasundar@microchip.com>
Message-Id: <174170473601.3452705.4276708145941047362.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: microchip-nand: convert txt
 to yaml
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_075253_116453_78B32970 
X-CRM114-Status: GOOD (  14.25  )
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


On Tue, 11 Mar 2025 17:58:45 +0530, Balamanikandan Gunasundar wrote:
> Convert text to yaml for microchip nand controller
> 
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> ---
> 
> Changes in v2:
> 
> - Change the filename to match the compatible string
> - Drop items and oneOf in the compatible property as it is just an enum
> - Remove the if in the #address-cells and #size-cells
> - Remove the unwanted comments that refers to .txt files
> - Fix reg property description
> - Define the properties in a list and add constraints
> - Fix DT coding style and droped unused labels
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt    |  50 -----
>  .../mtd/microchip,nand-controller.yaml        | 175 ++++++++++++++++++
>  2 files changed, 175 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mtd/microchip,nand-controller.example.dtb: /example-0/ecc-engine@ffffc070: failed to match any schema with compatible: ['atmel,at91sam9g45-pmecc']
Documentation/devicetree/bindings/mtd/microchip,nand-controller.example.dtb: /example-0/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/microchip,nand-controller.example.dtb: nand-controller: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/microchip,nand-controller.example.dtb: nand-controller: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250311122847.90081-2-balamanikandan.gunasundar@microchip.com

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
