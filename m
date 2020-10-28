Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC69C55178
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 14:36:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8322479C
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 14:36:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MqvSx5JL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B8322479C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZMY+FV+V0TUSgWlpVf5ZiqxcmPMSNbO1Wy5313JYE/E=; b=MqvSx5JLzbR1uBmxpZ1H0dHKI
	pRE/8XuWWXNvXWWirCSRlIzWrzYXn+Xhj+A7iGovUoIyeKnLyrrn6bkFB8u+lpD1f17I4UIuN9e8U
	p0kWdLHJqRObjlhNpBpySqKQ3mDmQ8FfTLj61rcHT53bvLEeoc5bFTjGeSjUBwZsbc1tcDWp8QJkt
	xUagjydEZHsY67+lVXtolqbZL2KWWYhGi/Zg4kwcWKImjfTmR0J3l733ivtDC7nuGIuYR5WzIa5Ij
	+bRoQ0g3VdnIPmGnOpr/WD+37uIksjd6H3JQI9kTFzb4DPO7Gjp2hs5etePQT4nX/2qxYBO4/r5ET
	29XKoWFqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXmYN-0004Wp-5g; Wed, 28 Oct 2020 14:35:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXmYJ-0004VX-P2
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 14:35:53 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 38FAD1F45195;
 Wed, 28 Oct 2020 14:35:49 +0000 (GMT)
Date: Wed, 28 Oct 2020 15:35:45 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manuel Dipolt <mdipolt@robart.cc>
Subject: Re: [PATCH v7] mtd: rawnand: sunxi: Add MDMA support
Message-ID: <20201028153545.559ba2be@collabora.com>
In-Reply-To: <154840787.280672.1602517282173.JavaMail.zimbra@robart.cc>
References: <154840787.280672.1602517282173.JavaMail.zimbra@robart.cc>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_103551_919181_4AF59867 
X-CRM114-Status: GOOD (  14.92  )
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
Cc: Roland Ruckerbauer <rruckerbauer@robart.cc>,
 linux-mtd <linux-mtd@lists.infradead.org>, maxime <maxime@cerno.tech>,
 miquel raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 12 Oct 2020 17:41:22 +0200 (CEST)
Manuel Dipolt <mdipolt@robart.cc> wrote:

> @@ -363,24 +364,34 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
>  	if (!ret)
>  		return -ENOMEM;
>  
> -	dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
> -	if (!dmad) {
> -		ret = -EINVAL;
> -		goto err_unmap_buf;
> +	if (!nfc->caps->has_mdma) {
> +		dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
> +		if (!dmad) {
> +			ret = -EINVAL;
> +			goto err_unmap_buf;
> +		}
>  	}
>  
>  	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
>  	       nfc->regs + NFC_REG_CTL);
>  	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
>  	writel(chunksize, nfc->regs + NFC_REG_CNT);
> -	if (nfc->caps->extra_mbus_conf)
> +
> +	if (nfc->caps->has_mdma) {
> +		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL,
> +		       nfc->regs + NFC_REG_CTL);
>  		writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
> +		writel(sg_dma_address(sg), nfc->regs + NFC_REG_MDMA_ADDR);
> +	} else {
> +		writel(readl(nfc->regs + NFC_REG_CTL) | NFC_DMA_TYPE_NORMAL,
> +		       nfc->regs + NFC_REG_CTL);

You might want to try dropping this writel (looks like it was only done
when extra_mbus_conf was set).

>  
> -	dmat = dmaengine_submit(dmad);
> +		dmat = dmaengine_submit(dmad);
>  
> -	ret = dma_submit_error(dmat);
> -	if (ret)
> -		goto err_clr_dma_flag;
> +		ret = dma_submit_error(dmat);
> +		if (ret)
> +			goto err_clr_dma_flag;
> +	}
>  
>  	return 0;
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
