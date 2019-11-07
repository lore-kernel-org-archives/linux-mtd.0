Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A88FA372C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 01:09:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C074221848
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 01:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SxWcDL3H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C074221848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WP4FdAxTIUu46z5EW+1Ogch6G6eQZqRtLLaLdl7jbIw=; b=SxWcDL3HiR3VxX
	l6M+nzvQ3Lyy4Y6Pzp/bRGKDSOgOcTe/WtFjS0dAE6ZlC6Y3a8AMgLJyF6MX38uAJs2bxi2Oi3Z7Z
	1Ld6bcPtIpByO7a9hyrB3D8IzW8kD7Qh0QaBrh1+l8t4OPAq79SJIOyUFjWrIKaK24pvI1aBcWaWs
	r16rXULJp/rCgggR2mMUyE2ECcgngLW/p2tayWsbd9UEjUZPLqZ2AdfQjgH8cn0wMUOTbyO7kQyWq
	w7Xvyo3vuwCALwDP5/ZiP+UAHZYrhLkwF0uFha+70BCV+EaOmr79GMBuCjjfwoH6MyvrXZpyW5zrY
	jD4xut6EtJeekbcUnfyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSWIo-0008Fu-GG; Thu, 07 Nov 2019 01:09:34 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSWIl-0008FA-4L; Thu, 07 Nov 2019 01:09:32 +0000
Received: by mail-ot1-f68.google.com with SMTP id m15so530088otq.7;
 Wed, 06 Nov 2019 17:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NYYQ/Md98Kv7GDY9hpFC9qLnAqCXT03X+kalujOMXqA=;
 b=dz1UW3xUHoUS6pFosJD0ArWQcsGrVRdbme44m9aWYMHDAikhssEBo3upKL77XJlWfA
 UAH3VHKGAfOTl4rNdPyQUS/lzyuCeHyQZ7jBxi3jjvShsd03jczKK4JfTeWAn+6zmMNP
 /TXyVoTdSaQr5napEgZD+rPTtlbvELVSt+w279zNTlyuKAwyf2roVPkPoswrFYkVWms8
 Q6gCNK9we/0xbldy8A61h+C9u2VRpcfThtvmDlNzcwxmwUpYqCmDaLDjVKlarna4bRHR
 Bbz5RlNi5yQ18X6uWFLXZ+5IbZ/yKPr8Wx1kskTYGL9fKqk97bojAMwVsDViyrQ0YlVl
 hw4A==
X-Gm-Message-State: APjAAAXXuLJduRaAXVNMIaaG42jbjq57yknBSmw5Sb+RHUNCg+J/N354
 EG9cRMHCuhQu9bvyr+J+UA==
X-Google-Smtp-Source: APXvYqwFinuHimJdUtg64Zs1L4hsqa6lJbK/YjzRj2+ENZc7gQOQnidCjX7AyT/Xd6ftZepv0BMhww==
X-Received: by 2002:a9d:6294:: with SMTP id x20mr540695otk.31.1573088970151;
 Wed, 06 Nov 2019 17:09:30 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 41sm223441otd.67.2019.11.06.17.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 17:09:29 -0800 (PST)
Date: Wed, 6 Nov 2019 19:09:28 -0600
From: Rob Herring <robh@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: mtd: mtk-quadspi: update bindings for
 mmap flash read
Message-ID: <20191107010928.GA14186@bogus>
References: <20191106140748.13100-1-gch981213@gmail.com>
 <20191106140748.13100-3-gch981213@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106140748.13100-3-gch981213@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_170931_172331_DD40AF2A 
X-CRM114-Status: GOOD (  18.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 06, 2019 at 10:07:48PM +0800, Chuanhong Guo wrote:
> update register descriptions and add an example binding using it.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  .../devicetree/bindings/mtd/mtk-quadspi.txt   | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> index a12e3b5c495d..4860f6e96f5a 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> @@ -12,7 +12,10 @@ Required properties:
>  		  "mediatek,mt7623-nor", "mediatek,mt8173-nor"
>  		  "mediatek,mt7629-nor", "mediatek,mt8173-nor"
>  		  "mediatek,mt8173-nor"
> -- reg: 		  physical base address and length of the controller's register
> +- reg: 		  Contains one or two entries, each of which is a tuple consisting of a
> +		  physical address and length. The first entry is the address and length
> +		  of the controller register set. The optional second entry is the address
> +		  and length of the area where the nor flash is mapped to.

All the compatibles support 2 entries? If not, which ones?

>  - clocks: 	  the phandle of the clocks needed by the nor controller
>  - clock-names: 	  the names of the clocks
>  		  the clocks should be named "spi" and "sf". "spi" is used for spi bus,
> @@ -48,3 +51,19 @@ nor_flash: spi@1100d000 {
>  	};
>  };
>  
> +nor_flash: spi@11014000 {
> +	compatible = "mediatek,mt7629-nor",
> +		     "mediatek,mt8173-nor";
> +	reg = <0x11014000 0xe0>,
> +	      <0x30000000 0x10000000>;
> +	clocks = <&pericfg CLK_PERI_FLASH_PD>,
> +		 <&topckgen CLK_TOP_FLASH_SEL>;
> +	clock-names = "spi", "sf";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +	};
> +};
> -- 
> 2.21.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
