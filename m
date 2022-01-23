Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69887C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtx89hG2vD6nB3ZDongRjSYzUR3EHD4WCkCOw1r340E=; b=HMP4PEgQQg29i7
	JwddEeH24Y/NNbGkiZAbto33TcbjoqBobDcDoYKWz14DRNqslsfPulbd99P6kLeFvK28svPB+FyKG
	h4lw/ZCPMDhFUc3MyoXzHRkRXtCXQKUrQo/ZFexMXi+XfFbsUP/sqBMuXFwpH9fY5ghJvWtNeiUCN
	VIwjFSf6pjZL+cPDh0fc1/UbhFIMT0v8N8XrcsUf/7mHxykZ3JoBOAkm11mkptQUJGUlfug4scNSX
	dF59rTlo4lMWDe98V8py0rKIlZVltzDn0OaV8zHTQwUcJaeEXGNVt+na/VAhF7JhvgKwLKo/3gXLb
	okS9eenc6a/ZtfhmDrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBeja-0013jx-S6; Sun, 23 Jan 2022 15:24:50 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBeiK-0013L9-V5
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:23:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C1F4E60002;
 Sun, 23 Jan 2022 15:23:27 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
 bbrezillon@kernel.org, absahu@codeaurora.org
Cc: baruch@tkos.co.il
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix clock sequencing in
 qcom_nandc_probe()
Date: Sun, 23 Jan 2022 16:23:26 +0100
Message-Id: <20220123152326.529692-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220103030316.58301-2-bryan.odonoghue@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'58f030410f1c8ee5a04ac39720050b7a9ded4820'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_072333_272744_D4998225 
X-CRM114-Status: GOOD (  12.48  )
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

On Mon, 2022-01-03 at 03:03:15 UTC, Bryan O'Donoghue wrote:
> Interacting with a NAND chip on an IPQ6018 I found that the qcomsmem NAND
> partition parser was returning -EPROBE_DEFER waiting for the main smem
> driver to load.
> 
> This caused the board to reset. Playing about with the probe() function
> shows that the problem lies in the core clock being switched off before the
> nandc_unalloc() routine has completed.
> 
> If we look at how qcom_nandc_remove() tears down allocated resources we see
> the expected order is
> 
> qcom_nandc_unalloc(nandc);
> 
> clk_disable_unprepare(nandc->aon_clk);
> clk_disable_unprepare(nandc->core_clk);
> 
> dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
> 		   DMA_BIDIRECTIONAL, 0);
> 
> Tweaking probe() to both bring up and tear-down in that order removes the
> reset if we end up deferring elsewhere.
> 
> Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
