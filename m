Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F85C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpemseOISZo9cKBAUmwZeMWjesCj+72JaZl5WmxARpE=; b=tZjQSkOpQ5Opp5
	J83fmBZWpxqRgEgZpAn5+9Ocr+a1cmQnTn8f4GjYp7KE8R7wLWbA+qHlwkMaua7f/x7bub8jwx2N3
	vPYTzPzMUaG7wpytjo5g8/kyi2/l534AhHkMkxKmTNrEx8Oi5RdimjkZ1TeJuHDQB6uvZ6/fzwtS+
	JZB6AZbsduikWjyWqY7tMyBGCLbeJFjaCLteoY5SGm1rCJm1khpTRdHSsrVeedBy6W/rXZ8agTlN0
	kOd2uHsHDjhMTpoZ7Mgxs0awWrWl1hv40NBTAY9rhfn9idXVTJnISPOoGqo2iEUXcKGTSP6BumLqo
	CkFL03eChaUdYRyA4E4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2GZq-008mvu-V8; Mon, 05 Dec 2022 18:52:31 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2GZf-008mYL-Hi; Mon, 05 Dec 2022 18:52:21 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 95041853BE;
	Mon,  5 Dec 2022 19:52:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1670266330;
	bh=fVkxPc0IwdgxUr/zpsellVXsZzkPkcvuNcqxb3eAJKs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WI/a57Dk+ZNhNfzY33J5WNZEoEzv/x3SrgWQMxMhNjHT66epX6vbMusRvF9CeuXkG
	 Jmp6LZOJVVRO2u425Tat+BCumbyx1774giFCCHcG+Br3AjkTPuopHlstMMZJJGFSZP
	 5OWhK1wIPyABuqKPs013T7Ubqq6r/wig4L17gC5OzTstcKi4ZVfeOYxgToIQ2W2z8p
	 hYQ+7dvvMG1CsMuyTWBiQeULCKRJ3KcoTiKNlI9T/rRPTj14LPnw/+RRsSyM2qjORd
	 43ycUIt/cgJRjWdkjhJ1r3+YZq07MdnuuLMDpAqi0sMnsD/LteP8DnVN1+PTn4jHT0
	 cvfzP0xtYs0Kg==
Message-ID: <29260d63-3240-6660-b002-cd00dc051574@denx.de>
Date: Mon, 5 Dec 2022 19:52:08 +0100
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
 <f69746b0-51c0-041c-4035-679c27fcba64@denx.de>
 <20221205191828.3072d872@xps-13>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221205191828.3072d872@xps-13>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_105219_919430_301F5DD1 
X-CRM114-Status: GOOD (  22.75  )
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

On 12/5/22 19:18, Miquel Raynal wrote:
> Hi Marek,
> 
> marex@denx.de wrote on Mon, 5 Dec 2022 19:07:14 +0100:
> 
>> On 12/5/22 18:58, Miquel Raynal wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> marex@denx.de wrote on Mon, 5 Dec 2022 17:26:53 +0100:
>>>    
>>>> On 12/5/22 16:23, Francesco Dolcini wrote:
>>>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>>>
>>>>> This reverts commit 753395ea1e45c724150070b5785900b6a44bd5fb.
>>>>>
>>>>> It introduced a boot regression on colibri-imx7, and potentially any
>>>>> other i.MX7 boards with MTD partition list generated into the fdt by
>>>>> U-Boot.
>>>>>
>>>>> While the commit we are reverting here is not obviously wrong, it fixes
>>>>> only a dt binding checker warning that is non-functional, while it
>>>>> introduces a boot regression and there is no obvious fix ready.
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Fixes: 753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
>>>>> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
>>>>> Link: https://lore.kernel.org/all/20221205144917.6514168a@xps-13/
>>>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>>> ---
>>>>>     arch/arm/boot/dts/imx7s.dtsi | 4 ++--
>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
>>>>> index 03d2e8544a4e..0fc9e6b8b05d 100644
>>>>> --- a/arch/arm/boot/dts/imx7s.dtsi
>>>>> +++ b/arch/arm/boot/dts/imx7s.dtsi
>>>>> @@ -1270,10 +1270,10 @@ dma_apbh: dma-apbh@33000000 {
>>>>>     			clocks = <&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
>>>>>     		};
>>>>>     > -		gpmi: nand-controller@33002000 {
>>>>> +		gpmi: nand-controller@33002000{
>>>>>     			compatible = "fsl,imx7d-gpmi-nand";
>>>>>     			#address-cells = <1>;
>>>>> -			#size-cells = <0>;
>>>>> +			#size-cells = <1>;
>>>>>     			reg = <0x33002000 0x2000>, <0x33004000 0x4000>;
>>>>>     			reg-names = "gpmi-nand", "bch";
>>>>>     			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>>>>
>>>> I suspect this fix should eventually be reverted again, once a proper fix is agreed upon in the MTD OF parser, right ?
>>>
>>> I guess it's time to migrate to a more modern definition
>>
>> Is that the nand-chip@N { status="disabled"; } part ?
> 
> I would prefer the controller to be disabled if useless, but otherwise
> yes.

ACK, but see below.

>>> , it's not
>>> complex to do, there are plenty of examples. This would be IMHO a
>>> better step ahead rather than just a cell change. Anyway, I don't mind
>>> reverting this once we've sorted this mess out and fixed U-Boot.
>>
>> Won't we still have issues with older bootloader versions which paste partitions directly into this &gpmi {} node, and which needs to be fixed up in the parser in the end ?
> 
> I believe fdt_fixup_mtdparts() should be killed, so we should no longer
> have this problem.

The fdt_fixup_mtdparts is U-Boot code. If contemporary Linux kernel is 
booted with ancient U-Boot, then you would still get defective DT passed 
to Linux, and that should be fixed up by Linux. Removing 
fdt_fixup_mtdparts() from current mainline U-Boot won't solve this problem.

I think this is also what Francesco is trying to convey (please correct 
me if I'm wrong).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
