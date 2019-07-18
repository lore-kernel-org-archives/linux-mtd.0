Return-Path: <SRS0=pV2g=VP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9203C76192
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2019 03:58:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6B82085A
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2019 03:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b5vVRKfQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD6B82085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EjD/nHczM2uwlyF1fLRre08PrM6FiFI7EwK+uttO2k8=; b=b5vVRKfQNqiAXwEhV8jsRoLVu
	QSqOmrJYjUf4aPwq4EARHXssgtpuYFBiIaUcOFY2J7AtHAFdxfwEKmaP0NceJBUgqhRFySZT+sWpJ
	FSakFZ2UvI2TdHjL5xqBD4v78eZVmlnvCQAuJxJwjcq61Uw81q7nt4CGgyxV0GYSuvLk0YJ6tqX0X
	6wKNojjeRdejQa0UWHJCS1NTXd3NyfntYoNWkqOIDxS/fYPABhJlrIphAZOtx0L1IJHXbpd3IPbYv
	DR6TG9XjupFYObWBNkId6yM5Jb31P1BzAqdVCqCcHIu5Wh/RBR5Rp/45LLE4YrEioABIOjYmdfRm2
	uWO1zVTlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnxZ6-0007Df-Ku; Thu, 18 Jul 2019 03:58:44 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnxYk-0006zh-9R; Thu, 18 Jul 2019 03:58:23 +0000
Received: from [10.28.18.185] (10.28.18.185) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 18 Jul
 2019 11:58:46 +0800
Subject: Re: [PATCH] mtd: rawnand: meson: Add of_node_put() before return
To: Nishka Dasgupta <nishkadg.linux@gmail.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <khilman@baylibre.com>
References: <20190709171640.13511-1-nishkadg.linux@gmail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <1e53cc6f-59d7-9bd2-8961-ce223d5cd0d5@amlogic.com>
Date: Thu, 18 Jul 2019 11:58:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709171640.13511-1-nishkadg.linux@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.185]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190717_205822_331934_74FB1C5B 
X-CRM114-Status: GOOD (  12.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Nishka,

On 2019/7/10 1:16, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index ea57ddcec41e..1b82b687e5a5 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1320,6 +1320,7 @@ static int meson_nfc_nand_chips_init(struct device *dev,
>   		ret = meson_nfc_nand_chip_init(dev, nfc, nand_np);
>   		if (ret) {
>   			meson_nfc_nand_chip_cleanup(nfc);
> +			of_node_put(nand_np);

Thank you. Looks good to me:
Acked-by: Liang Yang <liang.yang@amlogic.com>

>   			return ret;
>   		}
>   	}
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
