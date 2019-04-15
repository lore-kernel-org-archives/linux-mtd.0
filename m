Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135FAC10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 06:04:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C615020684
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 06:04:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/wB46GT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C615020684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KEDRlQWWjhNHYK2ViSLR7FTgQVzUsbJquQBKHCfAu4E=; b=q/wB46GTCkin8K/3052rkOndr
	6/wLxusa7xQieLJFuLiU77IPmS8hMlLNlzH82UyHrDZNm8qyRXXWHS43/2fVQM2W+LQrPI2TuCUOK
	sPgdufIpDZk4++gBar2B1PP5NckO1WMfP9qsrTt6+S8BXIl5YqDmqB2XVGZcb3u3RgLV4kY65cmyk
	2uSsGhAoh72hemnW7LuCD7QBGNDeeless5OkBhc6v9CW3Vxe447nBwcGYvt2eMSV9v3WrUnInd7d0
	GsGHLVnOtxbsFXOQhnqTRcUzJROA5v57a9ZcP3IBh/3Csxt67Ld9hl/MEi0hH/WFqscuNhuMWhw1c
	dKbse2KAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFuj2-0006uh-JB; Mon, 15 Apr 2019 06:04:16 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFuim-0006as-Md; Mon, 15 Apr 2019 06:04:07 +0000
Received: from [10.28.18.125] (10.28.18.125) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 15 Apr
 2019 14:03:59 +0800
Subject: Re: [PATCH 3/4] mtd: rawnand: meson: use a void pointer for
 meson_nfc_dma_buffer_setup
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-amlogic@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <richard@nod.at>, <miquel.raynal@bootlin.com>
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
 <20190411220056.19109-4-martin.blumenstingl@googlemail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <6ed284c1-ed34-9483-51a4-a79dfd0bd42c@amlogic.com>
Date: Mon, 15 Apr 2019 14:03:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411220056.19109-4-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.125]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_230400_754993_197C9695 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 2019/4/12 6:00, Martin Blumenstingl wrote:
> This simplifies the code because it gets rid of the casts to an
> u8-pointer when passing "info_buf" from struct meson_nfc_nand_chip.
> Also it gets rid of the cast of the u8 databuf pointer to a void
> pointer.
> The logic inside meson_nfc_dma_buffer_setup() doesn't care about the
> pointer types themselves because it only passes them to dma_map_single
> which accepts a void pointer.
> 
> No functional changes.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 9a6023638101..57cc4bd3f665 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -470,15 +470,15 @@ static int meson_nfc_ecc_correct(struct nand_chip *nand, u32 *bitflips,
>   	return ret;
>   }
>   
> -static int meson_nfc_dma_buffer_setup(struct nand_chip *nand, u8 *databuf,
> -				      int datalen, u8 *infobuf, int infolen,
> +static int meson_nfc_dma_buffer_setup(struct nand_chip *nand, void *databuf,
> +				      int datalen, void *infobuf, int infolen,
>   				      enum dma_data_direction dir)
Tested-by:Liang Yang <liang.yang@amlogic.com>
Acked-by: Liang Yang <liang.yang@amlogic.com>
>   {
>   	struct meson_nfc *nfc = nand_get_controller_data(nand);
>   	u32 cmd;
>   	int ret = 0;
>   
> -	nfc->daddr = dma_map_single(nfc->dev, (void *)databuf, datalen, dir);
> +	nfc->daddr = dma_map_single(nfc->dev, databuf, datalen, dir);
>   	ret = dma_mapping_error(nfc->dev, nfc->daddr);
>   	if (ret) {
>   		dev_err(nfc->dev, "DMA mapping error\n");
> @@ -645,7 +645,7 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
>   		return ret;
>   
>   	ret = meson_nfc_dma_buffer_setup(nand, meson_chip->data_buf,
> -					 data_len, (u8 *)meson_chip->info_buf,
> +					 data_len, meson_chip->info_buf,
>   					 info_len, DMA_TO_DEVICE);
Tested-by:Liang Yang <liang.yang@amlogic.com>
Acked-by: Liang Yang <liang.yang@amlogic.com>
>   	if (ret)
>   		return ret;
> @@ -729,7 +729,7 @@ static int meson_nfc_read_page_sub(struct nand_chip *nand,
>   		return ret;
>   
>   	ret = meson_nfc_dma_buffer_setup(nand, meson_chip->data_buf,
> -					 data_len, (u8 *)meson_chip->info_buf,
> +					 data_len, meson_chip->info_buf,
Tested-by:Liang Yang <liang.yang@amlogic.com>
Acked-by: Liang Yang <liang.yang@amlogic.com>
>   					 info_len, DMA_FROM_DEVICE);
>   	if (ret)
>   		return ret;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
