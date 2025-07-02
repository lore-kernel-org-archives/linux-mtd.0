Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7266C83F05
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jul 2025 14:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LCR8K4KCfjaY5OKEMEnjqA1DojHo4QShHdLo3+Ng0Rc=; b=HE+K0daOw1Qg4lpmS5o2cePsaI
	yTkQmszaBlRdnBkvDG/cbnDZloDNJM9bur5liogmOY5JRXT2iVfFrLwoX4unKrtKdUpZQf1b6EIIK
	FiszHcY+SqrSabWVohA0uxxpYHqxx5oflblkP5sScbIx5KNuhlXsrDFvq9AVB67txouFx9Mhhk8Nw
	99E5VuTcyhK7YNsXObr45Bt/+I4PUMrD3NkTDsVVRzdtA9gS7MyLNd5fyo7NDRQcWNeqZZE3zSuMG
	aJB9GJtCtzKcVDwT1KiUg1WJ3iY5cZuEZ4xE68CIOxFf5oWy1R1OC2xl1pwTPtZqIPJGYECkJca/Z
	30l9TdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWymW-00000008fz3-3TMs;
	Wed, 02 Jul 2025 14:49:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxVs-00000008SXa-04WP;
	Wed, 02 Jul 2025 13:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=9/mHY1iXeX9b6qN4M8HViaXxLFFBQvqt0AniwgviK24=; b=W0jctSq3xgh/1UEH5knAUrz6XY
	GJru3ycdxEDgLvwR40OH4VNkssRrQfN44/VQ8SDX8U1zWNA7+MiOSR5L2dgJQAx4xOr6OiEos7RGK
	D27Ihl69ja8EjzoTegrjzt0NWvUFfbNDWZiu/Z1/aNwtFmAiS/fU+BvX+SzokT6/2b34DKicXm7Da
	Lz3TpVPU2e9j7EQez2iyWt/YO4RN3oFcTmUvo3/vD90nnJbN8DxprBnRPxrCbAUfVVvgUhQQmToSM
	zrAjDke9NVOH3c1vUzGasSOG7HnuW0uASIbt7f3qKOJzq3Fu50vvP1OmbjkJ4Np+kcQI7r60lyp6/
	xcmbhBbw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxVo-00000007PeM-40HQ;
	Wed, 02 Jul 2025 13:28:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ABDF44D43;
	Wed,  2 Jul 2025 13:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261FEC4CEED;
	Wed,  2 Jul 2025 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462909;
	bh=wkmkkZivDEA1UxZm/WS0P0Mc3cKQij1LFXnN/TyZv7I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pt9YTI+tMGuYoDA8HXTHtUWsI29ivxk0ww/xQbHDQyWJ0TP0xsuFtwMFnzysFfyxD
	 MVRG8P+pyJ7h14t/sQcvsm8ieaMhSD0dBqaNhV0am/ID6Lb+nDLZK1IjpMCdtYYT5z
	 aO3tj3f7WxrB4iOV4xTqtNSuyPzrhj6Xytl7RX4Qara99G9kvPl/foVjQI/kNv2FG2
	 JlrhvK8A3Saig9cUSHKDPR23mQBMud6GeF62rrODKCgf8fQhkdHV9LO3ZROHfC3iOU
	 pXGgwo4KqMzm49iosSizxauCE7Bm/FqCJ6WvGkMSpialapgw27m4oF5HWX4Zn5u0vE
	 x1NaCIK/+kbGg==
Date: Wed, 02 Jul 2025 08:28:28 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Richard Weinberger <richard@nod.at>, Conor Dooley <conor+dt@kernel.org>, 
 linux-mtd@lists.infradead.org, imx@lists.linux.dev, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, 
 Vignesh Raghavendra <vigneshr@ti.com>, Vladimir Zapolskiy <vz@mleia.com>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250701212455.3106629-1-Frank.Li@nxp.com>
References: <20250701212455.3106629-1-Frank.Li@nxp.com>
Message-Id: <175146290647.1131327.11939010351638573167.robh@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: mtd: convert lpc32xx-slc.txt to
 yaml format
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_142833_203764_017CEDA7 
X-CRM114-Status: GOOD (  12.35  )
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


On Tue, 01 Jul 2025 17:24:54 -0400, Frank Li wrote:
> Convert lpc32xx-slc.txt to yaml format.
> - add clocks and partitions to match existed dts.
> - allow nand-on-flash-bbt.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - fix miss 's' at partition.yaml
> - remove ref nand-controller.yaml because existed dts have not nand child
> nodes.
> ---
>  .../devicetree/bindings/mtd/lpc32xx-slc.txt   | 52 ----------
>  .../bindings/mtd/nxp,lpc3220-slc.yaml         | 96 +++++++++++++++++++
>  2 files changed, 96 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.example.dtb: nand-controller@20020000 (nxp,lpc3220-slc): '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.example.dtb: nand-controller@20020000 (nxp,lpc3220-slc): '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250701212455.3106629-1-Frank.Li@nxp.com

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
