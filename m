From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>,  Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,  Richard
 Weinberger <richard@nod.at>,  David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,  Marek Vasut
 <marek.vasut@gmail.com>,  Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org,  Antoine Tenart
 <antoine.tenart@free-electrons.com>,  =?utf-8?Q?Miqu=C3=A8l?= Raynal
 <miquel.raynal@free-electrons.com>,  Nadav Haklai <nadavh@marvell.com>,
 Shadi Ammouri <shadi@marvell.com>,  Yehuda Yitschak
 <yehuday@marvell.com>,  Omri Itach <omrii@marvell.com>,  Hanna Hawa
 <hannah@marvell.com>,  Igal Liberman <igall@marvell.com>,  Marcin Wojtas
 <mw@semihalf.com>
Subject: Re: [PATCH 2/2] ARM64: dts: marvell: add NAND support on the CP110
 master
References: <20170719153126.16905-1-gregory.clement@free-electrons.com>
 <20170719153126.16905-3-gregory.clement@free-electrons.com>
Date: Mon, 24 Jul 2017 17:19:59 +0200
In-Reply-To: <20170719153126.16905-3-gregory.clement@free-electrons.com>
 (Gregory CLEMENT's message of "Wed, 19 Jul 2017 17:31:26 +0200")
Message-ID: <878tjd50bk.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
 
 On mer., juil. 19 2017, Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:

> The NAND controller used in A7K/A8K is present on the CP110 master
> part. It is compatible with the pxa-nand driver.
>
> Unlike most of the controller on the CP110 this one is only present on
> the master for the Armada 8K SoCs.

Actually this is wrong. The controller is present on both CP, but
because of the muxing only the one present on the CPS is available on
the Armada 8K.

I will send a new version fixing it.

Gregory

>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
> index 726528ce54e9..9be4a442ded5 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
> @@ -240,6 +240,20 @@
>  				status = "disabled";
>  			};
>  
> +			cpm_nand: nand@720000 {
> +				/*
> +				 * For A7K/A8K this controller is only
> +				 * present on the CPM and not on the CPS
> +				 */
> +				compatible = "marvell,armada370-nand";
> +				reg = <0x720000 0x54>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				interrupts = <ICU_GRP_NSR 115 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&cpm_clk 1 2>;
> +				status = "disabled";
> +			};
> +
>  			cpm_trng: trng@760000 {
>  				compatible = "marvell,armada-8k-rng", "inside-secure,safexcel-eip76";
>  				reg = <0x760000 0x7d>;
> -- 
> 2.13.2
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
