Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E2EC54F30
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 16:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5obzwIqeBhiZCumfhOckjiJ0GylWTWp3I7dOnliBWM=; b=0BV7AvRCvj/Jab
	Qi5VEeYsEsaAhEq8dyVWTFovwl2iOOBNYEjePlcSNT0IaL2QhBqeL5N0nfassUrFskYYhfdeqNvjU
	wyNxt+YOtjAm5R/z2t+gs4m2aooPEu1I5x+nEwX3496JHdJj4egCzu+aJP425MzNQsqo6pWNyq9vm
	DWTN6CujQuuT37haAADSyfBovHCQaAGoYlBjMoO69Z9ajijBdVkHxEEEZHraeAySu8H+/tOE/ouhp
	0Z6/C7bC/OjpuruX1moJFjvbekI2CNPoS4NHMZ1w8HwUvjcUxFlZLci3cxsed2exc6GLYbSekIlfc
	6TVxx3Tb8pWzwoudgRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxWy-0000000BCoz-3aii;
	Tue, 27 May 2025 16:52:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxWx-0000000BCoU-0Qin;
	Tue, 27 May 2025 16:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 420CB614C6;
	Tue, 27 May 2025 16:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21BCC4CEEB;
	Tue, 27 May 2025 16:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748364718;
	bh=1QHtJ70y+rvjR6EHIWwb1H2O+LY90CK8zar6Avm1ejE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q7trjF/Xiu4/dOXeYm3XARMbuTenNw4xm/v/XKKhQ3Qpz2BR/MmP9HbtTAWT9WNY2
	 9Ue0cdZe2532DMrkxHXjLPtpiQBle4NzeiOBgrcgpWd6Ppx42XazvV31CdT8BbCy74
	 9KQX1OYFF0SFkEiAAhHpgAtJ9/PnPEyhv0/MJTjyKbm++CfIKWkGfC9cRP2KpMvq6T
	 ZGrFw2XqrcTHFs4x3c0tnOmGTbcE2umdCs2wXDsQ7CTP0SNXYrT97dRzF97KDK4DZa
	 qTvN/hAkBUo3bs+vwWqNantVMjKirXvuqg+P6KDHImv4jJ4X0Hi5fj24rhi/sf9biw
	 /tS8x5vXTdGbA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Chen Wang
 <unicorn_wang@outlook.com>,  Inochi Amaoto <inochiama@gmail.com>,  Mark
 Brown <broonie@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,
  Longbin Li <looong.bin@gmail.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  sophgo@lists.linux.dev,
  linux-spi@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: Add SPI NOR node for SG2042
In-Reply-To: <20250525-sfg-spifmc-v2-3-a3732b6f5ab4@gmail.com>
References: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
	<20250525-sfg-spifmc-v2-3-a3732b6f5ab4@gmail.com>
Date: Tue, 27 May 2025 18:51:53 +0200
Message-ID: <mafs05xhmro7q.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Sun, May 25 2025, Zixian Zeng wrote:

> Add SPI-NOR controller and flash nodes to device tree for SG2042.
>
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
>  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 18 ++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> index 34645a5f6038389cd00d4940947c6bb71d39ec6f..c59a819e35d3201c484bf98392aec14392a7eb04 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -68,6 +68,24 @@ &sd {
>  	status = "okay";
>  };
>  
> +&spifmc0 {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;

Shouldn't you also add other properties like spi-max-frequency or
spi-{rx,tx}-bus-width? Same for the other flash.

> +	};
> +};
> +
> +&spifmc1 {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +	};
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
