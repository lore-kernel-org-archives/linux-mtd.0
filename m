Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7E9C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPg0fvMAvMmPEYER73nevwS0cuBxX8yVjg9ENNndZ40=; b=vuUz3Vlx4OaP+g
	45n+BLCzrWaGIxnyrdPT4h4M22ng8Omzv0WXt0SugTInL6odfI9Ghit50UnqkpxMHVk2/PIkipvt+
	/Y3lYJ+0LhCj0V01eYGoisgapbzbfccCokbQyKvJ399/DhAu2zKtQVjMr1kokBellVbQQSAfjuHAs
	wQY8yheTF90H0VuEzEVeABGXovYHFn0WkKMDQFzyQZ/5Tg/mHnWfXFBYWXxtzyRPBXb50OxWkT89S
	eNVovo/RUOunhZkAvFECmfJAJEvz8bbulYt/RFQmaJbiBoNelQ4o7sGwVFoDafM+HBev7auol3IsF
	wM8h8d9xByRlTgXKVSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBesI-0016ng-RE; Sun, 23 Jan 2022 15:33:51 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBeqk-0016AY-VY
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:32:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0DD7C100002;
 Sun, 23 Jan 2022 15:32:11 +0000 (UTC)
Date: Sun, 23 Jan 2022 16:32:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
 bbrezillon@kernel.org, absahu@codeaurora.org
Cc: baruch@tkos.co.il
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix clock sequencing in
 qcom_nandc_probe()
Message-ID: <20220123163210.3f9ce79a@xps13>
In-Reply-To: <20220123152326.529692-1-miquel.raynal@bootlin.com>
References: <20220103030316.58301-2-bryan.odonoghue@linaro.org>
 <20220123152326.529692-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_073215_213110_AD305C33 
X-CRM114-Status: GOOD (  16.50  )
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


miquel.raynal@bootlin.com wrote on Sun, 23 Jan 2022 16:23:26 +0100:

> On Mon, 2022-01-03 at 03:03:15 UTC, Bryan O'Donoghue wrote:
> > Interacting with a NAND chip on an IPQ6018 I found that the qcomsmem NAND
> > partition parser was returning -EPROBE_DEFER waiting for the main smem
> > driver to load.
> > 
> > This caused the board to reset. Playing about with the probe() function
> > shows that the problem lies in the core clock being switched off before the
> > nandc_unalloc() routine has completed.
> > 
> > If we look at how qcom_nandc_remove() tears down allocated resources we see
> > the expected order is
> > 
> > qcom_nandc_unalloc(nandc);
> > 
> > clk_disable_unprepare(nandc->aon_clk);
> > clk_disable_unprepare(nandc->core_clk);
> > 
> > dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
> > 		   DMA_BIDIRECTIONAL, 0);
> > 
> > Tweaking probe() to both bring up and tear-down in that order removes the
> > reset if we end up deferring elsewhere.
> > 
> > Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>  
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Both patches pushed to mtd/fixes, actually.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
