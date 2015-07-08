Received: from mail-qk0-f171.google.com ([209.85.220.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCyAE-0005A6-Vf
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 22:50:03 +0000
Received: by qkei195 with SMTP id i195so174468840qke.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2015 15:49:39 -0700 (PDT)
Message-ID: <559DA901.3060404@pid1solutions.com>
Date: Wed, 08 Jul 2015 18:49:37 -0400
From: Cory Tusar <cory.tusar@pid1solutions.com>
MIME-Version: 1.0
To: Haikun Wang <haikun.wang@freescale.com>
CC: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, han.xu@freescale.com
Subject: Re: [PATCH 6/8 v2] mtd: spi-nor: fsl-quadspi: Add QSPI dts node for
 LS1021A
References: <1436258300-21261-1-git-send-email-haikun.wang@freescale.com>
 <1436258300-21261-6-git-send-email-haikun.wang@freescale.com>
In-Reply-To: <1436258300-21261-6-git-send-email-haikun.wang@freescale.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/07/2015 04:38 AM, Haikun Wang wrote:
> Add QSPI dts node for LS1021AQDS and LS1021ATWR boards.
> 
> Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
> ---
> Changes in v2:
> - Rebase
> 
>  arch/arm/boot/dts/ls1021a-qds.dts | 16 ++++++++++++++++
>  arch/arm/boot/dts/ls1021a-twr.dts | 13 +++++++++++++
>  arch/arm/boot/dts/ls1021a.dtsi    | 15 +++++++++++++++
>  3 files changed, 44 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021a-qds.dts
> index 9c5e16b..15bf07f 100644
> --- a/arch/arm/boot/dts/ls1021a-qds.dts
> +++ b/arch/arm/boot/dts/ls1021a-qds.dts
> @@ -238,3 +238,19 @@
>  &uart1 {
>  	status = "okay";
>  };
> +
> +&qspi {
> +	num-cs = <2>;
> +	bus-num = <0>;
> +	fsl,spi-num-chipselects = <2>;
> +	fsl,spi-flash-chipselects = <0>;

I don't believe the above 4 properties are used by the fsl-quadspi
driver.

> +	status = "okay";
> +
> +	qflash0: s25fl128s@0 {
> +		compatible = "spansion,s25fl128s";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <20000000>;
> +		reg = <0>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
> index a2c591e..b72f6ee 100644
> --- a/arch/arm/boot/dts/ls1021a-twr.dts
> +++ b/arch/arm/boot/dts/ls1021a-twr.dts
> @@ -125,3 +125,16 @@
>  &uart1 {
>  	status = "okay";
>  };
> +
> +&qspi {
> +	num-cs = <2>;

I don't believe the above property is used by the fsl-quadspi driver.

> +	status = "okay";
> +
> +	qflash0: n25q128a13@0 {
> +		compatible = "micron,n25q128a13";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <20000000>;
> +		reg = <0>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
> index c70bb27..09f1a33 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -127,6 +127,21 @@
>  			big-endian;
>  		};
>  
> +		qspi: quadspi@1550000 {
> +			compatible = "fsl,ls1-qspi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0 0x1550000 0x0 0x10000>,
> +				<0x0 0x40000000 0x0 0x4000000>;
> +			reg-names = "QuadSPI", "QuadSPI-memory";
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-names = "qspi_en", "qspi";
> +			clocks = <&platform_clk 1>, <&platform_clk 1>;
> +			big-endian;
> +			amba-base = <0x40000000>;
> +			status = "disabled";
> +		};
> +
>  		esdhc: esdhc@1560000 {
>  			compatible = "fsl,esdhc";
>  			reg = <0x0 0x1560000 0x0 0x10000>;
> 


- -- 
Cory Tusar
Principal
PID 1 Solutions, Inc.


"There are two ways of constructing a software design.  One way is to
 make it so simple that there are obviously no deficiencies, and the
 other way is to make it so complicated that there are no obvious
 deficiencies."  --Sir Charles Anthony Richard Hoare

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWdqQEACgkQHT1tsfGwHJ+exQCfax9VHUKrButLo7J9wX9PQqiU
FAAAn1jsXCaFdWgtp6i29jsyCX0H18e+
=j0oT
-----END PGP SIGNATURE-----
