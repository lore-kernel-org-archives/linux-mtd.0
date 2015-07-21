Date: Tue, 21 Jul 2015 14:07:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lucas Stach <dev@lynxeye.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Stefan Agner <stefan@agner.ch>,
 Marcel Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Patch v3 5/5] ARM: tegra: enable NAND flash on Colibri T20
Message-ID: <20150721210702.GM24125@google.com>
References: <1431282602-7137-1-git-send-email-dev@lynxeye.de>
 <1431282602-7137-6-git-send-email-dev@lynxeye.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431282602-7137-6-git-send-email-dev@lynxeye.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 10, 2015 at 08:30:02PM +0200, Lucas Stach wrote:
> This enables the on-module ONFI conformant NAND flash.
> 
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> ---
>  arch/arm/boot/dts/tegra20-colibri-512.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> index 8e0066a..540b3fd 100644
> --- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> +++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> @@ -455,6 +455,13 @@
>  		};
>  	};
>  
> +	nand@70008000 {
> +		status = "okay";
> +		nand-bus-width = <8>;
> +		nand-on-flash-bbt;
> +		nvidia,wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_HIGH>;

^^ Is write-protect support necessary, or just optional? b/c you didn't
implement support in the NAND driver yet.

> +	};
> +
>  	usb@c5004000 {
>  		status = "okay";
>  		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)

Brian
