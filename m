Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBA9C433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 11:48:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 124FA20709
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 11:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SetpyXjQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 124FA20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qpJJh9Hp/Gtt7tLjFB/mh+htAu4iLLBomOtkxAEEoI=; b=SetpyXjQJ23ACW
	c16Q8kBOXIdUCfLUZvg4xIqY2B1KukbGevfEk5443tKDc96x//9eZmEtuJy1KS9i1EbAmrxIegIUK
	syOjcb2WQ8GCGs6G0OSNG7ovNWo9V7i6FiJ8N4hc3aO//R9Uju0FK/XZW8lKfVSG2CYdujjDMDW4f
	CLfRQV7dTZvGjz1b1CbW+jI6lj3THuaLP80bWXuzjUkk33KGnZhXz3Mi1455mTLWsmBYf5lqGUFhq
	CHP3WxxKPY4aAU0WTEVVly4fGPN5EDE4vk0UuIdGtv5YSMFfaNHelBIGCxT+treqiG6X1+7ENDWsQ
	gijkyZb2Ub/nHTYex0Rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZYpR-00065A-VC; Fri, 15 May 2020 11:48:37 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZYpO-00063F-97
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 11:48:36 +0000
IronPort-SDR: TjAFXYtDu6NS5+NCYkT0JogWJLWOqFc18I1erTOh1PYBEFHfKuLjHD3yBmNmFotAwkXGqS/JR3
 iVOLbFtnqtIQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 04:48:34 -0700
IronPort-SDR: IW+r6LhI9V6GV4u5qgTex4k0wHcQ/NC4Cn1wV9e8y2IAlgwdG4DUc2DWRUPKBm+L7vd4FJM5Sy
 JMKiMpG4ciWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="298415980"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002.fm.intel.com with ESMTP; 15 May 2020 04:48:29 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1jZYpL-006qm5-Iq; Fri, 15 May 2020 14:48:31 +0300
Date: Fri, 15 May 2020 14:48:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200515114831.GS185537@smile.fi.intel.com>
References: <20200515105537.4876-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_044834_328807_B26313E6 
X-CRM114-Status: GOOD (  11.86  )
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
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, May 15, 2020 at 06:55:37PM +0800, Ramuthevar,Vadivel MuruganX wrote:
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

> +	ebu_host->dma_tx = dma_request_chan(dev, "tx");
> +	if (IS_ERR(ebu_host->dma_tx)) {
> +		ret = PTR_ERR(ebu_host->dma_tx);
> +		dev_err(dev, "DMA tx channel request fail!.\n");
> +		goto err_cleanup_dma;
> +	}
> +
> +	ebu_host->dma_rx = dma_request_chan(dev, "rx");
> +	if (IS_ERR(ebu_host->dma_rx)) {
> +		ret = PTR_ERR(ebu_host->dma_rx);

> +		dev_err(dev, "DMA tx channel request fail!.\n");

rx ?

> +		goto err_cleanup_dma;
> +	}

...

> +static int ebu_nand_remove(struct platform_device *pdev)
> +{
> +	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
> +

> +	if (ebu_host) {

I dunno why you need this check? Maybe I forgot your answer to my comment?

> +		mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
> +		nand_cleanup(&ebu_host->chip);
> +		ebu_nand_disable(&ebu_host->chip);
> +		ebu_dma_cleanup(ebu_host);
> +		clk_disable_unprepare(ebu_host->clk);
> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
