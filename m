Return-Path: <SRS0=gdbt=6D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C406C38A29
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Apr 2020 22:28:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DC6320B1F
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Apr 2020 22:28:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oCvhhAoY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DC6320B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nO1+7E7L5xY+NAiCYFpV9T4fZQ+AwDq5ukAjQAiT5o=; b=oCvhhAoYorHYnM
	I2EKNosdKTPmDaLGp2aclqL+SF2HNiObhAjcroEiePobSbiU8HzBf6nRVdQLQVJAcfSaN32lFT4m2
	lJWo4mIP64M2/7MIS/7br7oBT76j7a9oWDxTwYJ2TAZUnxbt8p8fILA5e1H8lmbQZ0Iod/KSHLA+p
	zCWBiR+z7D4P3gEFMGACaxplLyfwSUPfseA3bmBpb7ykySau98u2RSzpxb6SH6LZt/cdJfQses1g2
	PZltGyGAHYfEowRcxG8l64rD4TW/MGjGXBEVSmef3FisGJQdgbWUOP2eSa8Ob7/meAQ3eMzmR3OCD
	kiQmo9Yy34JekfXiRc8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQIQJ-0005a8-OY; Sun, 19 Apr 2020 22:28:23 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQIQH-0005ZX-0g
 for linux-mtd@lists.infradead.org; Sun, 19 Apr 2020 22:28:22 +0000
IronPort-SDR: iptUihsmtTf2RrnUxw+1pATv941/NW/cYCjPLWdFfzoae47GuC/HbKe7KwO4X1qBBQ1kUR3qqv
 x1Xv10W3JndA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 15:28:20 -0700
IronPort-SDR: Nh+Dex8K9ftQjDSvavCHtA2y3a9nVX58784fZWSVhNqHos1DyHm21UfAcqen4FhIVAQ9CFSSxP
 PEoGt9ZMnosw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,404,1580803200"; d="scan'208";a="289824346"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2020 15:28:15 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1jQIQD-001v9r-Qw; Mon, 20 Apr 2020 01:28:17 +0300
Date: Mon, 20 Apr 2020 01:28:17 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200419222817.GK185537@smile.fi.intel.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_152821_101197_F0DFB7BC 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 piotrs@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Apr 17, 2020 at 04:21:47PM +0800, Ramuthevar,Vadivel MuruganX wrote:
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

I guess untested version slipped into mailing list...
See below why.

...

> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/resource.h>
> +#include <linux/sched.h>
> +#include <linux/types.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/mtd/nand_ecc.h>
> +#include <linux/platform_device.h>

> +#include <linux/of.h>

Do you need this?

> +#include <linux/mtd/partitions.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <mtd/mtd-abi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mtd/nand.h>

Basically, do you need all of them?

And maybe keep them in order?

...

> +static int lgm_dma_init(struct device *dev, struct lgm_nand_host *lgm_host)
> +{
> +	int ret;
> +
> +	/* Prepare for TX DMA: */
> +	lgm_host->dma_tx = dma_request_chan(dev, "tx");
> +	if (IS_ERR(lgm_host->dma_tx)) {
> +		ret = PTR_ERR(lgm_host->dma_tx);
> +		dev_err(dev, "can't get the TX DMA channel, error %d!\n", ret);
> +		goto err;
> +	}
> +
> +	/* Prepare for RX: */
> +	lgm_host->dma_rx = dma_request_chan(dev, "rx");
> +	if (IS_ERR(lgm_host->dma_rx)) {
> +		ret = PTR_ERR(lgm_host->dma_rx);
> +		dev_err(dev, "can't get the RX DMA channel, error %d\n", ret);

I suspect this error path hasn't been tested. I don't see where tx channel
freeing is happening.

> +		goto err;
> +	}
> +
> +	return 0;

> +err:
> +	return ret;

Redundant label.

> +}

...

> +	res = devm_platform_ioremap_resource_byname(pdev, lgm_host->cs_name);
> +	lgm_host->nandaddr_va = res;
> +	nandaddr_pa = res->start;
> +	if (IS_ERR(lgm_host->nandaddr_va))
> +		return PTR_ERR(lgm_host->nandaddr_va);

I'm wondering what is this.  How is it even compile?

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
