Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0892C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91A0F20882
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:26:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iuKKzMDG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91A0F20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NCjtpQzX+qXaDT13Yzyrgd3GQYzDytKP+qANHF5SCtU=; b=iuKKzMDGe1LguQR2iQSNyueGw
	Ja91LA5wGRK7sdPKZNE8TlyNvIbTcPHXZ4Smsam1BZ/9Ineqc9CQ+vydgogumK324nEF3RtBYpHgs
	yE0tcoW4Hb3WdKdoXO6Vcxm2VUWi8JBE/N73puFpnUKZiaFQJwyJLOZSdD1EmaGNj8/7mrP4MzFlM
	KWa+2AIJCjcRsOqjpxEpPigU3NohT91/wc4BCkuy8Y6nZlH1Cv+jcFI7LNav97K/EA/FsZpfEi3Ip
	+yJxyzQz4C/tQxDtHJeGALQFoq1Obr+vpPuUL79n3a5rAfvid3du0phU/GN7rLXVQ6vrlS/xGyzZk
	hrPl5iDwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gom8n-0004KU-2v; Wed, 30 Jan 2019 09:26:41 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gom88-0003ip-2e; Wed, 30 Jan 2019 09:26:02 +0000
Received: from [10.28.18.236] (10.28.18.236) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 30 Jan
 2019 17:26:49 +0800
Subject: Re: [PATCH][next] mtd: rawnand: meson: fix missing assignment of ret
 on a call to meson_chip_buffer_init
To: Colin King <colin.king@canonical.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
References: <20190129105757.19138-1-colin.king@canonical.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <aeadd16e-ed46-28f2-15de-66d1d9f1ed11@amlogic.com>
Date: Wed, 30 Jan 2019 17:26:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129105757.19138-1-colin.king@canonical.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.236]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_012600_551718_D3070471 
X-CRM114-Status: GOOD (  14.75  )
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

On 2019/1/29 18:57, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to meson_chip_buffer_init is not assigning ret, however, ret
> is being checked for failure. Fix this by adding in the missing assignment.
> 
> Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index e858d58d97b0..b9c543d1054c 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1206,7 +1206,7 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
>   		dev_err(nfc->dev, "16bits bus width not supported");
>   		return -EINVAL;
>   	}
> -	meson_chip_buffer_init(nand);
> +	ret = meson_chip_buffer_init(nand);

Looks good to me:

Acked-by: Liang Yang <liang.yang@amlogic.com>

>   	if (ret)
>   		return -ENOMEM;
>   
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
