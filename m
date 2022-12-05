Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA358C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 18:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0pkHEdeWQWo1JlIle+J1YK1bJKjh6c+jYmBb52J8eE=; b=jYLLXRDHXDdDOj
	bdqLwc6+A0kFxY/103Mcz7UcD54TTf3FsFruXADC6FzO84yZytTe4txtK/MeUYbvvHmwABvm9GPw0
	Pl4h5uZIAlUQ4H1bvCY+/urr5zOtvr23+i/5YAx5MPLhTf0r14TOh6S5PMt2Isz9g+ucRWKoDfwEo
	bfS+UnmXfYjNdAXzdT/QaXi3YTV/TfQIe5VkrxkuC+G0ryvgFRdpxOwrQzdU1ouzI5blpW91hV7cc
	sTRva77xzHOYHvk137GAgu7R9LEP9Gh42NngJG0Zst2aspAOpn/aK3aPV+PpoBaAzMhi6/u2Aj+qz
	/3bRG5hU0FSZCDZZ5w1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2FsP-0089cD-U7; Mon, 05 Dec 2022 18:07:37 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2FsA-0089MO-Jp; Mon, 05 Dec 2022 18:07:24 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5AA5384D9F;
	Mon,  5 Dec 2022 19:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1670263636;
	bh=UmCGmZ5cTHpj4mMtSRcGtVRFook/NiOWwYPr8VdESow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XN8XSiKvotx+uOJaeUrEiev7N+6Jq/qGOyjXLrC7PSBIeatNrdXefjibVwCv0bqRB
	 YDs/ZJ7g6j6TCMBzZX076nHTJs9aNUz9Tx55V+HEVjEC625TjznAfmB667xGq9hEzu
	 IHETUfIJApvC62aqddUs3WMi/y0gXJfuV6p5wL0oNkTR6hVmnlHv7yLDBh2Rb+vfF9
	 uEwFY/wT3LKI8t/DLH6T+qmpKsQxQ4/fKXeJYPoYvb9Xxw1yR8p/0OczS1Lc/z5IvM
	 8feGXRzklpLVgOb9VthYV6d+kGEk/SeBpsLgcwJMqr0uzjNGEaRkVN37skIIiiHrvI
	 7iPbnI8HLDIEA==
Message-ID: <f69746b0-51c0-041c-4035-679c27fcba64@denx.de>
Date: Mon, 5 Dec 2022 19:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
References: <20221205152327.26881-1-francesco@dolcini.it>
 <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
 <20221205185859.433d6cbf@xps-13>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221205185859.433d6cbf@xps-13>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_100723_098389_193DE910 
X-CRM114-Status: GOOD (  18.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/5/22 18:58, Miquel Raynal wrote:
> Hi Marek,

Hi,

> marex@denx.de wrote on Mon, 5 Dec 2022 17:26:53 +0100:
> 
>> On 12/5/22 16:23, Francesco Dolcini wrote:
>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>
>>> This reverts commit 753395ea1e45c724150070b5785900b6a44bd5fb.
>>>
>>> It introduced a boot regression on colibri-imx7, and potentially any
>>> other i.MX7 boards with MTD partition list generated into the fdt by
>>> U-Boot.
>>>
>>> While the commit we are reverting here is not obviously wrong, it fixes
>>> only a dt binding checker warning that is non-functional, while it
>>> introduces a boot regression and there is no obvious fix ready.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
>>> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
>>> Link: https://lore.kernel.org/all/20221205144917.6514168a@xps-13/
>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>> ---
>>>    arch/arm/boot/dts/imx7s.dtsi | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
>>> index 03d2e8544a4e..0fc9e6b8b05d 100644
>>> --- a/arch/arm/boot/dts/imx7s.dtsi
>>> +++ b/arch/arm/boot/dts/imx7s.dtsi
>>> @@ -1270,10 +1270,10 @@ dma_apbh: dma-apbh@33000000 {
>>>    			clocks = <&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
>>>    		};
>>>    > -		gpmi: nand-controller@33002000 {
>>> +		gpmi: nand-controller@33002000{
>>>    			compatible = "fsl,imx7d-gpmi-nand";
>>>    			#address-cells = <1>;
>>> -			#size-cells = <0>;
>>> +			#size-cells = <1>;
>>>    			reg = <0x33002000 0x2000>, <0x33004000 0x4000>;
>>>    			reg-names = "gpmi-nand", "bch";
>>>    			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>>
>> I suspect this fix should eventually be reverted again, once a proper fix is agreed upon in the MTD OF parser, right ?
> 
> I guess it's time to migrate to a more modern definition

Is that the nand-chip@N { status="disabled"; } part ?

>, it's not
> complex to do, there are plenty of examples. This would be IMHO a
> better step ahead rather than just a cell change. Anyway, I don't mind
> reverting this once we've sorted this mess out and fixed U-Boot.

Won't we still have issues with older bootloader versions which paste 
partitions directly into this &gpmi {} node, and which needs to be fixed 
up in the parser in the end ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
