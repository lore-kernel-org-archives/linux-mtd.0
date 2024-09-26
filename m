Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53167CDE006
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/KJIWLpII66eTDas7TZ5pUMjB+MaZN/LLn2Pu8Dkls=; b=bYli9sfsGD/Xi2
	JszAY+phYZTP68eAIant5ff/r2Px1buZw9AVU8orjdiUmUiCMidPco94KaiLN61+0/SUKJuSlDWiX
	GBNiPDxT5lwKWp5zEZ/j5JkcknYdx1Xs25j5Sg5ywPUS13pUpfcxiPQLBrKIESlFZkOi7uLXBG73k
	giQfmPH6i991nPlblCm1jdLiwSIbwu+AYy9ypiXAM7p5mb2BiElrC4v0VNjwOkJC1Wuk9AE+wcZsu
	Mfe5yKLPcg245AyyTXM40AeiRKO9nQnXl0ay4fgV4C7T0SKI2icWmHfY5gByZQ6nAOd9i8auDrpC0
	MwHC6HFmNQkAbIDdVhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stpHW-00000008YpJ-0Hvj;
	Thu, 26 Sep 2024 14:15:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stpHT-00000008Yok-2z9P
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 14:15:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B05325C3E7D;
	Thu, 26 Sep 2024 14:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECBCC4CEC5;
	Thu, 26 Sep 2024 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727360142;
	bh=Kv1Cdy6l+gouokDZ3e4xVwNd6beXKTj/+T6t59ybc2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7B2f0rcTDtiVBhyi6eeIT3fTA82VCjbUR0AY1bfVe8pnmhl8uVy+JDFnVDxuikdY
	 blzfgrjf+udZhHHqnk5feo9ATaHui45Hp3V9VvMylh8yxWbARg/0VreYeJ4uOnDX+/
	 BErfw9UvWnepSpuMxj5lmJ5due2iWYH5iUNrBwU5+iEpru8pYYGem9HZjr1/CM4jQ0
	 n2/r+GERvb58j5IGvJq4I1gWuUDOiWT8f3oi8L2xhQU+InsAO2GWA1zXZdwkWtAtyA
	 UfKZd0SNxWLg46UCZ1vKg8jlsxeaOHjSVuE9qNgD2HA2OKj2MVQDBd5KIMTIeowgmD
	 fCg9LNU/RxXKQ==
Date: Thu, 26 Sep 2024 09:15:41 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Simon Glass <sjg@chromium.org>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Li Lingfeng <lilingfeng3@huawei.com>,
	Christian Heusel <christian@heusel.eu>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [RFC PATCH v2 5/5] dt-bindings: mmc: Document support for
 partition table in mmc-card
Message-ID: <20240926141541.GA2625953-robh@kernel.org>
References: <20240925214544.6114-1-ansuelsmth@gmail.com>
 <20240925214544.6114-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925214544.6114-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_071543_958492_7ED3BE48 
X-CRM114-Status: GOOD (  28.47  )
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

On Wed, Sep 25, 2024 at 11:45:25PM +0200, Christian Marangi wrote:
> Document support for defining a partition table in the mmc-card node.
> 
> This is needed if the eMMC doesn't have a partition table written and
> the bootloader of the device load data by using absolute offset of the
> block device. This is common on embedded device that have eMMC installed
> to save space and have non removable block devices.
> 
> If an OF partition table is detected, any partition table written in the
> eMMC will be ignored and won't be parsed.
> 
> eMMC provide a generic disk for user data and if supported (JEDEC 4.4+)
> also provide two additional disk ("boot0" and "boot1") for special usage
> of boot operation where normally is stored the bootloader or boot info.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/mmc/mmc-card.yaml     | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> index fd347126449a..58b6593a0f60 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> @@ -13,6 +13,10 @@ description: |
>    This documents describes the devicetree bindings for a mmc-host controller
>    child node describing a mmc-card / an eMMC.
>  
> +  It's possible to define a fixed partition table for an eMMC for the user
> +  partition and one of the 2 boot partition (boot0/boot1) if supported by the
> +  eMMC.
> +
>  properties:
>    compatible:
>      const: mmc-card
> @@ -26,6 +30,30 @@ properties:
>        Use this to indicate that the mmc-card has a broken hpi
>        implementation, and that hpi should not be used.
>  
> +  "#address-cells":
> +    const: 0
> +
> +  "#size-cells":
> +    const: 0

Don't need these properties.

> +
> +patternProperties:
> +  "^partitions(-boot[01])?$":
> +    $ref: /schemas/block/partitions/partitions.yaml
> +
> +    patternProperties:
> +      "^partition@[0-9a-f]+$":
> +        $ref: /schemas/block/partitions/partition.yaml
> +
> +        properties:
> +          reg:
> +            multipleOf: 512

I was going to suggest this, but I think it won't actually work because 
it could be 2 cells for address and/or size.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
