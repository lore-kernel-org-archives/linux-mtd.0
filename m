Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3A7C2BA1A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 19:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NmKygo9P/CsIPyUevGB/kjVIDaVSRfMNDmWoHGW3Pwo=; b=sfYUVkUyzhfWTPr/FFw2I2W/yb
	yp93LD0OSpHRXPxIHy6q8c+z0/crRJMoYnxYVlTXZbbxK9WOEwUD3Ti1uJ0ryBQ3+lgUJoqsYOu77
	zGR3+G02a92M0VVDaD4IA6zTDcKCCLiEn0Nvjvur+PYM4UXbymiPn8xMT547hdKVDyEAhCtaTU03O
	JdVeNYaMcHZ5uZSA6aJNZmOwO6EJo2BuskVyD1v1JmhbAkYjdcfaiWX8A5+GOohIGL/VthcCehWE6
	fJSx76WC1aossxc3+UsGsdy0rnx6YVc+T0hMSSt09KZvXzL43svJVHOqcu719zSy/2wq/20bDnIMt
	Dkuct2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKNkh-00000006Vj2-3SWN;
	Thu, 20 Jun 2024 19:47:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKNkd-00000006Vha-15td;
	Thu, 20 Jun 2024 19:47:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FC5062190;
	Thu, 20 Jun 2024 19:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD0CC2BD10;
	Thu, 20 Jun 2024 19:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718912838;
	bh=D+e2m26VHYUG/Lo1gKaeNxI1GFfU9WexaAsiXpn5YYI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=snFugIF/AqgJy+pEn7auwBHqcgy7Pe3AUcf+drxFEmAqZGIg4UnWBdqoK6m6CwAsz
	 EkiwhgZjP3d7GOm7e8ou0XhSc1T7L3lMeaa/T1AEIXbfpSX2iywkxq4avE0e0+m91t
	 dLOvf7FI8ULn1u+pmBL4hCtE4SXPle6UjAxOchsCgdgfWHkHmUV9bzREB8NNPkOJPP
	 5LWC2Wixht1KdskG7sSDxZfktWP8GWsK507Mj2+LEuf+K4sBHxeRyzFxXz2SDbZ0t9
	 K6+mi92KIySVFO89b+DEvfdkNsCh+2E7uNs9B8beQA9nGHp8USIGgcbWKanPLsl5s8
	 j+fvNo+PZMXHQ==
Date: Thu, 20 Jun 2024 13:47:17 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-sound@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>, 
 dmaengine@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Richard Weinberger <richard@nod.at>, 
 Michael Turquette <mturquette@baylibre.com>, Takashi Iwai <tiwai@suse.com>, 
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-kernel@vger.kernel.org, Markus Elfring <Markus.Elfring@web.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Yangtao Li <frank.li@vivo.com>, 
 "J.M.B. Downing" <jonathan.downing@nautel.com>, 
 linux-mtd@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, 
 devicetree@vger.kernel.org, Li Zetao <lizetao1@huawei.com>, 
 linux-i2c@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 alsa-devel@alsa-project.org, Vinod Koul <vkoul@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
Message-Id: <171891283706.3289677.3213379285370562671.robh@kernel.org>
Subject: Re: [Patch v4 02/10] dt-bindings: dma: Add lpc32xx DMA mux binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_124719_644956_91966392 
X-CRM114-Status: GOOD (  12.80  )
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


On Thu, 20 Jun 2024 19:56:33 +0200, Piotr Wojtaszczyk wrote:
> LPC32XX SoCs use pl080 dma controller which have few request signals
> multiplexed between peripherals. This binding describes how devices can
> use the multiplexed request signals.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v4:
> - This patch is new in v4
> 
>  .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  9 +++
>  2 files changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.example.dtb: /example-0/syscon@40004000: failed to match any schema with compatible: ['nxp,lpc3220-creg', 'syscon', 'simple-mfd']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240620175657.358273-3-piotr.wojtaszczyk@timesys.com

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
