Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A0BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 12:18:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 235A1611C3
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 12:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 235A1611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFtYTcMIOXZhaajGrC+xWrKZq0Meh/1pjunpnqQVxis=; b=3ACQEGec4OgSob9uo1kgwT/Vak
	838tB42NZHqQ1SLgHt7q1DYpT1NoY/BZgBc5vZX6g34C0b5ajZioCGOtYjYbYdRSmdroU2CsFP55Z
	sF6pu5KVnYteWn/Krf3xhws3Um9DAGM5Hmps88cDq/I3hT2y6wWw32XA9FabAFNwqPUFzEaJKngd7
	nrb8a20eHv4NPEAKLtaKHkBp9FzEIZrsMXOYKhECJCgUNwXQXgK+grVIUyGFmlXcX8CpzcJpgU50H
	NQ+7O2co9Bk6l67+bqe1AkjwFa6tQL19zOET89f6+XRrJ6oKGoaOEk0uLxqfkvB2noGymfNUW3m8Q
	93IsJ9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVC3V-0072DI-9G; Tue, 28 Sep 2021 12:17:53 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVC3C-00720c-5E
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 12:17:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632831455; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XVITHsJ9eg8UKU/x0/Au9E7feURfvVXtzCIeg+cG94I=;
 b=XDpPMuRNcWdKBGhXdmVFta5zzr9qGM+Wl1Zuy3kclbz5mVGCayvSPg0MqgmifuGHGGJE3UdK
 7j/HkZyogNPNRQZQhNdkR/bnM44UIuYq3yn6uqMxWaWa7Aj6X3oWiRr0q3/3G0LfvbOhGPhd
 gt9PFabn7bYMz166LEbJ20J9Tkw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 615307d91abbf21d34b25050 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 12:17:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C8713C43635; Tue, 28 Sep 2021 12:17:28 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 40AAEC43617;
 Tue, 28 Sep 2021 12:17:27 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 28 Sep 2021 17:47:27 +0530
From: mdalam@codeaurora.org
To: miquel.raynal@bootlin.com, mani@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
Subject: Re: [PATCH 1/3] mtd: rawnand: qcom: Add support for status pipe
In-Reply-To: <1631699851-12172-2-git-send-email-mdalam@codeaurora.org>
References: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
 <1631699851-12172-2-git-send-email-mdalam@codeaurora.org>
Message-ID: <97df48e5505c4e6ae3bc6b7e953c156c@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_051735_396766_58584230 
X-CRM114-Status: GOOD (  21.32  )
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

On 2021-09-15 15:27, Md Sadre Alam wrote:
> From QPIC V2.0 onwards there is a separate pipe
> to read status of each code word, called "status" pipe.
> 
> "status" pipe will use to read CW status in case of
> enhanced read mode like page scope read, multi page read.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c
> b/drivers/mtd/nand/raw/qcom_nandc.c
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
> @@ -2737,6 +2738,11 @@ static void qcom_nandc_unalloc(struct
> qcom_nand_controller *nandc)
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
> @@ -2815,6 +2821,14 @@ static int qcom_nandc_alloc(struct
> qcom_nand_controller *nandc)
>  			goto unalloc;
>  		}
> 
> +		if (nandc->props->qpic_v2) {
> +			nandc->sts_chan = dma_request_slave_channel(nandc->dev, "sts");
> +			if (!nandc->sts_chan) {
> +				dev_err(nandc->dev, "failed to request sts channel\n");
> +				return -ENODEV;
> +			}
> +		}
> +
>  		/*
>  		 * Initially allocate BAM transaction to read ONFI param page.
>  		 * After detecting all the devices, this BAM transaction will

Ping! Please provide me some updates on this patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
