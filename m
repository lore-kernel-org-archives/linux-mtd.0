Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DB4C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Mar 2022 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRYnE1H9LUkpc+llX5AxGi8EWscoNQzgoZO6NvG5HT4=; b=gpC5esnHAcwO4U
	RzPX2zYfgwtQ3cQSrvO2Zvh/CW8mehrsQFSJD67XcQqMNNGzZJLegjeR9iqWgYQP+2/ilqHxIFvLN
	b/cCHESrUXFv5rdVXSLsahmc7DiRKTV//jhK5w8NB36i5EO3ZcMRlKpAXlAajM/qMfYRW+IviJxmS
	DT/Q5YtdIghB4lSdVChbhDq57VZbs8aZJEr9tq8YuHlu8VEvcF71HYD7OPNflRZnAXjlLQ6OWLKxx
	8GnCMNUCNnRN/yKWO2vqX/F2k2QrI+qMsVs8oII2Ph1Z7B6J0CC7EicjmBAi/nvp/1tDGP2gGLMAs
	D4WVg24GOppvb8CdxrJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSads-00FY4R-OE; Fri, 11 Mar 2022 08:28:56 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSadZ-00FXxv-PS; Fri, 11 Mar 2022 08:28:39 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 11 Mar
 2022 16:28:32 +0800
Message-ID: <54a87a83-c631-0cec-08a8-cf95f6090ead@amlogic.com>
Date: Fri, 11 Mar 2022 16:28:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH RESEND v2 1/2] mtd: rawnand: meson: discard the common MMC
 sub clock framework
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20220217063346.21691-1-liang.yang@amlogic.com>
 <20220217063346.21691-2-liang.yang@amlogic.com>
 <1jzgmbw7d8.fsf@starbuckisacylon.baylibre.com>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <1jzgmbw7d8.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_002838_074592_5C896549 
X-CRM114-Status: GOOD (  26.20  )
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

Hello Jerome,

On 2022/2/28 19:28, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Thu 17 Feb 2022 at 14:33, Liang Yang <liang.yang@amlogic.com> wrote:
> 
>> EMMC and NAND have the same clock control register named 'SD_EMMC_CLOCK' which is
>> defined in EMMC port internally. bit0~5 of 'SD_EMMC_CLOCK' is the divider and
>> bit6~7 is the mux for fix pll and xtal.A common MMC and NAND sub-clock has been
>> implemented and can be used by the eMMC and NAND controller (which are mutually
>> exclusive anyway). Let's use this new clock.
>>
>> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
>> ---
>>   drivers/mtd/nand/raw/meson_nand.c | 107 +++++++++++++++++-------------
>>   1 file changed, 61 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
>> index ac3be92872d0..c5b892d38ea0 100644
>> --- a/drivers/mtd/nand/raw/meson_nand.c
>> +++ b/drivers/mtd/nand/raw/meson_nand.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/dma-mapping.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>>   #include <linux/mtd/rawnand.h>
>>   #include <linux/mtd/mtd.h>
>>   #include <linux/mfd/syscon.h>
>> @@ -19,6 +20,7 @@
>>   #include <linux/iopoll.h>
>>   #include <linux/of.h>
>>   #include <linux/of_device.h>
>> +#include <linux/of_address.h>
>>   #include <linux/sched/task_stack.h>
>>   
>>   #define NFC_REG_CMD		0x00
>> @@ -104,6 +106,9 @@
>>   
>>   #define PER_INFO_BYTE		8
>>   
>> +#define CLK_DIV_SHIFT		0
>> +#define CLK_DIV_WIDTH		6
>> +
>>   struct meson_nfc_nand_chip {
>>   	struct list_head node;
>>   	struct nand_chip nand;
>> @@ -151,15 +156,15 @@ struct meson_nfc {
>>   	struct nand_controller controller;
>>   	struct clk *core_clk;
>>   	struct clk *device_clk;
>> -	struct clk *phase_tx;
>> -	struct clk *phase_rx;
>> +	struct clk *nand_clk;
>> +	struct clk_divider nand_divider;
>>   
>>   	unsigned long clk_rate;
>>   	u32 bus_timing;
>>   
>>   	struct device *dev;
>>   	void __iomem *reg_base;
>> -	struct regmap *reg_clk;
>> +	void __iomem *sd_emmc_clock;
>>   	struct completion completion;
>>   	struct list_head chips;
>>   	const struct meson_nfc_data *data;
>> @@ -988,6 +993,8 @@ static const struct mtd_ooblayout_ops meson_ooblayout_ops = {
>>   static int meson_nfc_clk_init(struct meson_nfc *nfc)
>>   {
>>   	int ret;
>> +	struct clk_init_data init = {0};
>> +	struct clk_parent_data nfc_divider_parent_data[1];
>>   
>>   	/* request core clock */
>>   	nfc->core_clk = devm_clk_get(nfc->dev, "core");
>> @@ -1002,21 +1009,26 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
>>   		return PTR_ERR(nfc->device_clk);
>>   	}
>>   
>> -	nfc->phase_tx = devm_clk_get(nfc->dev, "tx");
>> -	if (IS_ERR(nfc->phase_tx)) {
>> -		dev_err(nfc->dev, "failed to get TX clk\n");
>> -		return PTR_ERR(nfc->phase_tx);
>> -	}
>> -
>> -	nfc->phase_rx = devm_clk_get(nfc->dev, "rx");
>> -	if (IS_ERR(nfc->phase_rx)) {
>> -		dev_err(nfc->dev, "failed to get RX clk\n");
>> -		return PTR_ERR(nfc->phase_rx);
>> -	}
>> +	init.name = devm_kstrdup(nfc->dev, "nfc#div", GFP_KERNEL);
>> +	init.ops = &clk_divider_ops;
>> +	nfc_divider_parent_data[0].fw_name = __clk_get_name(nfc->device_clk);
> 
> This is broken.
> __clk_get_name() gives the actual global name of the clock
> "fw_name" is the DT name which allows to find the index on the clock
> 
>>From the DT doc, the fw_name is either 'core' or 'device'
> 
> I don't think any clock would have such a name so I don't think this can
> actually work. Did you actually test this ?
> Indeed, it can't work. i have tried it.
so let us get solved by nfc_divider_parent_data[0].fw_name = "device" or 
previous parent_names? thanks.

> 
>> +	init.parent_data = nfc_divider_parent_data;
>> +	init.num_parents = 1;
>> +	nfc->nand_divider.reg = nfc->sd_emmc_clock;
>> +	nfc->nand_divider.shift = CLK_DIV_SHIFT;
>> +	nfc->nand_divider.width = CLK_DIV_WIDTH;
>> +	nfc->nand_divider.hw.init = &init;
>> +	nfc->nand_divider.flags = CLK_DIVIDER_ONE_BASED |
>> +				  CLK_DIVIDER_ROUND_CLOSEST |
>> +				  CLK_DIVIDER_ALLOW_ZERO;
>> +
>> +	nfc->nand_clk = devm_clk_register(nfc->dev, &nfc->nand_divider.hw);
>> +	if (IS_ERR(nfc->nand_clk))
>> +		return PTR_ERR(nfc->nand_clk);
>>   
>>   	/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
>> -	regmap_update_bits(nfc->reg_clk,
>> -			   0, CLK_SELECT_NAND, CLK_SELECT_NAND);
>> +	writel(CLK_SELECT_NAND | readl(nfc->sd_emmc_clock),
>> +	       nfc->sd_emmc_clock);
>>   
>>   	ret = clk_prepare_enable(nfc->core_clk);
>>   	if (ret) {
>> @@ -1030,29 +1042,21 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
>>   		goto err_device_clk;
>>   	}
>>   
>> -	ret = clk_prepare_enable(nfc->phase_tx);
>> -	if (ret) {
>> -		dev_err(nfc->dev, "failed to enable TX clock\n");
>> -		goto err_phase_tx;
>> -	}
>> -
>> -	ret = clk_prepare_enable(nfc->phase_rx);
>> +	ret = clk_prepare_enable(nfc->nand_clk);
>>   	if (ret) {
>> -		dev_err(nfc->dev, "failed to enable RX clock\n");
>> -		goto err_phase_rx;
>> +		dev_err(nfc->dev, "pre enable NFC divider fail\n");
>> +		goto err_nand_clk;
>>   	}
>>   
>>   	ret = clk_set_rate(nfc->device_clk, 24000000);
>>   	if (ret)
>> -		goto err_disable_rx;
>> +		goto err_disable_clk;
>>   
>>   	return 0;
>>   
>> -err_disable_rx:
>> -	clk_disable_unprepare(nfc->phase_rx);
>> -err_phase_rx:
>> -	clk_disable_unprepare(nfc->phase_tx);
>> -err_phase_tx:
>> +err_disable_clk:
>> +	clk_disable_unprepare(nfc->nand_clk);
>> +err_nand_clk:
>>   	clk_disable_unprepare(nfc->device_clk);
>>   err_device_clk:
>>   	clk_disable_unprepare(nfc->core_clk);
>> @@ -1061,8 +1065,7 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
>>   
>>   static void meson_nfc_disable_clk(struct meson_nfc *nfc)
>>   {
>> -	clk_disable_unprepare(nfc->phase_rx);
>> -	clk_disable_unprepare(nfc->phase_tx);
>> +	clk_disable_unprepare(nfc->nand_clk);
>>   	clk_disable_unprepare(nfc->device_clk);
>>   	clk_disable_unprepare(nfc->core_clk);
>>   }
>> @@ -1370,11 +1373,31 @@ static const struct of_device_id meson_nfc_id_table[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, meson_nfc_id_table);
>>   
>> +static int meson_nfc_reg_resource(struct device *dev, struct meson_nfc *nfc)
>> +{
>> +	struct resource res;
>> +	void __iomem *base[2];
>> +	struct device_node *node = dev->of_node;
>> +	int i;
>> +
>> +	for (i = 0; i < 2; i++) {
>> +		if (of_address_to_resource(node, i, &res))
>> +			return -ENOENT;
>> +
>> +		base[i] = devm_ioremap_resource(dev, &res);
>> +		if (IS_ERR(base))
>> +			return PTR_ERR(base);
>> +	}
>> +	nfc->reg_base = base[0];
>> +	nfc->sd_emmc_clock = base[1];
>> +
> 
> There is no reason to make a separate function for this.
> 
> Please name your ressource and claim them properly instead of interating
> on them.
> 
> 
>> +	return 0;
>> +}
>> +
>>   static int meson_nfc_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	struct meson_nfc *nfc;
>> -	struct resource *res;
>>   	int ret, irq;
>>   
>>   	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
>> @@ -1388,20 +1411,12 @@ static int meson_nfc_probe(struct platform_device *pdev)
>>   	nand_controller_init(&nfc->controller);
>>   	INIT_LIST_HEAD(&nfc->chips);
>>   	init_completion(&nfc->completion);
>> -
>>   	nfc->dev = dev;
>>   
>> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	nfc->reg_base = devm_ioremap_resource(dev, res);
>> -	if (IS_ERR(nfc->reg_base))
>> -		return PTR_ERR(nfc->reg_base);
>> -
>> -	nfc->reg_clk =
>> -		syscon_regmap_lookup_by_phandle(dev->of_node,
>> -						"amlogic,mmc-syscon");
>> -	if (IS_ERR(nfc->reg_clk)) {
>> -		dev_err(dev, "Failed to lookup clock base\n");
>> -		return PTR_ERR(nfc->reg_clk);
>> +	ret = meson_nfc_reg_resource(dev, nfc);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to get reg resource\n");
>> +		return ret;
>>   	}
>>   
>>   	irq = platform_get_irq(pdev, 0);
> 
> .

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
