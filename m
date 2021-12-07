Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD2BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 07:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsrkmJQmJ+Qy8uToU7niL+Wc8HBUOgi01THoigT8Awo=; b=GSMGS/HVCkYLq7
	pu5fFNoQZDUcYhXrDd/ymUPmBCxxClXFW7oWXL0WJEtc7GF+NdFG1wTV597Vc4bH6vdgpeqkZGMBM
	+cdXzbJgZ+shgTsee9I2QyBT8Lo0tsecuKEyWwQd9caPXIxeNUWW1pj4JP6wjujXGDrS3kj/fteMY
	wYbhPcreB7koD8L3byLaslbd/WmfTHwsAXtl6YF4CMAkxwwFOw3CD8QjhTmy+8BbYeHsecD8r4S3r
	NAqtTsiZWDQ9lCsHitvujS+H5THNG+tMb5d/UWOwomFvgOEWnhqrrc60FmjfBFLm9rdprtfaKtSVf
	vGMP5tmpoW3K6BsQq5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muUgQ-007BiI-Ns; Tue, 07 Dec 2021 07:14:38 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muUgK-007Bhb-IB
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 07:14:34 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B77EQD7060239;
 Tue, 7 Dec 2021 01:14:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638861266;
 bh=whcxoM1kCXnWL/iG1rx1dwf/31jfNAf7VHubgohBgmY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=UxhoNauK1cK5FgrTx0EjzT1jlUCJiS6GGuU15QVm1pO5pRCIS7WaOvLx6lPuRRX5+
 QBM2h0Kd+RxSb54GjD64csJbB7483Ju9lOfkwtIipAsJxXnHmkDI3+II0U2ji6dr/1
 3v2mPC8mynLvnkr6ibo8qYEvOIF7haNsnIl9m+RM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B77EQXi009192
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 Dec 2021 01:14:26 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Dec 2021 01:14:10 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Dec 2021 01:14:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B77E97J061738;
 Tue, 7 Dec 2021 01:14:09 -0600
Date: Tue, 7 Dec 2021 12:44:08 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Rob Herring
 <robh+dt@kernel.org>, <devicetree@vger.kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v3 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Message-ID: <20211207071406.c2ajc3shqybevvjj@ti.com>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
 <20211206095921.33302-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206095921.33302-3-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_231432_754733_0F9299B4 
X-CRM114-Status: GOOD (  22.06  )
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

On 06/12/21 10:59AM, Miquel Raynal wrote:
> Describe two new memories modes:
> - A stacked mode when the bus is common but the address space extended
>   with an additinals wires.
> - A parallel mode with parallel busses accessing parallel flashes where
>   the data is spread.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/spi/spi-peripheral-props.yaml    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 5dd209206e88..13aa6a2374c9 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -82,6 +82,27 @@ properties:
>      description:
>        Delay, in microseconds, after a write transfer.
>  
> +  stacked-memories:
> +    type: boolean

I don't think a boolean is enough to completely describe the memory. 
Sure, you say the memories are stacked, but where do you specify when to 
switch the CS? They could be two 512 MiB memories, two 1 GiB memories, 
or one 512 MiB and one 256 MiB.

> +    description: Several SPI memories can be wired in stacked mode.
> +      This basically means that either a device features several chip
> +      selects, or that different devices must be seen as a single
> +      bigger chip. This basically doubles (or more) the total address
> +      space with only a single additional wire, while still needing
> +      to repeat the commands when crossing a chip boundary. XIP is
> +      usually not supported in this mode.
> +
> +  parallel-memories:
> +    type: boolean

With this I assume both memories have to be the same size?

> +    description: Several SPI memories can be wired in parallel mode.
> +      The devices are physically on a different buses but will always
> +      act synchronously as each data word is spread across the
> +      different memories (eg. even bits are stored in one memory, odd
> +      bits in the other). This basically doubles the address space and
> +      the throughput while greatly complexifying the wiring because as
> +      many busses as devices must be wired. XIP is usually not
> +      supported in this mode.
> +
>  # The controller specific properties go here.
>  allOf:
>    - $ref: cdns,qspi-nor-peripheral-props.yaml#
> -- 
> 2.27.0
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
