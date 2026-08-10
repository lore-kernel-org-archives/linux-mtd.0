Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0654C5AD7B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 18:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+gRR5gOOELUlVmU5500s8fPzzQUGu52HgxJW1H58VM=; b=pZ3DKNUpfi78fr
	UvepBo1V13lsOIC3IjCFFXojJoA2pKIH21x7yJb845Yw70a87pOfNxmTDzvU9/niQJMbGWoARMORI
	j8HupgY1I+RFOzZZTI9m0OD1qtP2+UoauzMhNw4kxJ9wXq7GwpztwhftXwmfBxf1E/APgEE5Z77N8
	L1Xs6aPDAfCNEgWajaIPpRxljcc2aRHAWO6lFIeMgXlVJLsuNVDd1IVoVcLfcwA6Y/P/+dIRAobwY
	mJyRyDoG2+aDl00v6BHkaGx/I0phKmaf+Kz2hGGQTmUPCKKSQO+iaeeOIIju+uNVNbiRxh0te9uTP
	fhD64Iicxiw4IZncXHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtULP-0000000Ca6W-3gN9;
	Mon, 10 Aug 2026 18:03:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtULO-0000000Ca69-2CXh;
	Mon, 10 Aug 2026 18:03:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5B8843760;
	Mon, 10 Aug 2026 18:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08F21F000E9;
	Mon, 10 Aug 2026 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786385005;
	bh=+47nB+ymVQpumJdoiL7i0y+0QEYSSwSbPBEdZ3OfrBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E5SrZ72VDXJbAtd0U9iOidzNeHCawXN+u5dsLBP7qBo2pJzTegMWiPiO/SjD33Dl0
	 0s7LAwspsNl+NzMXa2B+Seg1OtoD/Hc0tN3twuQ/GTBUjfV8v8N6PnY3lKuTXpYQPf
	 HfS9exE/RtVdAcJW8p30pJpDeQN88wOINYcwDqZR4jhKNTRShG/aYTsGrqptP909RK
	 2yXqp0EHNeyHRkyOMJfP5FlGajUUj/AFHG3l5XnWP8/Mdlvn4c5MObzjufaSxi6uv/
	 M5ojLqlXtohKQzlRWmJlxd1HHLiXIP18Ituk5+RVZ7VjHFWDnBGekuLRko6lnDMHo7
	 d2qz0ZNuIsIyQ==
Date: Mon, 10 Aug 2026 13:03:24 -0500
From: Rob Herring <robh@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk,
	richardcochran@gmail.com, arnd@arndb.de, linusw@kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP
 to be exposed via NVMEM
Message-ID: <20260810180324.GA2352629-robh@kernel.org>
References: <20260729043026.1811147-1-manikandan.m@microchip.com>
 <20260729043026.1811147-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729043026.1811147-2-manikandan.m@microchip.com>
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

On Wed, Jul 29, 2026 at 10:00:20AM +0530, Manikandan Muralidharan wrote:
> Add an optional "sfdp" child node (compatible "jedec,sfdp") that
> describes the SFDP as a read-only NVMEM provider via nvmem.yaml, so its
> contents (e.g. a vendor EUI-48/EUI-64) can be read through NVMEM cells.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 587af4968255..98fd954598ab 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -103,6 +103,20 @@ properties:
>    spi-cpol: true
>    spi-cpha: true
>  
> +  sfdp:
> +    $ref: /schemas/nvmem/nvmem.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      The Serial Flash Discoverable Parameters (SFDP) tables exposed as a
> +      read-only NVMEM device. This allows standard or vendor-specific SFDP
> +      data (for example a factory-programmed EUI-48/EUI-64 identifier) to be
> +      consumed through NVMEM cells.

blank line

> +    properties:
> +      compatible:
> +        const: jedec,sfdp

blank line

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
