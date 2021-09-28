Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070AEC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 15:55:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CACC260F0F
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 15:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CACC260F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8nc39E9AFFil7AsDZf3uxHjiCObVDX4PZlDE2kWNv8=; b=lOQ/oPEUjYHixN
	5T7zRymd25j8YcJS6D0gfgVQ/J0PWnJA82E7GJBRkJu/mE9vqGtVjtcCEX4AhxP0iBswQ3tbypUKr
	H5rfYuqF0Qg3f9MzY6hMqZvmnxvdFyZRgVaQJY198KGjl2xY/BLKgWyuXczAD07a1jT0C2R9f2FOE
	jpAQnSYSI+R+ricPgyfAWLKCjwry8F2ygkcKRL1jocVNyzGXuvC6EeNjeYLOlzrZFn5KcnceVZwqm
	eQ8UARGtOoBpc6osI2+sG1hMFNVmBAx/TTdxB+MdRBGA/+VsBGpzDFaxXYqJFW8/XbOnQuTbOcH0M
	qCyFymhpaTJBCc4M0Bvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVFRi-007wjt-08; Tue, 28 Sep 2021 15:55:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVFQG-007vcZ-D0
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 15:53:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F6A860F0F;
 Tue, 28 Sep 2021 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632844415;
 bh=Y5e9CIreOMBgUX4oGIdc1T/T430Kpn66zsMnsKXSXeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pDnIpqhr8CyZ1nLAsDCphZ5Xu9Z28BgKX+qEVht6neCzo6kjVmkjYHIXfABqwMw/x
 5YJ2BV3BVBkrOmmtBVPsy3MnBhDT7/iJVULg2lY7ICk5+gG70IpcOueIzL1ssHD6Qw
 OTlSI97QGsJOyVyXMaimX2kiQgi7Uyj3EPCQkxiVyiNL4n91kQYe5Ltt0tWIxTRNWc
 xPftl/4Knqf3Ayhf0kB3o/OBqNviw8kbgSxRxV5rcGZZO2o2LNeyXvyygtcvfGC2QP
 zlwdHejxFlMNi9yfLm5/R86K4GXsrEDI2cNZ1gFIlt6Srg6U61CZCJQEaXD15iw25e
 jNh7Ao5GA1LzA==
Date: Tue, 28 Sep 2021 21:22:05 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH 1/3] mtd: rawnand: qcom: Add support for status pipe
Message-ID: <20210928155205.GB12183@thinkpad>
References: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
 <1631699851-12172-2-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1631699851-12172-2-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_085336_510243_48EE566A 
X-CRM114-Status: GOOD (  21.60  )
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

On Wed, Sep 15, 2021 at 03:27:29PM +0530, Md Sadre Alam wrote:
> From QPIC V2.0 onwards there is a separate pipe
> to read status of each code word, called "status" pipe.
> 
> "status" pipe will use to read CW status in case of
> enhanced read mode like page scope read, multi page read.
> 

The pipe you are referring to is a DMA pipe (channel). So it should be mentioned
here.

> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 04e6f7b..42c6291 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -389,6 +389,7 @@ struct qcom_nand_controller {
>  			struct dma_chan *tx_chan;
>  			struct dma_chan *rx_chan;
>  			struct dma_chan *cmd_chan;
> +			struct dma_chan *sts_chan;
>  		};
>  
>  		/* will be used only by EBI2 for ADM DMA */
> @@ -2737,6 +2738,11 @@ static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
>  
>  		if (nandc->cmd_chan)
>  			dma_release_channel(nandc->cmd_chan);
> +
> +		if (nandc->props->qpic_v2) {
> +			if (nandc->sts_chan)
> +				dma_release_channel(nandc->sts_chan);
> +		}
>  	} else {
>  		if (nandc->chan)
>  			dma_release_channel(nandc->chan);
> @@ -2815,6 +2821,14 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>  			goto unalloc;
>  		}
>  
> +		if (nandc->props->qpic_v2) {
> +			nandc->sts_chan = dma_request_slave_channel(nandc->dev, "sts");
> +			if (!nandc->sts_chan) {
> +				dev_err(nandc->dev, "failed to request sts channel\n");
> +				return -ENODEV;
> +			}

If you are forcing the need of status pipe, then you should also update the
devicetree of relevant SoCs using the QPIC v2 controller. Else, they will fail
to probe.

Thanks,
Mani

> +		}
> +
>  		/*
>  		 * Initially allocate BAM transaction to read ONFI param page.
>  		 * After detecting all the devices, this BAM transaction will
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
