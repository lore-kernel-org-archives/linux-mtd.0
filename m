Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70051C10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 06:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B2DB20825
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 06:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d5a1mg69"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B2DB20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7SIj3SW8qUoai9vutoPRhmtEk4IyTvi7jDP/RCW9cMk=; b=d5a1mg694LNuY6SH+K3XjNUzB
	J7POjJEyG+NGq+nE3Byw+hDGHKi0ZAdlNfknDNMoHRtBdz790Qnw6pNndkp99cCD8mB25zIuE35ak
	a9zHT84sGc5y4wMp1S9rr/e8MhDI+2Uiupz3PsVAJt3tOn4AJettuk8TPQAvq9a1Kw5FoJYPiTabP
	bhiMnpoKobzhYz+/rfH6lcoq3/R+6udwMIKWnJQTyQaxm8tANdky4FGAbQbYVhTCScVsShzT6zavF
	ZNj6FXgNppBaxZLUcXXP7+oZhc+30zltIqkwqEH4Wcz+kDqIhjMbqgZbaqhsIT73IIgu91ktoP1uT
	fMmDLNFZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFuiR-0006BZ-I2; Mon, 15 Apr 2019 06:03:39 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFuhw-0005XD-NP; Mon, 15 Apr 2019 06:03:09 +0000
Received: from [10.28.18.125] (10.28.18.125) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 15 Apr
 2019 14:02:28 +0800
Subject: Re: [PATCH 2/4] mtd: rawnand: meson: use
 of_property_count_elems_of_size helper
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-amlogic@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <richard@nod.at>, <miquel.raynal@bootlin.com>
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
 <20190411220056.19109-3-martin.blumenstingl@googlemail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <e96ea061-5d5f-de59-cd64-0239d81b9a13@amlogic.com>
Date: Mon, 15 Apr 2019 14:02:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411220056.19109-3-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.125]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_230308_757614_08A42FB0 
X-CRM114-Status: GOOD (  10.58  )
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
> Use the of_property_count_elems_of_size() helper instead of open-coding
> it's logic. As a bonus this will now error out if the "reg" property
> values use an incorrect size (anything other than sizeof(u32)).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index c1a6af57dab5..9a6023638101 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1233,10 +1233,7 @@ meson_nfc_nand_chip_init(struct device *dev,
>   	int ret, i;
>   	u32 tmp, nsels;
>   
> -	if (!of_get_property(np, "reg", &nsels))
> -		return -EINVAL;
> -
> -	nsels /= sizeof(u32);
> +	nsels = of_property_count_elems_of_size(np, "reg", sizeof(u32));
Tested-by:Liang Yang <liang.yang@amlogic.com>
Acked-by: Liang Yang <liang.yang@amlogic.com>
>   	if (!nsels || nsels > MAX_CE_NUM) {
>   		dev_err(dev, "invalid register property size\n");
>   		return -EINVAL;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
