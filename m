Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEA0C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 17:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prn36f+vu0uzSbEfJB+KpjWeRA+t95AjOSJj08PhpKM=; b=uMszgyWUqKYiLc
	c5XICuMR89R5Nbz/o+L2WCAzECWoXCRnz1Rd/+49h8nZLvXUH80Evm5ivVYL7kV9c3QfT7Zx0vJCe
	btC3VlkwnOLHHtzPl+Won+6aMJmgE4AsRL70/ctBRGImmUvNrIMSuJ8CT/llQwkfzQztBUM3oFQfj
	aPPNYHOZLCU2CEycrqBJZL1Xy6mvLCiDF1x3gBAMpSaXP5aWI9xrhCVGPfHHu/tib1y9CYVobTVB/
	PsmWz+39xHywY1d5+HMe/142z+7v9DPHSUT+wo93tyBc6tsQ9Z6UfE0CW1/LW8yrII9pXYBj7ozv0
	i1m+9UAwbgbwy3hw7bbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5WoK-000s5L-Ci; Thu, 06 Jan 2022 17:44:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5WoH-000s47-86
 for linux-mtd@lists.infradead.org; Thu, 06 Jan 2022 17:44:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C988AB82293;
 Thu,  6 Jan 2022 17:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C65C36AE3;
 Thu,  6 Jan 2022 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641491058;
 bh=/Z4tijhHD0ZDCKofZQW7TfrtBbAeXpE5PX0D7zD/CDI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aBsbboTj1VwKriWPj1sG2XWXlE6tHxKTcO0Dvrt/tOsoWkn6PJqmIu4KRgNu4APOt
 OtDeVRlE1mZpwbJypjWOfNc6PXxjhiF782dS+GQHyiuj34Wv/F6y3eKyRp3MLouAWP
 3FZmTQKb9kIyWxKj/I9wJD8ySc3HJksyTHSzJWK0=
Date: Thu, 6 Jan 2022 18:44:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 architt@codeaurora.org, bbrezillon@kernel.org,
 absahu@codeaurora.org, baruch@tkos.co.il,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix clock sequencing in
 qcom_nandc_probe()
Message-ID: <Ydcqb5k8EcDqPJLD@kroah.com>
References: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
 <20220103030316.58301-2-bryan.odonoghue@linaro.org>
 <20220103055152.GA3581@thinkpad>
 <edcd752d-37a5-2004-3508-01efcfa571ba@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edcd752d-37a5-2004-3508-01efcfa571ba@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_094421_450240_9F7F6EC0 
X-CRM114-Status: GOOD (  22.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jan 06, 2022 at 05:24:27PM +0000, Bryan O'Donoghue wrote:
> On 03/01/2022 05:51, Manivannan Sadhasivam wrote:
> > On Mon, Jan 03, 2022 at 03:03:15AM +0000, Bryan O'Donoghue wrote:
> > > Interacting with a NAND chip on an IPQ6018 I found that the qcomsmem NAND
> > > partition parser was returning -EPROBE_DEFER waiting for the main smem
> > > driver to load.
> > > 
> > > This caused the board to reset. Playing about with the probe() function
> > > shows that the problem lies in the core clock being switched off before the
> > > nandc_unalloc() routine has completed.
> > > 
> > > If we look at how qcom_nandc_remove() tears down allocated resources we see
> > > the expected order is
> > > 
> > > qcom_nandc_unalloc(nandc);
> > > 
> > > clk_disable_unprepare(nandc->aon_clk);
> > > clk_disable_unprepare(nandc->core_clk);
> > > 
> > > dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
> > > 		   DMA_BIDIRECTIONAL, 0);
> > > 
> > > Tweaking probe() to both bring up and tear-down in that order removes the
> > > reset if we end up deferring elsewhere.
> > > 
> > > Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
> > > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > 
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > 
> > Can you please CC stable list for backporting?
> > 
> > Thanks,
> > Mani
> > 
> 
> NP.
> 
> + cc stable
> 
> FWIW I believe Greg's scripts will pick up on Fixes: tags automatically

No, that is NOT the way to ensure that a patch will get picked up, that
is a "this might eventually get there".

Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
