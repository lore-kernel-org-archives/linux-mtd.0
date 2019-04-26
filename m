Return-Path: <SRS0=mBQF=S4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37979C43219
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 20:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C20C2054F
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 20:20:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V7C52ABE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C20C2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mFqM4AX2IKsDg2Y28/FsNtfC5o7RIXhy6cUlRm+oJM=; b=V7C52ABEeZihz6
	i9rMTIUAaVU5zLxa8V6d10WBSrkdFhRxTNfFIGv+fpwexbFG2aS5JJZ7PyrmDOr8gJliQyTgsi1ZQ
	xXLNL6gR2L+U0581n8n/TpoOy0L0HBrr3dotaV2BCzz+w6JqBdzlMDdHNINF1iJhi6govnI7V2TaL
	+T1x4fNy8ixEBc8vlv6sw+HmUPYrQc/dSm0rRjMUujqOKbbQx5qkkCU0oTn5oKdCkVdYlpZIozCkl
	4Cgx+l4jbo+QWoEFmtT96f78pjQsVGrgb+mHCs05CUHtFxIYpuETWQeas2HaikLyWX4oh7CJt/j2D
	IRS6owze9OjzTcs0aUmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK7Kg-0005nv-Nm; Fri, 26 Apr 2019 20:20:30 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK7Kd-0005nR-VQ; Fri, 26 Apr 2019 20:20:29 +0000
Received: by mail-ot1-f66.google.com with SMTP id g8so2722433otl.8;
 Fri, 26 Apr 2019 13:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9z5p1QaGpPctFP5YJCgd6/+EOVf9obi55JfjI0sjSoM=;
 b=fhzgxcyOOaWn4WD1lH84ZUMOXgx9qNDM9w5tlOHvolhYWejPFs+IYA4QRWlOmu6eMh
 kcZVqsKVqwNbl1q3gfUtkCoyakYI6lUxnMpHCvrSqt5TZbCReSl3xzoBlntc8EnuAVcP
 ncdJrgDoY11Ly3dv1BlCWq7d7PLpQD1GQQNRCGNTilzfJOGKEzeA4WFC+uPYS5mJ4Z01
 mkj0EtFSWsv+1Hw4HIMI//6PSr962T+SwK9xjJ7rvu/AlL/Qyfvd85rDBJ4nqxSrV2mX
 jheRdMUEJWHmL/vJoqr7DjGn167wXnEN/9HWx5+bZ8K2VbQV0gwIj/FP4Xf4MDbEdSuK
 kUNg==
X-Gm-Message-State: APjAAAWJYq7z9KzjaeYnvAW01+FjXi7qO6Y5r97T+3ViubP1o/u+sx/0
 VhxTc5FIrtjaSNus1qsqgw==
X-Google-Smtp-Source: APXvYqz/+MGdetWcvDZ7xWRB+IWKMwc7ItdeKW49XlGFTg8fKUk0WnlYDghJOZxIGqYp7TapnHODgA==
X-Received: by 2002:a9d:3663:: with SMTP id w90mr5340778otb.189.1556310027070; 
 Fri, 26 Apr 2019 13:20:27 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b2sm469508otf.48.2019.04.26.13.20.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Apr 2019 13:20:26 -0700 (PDT)
Date: Fri, 26 Apr 2019 15:20:25 -0500
From: Rob Herring <robh@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: mtd: Add bindings for TI's AM654
 HyperBus memory controller
Message-ID: <20190426202025.GA24486@bogus>
References: <20190423104814.5762-1-vigneshr@ti.com>
 <20190423104814.5762-5-vigneshr@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190423104814.5762-5-vigneshr@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_132028_014062_989AAD30 
X-CRM114-Status: GOOD (  22.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 Mason Yang <masonccyang@mxic.com.tw>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2019 at 04:18:13PM +0530, Vignesh Raghavendra wrote:
> Add binding documentation for TI's HyperBus memory controller present on
> AM654 SoC.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 32 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> new file mode 100644
> index 000000000000..fc87c7918389
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> @@ -0,0 +1,32 @@
> +Bindings for HyperBus Memory Controller (HBMC) on TI's K3 family of SoCs
> +
> +Required properties:
> +- compatible : "ti,am654-hbmc" for AM654 SoC
> +- reg : Two entries:
> +	First entry pointed to the register space of HBMC controller
> +	Second entry pointing to the memory map region dedicated for
> +	MMIO access to attached flash devices
> +- ranges : Address range allocated for each chipselect in the MMIO space
> +
> +Optional properties:
> +- mux-controls : phandle to the multiplexer that controls selection of
> +		 HBMC vs OSPI. Mux state of 1 indicates HBMC is selected.

So 1 is also the default because your example doesn't have the property?

> +
> +Example:
> +
> +	hbmc: hbmc@47034000 {
> +		compatible = "ti,am654-hbmc";
> +		reg = <0x0 0x47034000 0x0 0x100>,
> +			<0x5 0x00000000 0x1 0x0000000>;
> +		power-domains = <&k3_pds 55>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
> +			 <0x1 0x5 0x04000000 0x4000000>; /* CS1 - 64MB

This is wrong. You need 2 cells for the child address. The first cell is 
the CS and the 2nd cell is the offset (typically 0). Otherwise you have 
overlapping addresses with child addresses 0 and 1.

> +
> +		/* Slave flash node */
> +		flash@0 {

And then the unit-address here would be '0,0'.

> +			compatible = "cypress,hyperflash";

Doesn't match what you defined for this binding.

> +			reg = <0x0 0x4000000>;
> +		};
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5f22f85c848..1ade81f9a32a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7258,6 +7258,7 @@ S:	Supported
>  F:	drivers/mtd/hyperbus/
>  F:	include/linux/mtd/hyperbus.h
>  F:	Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
> +F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>  
>  HYPERVISOR VIRTUAL CONSOLE DRIVER
>  L:	linuxppc-dev@lists.ozlabs.org
> -- 
> 2.21.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
