Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FF2C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 13:06:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2C3D21974
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 13:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2DSzARmI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2C3D21974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fDuDs0NJEzN1Jz16iiNC2mtOUqO52l9eqzQ0jdSIZqY=; b=2DSzARmImZTZYcnfDJxbnhLUY
	Yz/J+sWNCJZ4IBaQ9Uj3X9RXwMwN4Z0hVJ1n2AnGImtvKMsX+HnX8jukFt+TFeCQRqju3v2CkVVS6
	KXuRbhxyj2PA08w717xEkOw3zDRp1/3wTeyqnELwKBC55cjCaJ8dR+DQjS2zEq4DqfoqeOueLntXI
	1VDGImnScS0e01lQwtHyfliQHErFTMoRQZeFd7P74eO5BfDoio8zYZdMfVviTAw1U+BUWaTBeXXic
	DB3a4a0XqgRDIlHo4GutAOUDtxUSoYE3ECL65M3VcL2RLhLJRoZbSdW/82Ly8nJGfB79bFO3OSy/M
	aiy1vTc9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kItbZ-0008J2-JG; Thu, 17 Sep 2020 13:05:41 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kItbX-0008Hz-EU
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 13:05:40 +0000
IronPort-SDR: Co1Dntg4DWdmwZxEquxUzD5CEh9HYb15rv8bXerxBoSMkgdCHsySRHcruawA62yQI+l3tuVyo8
 TC2b9m/npmiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="147437331"
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; d="scan'208";a="147437331"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 06:05:31 -0700
IronPort-SDR: EYFvTNo2NH3yfO4zyr/tVVhYq3VMufkGzPYoelI/DIlCq3Yufk1BgOtUWKD2P9IMupk8rEdCLe
 ObCTRim+6d8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; d="scan'208";a="336413914"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 17 Sep 2020 06:05:27 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1kItbH-00HKOZ-1S; Thu, 17 Sep 2020 16:05:23 +0300
Date: Thu, 17 Sep 2020 16:05:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v13 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200917130523.GM3956970@smile.fi.intel.com>
References: <20200917003308.57038-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200917003308.57038-3-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917003308.57038-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_090539_623925_16C26726 
X-CRM114-Status: GOOD (  21.04  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 christophe.kerello@st.com, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, qi-ming.wu@intel.com,
 robert.jarzmik@free.fr, piotrs@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 08:33:08AM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> This patch adds the new IP of Nand Flash Controller(NFC) support
> on Intel's Lightning Mountain(LGM) SoC.
> 
> DMA is used for burst data transfer operation, also DMA HW supports
> aligned 32bit memory address and aligned data access by default.
> DMA burst of 8 supported. Data register used to support the read/write
> operation from/to device.
> 
> NAND controller driver implements ->exec_op() to replace legacy hooks,
> these specific call-back method to execute NAND operations.

...

> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/init.h>

> +#include <linux/io.h>
> +#include <linux/iopoll.h>

io.h is guaranteed to be included by iopoll.h.

> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>

> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/mtd/nand_ecc.h>
> +#include <linux/mtd/nand.h>

Since mtd is a hosting framework for this driver, I would move this group of headers after more generic ones with a blank line in between.


> +#include <linux/resource.h>

And this I think is guaranteed to be included by io.h.

> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>

> +#include <linux/platform_device.h>

Dup? It's exactly the reason how alphabetical order can help.

...

> +#define EBU_ADDR_SEL(n)		(0x20 + (n) * 4)

I think 0x20 is an offset here, and better to have it as 0x020 to be consistent
with all other offsets.

...

> +#define EBU_BUSCON(n)		(0x60 + (n) * 4)

Ditto.

...

> +static void ebu_nand_setup_timing(struct ebu_nand_controller *ctrl,
> +				  const struct nand_sdr_timings *timings)
> +{
> +	unsigned int rate = clk_get_rate(ctrl->clk) / 1000000;

HZ_PER_MHZ?

> +	unsigned int period = DIV_ROUND_UP(1000000, rate);

USEC_PER_SEC?

> +	u32 trecov, thold, twrwait, trdwait;
> +	u32 reg = 0;
> +
> +	trecov = DIV_ROUND_UP(max(timings->tREA_max, timings->tREH_min),
> +			      period);
> +	reg |= EBU_BUSCON_RECOVC(trecov);
> +
> +	thold = DIV_ROUND_UP(max(timings->tDH_min, timings->tDS_min), period);
> +	reg |= EBU_BUSCON_HOLDC(thold);
> +
> +	trdwait = DIV_ROUND_UP(max(timings->tRC_min, timings->tREH_min),
> +			       period);
> +	reg |= EBU_BUSCON_WAITRDC(trdwait);
> +
> +	twrwait = DIV_ROUND_UP(max(timings->tWC_min, timings->tWH_min), period);
> +	reg |= EBU_BUSCON_WAITWRC(twrwait);
> +
> +	reg |= EBU_BUSCON_CMULT_V4 | EBU_BUSCON_BCGEN_CS | EBU_BUSCON_ALEC |
> +		EBU_BUSCON_SETUP_EN;
> +
> +	writel(reg, ctrl->ebu + EBU_BUSCON(ctrl->cs_num));
> +}

...

> +	if (oob_required) {
> +		reg = (chip->oob_poi[3] << 24) | (chip->oob_poi[2] << 16) |
> +			(chip->oob_poi[1] << 8) | chip->oob_poi[0];

get_unligned_le32()?

...

> +		reg = (chip->oob_poi[7] << 24) | (chip->oob_poi[6] << 16) |
> +			(chip->oob_poi[5] << 8) | chip->oob_poi[4];

Ditto.

...

> +	ret = readl_poll_timeout_atomic(int_sta, val,
> +					!(val & HSNAND_INT_STA_WR_C), 10, 1000);

Slightly better (logically split between lines):

	ret = readl_poll_timeout_atomic(int_sta, val, !(val & HSNAND_INT_STA_WR_C),
					10, 1000);


> +	if (ret)
> +		return ret;

...

> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
> +	ebu_host->ebu = devm_ioremap_resource(&pdev->dev, res);

Why not to use

	ebu_host->ebu = devm_platform_ioremap_resource_byname(&pdev->dev, "ebunand");

?

> +	if (IS_ERR(ebu_host->ebu))
> +		return PTR_ERR(ebu_host->ebu);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
> +	ebu_host->hsnand = devm_ioremap_resource(&pdev->dev, res);

Ditto.

> +	if (IS_ERR(ebu_host->hsnand))
> +		return PTR_ERR(ebu_host->hsnand);

...


> +	for (i = 0; i < MAX_CS; i++) {
> +		resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", i);
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +						   resname);

> +		if (!res)
> +			return -EINVAL;

Redundant check.

> +		ebu_host->cs[i].chipaddr = devm_ioremap_resource(dev, res);

Ditto (see above).

> +		ebu_host->cs[i].nand_pa = res->start;
> +		if (IS_ERR(ebu_host->cs[i].chipaddr))
> +			return PTR_ERR(ebu_host->cs[i].chipaddr);
> +	}

...

> +	ebu_host->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(ebu_host->clk)) {

> +		ret = PTR_ERR(ebu_host->clk);
> +		dev_err(dev, "failed to get clock: %d\n", ret);
> +		return ret;

	return dev_err_probe() ?

> +	}

...

> +	ebu_host->dma_tx = dma_request_chan(dev, "tx");
> +	if (IS_ERR(ebu_host->dma_tx)) {

> +		ret = PTR_ERR(ebu_host->dma_tx);
> +		dev_err(dev, "DMA tx channel request fail!.\n");
> +		goto err_cleanup_dma;

Ditto. On top why !. ???

> +	}
> +
> +	ebu_host->dma_rx = dma_request_chan(dev, "rx");
> +	if (IS_ERR(ebu_host->dma_rx)) {

> +		ret = PTR_ERR(ebu_host->dma_rx);
> +		dev_err(dev, "DMA rx channel request fail!.\n");
> +		goto err_cleanup_dma;

Ditto.

> +	}

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
