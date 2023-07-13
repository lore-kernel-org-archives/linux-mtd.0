Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47374EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOnKQx3fLeji66KXx2cYsyHV+sGhKLRXjdQ6dCU8s/o=; b=HviHvqZumi6MIW
	7wzofBCb06ZrDStOfriMi5ZcYj35IWfuNdoSQz0hZBcIVyEYjPm0aHy94Sj09GlKLRdrR9FUuTO9s
	FmHpcAKy1hKkMIEOTgMShgv8ahEemmtOJxRkaI4Es5CpY4Lw1CP6ctqFUjlBZ4d04ngufsiH5JidN
	8YoWaFNASJo9yLNwsWEKPkQjtj1gws0ioHH0a5veMo+N1CEQdgNJbnTvkvPZ0ryHIMTYVxF0+54Ob
	lp2Uyx2O3VHGZ4Ti5T9U4mh2GENS6Y/XZzC8IR68PeTk8yLZa9DMHizYV6gglP1z4lggMVar1YDBy
	CJ0QOndBSsYYKSNgOoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsBC-002WQz-2q;
	Thu, 13 Jul 2023 09:00:06 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsB5-002WPv-0X
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 09:00:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF94E4000B;
	Thu, 13 Jul 2023 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689238793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fp/T2auLWK8Fh3jBHDr22urRoZN6z4YaEPdbMmTfazs=;
	b=SbSb0sexsiPU6to0djhloJ9Q46blZelElo9R8OOsyL1JJoNool3laht22HNcGTaN+X1oQ/
	ABEVvuZlDh+rAtZR5TmJIRR1m3hgNeM4eamhXKT1NzCkZqlQEsqC51ED7qYR8ePoyPF7rB
	pzR6CZNV8C3CNSClazlFDuDZzQ2hdPD3Pt383ouKqr9Sjf10clOc7E/b86dwLts9dQS4pz
	KCmXSp9NzouXNAFqAkx2C6CO4O500HW8clabk9dtdnHkE1QktHlhzqurso5F+o/N7ZQZ6G
	eikDmyNQzqeb10Z/VwAHk5CVpXUikGaPjj1ftndFA6/kV3dERjaeonkVhc+DaQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chris Packham
 <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v3 2/3] arm64: dts: marvell: Add NAND flash controller
 to AC5
In-Reply-To: <20230703035044.2063303-3-chris.packham@alliedtelesis.co.nz>
References: <20230703035044.2063303-1-chris.packham@alliedtelesis.co.nz>
 <20230703035044.2063303-3-chris.packham@alliedtelesis.co.nz>
Date: Thu, 13 Jul 2023 10:59:52 +0200
Message-ID: <87h6q82nlj.fsf@BL-laptop>
MIME-Version: 1.0
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_015959_375373_59ED12B7 
X-CRM114-Status: GOOD (  13.97  )
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

Chris Packham <chris.packham@alliedtelesis.co.nz> writes:

> The AC5/AC5X SoC has a NAND flash controller (NFC). Add this to
> the base SoC dtsi file as a disabled node. The NFC integration
> on the AC5/AC5X only supports SDR timing modes up to 3 so requires a
> dedicated compatible property so this limitation can be enforced.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Now that binding and code has beeen applied I can apply this one on
mvebu/dt64

Thanks,

Gregory

> ---
>
> Notes:
>     Changes in v3:
>     - Use correct clock for NFC
>     Changes in v2:
>     - New.
>
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> index c9ce1010c415..c64aaf51deb8 100644
> --- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> @@ -297,6 +297,16 @@ spi1: spi@805a8000 {
>  			status = "disabled";
>  		};
>  
> +		nand: nand-controller@805b0000 {
> +			compatible = "marvell,ac5-nand-controller";
> +			reg =  <0x0 0x805b0000 0x0 0x00000054>;
> +			#address-cells = <0x1>;
> +			#size-cells = <0x0>;
> +			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&nand_clock>;
> +			status = "disabled";
> +		};
> +
>  		gic: interrupt-controller@80600000 {
>  			compatible = "arm,gic-v3";
>  			#interrupt-cells = <3>;
> @@ -319,5 +329,11 @@ spi_clock: spi-clock {
>  			#clock-cells = <0>;
>  			clock-frequency = <200000000>;
>  		};
> +
> +		nand_clock: nand-clock {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <400000000>;
> +		};
>  	};
>  };
> -- 
> 2.41.0
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
