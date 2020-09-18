Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4D0C43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 06:59:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0DD21534
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 06:59:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BLWi7+Iw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0DD21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqfnkZkZ8aSWvcU9J6r7KjSGpIAJs8BdwTJnn+bFlH4=; b=BLWi7+Iw0ZJHrO
	OASIeNg3q78AMEM0kJXhB0NjvgFa+bCSdpisnOdoRldswgwrqCSLA4EueFwlO2+L0+1tL9QrUw7po
	pRe0aIdgMvRhMTIaVvfNekQPPgwFvhXlDuNlYVC2OiclBePoBDz/jYa/tAwI3ATWotzvn/liYWEoO
	yXgkBRBnIy/JqCQl42ahX3gezlXxtwYL9eb4l5gd6LWpOwT4Zjj42Z7xnjDNRWjmlUnxqvkhu/2Qn
	Wymy3fiBOjRFHdYscmmHqIUx0vaWr0DdW7a/jGa0epOm0GO+eGjatg1w+NpFirZlpI7o3MGyN1syc
	4wXedYs2Zj4LLsWPiJ6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJAKr-0006bq-Kd; Fri, 18 Sep 2020 06:57:33 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJAKo-0006bP-W7
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 06:57:32 +0000
IronPort-SDR: js2FdmBnfHQHFq8aojZrVvW0HWcBXEv5a4XED+NS5d/YQCYunOcOkIjMW9dpU09ui2kKNYaP1o
 LAajgEQApz5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="157259251"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="157259251"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 23:57:23 -0700
IronPort-SDR: apw7X2tvrgEQ7JKnAgRMaAoUZeIxL1xJNnaI32NwBvFJSn0GcYXTmUdp3i9V/rNOnOk5/eMijP
 QVwGYzN+AxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="410196068"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 17 Sep 2020 23:57:22 -0700
Received: from [10.249.68.124] (vramuthx-MOBL1.gar.corp.intel.com
 [10.249.68.124])
 by linux.intel.com (Postfix) with ESMTP id 94A7958053A;
 Thu, 17 Sep 2020 23:57:17 -0700 (PDT)
Subject: Re: [PATCH v13 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200917003308.57038-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200917003308.57038-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200917130523.GM3956970@smile.fi.intel.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <bb8606e9-e102-916d-359c-5ce7a94cc4e4@linux.intel.com>
Date: Fri, 18 Sep 2020 14:57:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917130523.GM3956970@smile.fi.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_025731_178222_65CD9755 
X-CRM114-Status: GOOD (  30.19  )
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
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 christophe.kerello@st.com, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, qi-ming.wu@intel.com,
 robert.jarzmik@free.fr, piotrs@cadence.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Andy,

  Thank you for the review comments...

On 17/9/2020 9:05 pm, Andy Shevchenko wrote:
> On Thu, Sep 17, 2020 at 08:33:08AM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> This patch adds the new IP of Nand Flash Controller(NFC) support
>> on Intel's Lightning Mountain(LGM) SoC.
>>
>> DMA is used for burst data transfer operation, also DMA HW supports
>> aligned 32bit memory address and aligned data access by default.
>> DMA burst of 8 supported. Data register used to support the read/write
>> operation from/to device.
>>
>> NAND controller driver implements ->exec_op() to replace legacy hooks,
>> these specific call-back method to execute NAND operations.
> 
> ...
> 
>> +#include <linux/clk.h>
>> +#include <linux/completion.h>
>> +#include <linux/dmaengine.h>
>> +#include <linux/dma-direction.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/err.h>
>> +#include <linux/init.h>
> 
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
> 
> io.h is guaranteed to be included by iopoll.h.
Noted
> 
>> +#include <linux/kernel.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/module.h>
> 
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/rawnand.h>
>> +#include <linux/mtd/nand_ecc.h>
>> +#include <linux/mtd/nand.h>
> 
> Since mtd is a hosting framework for this driver, I would move this group of headers after more generic ones with a blank line in between.
okay, noted
> 
> 
>> +#include <linux/resource.h>
> 
> And this I think is guaranteed to be included by io.h.
Sure, will check and update.
> 
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
> 
>> +#include <linux/platform_device.h>
> 
> Dup? It's exactly the reason how alphabetical order can help.
Good catch
> 
> ...
> 
>> +#define EBU_ADDR_SEL(n)		(0x20 + (n) * 4)
> 
> I think 0x20 is an offset here, and better to have it as 0x020 to be consistent
> with all other offsets.
> 
> ...
> 
>> +#define EBU_BUSCON(n)		(0x60 + (n) * 4)
> 
> Ditto.
Noted, will update
> 
> ...
> 
>> +static void ebu_nand_setup_timing(struct ebu_nand_controller *ctrl,
>> +				  const struct nand_sdr_timings *timings)
>> +{
>> +	unsigned int rate = clk_get_rate(ctrl->clk) / 1000000;
> 
> HZ_PER_MHZ?
yes, you're right we can use it.
> 
>> +	unsigned int period = DIV_ROUND_UP(1000000, rate);
> 
> USEC_PER_SEC?
yes, you're right we can use it.
> 
>> +	u32 trecov, thold, twrwait, trdwait;
>> +	u32 reg = 0;
>> +
>> +	trecov = DIV_ROUND_UP(max(timings->tREA_max, timings->tREH_min),
>> +			      period);
>> +	reg |= EBU_BUSCON_RECOVC(trecov);
>> +
>> +	thold = DIV_ROUND_UP(max(timings->tDH_min, timings->tDS_min), period);
>> +	reg |= EBU_BUSCON_HOLDC(thold);
>> +
>> +	trdwait = DIV_ROUND_UP(max(timings->tRC_min, timings->tREH_min),
>> +			       period);
>> +	reg |= EBU_BUSCON_WAITRDC(trdwait);
>> +
>> +	twrwait = DIV_ROUND_UP(max(timings->tWC_min, timings->tWH_min), period);
>> +	reg |= EBU_BUSCON_WAITWRC(twrwait);
>> +
>> +	reg |= EBU_BUSCON_CMULT_V4 | EBU_BUSCON_BCGEN_CS | EBU_BUSCON_ALEC |
>> +		EBU_BUSCON_SETUP_EN;
>> +
>> +	writel(reg, ctrl->ebu + EBU_BUSCON(ctrl->cs_num));
>> +}
> 
> ...
> 
>> +	if (oob_required) {
>> +		reg = (chip->oob_poi[3] << 24) | (chip->oob_poi[2] << 16) |
>> +			(chip->oob_poi[1] << 8) | chip->oob_poi[0];
> 
> get_unligned_le32()?
last time seen system crash ,so I left it.
> 
> ...
> 
>> +		reg = (chip->oob_poi[7] << 24) | (chip->oob_poi[6] << 16) |
>> +			(chip->oob_poi[5] << 8) | chip->oob_poi[4];
> 
> Ditto.
Let me double check will add it, keep the same if not
> 
> ...
> 
>> +	ret = readl_poll_timeout_atomic(int_sta, val,
>> +					!(val & HSNAND_INT_STA_WR_C), 10, 1000);
> 
> Slightly better (logically split between lines):
> 
> 	ret = readl_poll_timeout_atomic(int_sta, val, !(val & HSNAND_INT_STA_WR_C),
> 					10, 1000);
Thanks!, will update
> 
> 
>> +	if (ret)
>> +		return ret;
> 
> ...
> 
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
>> +	ebu_host->ebu = devm_ioremap_resource(&pdev->dev, res);
> 
> Why not to use
> 
> 	ebu_host->ebu = devm_platform_ioremap_resource_byname(&pdev->dev, "ebunand");
As Boris mtd-maintainer suggested me to split into 2 API's, thanks!.
> 
> ?
> 
>> +	if (IS_ERR(ebu_host->ebu))
>> +		return PTR_ERR(ebu_host->ebu);
>> +
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
>> +	ebu_host->hsnand = devm_ioremap_resource(&pdev->dev, res);
> 
> Ditto.
> 
>> +	if (IS_ERR(ebu_host->hsnand))
>> +		return PTR_ERR(ebu_host->hsnand);
> 
> ...
> 
> 
>> +	for (i = 0; i < MAX_CS; i++) {
>> +		resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", i);
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +						   resname);
> 
>> +		if (!res)
>> +			return -EINVAL;
> 
> Redundant check.
> 
>> +		ebu_host->cs[i].chipaddr = devm_ioremap_resource(dev, res);
> 
> Ditto (see above).
Noted
> 
>> +		ebu_host->cs[i].nand_pa = res->start;
>> +		if (IS_ERR(ebu_host->cs[i].chipaddr))
>> +			return PTR_ERR(ebu_host->cs[i].chipaddr);
>> +	}
> 
> ...
> 
>> +	ebu_host->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(ebu_host->clk)) {
> 
>> +		ret = PTR_ERR(ebu_host->clk);
>> +		dev_err(dev, "failed to get clock: %d\n", ret);
>> +		return ret;
> 
> 	return dev_err_probe() ?
Noted, will add it.
> 
>> +	}
> 
> ...
> 
>> +	ebu_host->dma_tx = dma_request_chan(dev, "tx");
>> +	if (IS_ERR(ebu_host->dma_tx)) {
> 
>> +		ret = PTR_ERR(ebu_host->dma_tx);
>> +		dev_err(dev, "DMA tx channel request fail!.\n");
>> +		goto err_cleanup_dma;
> 
> Ditto. On top why !. ???
sorry missed it,Noted
> 
>> +	}
>> +
>> +	ebu_host->dma_rx = dma_request_chan(dev, "rx");
>> +	if (IS_ERR(ebu_host->dma_rx)) {
> 
>> +		ret = PTR_ERR(ebu_host->dma_rx);
>> +		dev_err(dev, "DMA rx channel request fail!.\n");
>> +		goto err_cleanup_dma;
> 
> Ditto.
Noted

Regards
Vadivel
> 
>> +	}
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
