Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D00C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 00:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 835E2222C9
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 00:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uTBZJ26S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Q8YE4WWO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 835E2222C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=sIrWXMSvtpfJ72Mmm69ebvAFMZqxZbiVXFA8M4dUdUQ=; b=uTBZJ26SZ0hgJT
	Mx4y4b+7mU4/b9t/whxI/Fihl/q5We4moGmlETAV8aNXQ/2tJAHh7TSKLwgrYv8DKS939cdHafi7h
	POpODMkiurPNv6FhppG0/Y5IWNbuDRuv5pid6FFDPS/fugR2ApZhKKbBq70welURtz9UIdz7wFEbb
	L/L2/EB/LOGP5DBxlyCTU45o7ASHH6rlUi2o2mVOECqw1mZe/kZcS4+WVp72H8qiHm4glehTz0ggM
	aYMlSrQa4etdz3Kng6y6u6VE7kvclRHZU+VbZmhGi856500qxpOj9pxRuFCiCtnCFz8OW7WWkaqR+
	H1z1aH1OWyYO+TYDFEKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu53z-0005VV-S3; Thu, 14 Feb 2019 00:39:39 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu53v-0005V1-Df
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 00:39:37 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 55253806A8;
 Thu, 14 Feb 2019 13:39:10 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1550104750;
 bh=XERIyS9xCRHoC2ivJ1kwcJgp7hlY1zyiZr+1YIZj2i8=;
 h=From:To:Subject:Date:References;
 b=Q8YE4WWOV9ZOecqa/pskyH3nz6eMaHhqzrvle2bhjdM4twnf1cDAjtEEYT6WKcLdo
 anXGdxsgpxwtAqhrHbsDFXDrP1Fb5azFcs1fPqOjp5fNUGhoSZods4uKi2zdQyva8a
 /HJRcRqNpPVmsD7NUKTw84uiV/123AtN6nslr7V9ytR++bmviUfXaiFOvynq9tjLFn
 n5InBzWKB73/iHGYs9qEQJua2O2iLOU84aX1gLC/C+awyF+XeC/nSa+YAgAoCkEr0y
 F3cFZXHbry+8U2LbsccJ01xyF1eZhrFw8XG1N+Liy+DcYZU28e0cqY+iA6gMIbyAco
 ZSX8SN1a+fHhw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5c64b8ad0000>; Thu, 14 Feb 2019 13:39:09 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Thu, 14 Feb 2019 13:39:10 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Thu, 14 Feb 2019 13:39:10 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Przemyslaw Sobon <psobon@amazon.com>, "bbrezillon@kernel.org"
 <bbrezillon@kernel.org>, "Joakim.Tjernlund@infinera.com"
 <Joakim.Tjernlund@infinera.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "fbettoni@gmail.com" <fbettoni@gmail.com>,
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>,
 "liujian56@huawei.com" <liujian56@huawei.com>, Mark Tomlinson
 <Mark.Tomlinson@alliedtelesis.co.nz>
Subject: Re: mtd: cfi: Fixed endless loop problem in CFI when value was
 written but corrupted.
Thread-Topic: mtd: cfi: Fixed endless loop problem in CFI when value was
 written but corrupted.
Thread-Index: AQHUw/2yaFopaTJblkCsDO0mtD692g==
Date: Thu, 14 Feb 2019 00:39:09 +0000
Message-ID: <e945b943b2204d4d927391ffd068491d@svr-chch-ex1.atlnz.lc>
References: <20190207235806.GA39580@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_163936_077390_50C34CCD 
X-CRM114-Status: GOOD (  13.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi All,

On 8/02/19 12:58 PM, Przemyslaw Sobon wrote:
> Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer to
>         check correct value)
> 
> There was an endless loop in CFI Flash driver when a value was written
> incorrectly. In such case chip_ready returns true but chip_good returns
> false and we never get out of the loop.
> 
> The solution was to break the loop in 2 cases, either device is ready or
> device is not ready and timeout elapsed. The correctness of the write is
> checked after the loop ended. That way we ensure the loop always ends.
> 
> Signed-off-by: Przemyslaw Sobon <psobon@amazon.com>

Mark (cc'd) has done some testing here, and assuming he's happy with the 
forgery.

Tested-by: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>

> ---
>   drivers/mtd/chips/cfi_cmdset_0002.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 72428b6bfc47..6cc31d2057e9 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1879,15 +1879,18 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>   		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
>   			break;
>   
> -		if (chip_good(map, adr, datum)) {
> -			xip_enable(map, chip, adr);
> -			goto op_done;
> -		}
> +		if (chip_ready(map, adr))
> +			break;
>   
>   		/* Latency issues. Drop the lock, wait a while and retry */
>   		UDELAY(map, chip, adr, 1);
>   	}
>   
> +	if (chip_good(map, adr, datum)) {
> +		xip_enable(map, chip, adr);
> +		goto op_done;
> +	}
> +
>   	/*
>   	 * Recovery from write-buffer programming failures requires
>   	 * the write-to-buffer-reset sequence.  Since the last part
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
