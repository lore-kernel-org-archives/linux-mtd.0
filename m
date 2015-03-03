Message-ID: <54F56C67.7070404@free-electrons.com>
Date: Tue, 03 Mar 2015 09:10:15 +0100
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 2/2] ARM: mvebu: a385-db-ap: Enable the NAND
References: <1424255528-1717-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424255528-1717-3-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1424255528-1717-3-git-send-email-maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, Sudhakar Gundubogula <sudhakar@marvell.com>,
 Nadav Haklai <nadavh@marvell.com>, Boris Brezillon <boris@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Maxime,

On 18/02/2015 11:32, Maxime Ripard wrote:
> The Armada 385 Access Point Development Board has a 1GB NAND SLC chip from
> Micron as its main storage. Enable it.

I wanted applying your patch but it failed. Actually it depends on your
other patch "ARM: mvebu: armada-385-ap: Enable USB3 port" and this patch
depend on an other patch "usb: xhci: plat: Add USB phy support" which
hadn't been merged.

So either you send a new version which apply on 4.0-rc1, or we can wait for
that "usb: xhci: plat: Add USB phy support" will be merged then I will be able
applying "ARM: mvebu: armada-385-ap: Enable USB3 port" and finally this patch.
As you want.


Thanks,

Gregory


> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  arch/arm/boot/dts/armada-385-db-ap.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/armada-385-db-ap.dts b/arch/arm/boot/dts/armada-385-db-ap.dts
> index b891b4c897f5..ee648fb19075 100644
> --- a/arch/arm/boot/dts/armada-385-db-ap.dts
> +++ b/arch/arm/boot/dts/armada-385-db-ap.dts
> @@ -130,6 +130,19 @@
>  				phy-mode = "rgmii-id";
>  			};
>  
> +			nfc: flash@d0000 {
> +				status = "okay";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				num-cs = <1>;
> +				nand-ecc-strength = <4>;
> +				nand-ecc-step-size = <512>;
> +				marvell,nand-keep-config;
> +				marvell,nand-enable-arbiter;
> +				nand-on-flash-bbt;
> +			};
> +
>  			usb3@f0000 {
>  				status = "okay";
>  				usb-phy = <&usb3_phy>;
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
