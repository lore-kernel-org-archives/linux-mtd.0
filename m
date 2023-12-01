Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5243C07E97
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Dec 2023 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NuE9/FZQgUD7wHHXPDv4ChozkpoBJ92JIfma+fm69Y=; b=X2frkmJCpUG5IiHaK6pHX4zncY
	yjKc2vFaLDGTIajTihgRljYsaerZMcFHMdkWp1tmrry+dEOAMwOOz/hg67CH8kb6mjmV808gu0mUU
	akc4ycbfllyOF7oSk/OplNsdTzt2EZd0p3koCRLqSNEnC5zv1HqVDdG7awXY4U1xKN4iLRZaKXFx6
	g5wY/6sp/nvpNXnRvAdhfJAxcT9NPsEfsG9qb2rasXLpvDbuR01VxSVBDsBgk9co4tfrWF5yOS5W8
	8BL6SBFo0Vja0s7U9xHhBlgq7z+ZbVG0bw+bQkdE2bRgJ885mtTkx4Quq+JVHe0S10126JtrjR9bo
	UYkPgpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ypz-00Cxwj-1o;
	Fri, 01 Dec 2023 08:25:27 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ypv-00CxvO-02
	for linux-mtd@lists.infradead.org;
	Fri, 01 Dec 2023 08:25:24 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2221F437;
	Fri,  1 Dec 2023 09:25:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701419114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhXDRmi4tfPVc7FC6DMxt3oqC+b1zMorJlBynF8aFYk=;
	b=ZAZmefU4PyO+h9YOCGHuZQWmoxurvNu2vnXpaChftOvV3I2kJ3aeFumOjoUFp1eriV687B
	0s7DfhyYjO+vHo0hyO4CKUSFqlrmwP+vW/wThMDg1Zaak2jI9hVoPBdhwCua4wXrjcYc7/
	1EA+Xw8ZqWNrVMarNFVKhYnV8UBis0566lBRpFkCJVixX+MFjeXRVnqB6+xwQsUDRWKtWi
	IWM8KlL82CGBjVSMfUigeX0c8SOmGtTjT2ft557IYiTtClGqJNy0fFX+M+Z7i9+FkgEFli
	wigNMCxNaLEt3AgZ09+RpMPrEYCNlng77LZ99tWRJrsevHwZYrhRrPFilI5aSg==
MIME-Version: 1.0
Date: Fri, 01 Dec 2023 09:25:13 +0100
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v6 5/7] spi: mxic: Add support for swapping byte
In-Reply-To: <CAAQoYRm=5smXRSRJki8MB3yOuh4UeQO4oBYG8JSG29bbyADHGA@mail.gmail.com>
References: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
 <20231130083854.55221-6-jaimeliao.tw@gmail.com>
 <eb145cfb0cf10330f5125f0c7d2224eb@walle.cc>
 <CAAQoYRm=5smXRSRJki8MB3yOuh4UeQO4oBYG8JSG29bbyADHGA@mail.gmail.com>
Message-ID: <d42c102528ac8d4188147b6e23b18612@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_002523_202246_6D7E8752 
X-CRM114-Status: GOOD (  22.29  )
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

Hi Jaime,

>> > Some SPI-NOR flash swap the bytes on a 16-bit boundary when
>> > configured in Octal DTR mode. It means data format D0 D1 D2 D3
>> > would be swapped to D1 D0 D3 D2. So that whether controller
>> > support swapping bytes should be checked before enable Octal
>> > DTR mode. Add swap byte support on a 16-bit boundary when
>> > configured in Octal DTR mode for Macronix xSPI host controller
>> > dirver.
>> >
>> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
>> > ---
>> >  drivers/spi/spi-mxic.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
>> > index 60c9f3048ac9..085c9037d6f5 100644
>> > --- a/drivers/spi/spi-mxic.c
>> > +++ b/drivers/spi/spi-mxic.c
>> > @@ -572,6 +572,7 @@ static const struct spi_controller_mem_ops
>> > mxic_spi_mem_ops = {
>> >
>> >  static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
>> >       .dtr = true,
>> > +     .dtr_swab16 = true,
>> >       .ecc = true,
>> >  };
>> 
>> I'm confused. How can this swap the bytes depending on the flashes
>> requirements? I.e. the controller should look at the spi-mem operation
>> and either swap the bytes or it should leave them as is.
> Byte order in 8D-8D-8D mode could get by parsing BFPT 18th Dword 31th 
> bit.
> I think flash driver should notify controller driver and verify whether 
> the
> controller driver support byte swap functionality. If flash requires 
> byte swap
> in octal DTR mode but the controller driver doesn't support it, then 
> octal DTR
> should not be enabled.

Correct. But the above means, the controller *supports* swapping the 
bytes
if the flash requires it. But where is the code in the spi-mxic driver 
which
actually controls the swapping depending on the dtr_swab16 property in
spi_mem_op?

> The controller driver should indicate in the
> description of
> "spi_controller_mem_caps" whether this feature is supported. The 
> implementation
> of this feature should be handled separately by each controller drive
> since the design
> may vary for each one.

Correct. And because your flashes apparently need that swapping, the 
driver
will have to have support for that.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
