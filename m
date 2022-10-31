Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6BAFA3741
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 20:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pexoo7e3pHGaFo1/3WjvJUaZGkv8KnZb0bG2xoTiQWQ=; b=HNTcpFUIIOOZvn
	1TQHyzNJgAmNY0e2NRHITrYZDu0EMAHyJtntD1GNOrxLK2sEfLFA6tQSwwFpLb+2MSX5mGEdAFH0m
	ctKzdA7AHfYJ69gl06iRxajcvEuDtjSJ8sRGNME1H78X+EE8O6ptbp5hWDTNk7p1XQ5sp7fjOk0/K
	pDM/Gxv0vnufRte5hX38VIytM1Ckg7hvgxA1HDsQNJtL/4GwfD0omuYwuomjRKi4Cp9N1o4hqi7jG
	MmQys7vrESOKr3hRoLmZLbvhzYfa48yeM0Bon//KpEUnpUhO15yXGB9TQ9/2+xnnL1k00XBdGkG9U
	4M7RYo9g/oqF4+iaPLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opbny-00FLGt-Ha; Mon, 31 Oct 2022 20:54:46 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opbnv-00FLGI-N4; Mon, 31 Oct 2022 20:54:44 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-13bd2aea61bso14862390fac.0;
        Mon, 31 Oct 2022 13:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlLgdjn9D1YIceaBfkfEVV7Xu0o6/DdkHOK6FWg7DXs=;
        b=ylMSyHac8BNBGM5oNlt32lfVAMVGD90oJVDatcAi+sv3FnllTYxUerRiEcUPAJ7Kd6
         5PSInPaZz47uLhAiGLGZo9PH4Hw8LZhst6tCaP864s5glhKUjVfN1cIhgGW7uN525ZXI
         kvli1DAEeVX1Ovkr3MPEwrjplRDNN2bY+pz13uSVyO+AeTTri5jEA1jPwONqtD9OwjAp
         qGHFanuwaktebaxy8FiWtlRipuoO5id/OaE06Oon/NARGrUs6g4G/IsaE7ZRI4gSFgBp
         XF4weZocxVw7z+stWwMYI6+5oHM6EgGnspumel1PosTliUxVahxsfLtCYgTbiDREb9NO
         4ePQ==
X-Gm-Message-State: ACrzQf1SYg3kFgQSmdmCxIJD0KDQNIBy43c3wO+xc5z3L8UKgaDXczec
	qJIagyznaGnvgN8AEVYCsw==
X-Google-Smtp-Source: AMsMyM7vTUsE4Eu/4WH4ujPZbj5pkakgbRyAll6n+tNS+7ne5KKzHQQXzNKYvu6fsABenaccKwfl4Q==
X-Received: by 2002:a05:6870:a7a5:b0:125:76da:1bc1 with SMTP id x37-20020a056870a7a500b0012576da1bc1mr19209128oao.272.1667249681241;
        Mon, 31 Oct 2022 13:54:41 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d94-20020a9d2967000000b0066b9a6bf3bcsm3152995otb.12.2022.10.31.13.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:54:40 -0700 (PDT)
Received: (nullmailer pid 3504734 invoked by uid 1000);
	Mon, 31 Oct 2022 20:54:42 -0000
Date: Mon, 31 Oct 2022 15:54:42 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 05/12] dt-bindings: mtd: onenand: Mention the expected
 node name
Message-ID: <20221031205442.GA3307775-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-6-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_135443_769735_9FEDB84A 
X-CRM114-Status: GOOD (  17.32  )
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

On Sat, Oct 29, 2022 at 01:59:26AM +0200, Miquel Raynal wrote:
> The chip node name in this driver is expected to be different and should
> be prefixed with onenand instead of the regular "flash" string, so
> mention it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> index a953f7397c40..8a79ad300216 100644
> --- a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> @@ -15,6 +15,9 @@ description:
>    as child nodes of the GPMC controller.
>  
>  properties:
> +  $nodename:
> +    pattern: "^onenand@[0-9],[0,9]$"

I don't think it is worth enforcing node names that we 
haven't defined in the spec. Wouldn't 'nand-controller' be appropriate?

> +
>    compatible:
>      const: ti,omap2-onenand
>  
> -- 
> 2.34.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
