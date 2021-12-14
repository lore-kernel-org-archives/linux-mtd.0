Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2E6C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 19:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzidB5NAyKMwVMo6i4ldRsmbLpjmNGWPeFDKzJf9qeI=; b=v0xt8PDIXr/+e6
	h+af6nvylPoQ9oU6MTT7KnjhgZrkC8xokBHbP/zEfTpRsw8SBVRoz/GeLeV57n6iizxGcdZHrUVYv
	hoHEgDKJNIpKDgHWzD6DFiHkCP2RO36K0UYNOvAavpZ0Esc+NQyaqYO0c5KCTLKonx6IHqeDzSUtt
	b0q4TwAgjTdhD0buD7yWONtlv/TpwmUtBggsw+HgjyXzbh+RWzKwSO6uxlDQwxzD1uSDXM1hBfVcG
	LCCmAXUCw6IivFHqCzgsrpIT3bw2T85zvS+eJeZCaoQNhzUYmVdRrmxL5XOWN76LHZfFgAyjMEqu9
	L7TaSz/woBONPf6aBhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxDjI-00FeBn-2W; Tue, 14 Dec 2021 19:44:52 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxDjE-00FeAq-HI
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 19:44:50 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BEJiZOt066021;
 Tue, 14 Dec 2021 13:44:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1639511075;
 bh=QbwF9PvySlAZfWMCGJJbnCKtJrdFlG0AGV6tD/F+cHs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=gpfPvF7NS0zI8sji9Wk7g2XGGb/wDoV6YEAgZTnDnYx/IbhdqcuG9gpPFZrVdZfBL
 xf/7+MWFJfmqvrlUcWHtgKsTxTJoJgP5/AL8SLj3GbbB32L3jY8yMyfIaxZRI9O0sM
 J2H8t65E8CThk6qO3LZ1di76C/FZcKFBxhHEHysU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BEJiZr1102883
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Dec 2021 13:44:35 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 14
 Dec 2021 13:44:34 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 14 Dec 2021 13:44:34 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BEJiYQh083577;
 Tue, 14 Dec 2021 13:44:34 -0600
Date: Wed, 15 Dec 2021 01:14:33 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Michal Simek
 <monstr@monstr.eu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob
 Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Message-ID: <20211214194431.4kpwfgvju6msh5d4@ti.com>
References: <20211210201039.729961-1-miquel.raynal@bootlin.com>
 <20211210201039.729961-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210201039.729961-3-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_114448_839390_09A1B30A 
X-CRM114-Status: GOOD (  24.80  )
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

Hi Miquel,

On 10/12/21 09:10PM, Miquel Raynal wrote:
> Describe two new memories modes:
> - A stacked mode when the bus is common but the address space extended
>   with an additinals wires.
> - A parallel mode with parallel busses accessing parallel flashes where
>   the data is spread.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/spi/spi-peripheral-props.yaml    | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 5dd209206e88..4194fee8f556 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -82,6 +82,35 @@ properties:
>      description:
>        Delay, in microseconds, after a write transfer.
>  
> +  stacked-memories:
> +    $ref: /schemas/types.yaml#/definitions/uint64-matrix

Why matrix? Can't you use array here? Sorry, I am not much familiar with 
JSON schema.

> +    description: Several SPI memories can be wired in stacked mode.
> +      This basically means that either a device features several chip
> +      selects, or that different devices must be seen as a single
> +      bigger chip. This basically doubles (or more) the total address
> +      space with only a single additional wire, while still needing
> +      to repeat the commands when crossing a chip boundary. The size of
> +      each chip should be provided as members of the array.
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      maxItems: 1

Thanks. This looks better to me.

But before we go ahead, I think there has been some confusion around 
what exactly your patches intend to support. Let's clear them up first. 
What type of setup do you want to support?

  1. One single flash but with multiple dies, with each die sitting on a 
     different CS.
  2. Two (or more) identical but independent flash memories to be 
     treated as one.
  3. Two (or more) different and independent flash memories to be 
     treated as one.

In our earlier exchanges you said you want to support 2. And when I 
wanted you to account for 3 as well you said we should use mtdconcat for 
that. So my question is, why can't we use mtdconcat for 2 as well, since 
it is just a special case of 3? And if we are using mtdconcat, then why 
do we need this at all? Shouldn't you then choose the chip at MTD layer 
and use the respective SPI device to get the CS value, which would make 
this property useless?

I can see this making sense for case 1. For that case you said you don't 
have an existing datasheet or device to propose. And if there is no real 
device doing it I see little point in figuring out a binding for it.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
