Return-Path: <SRS0=XIAy=2A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153D3C2D0C4
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 09:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C092073B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 09:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lGrgVDdh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C092073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15QXNw5FMB4HnOsetf02O9rdlbCZXBGdfcj9slxOMVI=; b=lGrgVDdhJNwc6O
	N/V5o6gURpRX7Sy4YFaT9gZWcVNXkggidXL2FJQLyJFzpyZ9icUh13vWb36WAjsqvjtY+Zie2OEoY
	1likbKbIDnc6AH/HCuEAOs/uNQX9iUZ6La84tb5450JJT/oqDNl+74qkzyugtKaOdZJ1oWS041BO+
	7eTfHsW+0Ej4ehTDshFx7jKRIKtKWb1cc9Bv81QquEU5ojBFPqpxw9Zj52U2UmwxQ26+Hmu32sq+B
	cu0grxUEcTKogr66ouckN6RZ1H/+bXEAaJ35GKIKev8KT+MT82JDK+Sk3UPkTA9DYRcru3363EdR0
	f4IytEQR8s9Nbny9Od/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iecCV-00067i-Ol; Tue, 10 Dec 2019 09:53:03 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iecCS-00066e-3X
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2019 09:53:01 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iecCP-0007sy-B0; Tue, 10 Dec 2019 10:52:57 +0100
Message-ID: <e46037cf54fb107d1f5d1ea0d618e3b4eeab1af0.camel@pengutronix.de>
Subject: Re: [PATCH] mtd: rawnand: denali: add reset controlling
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, 
 linux-mtd@lists.infradead.org
Date: Tue, 10 Dec 2019 10:52:55 +0100
In-Reply-To: <20191210091453.26346-1-yamada.masahiro@socionext.com>
References: <20191210091453.26346-1-yamada.masahiro@socionext.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_015300_147671_84D44230 
X-CRM114-Status: GOOD (  28.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Masahiro,

On Tue, 2019-12-10 at 18:14 +0900, Masahiro Yamada wrote:
> According to the Denali User's Guide, this IP has two reset signals.
> 
>   rst_n:     reset most of FFs in the controller core
>   reg_rst_n: reset all FFs in the register interface, and in the
>              initialization sequence
> 
> This commit supports controlling those reset signals, although they
> might be often tied up together in actual SoC integration.
> 
> One thing that should be kept in mind is the automated initialization
> sequence (a.k.a. 'bootstrap' process) is kicked off when reg_rst_n is
> deasserted.
> 
> When the reset is deasserted, the controller issues a RESET command
> to the chip select 0, and attempts to read out the chip ID, and further
> more, ONFI parameters if it is an ONFI-compliant device. Then, the
> controller sets up the relevant registers based on the detected
> device parameters.
> 
> This process is just redundant for Linux because nand_scan_ident()
> probes devices and sets up parameters accordingly. Rather, this hardware
> feature is annoying because it ends up with misdetection due to bugs.
> 
> So, commit 0615e7ad5d52 ("mtd: nand: denali: remove Toshiba and Hynix
> specific fixup code") changed the driver to not rely on it.
> 
> However, there is no way to prevent it from running. The IP provides
> the 'bootstrap_inhibit_init' port to suppress this sequence, but it is
> usually out of software control, and dependent on SoC implementation.
> As for the Socionext UniPhier platform, LD4 always enables it. For the
> later SoCs, the bootstrap sequence runs depending on the boot mode.
> 
> I added usleep_range() to make the driver wait until the sequence
> finishes. Otherwise, the driver would fail to detect the chip due
> to the race between the driver and hardware-controlled sequence.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  .../devicetree/bindings/mtd/denali-nand.txt   |  7 ++++
>  drivers/mtd/nand/raw/denali_dt.c              | 40 ++++++++++++++++++-
>  2 files changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> index b32aed1db46d..a48b17fb969a 100644
> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> @@ -14,6 +14,11 @@ Required properties:
>      interface clock, and the ECC circuit clock.
>    - clock-names: should contain "nand", "nand_x", "ecc"
>  
> +Optional properties:
> +  - resets: may contain phandles to the controller core reset, the register
> + reset
> +  - reset-names: may contain "nand", "reg"
> +
>  Sub-nodes:
>    Sub-nodes represent available NAND chips.
>  
> @@ -46,6 +51,8 @@ nand: nand@ff900000 {
>  	reg-names = "nand_data", "denali_reg";
>  	clocks = <&nand_clk>, <&nand_x_clk>, <&nand_ecc_clk>;
>  	clock-names = "nand", "nand_x", "ecc";
> +	resets = <&nand_rst>, <&nand_reg_rst>;
> +	reset-names = "nand", "reg";
>  	interrupts = <0 144 4>;
>  
>  	nand@0 {

According to Documentation/devicetree/bindings/submitting-patches.txt
this part should be a separate patch.

> diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
> index 8b779a899dcf..132bc6cc066c 100644
> --- a/drivers/mtd/nand/raw/denali_dt.c
> +++ b/drivers/mtd/nand/raw/denali_dt.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>
> @@ -14,6 +15,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  
>  #include "denali.h"
>  
> @@ -22,6 +24,8 @@ struct denali_dt {
>  	struct clk *clk;	/* core clock */
>  	struct clk *clk_x;	/* bus interface clock */
>  	struct clk *clk_ecc;	/* ECC circuit clock */
> +	struct reset_control *rst;	/* core reset */
> +	struct reset_control *rst_reg;	/* register reset */
>  };
>  
>  struct denali_dt_data {
> @@ -151,6 +155,14 @@ static int denali_dt_probe(struct platform_device *pdev)
>  	if (IS_ERR(dt->clk_ecc))
>  		return PTR_ERR(dt->clk_ecc);
>  
> +	dt->rst = devm_reset_control_get_optional_shared(dev, "nand");
> +	if (IS_ERR(dt->rst))
> +		return PTR_ERR(dt->rst);
> +
> +	dt->rst_reg = devm_reset_control_get_optional_shared(dev, "reg");
> +	if (IS_ERR(dt->rst_reg))
> +		return PTR_ERR(dt->rst_reg);
> +
>  	ret = clk_prepare_enable(dt->clk);
>  	if (ret)
>  		return ret;
> @@ -166,10 +178,30 @@ static int denali_dt_probe(struct platform_device *pdev)
>  	denali->clk_rate = clk_get_rate(dt->clk);
>  	denali->clk_x_rate = clk_get_rate(dt->clk_x);
>  
> -	ret = denali_init(denali);
> +	/*
> +	 * Deassert the register reset, and the core reset in this order.
> +	 * Deasserting the core reset while the register reset is asserted
> +	 * will cause unpredictable behavior in the controller.
> +	 */
> +	ret = reset_control_deassert(dt->rst_reg);
>  	if (ret)
>  		goto out_disable_clk_ecc;
>  
> +	ret = reset_control_deassert(dt->rst);
> +	if (ret)
> +		goto out_assert_rst_reg;
> +
> +	/*
> +	 * When the reset is deasserted, the initialization sequence is kicked
> +	 * (bootstrap process). This will take a while, and the driver must
> +	 * wait until it finished in order to avoid unpredictable behavior.
> +	 */
> +	usleep_range(200, 1000);
> +
> +	ret = denali_init(denali);
> +	if (ret)
> +		goto out_assert_rst;
> +
>  	for_each_child_of_node(dev->of_node, np) {
>  		ret = denali_dt_chip_init(denali, np);
>  		if (ret) {
> @@ -184,6 +216,10 @@ static int denali_dt_probe(struct platform_device *pdev)
>  
>  out_remove_denali:
>  	denali_remove(denali);
> +out_assert_rst:
> +	reset_control_assert(dt->rst);
> +out_assert_rst_reg:
> +	reset_control_assert(dt->rst_reg);
>  out_disable_clk_ecc:
>  	clk_disable_unprepare(dt->clk_ecc);
>  out_disable_clk_x:
> @@ -199,6 +235,8 @@ static int denali_dt_remove(struct platform_device *pdev)
>  	struct denali_dt *dt = platform_get_drvdata(pdev);
>  
>  	denali_remove(&dt->controller);
> +	reset_control_assert(dt->rst);
> +	reset_control_assert(dt->rst_reg);
>  	clk_disable_unprepare(dt->clk_ecc);
>  	clk_disable_unprepare(dt->clk_x);
>  	clk_disable_unprepare(dt->clk);

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

for the driver part.

regards
Philipp


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
