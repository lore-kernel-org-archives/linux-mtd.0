Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D7FC4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 16:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onhZCHUAuPLKEohDbe9yuLWzCjZCHEQHiCEGKhiLdfE=; b=iWzp8tquMKDtsG
	O2aYSI2RdO+OBh8jhtmn+ByLAM+iYNGNscQ6L10ZP654dvSxzq5FS9F8V8ghJ1eLieZI5OV85jUN7
	4ufloRBS4T3wzI5myJ6bbbztZM9swinY7CXMVA8lKJy8Zg2axwozNuZAMObGkOk0U96rXh6sFMPwm
	IVVq2obvpulrAet5v8Wmx9TZnWAChLJSQWf3hHGNmW5eqJqrvfAl1AN6mw/fdJJYVbE/mCYWMFN62
	APGDXGAXUzJ94eZoWRu4Ty6um1YArLEL6N66MkkB1P/28Vp0m83IXAax/MTqc2bN+h9v0OTKdVXiG
	TSilUvmjGek9KAnOdbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19Aj-0003uG-LV; Fri, 02 Dec 2022 16:45:57 +0000
Received: from smtp-out-06.comm2000.it ([212.97.32.74])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19AX-0003px-Sb; Fri, 02 Dec 2022 16:45:48 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-06.comm2000.it (Postfix) with ESMTPSA id 950A9561702;
	Fri,  2 Dec 2022 17:45:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1669999539;
	bh=rDhRZkMjIul++T92YcO2Em+dmofCRBVb85rkOgmruxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=brl/D33BjmmEo+v9O60MrEkcqNX1LUCyi3J5i7ekEAiLZ0+Et6Xn0uYg7MPhb/366
	 MSa899RvLnw8xESwV7CYiDJXThx+hzkh6OgQ+ohuMShZJfi/3BCh/HQCWP43ixim7V
	 FVQH9AjcVFHPiBp6BuE+TjZgZJ73655183ySlZgASo7Rp11nJb3eBsUGTszlc+tV3u
	 WdgFBtipHim65efataTitg5XzOCacT6epsZNuZqosoF1qaJHisO90yWkRwD1HSzcaX
	 MNn+6upbFBRHZRlyc1+Fy5+/Zc6VYn+rgxA78KjszyIXquF3xtOM1Yy4okayVD7Eb9
	 7RSTgeyGdtNzg==
Date: Fri, 2 Dec 2022 17:45:37 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Message-ID: <Y4orsUIp3Ffz8m+r@francesco-nb.int.toradex.com>
References: <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
 <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
 <20221202115327.4475d3a2@xps-13>
 <Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
 <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
 <20221202160030.1b8d0b8a@xps-13>
 <223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
 <20221202164904.08d750df@xps-13>
 <0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_084546_391620_BA8CEDAA 
X-CRM114-Status: GOOD (  22.98  )
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

On Fri, Dec 02, 2022 at 05:17:59PM +0100, Marek Vasut wrote:
> On 12/2/22 16:49, Miquel Raynal wrote:
> > , not the NAND controller node. I hope this
> > is correctly supported in U-Boot though. So if there is a NAND chip
> > subnode, I suppose U-Boot would try to create the partitions that are
> > inside, or even in the sub "partitions" container.
> 
> My understanding is that U-Boot checks the nand-controller node size-cells,
> not the nand-chip{} or partitions{} subnode size-cells .
Not 100% correct.

 - U-Boot before v2022.04 updates the nand-controller{} node, no matter what.
 - U-Boot starting from v2022.04 looks for `partitions{}` into the
   nand-controller{} node, and creates the partition into it if found.
   If not found it behaves the same way as the previous versions.
   See commit 36fee2f7621e ("common: fdt_support: add support for "partitions" subnode to fdt_fixup_mtdparts()")

I'd like to stress once more the fact that we cannot expect old U-Boot
to be updated in the field, and they will keep generating the partitions
as child of the nand-controller node whatever we do with the dts file.

I think that this should be treated the same way as any other fixup we
might have for broken firmware, especially considering that this used to
"work" (yes, I can agree that it horrible, but I cannot change the past)
without even a warning since the imx7 support was first introduced in
the linux kernel years ago.

> Francesco, can you please share the DT, including the U-Boot generated
> partitions, which is passed to Linux on Colibri MX7 ? I think that should
> make all confusion go away.

The device tree part is easy, just
arch/arm/boot/dts/imx7d-colibri-eval-v3.dts.

and the nand-controller node is coming from

#include "imx7d.dtsi"

plus

&gpmi {
	fsl,use-minimum-ecc;
	nand-ecc-mode = "hw";
	nand-on-flash-bbt;
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_gpmi_nand>;
};

The partitions nodes are generated 100% by U-Boot, nothing is present in
the dts source files.

With this DTS file as input, whatever U-Boot version is used I have the
following generated:

root@colibri-imx7-02844233:/# ls /proc/device-tree/soc/nand-controller@33002000/
#address-cells          dma-names               nand-on-flash-bbt       pinctrl-0
#size-cells             dmas                    partition@0             pinctrl-names
assigned-clock-parents  fsl,use-minimum-ecc     partition@200000        reg
assigned-clocks         interrupt-names         partition@380000        reg-names
clock-names             interrupts              partition@400000        status
clocks                  name                    partition@80000
compatible              nand-ecc-mode           phandle

root@colibri-imx7-02844233:/# ls /proc/device-tree/soc/nand-controller@33002000/partition@*
/proc/device-tree/soc/nand-controller@33002000/partition@0:
label  name   reg

/proc/device-tree/soc/nand-controller@33002000/partition@200000:
label      name       read_only  reg

/proc/device-tree/soc/nand-controller@33002000/partition@380000:
label  name   reg

/proc/device-tree/soc/nand-controller@33002000/partition@400000:
label  name   reg

/proc/device-tree/soc/nand-controller@33002000/partition@80000:
label      name       read_only  reg



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
