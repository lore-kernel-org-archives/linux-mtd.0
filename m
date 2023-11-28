Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80BCC4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqTsrCOT9zbPtCdmpECLTa6/UZOV1RXXabhP079XxLk=; b=F4CTnyE/hjuke0
	RaZ2IidwtFwg+MoplhuPgkY1+OKbgAiyOzKyJss0CIpBhI4gim6DEFkPhfDTl7wnfpPDHX3UaPAeH
	i1TZwojR4fhp8Bdjhp8zYKiameT2ePr4ynzEKInxKwqiCbeI/c1kWoCEEmXrfbs5Y7e8yQ06VFZ8g
	cQdEmy7fq63PulTtquVTBZKyhwv6BIxgVQaovtuQkNEr9zyju0xPsZJXSoehLGftQgcsG0Fd2a0l8
	gRxUvmKdd4WFR/Tl5X2tLUuA8uQRZmQoyHamY9afNN377n+oPSGXPtBzBOix/1oRbFHCBqaDmgHS1
	24zpCAA1NBOffv/kcuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7uYq-004laC-2O;
	Tue, 28 Nov 2023 09:39:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7uYn-004lZp-25
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 09:39:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-332e3664665so3143575f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 28 Nov 2023 01:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701164355; x=1701769155; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F35KnoNBRL3FeAGOoToZvSSFOaDEqHRjPz6QpcJHB9w=;
        b=t58iTMPQFQlOTHcKl7jVz3ZSMKR+h3SClBDmp56CMTEScr/mA9AqxFoMzjQcHdjbci
         SkwZM5f4qFNKZ0U73HKrfh9DrX9EuuO25jl4r0hCiwI3yIVvOiPYgf0VUMO7EjH7jJdQ
         6Uo/TprZWrq7pEPp/UyuRnoLCOmokClCMF2iHS0k/y1I5Gf/QNHuzr6mwPf5GYM9Ax7C
         GFqaFbrQfNfxNOibRg3dsuPx8FAoUOHotRZXW/r9zHgYHc38C8TKK/GaOo0lQt6y3XtW
         IqWLulONSdLLG6DLZwa6yT2XA7+WHVtMi3Vljj+ssU5AeF2Naupq9PB/1+mtQpD+PkvA
         BQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701164355; x=1701769155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F35KnoNBRL3FeAGOoToZvSSFOaDEqHRjPz6QpcJHB9w=;
        b=Z/sBA4j1v66b0cPmzsLwXkSpPsD4xgmoIQ9zFD7IhPJkiCgf3AwJH1NkyhdJDeHTg3
         DhzWeDrepeeBydKeTY2V6pcH1ES6BFEvxI2hnzRDXVhwqT3V+jtwUtwts0z83U7+oqhp
         grrOtoiLGsDFJjPrgDrnHrW1C/UcznFnh3MuNrdpK0TqXMu77SLhE2mIWvv9F3jnrdsK
         uMxXeMKacB/HYv/2mYrOVT3zcV0QqxU+O6Gi1CpppwHhDsVCOALcavT2cIBu4aB8Ol9T
         kZCL3Qfae2Ow3oSt10zOB5ZX20h7sU6wGr+IOfx8IpHTuUYwwcYTViiGmyYn5heIagmI
         dL5A==
X-Gm-Message-State: AOJu0YyYAToHufC+c+4lXt2ZA6jMFyPUql16rdQK+yW+s4GdHzr0KafA
	7Xmv/2tBQrNxQuu+TzJ4Koqe1g==
X-Google-Smtp-Source: AGHT+IEXQ9CWLukCvGCcAvDbOjjedJ0095mcnpHjjNGA+wRHrHmOcRQ67nOPBQ3Vl8R6qi5y7tkusQ==
X-Received: by 2002:a5d:4e0d:0:b0:332:eeb1:3e7b with SMTP id p13-20020a5d4e0d000000b00332eeb13e7bmr7582956wrt.7.1701164355522;
        Tue, 28 Nov 2023 01:39:15 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id v6-20020a5d4a46000000b003330b55b941sm1536039wrs.77.2023.11.28.01.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:39:15 -0800 (PST)
Message-ID: <d7bb4580-00b9-4206-bbfc-bd203c21a877@linaro.org>
Date: Tue, 28 Nov 2023 09:39:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: stop printing superfluous debug info
Content-Language: en-US
To: liao jaime <jaimeliao.tw@gmail.com>, Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, jaimeliao@mxic.com.tw,
 pratyush@kernel.org, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
 <42c96d63d1ea4f7e8f16a3c8eb0a4cf1@walle.cc> <20231128100313.3c990f69@xps-13>
 <18ba4126dbd9e49846344b517ad2fbdd@walle.cc>
 <CAAQoYR=ZAEVeoCwkRmky2CHVeKGX55JijM8Q6D5msz_5iW+jtw@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAQoYR=ZAEVeoCwkRmky2CHVeKGX55JijM8Q6D5msz_5iW+jtw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_013917_705151_ABC3E94B 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


cut

>>> Maybe we don't need this at all, as long as one message remains about
>>> the JEDEC ID, but keep in mind that spi-nors are commonly storing the
>>> rootfs and if your spi-nor does not boot you don't have a userspace yet
>>> and all the debugfs entries are purely useless.
>>
>> Good point.
>>
>> Just curious, do you know any boards which has the rootfs writable on
>> the spi-nor flash?
> I am also interested.
> 

Having the rootfs stored on SPI NOR is a poor design decision as you're
better of with a NAND, which is cheaper and faster on writes. I tried in
the past a ubifs on top of a large (64 and 128MB) SPI NOR flash. But
they were plug-able flashes, not something that is always tied to the
board. Microchip's sama7g5ek comes with a 128MB macronix SPI NOR flash
populated. But there are other vendors that provide large SPI NORs if
really needed.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
