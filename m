Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1DDC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIIPOwHl5iPDy5u0nPVzI2E9fRj6uHlPV/VVuYVmV3M=; b=J5knm8/w/NGwIx
	8Wk1MsW7BMfHCRqZEwnUs5+W7CtDsFrl3Yb6SkX8fMcYUHE6RLPjHfNjeRlK+vllvS47hn5H4shna
	2o87IoQwhcQhGzsjAV9/10r3HASgtDqbkib2o1dJuDa0CxGep6lAHsjIXgbOj6NUPGBJYhoCLZeDU
	HTP9Txq6c7917dCJHSmTzG8l8eC06w/0JIp3i9/YW0kWrIazLqlvkm6aIKBtJWedE0oFB2HNE3046
	zMMa5mMjUretsc4wSEx49O3Nz/Db5l7mkS41MCPkhj9pB3Mvnf3pgu3WlEYxgq9X8qWMk9BR5WHuZ
	E+9XrjZ0XWnnTUpYdU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EJB-006Sya-Jk; Mon, 05 Dec 2022 16:27:09 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EIy-006SuC-Eg; Mon, 05 Dec 2022 16:26:58 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2DEA685681;
	Mon,  5 Dec 2022 17:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1670257615;
	bh=8TDuGb7NmlheQkJwLnPHVwZdfqltcWdZV1PRx3pDHs4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cNYKGcIOLrLB1Qgs4Y/uLtIQitpBgjq+RAWA65IWHdfmXPqqU4J2xJEpvMeE+lRtu
	 iUdnxipgd3Ayh24AmBP/0Wd+JwoovbhNVJ7xipD8VrdXD9SxAAm2JBHH6I+pFSVzlN
	 ImxnviW03anPjGpZq6VwfeOS1CFV1jnhuNuIsXjI3qd2OJyfpwJXvlXNW41hBhvxCk
	 uZ/Vz++oAKdJEYH/qiGZSYymPz6pc0+N5F6lZfuGjLrxGWQ1uTx9nIwThQFOexFXTu
	 JtufwP9qZ63nfuygZ7khOviD0QAHJmtmgrBJY1Xc5M+C3G/AyA8pD45LNz3spGajNS
	 +xV81wlPt1wIw==
Message-ID: <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
Date: Mon, 5 Dec 2022 17:26:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
References: <20221205152327.26881-1-francesco@dolcini.it>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221205152327.26881-1-francesco@dolcini.it>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_082656_677184_C1DB6E76 
X-CRM114-Status: GOOD (  17.44  )
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

On 12/5/22 16:23, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This reverts commit 753395ea1e45c724150070b5785900b6a44bd5fb.
> 
> It introduced a boot regression on colibri-imx7, and potentially any
> other i.MX7 boards with MTD partition list generated into the fdt by
> U-Boot.
> 
> While the commit we are reverting here is not obviously wrong, it fixes
> only a dt binding checker warning that is non-functional, while it
> introduces a boot regression and there is no obvious fix ready.
> 
> Cc: stable@vger.kernel.org
> Fixes: 753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> Link: https://lore.kernel.org/all/20221205144917.6514168a@xps-13/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>   arch/arm/boot/dts/imx7s.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 03d2e8544a4e..0fc9e6b8b05d 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -1270,10 +1270,10 @@ dma_apbh: dma-apbh@33000000 {
>   			clocks = <&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
>   		};
>   
> -		gpmi: nand-controller@33002000 {
> +		gpmi: nand-controller@33002000{
>   			compatible = "fsl,imx7d-gpmi-nand";
>   			#address-cells = <1>;
> -			#size-cells = <0>;
> +			#size-cells = <1>;
>   			reg = <0x33002000 0x2000>, <0x33004000 0x4000>;
>   			reg-names = "gpmi-nand", "bch";
>   			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;

I suspect this fix should eventually be reverted again, once a proper 
fix is agreed upon in the MTD OF parser, right ?

With that:

Acked-by: Marek Vasut <marex@denx.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
