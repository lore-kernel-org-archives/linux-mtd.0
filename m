Return-Path: <SRS0=VbW+=UN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAACC31E44
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 03:32:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79BDB2084E
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 03:32:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FI/2WHCD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="YLYUJXLC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79BDB2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=JSQZsk9eSc8gebojgqm2wOkFAr6m3VKivuwhh9S0t6E=; b=FI/2WHCDasC6C+
	5T5cfY7r+loZeLvii+mW0cRKwdUSItJ564f5MwP8NvmsRjiyc7D2f9lP6YGtJzc76YlMV3e7ctcU5
	0Fi6PbHAElM3/fEThm1xqj5HrtGcTQ+r+nVn1LO4A/5DKnv5xtLa1LFUI0omtTxXxpyfaycODV7WI
	QnRSJyE9nq+itG901lpBf9ey0ztSBocZjGjixIH9/g0o6TavvTKWAHf7kCkBNF7+o5rK/twwm3Fnh
	f2XPSjpmsWpEAbdkRvgDeBHr+nLLXofqKT2q623r5bwLYcirlo9L7NFQiQrd8YVxMuKvayz9WsIXv
	0OiMjgbO5jfUvaVY1oRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbcxA-00055P-HU; Fri, 14 Jun 2019 03:32:36 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbcqw-0006sG-K4
 for linux-mtd@lists.infradead.org; Fri, 14 Jun 2019 03:26:12 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 995058011F;
 Fri, 14 Jun 2019 15:26:06 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1560482766;
 bh=7cuNjAUOasNNcdtTHWPsfOhv3qMjbKvxs9MCbv9O5Ug=;
 h=From:To:CC:Subject:Date:References;
 b=YLYUJXLC8jQj0CxFuDLhFcOR0xnZ9SRStohsLsmY7DAoSCf8pDCvG1J5fFDQJO3yq
 vcZ++Z4S8R/wA8RsqUPYpVwBzz7fVnAB6TgdDa4YhljxI1/FhkHnYSXpS9LG43EqnV
 wh8G0vGziGTS6zKRD36HkWxBNLFGyHBM4LHiNINR1ttbLmaPILzz7YG7mwGVFFE42c
 Y9pNmORSfIogM0SWgT044OUpkXlrnejbKzBNfyyMdFv12D8OqJYCOjWyTacN2EOt1a
 m/w6MXRy+LOX/u27t0lA0IXrbS49lsqgo9XEhe+hGUb18kmo3MMs7xvpiblixZerXP
 bUtGMALmfNLVQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d0313cc0000>; Fri, 14 Jun 2019 15:26:06 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Fri, 14 Jun 2019 15:26:04 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Fri, 14 Jun 2019 15:26:04 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/2] mtd: concat: refactor concat_lock/concat_unlock
Thread-Topic: [PATCH v2 1/2] mtd: concat: refactor concat_lock/concat_unlock
Thread-Index: AQHVEPTbCX8jgKCQ/EWiWr4BFnYFGQ==
Date: Fri, 14 Jun 2019 03:26:03 +0000
Message-ID: <355dad1321ed46baa98ca6f47b4d00b5@svr-chch-ex1.atlnz.lc>
References: <20190522231948.17559-1-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_202611_240809_B2BF0CA9 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi All,

Ping?

On 23/05/19 11:19 AM, Chris Packham wrote:
> concat_lock() and concat_unlock() only differed in terms of the mtd_xx
> operation they called. Refactor them to use a common helper function and
> pass a boolean flag to indicate whether lock or unlock is needed.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - Use a boolean flag instead of passing a function pointer.
> 
>   drivers/mtd/mtdconcat.c | 44 +++++++++++------------------------------
>   1 file changed, 12 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
> index cbc5925e6440..6cb60dea509a 100644
> --- a/drivers/mtd/mtdconcat.c
> +++ b/drivers/mtd/mtdconcat.c
> @@ -451,7 +451,8 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
>   	return err;
>   }
>   
> -static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +static int concat_xxlock(struct mtd_info *mtd, loff_t ofs, uint64_t len,
> +			 bool is_lock)
>   {
>   	struct mtd_concat *concat = CONCAT(mtd);
>   	int i, err = -EINVAL;
> @@ -470,7 +471,10 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>   		else
>   			size = len;
>   
> -		err = mtd_lock(subdev, ofs, size);
> +		if (is_lock)
> +			err = mtd_lock(subdev, ofs, size);
> +		else
> +			err = mtd_unlock(subdev, ofs, size);
>   		if (err)
>   			break;
>   
> @@ -485,38 +489,14 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>   	return err;
>   }
>   
> -static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>   {
> -	struct mtd_concat *concat = CONCAT(mtd);
> -	int i, err = 0;
> -
> -	for (i = 0; i < concat->num_subdev; i++) {
> -		struct mtd_info *subdev = concat->subdev[i];
> -		uint64_t size;
> -
> -		if (ofs >= subdev->size) {
> -			size = 0;
> -			ofs -= subdev->size;
> -			continue;
> -		}
> -		if (ofs + len > subdev->size)
> -			size = subdev->size - ofs;
> -		else
> -			size = len;
> -
> -		err = mtd_unlock(subdev, ofs, size);
> -		if (err)
> -			break;
> -
> -		len -= size;
> -		if (len == 0)
> -			break;
> -
> -		err = -EINVAL;
> -		ofs = 0;
> -	}
> +	return concat_xxlock(mtd, ofs, len, true);
> +}
>   
> -	return err;
> +static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +{
> +	return concat_xxlock(mtd, ofs, len, false);
>   }
>   
>   static void concat_sync(struct mtd_info *mtd)
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
