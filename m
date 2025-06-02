Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B107C5B549
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 07:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W6G6et6nJqoV+Ur2jQ99G6Ocw0v7VQj75BhGYwIXM60=; b=2X0EAoo/ibHAegtpTvBGuXW0vR
	KUFv4TuS/7M0rg7ZnFWBKZJCtXgE7HHEIPAMUo6aOWcONyGPjPNGenwEeaQ6imSVa/+c3pUxauTfb
	iZTWfyZLgkJD0Vf8eDEIxjjld9K8nEaul5aua4s7K0OblFhFwKNQYT9k3WLWoMwjHENMjbumgqK6s
	nduQ9JPLpBgqz+7WS4afKr76fgYFbGm0bQdBeH2MiPxw6Ogb8rHQ8vl8p04cvlgLPeqUB4sgUf5//
	wZkQkNS+sukDzmfWGo6NnxdTGfsh+Y3utvAm57w2D38OxJq6/IrP+3alIlFuLUHwDofg1kf8Q/yrc
	Z/hyLJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzHH-00000006t6z-1Z8x;
	Mon, 02 Jun 2025 07:08:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzF9-00000006szw-2v1o;
	Mon, 02 Jun 2025 07:05:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4173E6111C;
	Mon,  2 Jun 2025 07:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB657C4CEEB;
	Mon,  2 Jun 2025 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748847958;
	bh=3Zpf+Qil/YamO+qg691NiwhwZgCq5Dm12QIEOCFrJ6c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=etUHg7kTonia1iJXlF47bA1+U3Jo/kbCY0MlSz+el5nFAhOkEFfmEm7b/imINjoVU
	 DwsuDKEMWSga885lYX8J+HnjqXmV881U32GnZWArkfBnmjeoUxTBd+YdYRxN08wn1g
	 /u2hj8bjAsPM8NsM2A1CRTS5Dam2Nf0LQ42GuZfVEAlMtFLbjtVmuhU++bfdPtUqmF
	 Pkl3WPlSkpwXqYJawUaWwce8dVQAHOzdhGu6KD6uePzU4lveXH8RPj4veguo2pH8pm
	 B4IUHgRcFTWHXbuku119cB0cjTEErAjMLTBG8h+35c+UewGdt1eK/TYia+bUvV+0Ql
	 9frlkRJvZUEWw==
Date: Mon, 02 Jun 2025 02:05:56 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: claudiu.beznea@tuxon.dev, vigneshr@ti.com, krzk+dt@kernel.org, 
 nicolas.ferre@microchip.com, krzysztof.kozlowski+dt@linaro.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com, richard@nod.at, 
 conor+dt@kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
In-Reply-To: <20250602053507.25864-2-balamanikandan.gunasundar@microchip.com>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
 <20250602053507.25864-2-balamanikandan.gunasundar@microchip.com>
Message-Id: <174884795608.25189.1492407932074912521.robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: mtd: microchip-nand: convert txt
 to yaml
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


On Mon, 02 Jun 2025 11:05:04 +0530, Balamanikandan Gunasundar wrote:
> Convert text to yaml for microchip nand controller
> 
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt    |  50 ------
>  .../mtd/microchip,nand-controller.yaml        | 169 ++++++++++++++++++
>  2 files changed, 169 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mtd/microchip,nand-controller.example.dtb: /example-0/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/microchip,nand-controller.example.dtb: nand-controller (atmel,sama5d3-nand-controller): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/microchip,nand-controller.example.dtb: nand-controller (atmel,sama5d3-nand-controller): #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250602053507.25864-2-balamanikandan.gunasundar@microchip.com

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
