Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC24C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11Dl4a8pR8q5Nxn0oj+JJxvit1HVF1U4DOHDJRPYGvs=; b=w6WUG862yMmKFcpq3GJPj0tg+X
	ykGUC9/J9BoadX25FnM8d46rYOGgisHkYHFciFmyj4IKVL6gji/dyd3LFi5ZuhYb5hm07+cS7f5pZ
	+UupzdZjR5LOdnPiee0YCgBIlPGk5DfxHAOt6pCH/wtH2CIO9SB1fm/Q9eLzmYOapM/WmJaV0rmNW
	kef2zOUIyhfbyRXlJG8ITe9/1EfzgUH0GHQq12nnDDmGrtEcWQim7m5Ql7cU2V/Sp80k9wC3p0lBn
	tRguEsgAIzW350Po2hZq8XpkwxWydgqplORjzknVRJcP5x/sOrToSk7VsUkHN0UqPn7Fy4oOqjmx+
	r1i2J77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7d2V-002kqa-2O;
	Mon, 27 Nov 2023 14:56:47 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7d2S-002kph-1v
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 14:56:45 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id F2CDD132;
	Mon, 27 Nov 2023 15:56:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701097000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Co1syxlnPGDLe31aWb9o7hRE9YDybiOO3zM/awvsmA0=;
	b=qBqrnY/NbjvbOVDNdw1HM30rDJnTgjGEWr8YKehwH/m1RdjsjGtTMIRAgF+KyBjIi4zd3U
	2mTiV0tva03xKy0oy4UIiOYyd1EFv1TOwIB8ePNrpYVCcpvw4e2DYoi74EoERt2xufOTWh
	8YhOxQRRj1Avczg45ZrYdJG14XQmh72U6yGv2PkH42ovZWu8zFJg5lI/0kkI7LngdGvP6X
	ayxsD2YIG9pqKgdDXgh2UCRy66ID5QEX/EVWXdaICFsxo65bQjIq8xX+OOWSnI9g6BPfjo
	okCA4m1+UwJ0/JEIL59GwiA69N+9sjUW/R2v8Wv58xYA6ctJkv6Tw+HmjgcCpA==
MIME-Version: 1.0
Date: Mon, 27 Nov 2023 15:56:39 +0100
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v1 2/2] mtd: spi-nor: hide flash name when the flash name
 does not exist
In-Reply-To: <20231127154737.534db375@xps-13>
References: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
 <20231127100756.41605-3-jaimeliao.tw@gmail.com>
 <6d362dd698095b04dd895019d3af26d0@walle.cc> <20231127154737.534db375@xps-13>
Message-ID: <848f3b2e83d363fd69adfc947b197011@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_065644_791326_D9E357B0 
X-CRM114-Status: GOOD (  16.29  )
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

Hi,

>> > (null) will print when flash ID founded in ID table but
>> > the flash name didn't include in it.
>> >
>> > Make info->name optional in the print for showing flash name
>> > and flash size.
>> >
>> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
>> > ---
>> >  drivers/mtd/spi-nor/core.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> > index 1c443fe568cf..73405bed2a5a 100644
>> > --- a/drivers/mtd/spi-nor/core.c
>> > +++ b/drivers/mtd/spi-nor/core.c
>> > @@ -3518,7 +3518,7 @@ int spi_nor_scan(struct spi_nor *nor, const char > *name,
>> >  	/* No mtd_info fields should be used up to this point. */
>> >  	spi_nor_set_mtd_info(nor);
>> >
>> > -	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>> > +	dev_info(dev, "%s (%lld Kbytes)\n", info->name ?: "",
>> 
>> Maybe print the jedec id if the name is empty.
> 
> What about always printing the jedec id if names aren't reliable
> enough?

I'm fine with that, too. Actually I've considered that myself, but
maybe Tudor or Pratyush want to keep the output backwards compatible.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
