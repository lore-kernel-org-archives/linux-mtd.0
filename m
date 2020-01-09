Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1280C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 20:46:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706E020721
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 20:46:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cCpfnOZg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="EKObZoix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 706E020721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9Cx0dUnIsJyPzlkATfnhff62pzwibRBviSiozln88M=; b=cCpfnOZg3yPqT0
	UD5W0ubDbYO06zso08y/0Q03lFL6I2xCo3Ll3469Nd5KW0X63OkxaiZr3rD8ZY7tUAYcKSfl7Q+b6
	MmgkdtNL1cZS/xe/0IO/HSbIxPVzTaFaBmTfWBE7uteNkH7zFKoMISPoSCQMq3wXcAniH7zOhxc1W
	Qy+N5+cB2A6DDkcGC4zgcDu/u20eX+oCAaOEtUVU5R+9SGGg4kVOF0bow8zsuitRuBSAu7phKggXR
	WmunkDf5pnBgMppsvwm+TRjRneKreK1feCGIgCe9vh0evCWrDN5AVbSz83yOY1A6JxFKH0HyxApL0
	HG4r5h7B+RCH9iSpeWdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipegu-0007VF-LY; Thu, 09 Jan 2020 20:46:04 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipegr-0007Up-Dt
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 20:46:03 +0000
Received: from localhost (87-49-44-45-mobile.dk.customer.tdc.net [87.49.44.45])
 by first.geanix.com (Postfix) with ESMTPSA id DBC9C820;
 Thu,  9 Jan 2020 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1578602731; bh=6Se3wfqzaI4oeyhcIcZQkTNu1I86zuNV8iY4LmK7wy8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To;
 b=EKObZoixYq/drDtg6xVMMXH04ZcCoZSRbYz0kgGKx11MlfBuazAWY8Nk1b85pvMoX
 wcgijIzu3vzGDXQT0pzL5VPW9Qb3649pJIBo9OUY6Zvs4WBnUiU+5v9/5FDe3/LX9l
 J3MTXI4nxiU891yJAMJrxWyjCueuEuldApWCki+YMBu+7NcyYBXgtlcWqhoSCWr8wm
 jl4YYyBBjihduAax4yH83l8ZfAF4PnZeG/v5YUrBc77bV847tdhFfme5v2wv+5o/hm
 O+ftLIolw44j4thlo9XR5nL7oqVJeenjPJmXZZpq3sDD26IcIEz43ZP2wdO/uxQ8i5
 W2KpyZ2g2eQXg==
From: Esben Haabendal <esben@geanix.com>
To: Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix the suspend/resume issue
References: <1578589556-683-1-git-send-email-han.xu@nxp.com>
Date: Thu, 09 Jan 2020 21:45:58 +0100
In-Reply-To: <1578589556-683-1-git-send-email-han.xu@nxp.com> (Han Xu's
 message of "Fri, 10 Jan 2020 01:05:56 +0800")
Message-ID: <87r208mk8p.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_124601_761599_0CC03B86 
X-CRM114-Status: GOOD (  21.91  )
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
Cc: vigneshr@ti.com, richard@nod.at, s.hauer@pengutronix.de, sean@geanix.com,
 martin@geanix.com, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Han

See comments/questions below.

If I understand the purpose of some of your changes correct, you are
fixing the handling of pm usage counter, as it currently is incremented
in gpmi_init() and decremented in gpmi_nand_remove().  I believe that
would be nice to have in a separate patch with an explanation of the
change.

Han Xu <han.xu@nxp.com> writes:

> fix several issues when system suspend/resume,
>
> - leverage the runtime pm for system suspend/resume
> - enable the clock before register access
> - re-apply timing settings
> - set the proper pinctrl state
>
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 59 ++++++++++++++++------
>  1 file changed, 44 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 334fe3130285..37437d47ab9a 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -15,6 +15,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/dma/mxs-dma.h>
>  #include "gpmi-nand.h"
>  #include "gpmi-regs.h"
> @@ -146,7 +147,11 @@ static int __gpmi_enable_clk(struct gpmi_nand_data *this, bool v)
>  static int gpmi_init(struct gpmi_nand_data *this)
>  {
>  	struct resources *r = &this->resources;
> -	int ret;
> +	int ret = 0;

I don't see why this is changed, given that ret is unconditionally
assigned in the next line.

> +
> +	ret = pm_runtime_get_sync(this->dev);
> +	if (ret < 0)
> +		return ret;
>  
>  	ret = gpmi_reset_block(r->gpmi_regs, false);
>  	if (ret)
> @@ -179,8 +184,10 @@ static int gpmi_init(struct gpmi_nand_data *this)
>  	 */
>  	writel(BM_GPMI_CTRL1_DECOUPLE_CS, r->gpmi_regs + HW_GPMI_CTRL1_SET);
>  
> -	return 0;

Please provide an explanation of the reasoning of this change is.

>  err_out:
> +	pm_runtime_mark_last_busy(this->dev);
> +	pm_runtime_put_autosuspend(this->dev);
> +
>  	return ret;
>  }
>  
> @@ -528,7 +535,7 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
>  static int bch_set_geometry(struct gpmi_nand_data *this)
>  {
>  	struct resources *r = &this->resources;
> -	int ret;
> +	int ret = 0;

I don't see any reason for this change.

>  	ret = common_nfc_set_geometry(this);
>  	if (ret)
> @@ -2676,7 +2682,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
>  	return 0;
>  
>  exit_nfc_init:
> -	pm_runtime_put(&pdev->dev);

I guess this is because of the change above that causes usage counter
not to be incremented in gpmi_init() when it is successful.

> +	pm_runtime_dont_use_autosuspend(&pdev->dev);

Is this required before pm_runtime_disable()?

>  	pm_runtime_disable(&pdev->dev);
>  	release_resources(this);
>  exit_acquire_resources:
> @@ -2688,7 +2694,6 @@ static int gpmi_nand_remove(struct platform_device *pdev)
>  {
>  	struct gpmi_nand_data *this = platform_get_drvdata(pdev);
>  
> -	pm_runtime_put_sync(&pdev->dev);

Should be covered by explanation of the change in gpmi_init().

>  	pm_runtime_disable(&pdev->dev);
>  
>  	nand_release(&this->nand);
> @@ -2700,10 +2705,12 @@ static int gpmi_nand_remove(struct platform_device *pdev)
>  #ifdef CONFIG_PM_SLEEP
>  static int gpmi_pm_suspend(struct device *dev)
>  {
> -	struct gpmi_nand_data *this = dev_get_drvdata(dev);
> +	int ret;
>  
> -	release_dma_channels(this);
> -	return 0;
> +	pinctrl_pm_select_sleep_state(dev);
> +	ret = pm_runtime_force_suspend(dev);
> +
> +	return ret;
>  }
>  
>  static int gpmi_pm_resume(struct device *dev)
> @@ -2711,9 +2718,13 @@ static int gpmi_pm_resume(struct device *dev)
>  	struct gpmi_nand_data *this = dev_get_drvdata(dev);
>  	int ret;
>  
> -	ret = acquire_dma_channels(this);
> -	if (ret < 0)
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret) {
> +		dev_err(this->dev, "Error in resume %d\n", ret);
>  		return ret;
> +	}
> +
> +	pinctrl_pm_select_default_state(dev);
>  
>  	/* re-init the GPMI registers */
>  	ret = gpmi_init(this);
> @@ -2729,22 +2740,40 @@ static int gpmi_pm_resume(struct device *dev)
>  		return ret;
>  	}
>  
> +	/* re-apply the timing setting */
> +	this->hw.must_apply_timings = true;
> +
>  	return 0;
>  }
>  #endif /* CONFIG_PM_SLEEP */
>  
> -static int __maybe_unused gpmi_runtime_suspend(struct device *dev)
> +#define gpmi_enable_clk(x)	__gpmi_enable_clk(x, true)
> +#define gpmi_disable_clk(x)	__gpmi_enable_clk(x, false)
> +
> +static int gpmi_runtime_suspend(struct device *dev)
>  {
>  	struct gpmi_nand_data *this = dev_get_drvdata(dev);
>  
> -	return __gpmi_enable_clk(this, false);
> +	gpmi_disable_clk(this);
> +	release_dma_channels(this);
> +
> +	return 0;
>  }
>  
> -static int __maybe_unused gpmi_runtime_resume(struct device *dev)
> +static int gpmi_runtime_resume(struct device *dev)
>  {
>  	struct gpmi_nand_data *this = dev_get_drvdata(dev);
> +	int ret;
>  
> -	return __gpmi_enable_clk(this, true);
> +	ret = gpmi_enable_clk(this);
> +	if (ret)
> +		return ret;
> +
> +	ret = acquire_dma_channels(this);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
>  }
>  
>  static const struct dev_pm_ops gpmi_pm_ops = {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
