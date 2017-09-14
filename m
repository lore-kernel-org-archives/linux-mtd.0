Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsP95-0001Fe-Hl
 for linux-mtd@lists.infradead.org; Thu, 14 Sep 2017 08:05:17 +0000
Subject: Re: [PATCH] dt-bindings: nand: denali: reduce the register space in
 the example
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <1505373456-24047-1-git-send-email-yamada.masahiro@socionext.com>
From: Oleksij Rempel <ore@pengutronix.de>
Message-ID: <3c17c272-40ec-4eeb-0dc3-59a64400e6f8@pengutronix.de>
Date: Thu, 14 Sep 2017 10:04:32 +0200
MIME-Version: 1.0
In-Reply-To: <1505373456-24047-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

i assume arch/arm/boot/dts/socfpga.dtsi should be update as well. Right?

On 14.09.2017 09:17, Masahiro Yamada wrote:
> This example allocates too much for register regions.  Especially,
> there are only two registers in the "nand_data" interface of this
> hardware (ADDR: 0x00, DATA: 0x10).
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>   Documentation/devicetree/bindings/mtd/denali-nand.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> index 504291d..0ee8edb 100644
> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> @@ -29,7 +29,7 @@ nand: nand@ff900000 {
>   	#address-cells = <1>;
>   	#size-cells = <1>;
>   	compatible = "altr,socfpga-denali-nand";
> -	reg = <0xff900000 0x100000>, <0xffb80000 0x10000>;
> +	reg = <0xff900000 0x20>, <0xffb80000 0x1000>;
>   	reg-names = "nand_data", "denali_reg";
>   	interrupts = <0 144 4>;
>   };
> 
