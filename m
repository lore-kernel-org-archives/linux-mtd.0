Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGzOJ-00064C-0x
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 01:29:27 +0000
Received: by mail-pa0-x229.google.com with SMTP id yy13so152349623pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 17:29:06 -0800 (PST)
Date: Wed, 6 Jan 2016 17:29:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 alex@alex-smith.me.uk, Alex Smith <alex.smith@imgtec.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, robh@kernel.org
Subject: Re: [PATCH v11 3/3] MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND
 device tree nodes
Message-ID: <20160107012903.GX109450@google.com>
References: <1451910884-18710-1-git-send-email-harvey.hunt@imgtec.com>
 <1451910884-18710-4-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451910884-18710-4-git-send-email-harvey.hunt@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 04, 2016 at 12:34:44PM +0000, Harvey Hunt wrote:
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
> index 9fcb9e7..782258c 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts

As I noted on patch 1, you need to send this to linux-mips + Ralf.

> @@ -42,3 +42,66 @@
>  &uart4 {
>  	status = "okay";
>  };
> +
> +&nemc {
> +	status = "okay";
> +
> +	nandc: nand-controller@1 {
> +		compatible = "ingenic,jz4780-nand";
> +		reg = <1 0 0x1000000>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ingenic,bch-controller = <&bch>;
> +
> +		ingenic,nemc-tAS = <10>;
> +		ingenic,nemc-tAH = <5>;
> +		ingenic,nemc-tBP = <10>;
> +		ingenic,nemc-tAW = <15>;
> +		ingenic,nemc-tSTRV = <100>;
> +
> +		nand@1 {
> +			reg = <1>;
> +
> +			nand-ecc-step-size = <1024>;
> +			nand-ecc-strength = <24>;
> +			nand-ecc-mode = "hw";
> +			nand-on-flash-bbt;
> +
> +			partitions {
> +				#address-cells = <2>;
> +				#size-cells = <2>;

This binding was updated, so you need:

				compatible = "fixed-partitions";

Brian

> +
> +				partition@0 {
> +					label = "u-boot-spl";
> +					reg = <0x0 0x0 0x0 0x800000>;
> +				};
> +
> +				partition@0x800000 {
> +					label = "u-boot";
> +					reg = <0x0 0x800000 0x0 0x200000>;
> +				};
> +
> +				partition@0xa00000 {
> +					label = "u-boot-env";
> +					reg = <0x0 0xa00000 0x0 0x200000>;
> +				};
> +
> +				partition@0xc00000 {
> +					label = "boot";
> +					reg = <0x0 0xc00000 0x0 0x4000000>;
> +				};
> +
> +				partition@0x8c00000 {
> +					label = "system";
> +					reg = <0x0 0x4c00000 0x1 0xfb400000>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&bch {
> +	status = "okay";
> +};

Brian
