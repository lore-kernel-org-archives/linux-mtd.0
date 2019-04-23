Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC5DC10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 05:22:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77B3F20811
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 05:22:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dfv+eLOr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcw978wh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77B3F20811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Si/gdtyr/wRto9CFhIZVDWp5Cjyjfy6vTH+nx0Ynjw=; b=dfv+eLOrKouEGp
	dz3x3QqUiEfS3gkjoqEC3DZatwcDct97CaTqe96o6KuBVO0tLhLEgQpqqf4HCJVVuPbV+lqcrs6Un
	Ldeez7f0UGEX9bmgStSYNcAdzHewW/2dMekTqhm/BZ3+TQnk+g8TG4UAaCn0J4huZ7goJuLDpMAGL
	3sVMv/X000tHbxYU4Shg6vrNKzDoSPKpQfbkxNYGvPf09KQPTZ0OBSsjWlEMGrawCo1PnXTJ58/zP
	qTxErXYq0GYukmetTiNMGszc04/ZFBNB799OgPbnONGUrS4NfN0N/avep5aKVKZs6MCVEmKYqIVW+
	Kg3mAc+V6tPqhGgWcPtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIntC-0007Oc-AC; Tue, 23 Apr 2019 05:22:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hInt9-0007OE-S6
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2019 05:22:41 +0000
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94AD820811;
 Tue, 23 Apr 2019 05:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555996959;
 bh=JRnz1VgMZtR9vfrW0l6xcYdg1w6XmiL4eCs+JT6e9hU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kcw978wh1O7G27d/oRqE0SO8c3cHoaGKK6u4SiLJ3VTfNnNUWI3C4af3yrnmbQAmj
 5alw+ab2HjnEtFI7/jVN5pVGAtKMT06ic5DJQibSemJa9qr2WQdQ0k6zWHepfymBPi
 464LlZdFOsbZvKc2fVimEE2LifXQhD8kCTUx9MYY=
Date: Tue, 23 Apr 2019 10:52:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 10/14] dma: mxs: Drop unnecessary flag
Message-ID: <20190423052233.GH28103@vkoul-mobl>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-11-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190409113421.3037-11-s.hauer@pengutronix.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_222239_939051_8CC9EFF5 
X-CRM114-Status: GOOD (  18.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 09-04-19, 13:34, Sascha Hauer wrote:
> The mxs dma driver insists on having the DMA_PREP_INTERRUPT flag set
> on all but the first transfer. There's no need to let the user set this
> flag, the driver can do it internally whenever it needs it. Drop
> handling of this flag from the driver.

After changing patch title to dmaengine: mxs: ....

Acked-by: Vinod Koul <vkoul@kernel.org>

> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/dma/mxs-dma.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> index 22cc7f68ef6e..ce92a3626ea4 100644
> --- a/drivers/dma/mxs-dma.c
> +++ b/drivers/dma/mxs-dma.c
> @@ -477,16 +477,16 @@ static void mxs_dma_free_chan_resources(struct dma_chan *chan)
>   *            ......
>   *            ->device_prep_slave_sg(0);
>   *            ......
> - *            ->device_prep_slave_sg(DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> + *            ->device_prep_slave_sg(DMA_CTRL_ACK);
>   *            ......
>   *    [3] If there are more than two DMA commands in the DMA chain, the code
>   *        should be:
>   *            ......
>   *            ->device_prep_slave_sg(0);                                // First
>   *            ......
> - *            ->device_prep_slave_sg(DMA_PREP_INTERRUPT [| DMA_CTRL_ACK]);
> + *            ->device_prep_slave_sg(DMA_CTRL_ACK]);
>   *            ......
> - *            ->device_prep_slave_sg(DMA_PREP_INTERRUPT | DMA_CTRL_ACK); // Last
> + *            ->device_prep_slave_sg(DMA_CTRL_ACK); // Last
>   *            ......
>   */
>  static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
> @@ -500,13 +500,12 @@ static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
>  	struct scatterlist *sg;
>  	u32 i, j;
>  	u32 *pio;
> -	bool append = flags & DMA_PREP_INTERRUPT;
> -	int idx = append ? mxs_chan->desc_count : 0;
> +	int idx = 0;
>  
> -	if (mxs_chan->status == DMA_IN_PROGRESS && !append)
> -		return NULL;
> +	if (mxs_chan->status == DMA_IN_PROGRESS)
> +		idx = mxs_chan->desc_count;
>  
> -	if (sg_len + (append ? idx : 0) > NUM_CCW) {
> +	if (sg_len + idx > NUM_CCW) {
>  		dev_err(mxs_dma->dma_device.dev,
>  				"maximum number of sg exceeded: %d > %d\n",
>  				sg_len, NUM_CCW);
> @@ -520,7 +519,7 @@ static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
>  	 * If the sg is prepared with append flag set, the sg
>  	 * will be appended to the last prepared sg.
>  	 */
> -	if (append) {
> +	if (idx) {
>  		BUG_ON(idx < 1);
>  		ccw = &mxs_chan->ccw[idx - 1];
>  		ccw->next = mxs_chan->ccw_phys + sizeof(*ccw) * idx;
> -- 
> 2.20.1

-- 
~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
