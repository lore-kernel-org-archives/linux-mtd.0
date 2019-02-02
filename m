Return-Path: <SRS0=Axir=QJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AD8C282D8
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 03:00:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF3F20855
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 03:00:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UvEFjHB6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECF3F20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dUI3cnoCpgoxj5Ek/8+lgRZyExc2fvdIdu2VM6TlXY4=; b=UvEFjHB6WOzUpKpeeJQfY7xsA
	X3AZONLHX9V+lxrLu3fYR6Br/AQiVdr9OrqKGgDgK/nBpxuU6xszQVYBRNhPxJ63ofRp7Am2GXxv9
	VXuJc2X4YVGPhSvFCP9/Mxr+IMnt1XT7x+2FrNoQ/ewKOn6+a9qtcGinq5dLRu58rbVG099sqe0Od
	8kKe7oHnWuXs1CoCaIui5IAnW7cmJDTReon5rt0gNpDfe/SXJbwqNHoPwwGYir5ZSiKR8HgQpIc9c
	62P/mBOrRhTnBTawMIW2x+iNSc1e0j8f6V361HYCmEisp79vI+G5vXnn/kP8uaSw1u8Px3IxxbYoc
	wIA6QhY1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gplXz-0005tB-Hc; Sat, 02 Feb 2019 03:00:47 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gplXv-0005qQ-E6; Sat, 02 Feb 2019 03:00:44 +0000
Received: from [10.28.18.236] (10.28.18.236) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Sat, 2 Feb
 2019 11:01:33 +0800
Subject: Re: [PATCH 3/3] mtd: rawnand: meson: remove unnecessary condition in
 meson_nfc_select_chip()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20190201083053.GE8459@kadam>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <40c4ae49-22fa-38ab-cbfc-9562bc6be65a@amlogic.com>
Date: Sat, 2 Feb 2019 11:01:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190201083053.GE8459@kadam>
Content-Language: en-US
X-Originating-IP: [10.28.18.236]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_190043_471371_5EF60207 
X-CRM114-Status: GOOD (  14.83  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 2019/2/1 16:30, Dan Carpenter wrote:
> If chip is negative then we return at the very start of the function.
> Removing the check lets us pull everything in one indent level.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 28 ++++++++++++----------------
>   1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 0d93d0b9c1af..105d12103ca6 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -234,23 +234,19 @@ static void meson_nfc_select_chip(struct nand_chip *nand, int chip)
>   	nfc->timing.tadl = meson_chip->tadl;
>   	nfc->timing.tbers_max = meson_chip->tbers_max;
>   
> -	if (chip >= 0) {
> -		if (nfc->clk_rate != meson_chip->clk_rate) {
> -			ret = clk_set_rate(nfc->device_clk,
> -					   meson_chip->clk_rate);
> -			if (ret) {
> -				dev_err(nfc->dev, "failed to set clock rate\n");
> -				return;
> -			}
> -			nfc->clk_rate = meson_chip->clk_rate;
> -		}
> -		if (nfc->bus_timing != meson_chip->bus_timing) {
> -			value = (NFC_CLK_CYCLE - 1)
> -				| (meson_chip->bus_timing << 5);
> -			writel(value, nfc->reg_base + NFC_REG_CFG);
> -			writel((1 << 31), nfc->reg_base + NFC_REG_CMD);
> -			nfc->bus_timing =  meson_chip->bus_timing;
> +	if (nfc->clk_rate != meson_chip->clk_rate) {
> +		ret = clk_set_rate(nfc->device_clk, meson_chip->clk_rate);
> +		if (ret) {
> +			dev_err(nfc->dev, "failed to set clock rate\n");
> +			return;
>   		}
> +		nfc->clk_rate = meson_chip->clk_rate;
> +	}
> +	if (nfc->bus_timing != meson_chip->bus_timing) {
> +		value = (NFC_CLK_CYCLE - 1) | (meson_chip->bus_timing << 5);
> +		writel(value, nfc->reg_base + NFC_REG_CFG);
> +		writel((1 << 31), nfc->reg_base + NFC_REG_CMD);
> +		nfc->bus_timing =  meson_chip->bus_timing;
>   	}

Indeed, we need not check chip >= 0 again. Thank you.

Acked-by: Liang Yang <liang.yang@amlogic.com>

>   }
>   
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
