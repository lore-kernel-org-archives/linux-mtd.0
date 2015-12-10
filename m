Received: from mail-bl2on0088.outbound.protection.outlook.com ([65.55.169.88]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a74Rv-0008TP-73
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 16:52:12 +0000
Message-ID: <5669ABE6.5030607@opensource.altera.com>
Date: Thu, 10 Dec 2015 10:44:22 -0600
From: Dinh Nguyen <dinguyen@opensource.altera.com>
MIME-Version: 1.0
To: Graham Moore <grmoore@opensource.altera.com>,
 <linux-mtd@lists.infradead.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, <linux-kernel@vger.kernel.org>, Alan Tull
 <atull@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>
Subject: Re: [PATCH] ARM: socfpga: dts: Add NAND device tree for Altera Arria10
References: <1449762225-3592-1-git-send-email-grmoore@opensource.altera.com>
In-Reply-To: <1449762225-3592-1-git-send-email-grmoore@opensource.altera.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/10/2015 09:43 AM, Graham Moore wrote:
> Add socfpga_arria10_socdk_nand.dts board file for supporting NAND
> on Altera Arria10.
> 
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> ---
>  arch/arm/boot/dts/Makefile                       |  1 +
>  arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts | 44 ++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 30bbc37..7031603 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -556,6 +556,7 @@ dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += \
>  	sh73a0-kzm9g.dtb
>  dtb-$(CONFIG_ARCH_SOCFPGA) += \
>  	socfpga_arria5_socdk.dtb \
> +	socfpga_arria10_socdk_nand.dtb \

This patch does not apply:

error: patch failed: arch/arm/boot/dts/Makefile:556
error: arch/arm/boot/dts/Makefile: patch does not apply

Can you please rebase this patch to my branch:

https://git.kernel.org/cgit/linux/kernel/git/dinguyen/linux.git/log/?h=socfpga_for_next_v4.5_dts


>  	socfpga_arria10_socdk_sdmmc.dtb \
>  	socfpga_cyclone5_socdk.dtb \
>  	socfpga_cyclone5_de0_sockit.dtb \
> diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts b/arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts
> new file mode 100644
> index 0000000..e69144b
> --- /dev/null
> +++ b/arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts
> @@ -0,0 +1,44 @@
> +/*
> + * Copyright (C) 2015 Altera Corporation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +/dts-v1/;
> +#include "socfpga_arria10_socdk.dtsi"
> +
> +/ {
> +	soc {
> +		nand: nand@ffb90000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "denali,denali-nand-dt";
> +			reg = <0xffb90000 0x72000>, <0xffb80000 0x10000>;
> +			reg-names = "nand_data", "denali_reg";
> +			interrupts = <0 99 4>;
> +			dma-mask = <0xffffffff>;
> +			clocks = <&nand_clk>;
> +			have-hw-ecc-fixup;

"have-hw-ecc-fixup" is not documented anywhere. What is this?

Also, for v2, please resend this patch with to the appropriate people
per what get_maintainers.pl reports:

Dinh Nguyen <dinguyen@opensource.altera.com> (maintainer:ARM/SOCFPGA
ARCHITECTURE)
Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
Pawel Moll <pawel.moll@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS)
Ian Campbell <ijc+devicetree@hellion.org.uk> (maintainer:OPEN FIRMWARE
AND FLATTENED DEVICE TREE BINDINGS)
Kumar Gala <galak@codeaurora.org> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS)
Russell King <linux@arm.linux.org.uk> (maintainer:ARM PORT)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
TREE BINDINGS)
linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT)
linux-kernel@vger.kernel.org (open list)


Thanks,
Dinh
