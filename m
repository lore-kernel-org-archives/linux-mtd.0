Return-Path: <SRS0=VbW+=UN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82DFC31E44
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 03:32:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF90208CA
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 03:32:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r84BlGKq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="kK6Kk2II"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEF90208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=QG5c4l9p38ay+UTQz1jQtsyxQlKcx2EY9HbJn/Nkgcc=; b=r84BlGKqF/6uw5
	BRsxwtfWctJZl4oT7VwL8tE4XsHhDFdOm7YxKKC2NtaWWOQy52EbaFTHwOJdr15gf2x6gAIK6UWs1
	KGKZcYQ0qNTt0SYitsvB2RzoaXzYvXyfq3sXSZVnf7SbaWTXkoiyEJ2EdMfBFLn38mCgQG/wV98gP
	dAXsO1J1JXWZZoQLXqWkuwV9cUsyKE+ebPj69k3C/sc1dKFegztAH6UELIw4pPiztIYyl9XHpTJbR
	V26E0iY4CWzoJ2Xn9yZ4YWtrmxyMqS1HBuLsDZFID8Cg9c3ixr91usN7UaCwkamnN8ugz8KJC+9WH
	NBP8Ze/6+G4fykJ7+PKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbcwf-0004Yl-KU; Fri, 14 Jun 2019 03:32:05 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbcow-00041L-M9
 for linux-mtd@lists.infradead.org; Fri, 14 Jun 2019 03:24:09 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4BF348011F;
 Fri, 14 Jun 2019 15:23:59 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1560482639;
 bh=AbZqhinaeDDXdEDPzuAuewpZ+Ugz4DonDu2l7bEltmo=;
 h=From:To:CC:Subject:Date:References;
 b=kK6Kk2IISGYuLBUAa5ZgFnskmSHT+XwHWmucjvXoPGeMKvahtzFTF9c+R3FxvPLIS
 fzq/PYJVIGdfkyJAZWJq32eiGNUJ4wWUewlPLQlYpOyoeijEsmlDH6gOlXvw5sdeaf
 DLuLVteoGXBnNmWmdXhtocnZ6wQYK1Ac6ydDwYEVHmcnG8eq5V2sdoLPoEaCKlhr5m
 gd8pcxHEEKDWtOEJa/8jhL+CYF4QzW4xyP5f2n8UvYHIyhEABhxrM+vYtvTvpfshDb
 gzv6wiBhfe58E4StnYwtgyJYU9BOOsZhSJri9fQMSeE4Ok+e20Q8HLbxaVj2w0RA2w
 suJUd3UtKXIWQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d03134e0000>; Fri, 14 Jun 2019 15:23:59 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Fri, 14 Jun 2019 15:23:58 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Fri, 14 Jun 2019 15:23:58 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: dynamically determine the max
 sectors
Thread-Topic: [PATCH] mtd: cfi_cmdset_0002: dynamically determine the max
 sectors
Thread-Index: AQHVEDI+CoqUJR97jEy7wwMr7iI19Q==
Date: Fri, 14 Jun 2019 03:23:57 +0000
Message-ID: <8e80d911f0dd4759b3edc72fb76530d6@svr-chch-ex1.atlnz.lc>
References: <20190522000628.13073-1-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_202407_120647_FFF1F25A 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: "sr@denx.de" <sr@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi All,

I think this may have got lost in the change of maintainer for mtd.

On 22/05/19 12:06 PM, Chris Packham wrote:
> Because PPB unlocking unlocks the whole chip cfi_ppb_unlock() needs to
> remember the locked status for each sector so it can re-lock the
> unaddressed sectors. Dynamically calculate the maximum number of sectors
> rather than using a hardcoded value that is too small for larger chips.
> 
> Tested with Spansion S29GL01GS11TFI flash device.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>   drivers/mtd/chips/cfi_cmdset_0002.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index c8fa5906bdf9..a1a7d334aa82 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -2533,8 +2533,6 @@ struct ppb_lock {
>   	int locked;
>   };
>   
> -#define MAX_SECTORS			512
> -
>   #define DO_XXLOCK_ONEBLOCK_LOCK		((void *)1)
>   #define DO_XXLOCK_ONEBLOCK_UNLOCK	((void *)2)
>   #define DO_XXLOCK_ONEBLOCK_GETLOCK	((void *)3)
> @@ -2633,6 +2631,7 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>   	int i;
>   	int sectors;
>   	int ret;
> +	int max_sectors;
>   
>   	/*
>   	 * PPB unlocking always unlocks all sectors of the flash chip.
> @@ -2640,7 +2639,11 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>   	 * first check the locking status of all sectors and save
>   	 * it for future use.
>   	 */
> -	sect = kcalloc(MAX_SECTORS, sizeof(struct ppb_lock), GFP_KERNEL);
> +	max_sectors = 0;
> +	for (i = 0; i < mtd->numeraseregions; i++)
> +		max_sectors += regions[i].numblocks;
> +
> +	sect = kcalloc(max_sectors, sizeof(struct ppb_lock), GFP_KERNEL);
>   	if (!sect)
>   		return -ENOMEM;
>   
> @@ -2689,9 +2692,9 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>   		}
>   
>   		sectors++;
> -		if (sectors >= MAX_SECTORS) {
> +		if (sectors >= max_sectors) {
>   			printk(KERN_ERR "Only %d sectors for PPB locking supported!\n",
> -			       MAX_SECTORS);
> +			       max_sectors);
>   			kfree(sect);
>   			return -EINVAL;
>   		}
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
