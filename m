Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C047FC282D9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9181D20989
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aMAeGulf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9181D20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2DuMIqAM53J124/IKpgHXE9TryuuLshg53D8xvC7adA=; b=aMAeGulfeVfLDrSIwqoPgX4Af
	RTs3HqFOwimfWm775/YYMmiqDo63bKL6cJwUGCeoJ8g3a764tf74d9xM4xTJhO74OJsbWTtGQgdfi
	OZBAWHtJ/7A/7CsA1LMijwzcaIqdFvpJKrPTGPjxnMn6DJJ3wR8gk+ehNGegmTbbv1ObmWm4AKB+Z
	0SQX43MUlxiyvYVsK3RnC5a8OnxTx4B7oCsO/TlpYOTgohSgy7J5bmYC29E5lxFcXVvvad0sSM+4b
	xa5T/aX5eeq2GwrzZY822WqKO5np9FVze2b7RUhsyMmSvoxsYn3ExEUo7UAb2ReUDA1HZPfxADXD7
	70IxraTEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gomMJ-0005L0-S1; Wed, 30 Jan 2019 09:40:39 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gom8T-00040a-1X; Wed, 30 Jan 2019 09:26:26 +0000
Received: from [10.28.18.236] (10.28.18.236) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 30 Jan
 2019 17:27:10 +0800
Subject: Re: [PATCH][next] mtd: rawnand: meson:: make several functions static
To: Colin King <colin.king@canonical.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
References: <20190129124429.19829-1-colin.king@canonical.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <a1f6dfbd-3434-be6a-c623-794398393609@amlogic.com>
Date: Wed, 30 Jan 2019 17:27:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129124429.19829-1-colin.king@canonical.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.236]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_012621_581208_121A3AF2 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Colin,

On 2019/1/29 20:44, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are several functions that are local to the source and do
> not need to be in global scope, so make them static.
> 
> Cleans up sparse warnings.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index b9c543d1054c..9557bd94dcd2 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -829,14 +829,14 @@ static int meson_nfc_read_oob(struct nand_chip *nand, int page)
>   	return meson_nfc_read_page_hwecc(nand, NULL, 1, page);
>   }
>   
> -bool meson_nfc_is_buffer_dma_safe(const void *buffer)
> +static bool meson_nfc_is_buffer_dma_safe(const void *buffer)
>   {
>   	if (virt_addr_valid(buffer) && (!object_is_on_stack(buffer)))
>   		return true;
>   	return false;
>   }
>   
> -void *
> +static void *
>   meson_nand_op_get_dma_safe_input_buf(const struct nand_op_instr *instr)
>   {
>   	if (WARN_ON(instr->type != NAND_OP_DATA_IN_INSTR))
> @@ -848,7 +848,7 @@ meson_nand_op_get_dma_safe_input_buf(const struct nand_op_instr *instr)
>   	return kzalloc(instr->ctx.data.len, GFP_KERNEL);
>   }
>   
> -void
> +static void
>   meson_nand_op_put_dma_safe_input_buf(const struct nand_op_instr *instr,
>   				     void *buf)
>   {
> @@ -863,7 +863,7 @@ meson_nand_op_put_dma_safe_input_buf(const struct nand_op_instr *instr,
>   	kfree(buf);
>   }
>   
> -void *
> +static void *
>   meson_nand_op_get_dma_safe_output_buf(const struct nand_op_instr *instr)
>   {
>   	if (WARN_ON(instr->type != NAND_OP_DATA_OUT_INSTR))
> @@ -876,7 +876,7 @@ meson_nand_op_get_dma_safe_output_buf(const struct nand_op_instr *instr)
>   		       instr->ctx.data.len, GFP_KERNEL);
>   }
>   
> -void
> +static void
>   meson_nand_op_put_dma_safe_output_buf(const struct nand_op_instr *instr,
>   				      const void *buf)
>   {
> 

Looks good to me:

Acked-by: Liang Yang <liang.yang@amlogic.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
