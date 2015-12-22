Received: from localhost.localdomain ([127.0.0.1]:52144 "EHLO linux-mips.org"
 rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
 id S27014319AbbLVBQSynSa2 (ORCPT
 <rfc822;linux-mtd@lists.infradead.org> + 1 other);
 Tue, 22 Dec 2015 02:16:18 +0100
Date: Tue, 22 Dec 2015 02:16:09 +0100
From: Ralf Baechle <ralf@linux-mips.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: arm@kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
 Alex Smith <alex.smith@imgtec.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 9/9] MIPS: dts: jz4780/ci20: Add compatible property
 to "partitions" node
Message-ID: <20151222011609.GA15881@linux-mips.org>
References: <1450694033-27717-1-git-send-email-geert+renesas@glider.be>
 <1450694033-27717-10-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1450694033-27717-10-git-send-email-geert+renesas@glider.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 21, 2015 at 11:33:53AM +0100, Geert Uytterhoeven wrote:
> Date:   Mon, 21 Dec 2015 11:33:53 +0100
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> To: arm@kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
>  <gregory.clement@free-electrons.com>, Sebastian Hesselbarth
>  <sebastian.hesselbarth@gmail.com>, Simon Horman <horms@verge.net.au>,
>  Magnus Damm <magnus.damm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
>  Alex Smith <alex.smith@imgtec.com>
> Cc: Brian Norris <computersforpeace@gmail.com>, Rob Herring
>  <robh+dt@kernel.org>, devicetree@vger.kernel.org,
>  linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
>  linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
>  linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH v2 9/9] MIPS: dts: jz4780/ci20: Add compatible property to
>  "partitions" node
> 
> As of commit e488ca9f8d4f62c2 ("doc: dt: mtd: partitions: add compatible
> property to "partitions" node"), the "partitions" subnode of an SPI
> FLASH device node must have a compatible property. The partitions are no
> longer detected if it is not present.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  arch/mips/boot/dts/ingenic/ci20.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
> index 782258c0e4fbba8e..1652d8d60b1e4b86 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -70,6 +70,7 @@
>  			nand-on-flash-bbt;
>  
>  			partitions {
> +				compatible = "fixed-partitions";
>  				#address-cells = <2>;
>  				#size-cells = <2>;
>  
> -- 
> 1.9.1

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
