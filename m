Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BEBC83F26
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 20:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXLmyJpxAfE/mzMwr9qJr6dnZObnGmuGEE0Zo3N1Dr0=; b=S30rfnMwguE2u2
	P/NC63Cb4l/bDXy+U9fUrOjNCIuruboQqjnVDpaEgWZPZHutYBNyKv6sucD3IWU2/fowH1mc7ADKA
	4CHAxHdoGVmpmb5x6h6+XF0JkCBHzzdOJLWFrTks1Ca5PlHfSxhskdVji37Si9zeDnBpDQLWxDTPu
	RfGOh1CS/Qt+WCHrz8LxZZcXFP6tvaeia/JNS+DfoZxEW9wd3hg7InAzynE/iSs8wZvHIZBD6+WlF
	GMPw9bZqSGXHU1Rm+C/BfBKF7niRm90RMG63eTJqVRUCLNtK0NcyyZ4NwKFns95nFfAXKPc3uorFB
	WcHEctDXwdlgDTg5rWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxVa-00000000fqF-2F3m;
	Mon, 21 Jul 2025 20:53:14 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxDY-00000000dkU-1bCR
	for linux-mtd@lists.infradead.org;
	Mon, 21 Jul 2025 20:34:37 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bmBvr5vCnz9sxb;
	Mon, 21 Jul 2025 22:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753130072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjMHqHnrbR9uOHiktuTKqoY5zCg3GeGQDLjsSoyvOm0=;
	b=pbggo5s3icq1EDv03NvOkzqtmk0anN/EGdZDMSq1RJuo59MEXMCMyQfuAUL8yivjDAUuiq
	a1SwP0YBhyOa5iQEF3tKApjhI05iOSF1IJJNHefUYc1ZQ+ydNp6UrhjRoZ77kFSfQKiEKK
	YQrF5DpCqhlSq0HuZciIHc1hO84Ug5Nd1R9RGeQkjqGca6cVUfV9N0BDq0Ed8NZMpwMRLV
	NQ/I2oq3/UpGMLjgLdTUV6A9Y/gvF2JwU9VNqcuJ4DgA8hTPzuYS58vIEszBrZ9Fsw25eR
	vQuxHdtbIaI8NYcGOeA2I7DV02lpUNhGQ1Ve/NFVrSxpf5e/N/Vy107K+W3zzA==
Message-ID: <ada14a84-0b98-485b-bd84-26666f7a9b3b@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753130070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjMHqHnrbR9uOHiktuTKqoY5zCg3GeGQDLjsSoyvOm0=;
	b=XNSoo6wrVkYR7ROKG/Zx3v6+n5I3sVoXsdB5kVwc6jq3b5r9AIuC9X6q6MEY91GrTIoVVB
	clBGyP9rZYOoCj0HN03Q+G2d/8dVAsrHONqGwvXnI8r+yLa8shfzzcFgK3kQ0XU1/X9L20
	EqRqFOVSsPwyrLZ4XZHpcniarqodSwV+59GS0NH1DOUvHLYr70hhIpsLy1xPDW43/hzlQx
	ia4OP2kY2ytTdoTyXt79+YVnwk4PdYUzREMwHCBADrlH0sbeco5+0vk8/GW3p9aY/tC52D
	Aw96RJb7/+G5rD+5qj3/CHIcJ19aKGL4+QRM8MPHhf/GvymzcTjaqWg/7w3o6A==
Date: Mon, 21 Jul 2025 22:34:28 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for W77Q51NW
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-mtd@lists.infradead.org
Cc: Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20250720195625.413715-1-marek.vasut+renesas@mailbox.org>
 <11349679-f1c4-4648-83ec-2292f1c2ae3f@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <11349679-f1c4-4648-83ec-2292f1c2ae3f@linaro.org>
X-MBO-RS-ID: 5e68372c44b02ec9c00
X-MBO-RS-META: 53q8xj3dgsennxtkko5bfhn3beg8i7ir
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_133436_565911_7E91B32C 
X-CRM114-Status: GOOD (  13.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On 7/21/25 11:28 AM, Tudor Ambarus wrote:

Hi,

>> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
>> index 63a93c9eb917..dcb6c9ec862a 100644
>> --- a/drivers/mtd/spi-nor/winbond.c
>> +++ b/drivers/mtd/spi-nor/winbond.c
>> @@ -343,6 +343,10 @@ static const struct flash_info winbond_nor_parts[] = {
>>   		.id = SNOR_ID(0xef, 0x80, 0x20),
>>   		.name = "w25q512nwm",
>>   		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
>> +	}, {
>> +		.id = SNOR_ID(0xef, 0x8a, 0x1a),
>> +		.name = "w77q51nw",
> 
> we concluded that the name is not relevant, as there can be flashes
> that update their name or worse, entirely different flashes that use
> the same flash ID. So please add the name as a comment, above the flash
> definition. See recent flash additions.
> 
> Also, we introduced some minimum testing requirements, so that we make
> sure that the flash was tested at the time of submission and also to
> save the dtb database in case other flashes reuse the flash ID, or
> different flavors appear, etc. Please do the tests described at:
> https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-requirements
Should all be part of V2 I just posted, thanks .

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
