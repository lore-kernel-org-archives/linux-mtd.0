Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FD9C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:26:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A213220882
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qW2N/OGc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A213220882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nztrS+Ll3cuKxz0Ckqobw31OP7d3CFENP3XNjb8bwnA=; b=qW2N/OGcEDJAdisbBeOzKPR5t
	B5RLF8xFNV74exVvSY4vbfv823eLIjT7HHNhBcQaPNM9vsmgloTOmUoyM7k+R/CWST2WmJyATABZ8
	SuDL+HneyOHIoMX8yX9eZwvE58tbuFhQioL2Z1o47y+EJ5/x+gyOPk1wjv5c89jhiIqxUdnxOo0/k
	cZdgfU70j3s66LW88mVTBqj6m1N62W6ClrybB32kAeu2aoMWG3ygBY/LtOJ3xo8X2r5vM1rPIqtVH
	UznJg27T5TfFfuaod0PFhdSnCxBBHRiF9Cu6Yfk+x7WBMKeTS4Kdp+Hyj7YHtSNz39YjMF6yfQnHU
	wGcj6VreQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gom8K-0003sm-JO; Wed, 30 Jan 2019 09:26:12 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gom83-0003ip-4G; Wed, 30 Jan 2019 09:25:59 +0000
Received: from [10.28.18.236] (10.28.18.236) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 30 Jan
 2019 17:26:39 +0800
Subject: Re: [PATCH] mtd: rawnand: meson: Fix linking error on 32-bit platforms
To: Nathan Chancellor <natechancellor@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
References: <20190129214657.5877-1-natechancellor@gmail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <42d2e92e-9f5a-62b2-c0af-b7f3544d79d2@amlogic.com>
Date: Wed, 30 Jan 2019 17:26:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129214657.5877-1-natechancellor@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.236]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_012555_490758_8B94B63B 
X-CRM114-Status: GOOD (  12.54  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Nathan,

On 2019/1/30 5:46, Nathan Chancellor wrote:
> On arm little endian allyesconfig:
> 
>    ld.lld: error: undefined symbol: __aeabi_uldivmod
>    >>> referenced by meson_nand.c
>    >>> mtd/nand/raw/meson_nand.o:(meson_nfc_setup_data_interface) in archive drivers/built-in.a
> 
> The dividend tBERS_max is u64, meaning we need to use DIV_ROUND_UP_ULL
> (which wraps do_div) to prevent the compiler from emitting
> __aebi_uldivmod.
> 
> Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index e858d58d97b0..6f12a96195d1 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1116,8 +1116,8 @@ int meson_nfc_setup_data_interface(struct nand_chip *nand, int csline,
>   				       div * NFC_CLK_CYCLE);
>   	meson_chip->tadl = DIV_ROUND_UP(PSEC_TO_NSEC(timings->tADL_min),
>   					div * NFC_CLK_CYCLE);
> -	tbers_clocks = DIV_ROUND_UP(PSEC_TO_NSEC(timings->tBERS_max),
> -				    div * NFC_CLK_CYCLE);
> +	tbers_clocks = DIV_ROUND_UP_ULL(PSEC_TO_NSEC(timings->tBERS_max),
> +					div * NFC_CLK_CYCLE);

Looks good to me:

Acked-by: Liang Yang <liang.yang@amlogic.com>

>   	meson_chip->tbers_max = ilog2(tbers_clocks);
>   	if (!is_power_of_2(tbers_clocks))
>   		meson_chip->tbers_max++;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
