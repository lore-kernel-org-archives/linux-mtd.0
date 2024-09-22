Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA2DCF9C69
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Sep 2024 20:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIZcdbpnLX9aLxEPmPFte3ZR4aaFZh8S5bGblESytDs=; b=QEb5LrCTh01Q3r
	7fme5vYWu2v+y0FJqnlukdG4bcPhek9xH7j/ME1vjfwXP9pJpk4Wo0QJqe13OCmAnhwL3PV/8w8Ff
	QL/xWiYatu3jeGUFg0cKe93x99ebHQVo13xnYoaRGAuLQHU2fmPf33Qd6gBVXF7TfzDJimjHVYJUp
	QJIiRfF2Ubh+dA8MyXRabFL+16s7mYfSyyPymulZE0aIRHu4LMVU8tteZG2kVvHGT9opztKaeCkel
	yjxtg+hXqURTt7bqbZEHFsPu+lMNOiFNZX3enUm5Xlc2CRI4AVAXFCCFln9YzFqmpFt+VjzsVlE0b
	t3ThLjAe7isK+FtsYskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssTNk-0000000Fibc-0xv1;
	Sun, 22 Sep 2024 20:40:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssTNg-0000000FibD-1S3z
	for linux-mtd@lists.infradead.org;
	Sun, 22 Sep 2024 20:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39960A40FA6;
	Sun, 22 Sep 2024 20:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD987C4CEC3;
	Sun, 22 Sep 2024 20:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037630;
	bh=u0jmX+4P2TILi/C5bbfXVYKw7H7u1hfnwLxWdlhqJoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKGM6gv9O6G8jgE9+u+lvgLW4qhclGBONgrrz9SSyQHLhhR3n3an2CoUw/itQcVY/
	 7VAMBV4CIu3Drh5bTRP9bTFECJbJ20DNU9AuidonqXo+PHHFN6y6xdUot/q1dRVNw6
	 p8DvGirrorChkaBwIE0xYxDZeImL5Z3/IkQA1qnvrzb/q6O9Iy8DTl3ookfnLMXNxU
	 PEZNdIs4MEirQkY+a3q22B1VhEdUqXp9PoP/HESsWpBT0ijj43uSl6QqK8zPwJH//I
	 7y9YYH9NWzLSQmdoB3a3KAhCI7TDKDIfQZ6U2g1UPlsUQuFYapxEbRXBxAP1QjY7K8
	 /atRYQSkqrShw==
Date: Sun, 22 Sep 2024 22:40:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erez Geva <erezgeva@nwtime.org>
Cc: linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>, Erez Geva <ErezGeva2@gmail.com>
Subject: Re: [PATCH v5 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
Message-ID: <2fo7pndjqieq6lfydmq2pnwb374oqoqnrcsezycgougmr7mtl5@2wm6fe3inf5u>
References: <20240920181231.20542-1-erezgeva@nwtime.org>
 <20240920181231.20542-4-erezgeva@nwtime.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920181231.20542-4-erezgeva@nwtime.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_134032_543592_C460B5D5 
X-CRM114-Status: GOOD (  22.59  )
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

On Fri, Sep 20, 2024 at 08:12:29PM +0200, Erez Geva wrote:
> From: Erez Geva <ErezGeva2@gmail.com>
> 
> Some flash devices need OTP parameters in device tree.
> As we can not deduce the parameters based on JEDEC ID or SFDP.
> 
> Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
> ---
>  .../bindings/mtd/jedec,spi-nor.yaml           | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 6e3afb42926e..4f7bb3f41cb1 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -90,6 +90,43 @@ properties:
>        the SRWD bit while writing the status register. WP# signal hard strapped to GND
>        can be a valid use case.
>  
> +  otp-n-regions:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Some flash devices need OTP parameters in the device tree.
> +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> +      This parameter indicates the number of OTP regions.

OTP regions where? In DTS? On flash itself?

> +      The value must be larger or equal to 1 and mandatory for OTP.

Don't repeat constraints in free form text. Add proper minimum and
default, although it is confusing - property is not required but it is
mandatory for OTP?



> +
> +  otp-len:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Some flash devices need OTP parameters in the device tree.
> +      As we can not deduce the parameters based on JEDEC ID or SFDP.

Don't repeat the same.

> +      This parameter indicates the size (length) in bytes of an OTP region.

What if each region has different length? Is it possible?

> +      Currently the driver supports symmetric OTP,
> +       which means all regions must use the same size.

Drop unneeded space in front.

> +      The value must be positive and mandatory for OTP.

Same comments as before.

> +
> +  otp-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Some flash devices need OTP parameters in the device tree.
> +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> +      This parameter indicates the offset in bytes of
> +       an OTP region relative to its previous.
> +      User can omit it if the offset equals the length.
> +      Or in case we have a single OTP region.
> +
> +  otp-base:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Some flash devices need OTP parameters in the device tree.
> +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> +      This parameter indicates the base in bytes of the first OTP region.
> +      User can omit it if the base is zero.

so default: 0?

I am not sure, but all this looks like duplicated description of nvmem
cells or some sort of partitions.

Considering that this is first time the binding mentions OTP, I really
do not get what you are doing it. If the properties are to stay, please
describe better the problem (and hardware!) in commit msg.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
