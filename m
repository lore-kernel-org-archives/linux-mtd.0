Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F7ACF9C6F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 14:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dkjsBe68baP1+aiOQr+hmPlBxFqVPrATa/SXkXS6r8=; b=jgmRZbbRkDQ2HA
	LQz1PvM+3T/9BKDaMEIqLeGAel6rLC4cdpUoM6mbBbGIref3h6IWM3MuDAUlotSL7cTTZz2I8DFUD
	QppmYj4Q/OvodKlqSZCqsjX/sN/iPqrmCG2d7Mn5EwntVEKzHsTCwwyt4nacAWQnjrvlXYCUJHQVA
	ihKgz7tcn2Pq3v4/dVwFV5eFHlBbu8JTrwnen/SzlkFTFH4In53wwnHjgKTHUGKw2rxk4xn7yBcF1
	woIG0QaYPCOAIX+hUU8Mh2JF0D2JfZDBLjPuSgIyQpUVEbrWJliE1ft8bpsDuY/IyXyiZl6BPpSu6
	yjMtrWnb5ETZbVXtTv9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st6Xy-00000002Y49-0h4S;
	Tue, 24 Sep 2024 14:29:46 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st6Xv-00000002Y3d-0OUD
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 14:29:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5356bb55224so7571082e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2024 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727188181; x=1727792981; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4cZlZAMjE0Ne1cxdgDT0MlDCgX/48/03XwVDrLKtwc=;
        b=WVPWH5VCon4pIo7RGCuk2d6a85TTwrl7tvtvav/1QRuZK5nW8iOViu0rlgItYy+C2F
         /uyHLKBkAx2ShXsCJjaWuKuiFzvjSjzPCP7kSbDyQxq9aINKcdTnj9hLTZq7laaWMJlE
         wDn8YNNNa7BV7k7iIWwyd7ZW9zX6m9lghdY4a+zmyd5xhShHzXTtgxFsC0VUZUlzLh0E
         snL2Jn8DO251WMut5dyxejeS1s+lllE/5XuumjZ26Mbk8sHAMDGtVS0+TRgIGGUXaYgy
         XRe7ZaMQ4DoNKV5rTMznO2elMS0gKMNDehuYptguYFCyIaAVyxU1X4eocDZe751Js5X7
         Dekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727188181; x=1727792981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f4cZlZAMjE0Ne1cxdgDT0MlDCgX/48/03XwVDrLKtwc=;
        b=WsRgwCpuXtlZuw83BfmRdR3qWiD1WvVr8QPJoPDhP0MyjA7c0llTyOyCAzKG4p7oq8
         ncLQLeRr38vGn+Ed87naNAY1vVuPpNDbgH6+7U+gLODnDWS+U7bfHlDigTx4ry7tmRTy
         VKtv7nhI/x0vpGQCSJiGbBx8buzUxKQuZvkKQLWqIgsON48dbiAwED9gBaZ7hWGpc0Ay
         8W10IsjaPOyu7AxerBVtz6gA3gz0MIwkY0ZKbIviePNvmOGNyf3zdnEQQmdrdiJVMcgU
         uEhbRY8orOpFLJ9z4pnKH4uFrEalixl44RQPEAeJGKStE4VnPfXxoaKre0pPMEvz2tqu
         rQiw==
X-Gm-Message-State: AOJu0YzD5QrJFdl8xrYqlvhok+0jWyHCutbLWHFhFXiOMwGgVpWutc2q
	3HWR77uQlkKBpimEs6oE2zPCs0dXa1+PEAsK5w0iWEk4+jtdkdN7R9oa5beZzbE=
X-Google-Smtp-Source: AGHT+IHqqbNSNbNJsHX8o3utWIHB/GoQ4Xc0CjtuLGIi0iI5bbvuRybVAXmwL11ncdRlK449c9p3oA==
X-Received: by 2002:ac2:4e09:0:b0:532:fdba:e7bc with SMTP id 2adb3069b0e04-536ad3f168fmr7657143e87.57.1727188180585;
        Tue, 24 Sep 2024 07:29:40 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae67sm89840866b.121.2024.09.24.07.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 07:29:39 -0700 (PDT)
Message-ID: <a87a159e-eff1-45c3-bf26-115d4ca5a9be@linaro.org>
Date: Tue, 24 Sep 2024 15:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] spi: mxic: Add support for swapping byte
To: Mark Brown <broonie@kernel.org>, AlvinZhou <alvinzhou.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratyush@kernel.org, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 chengminglin@mxic.com.tw, leoyu@mxic.com.tw,
 AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-6-alvinzhou.tw@gmail.com>
 <ZvKktPc0luV9hItN@finisterre.sirena.org.uk>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ZvKktPc0luV9hItN@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_072943_181099_392C97D4 
X-CRM114-Status: GOOD (  11.62  )
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

Hi, Mark,

On 9/24/24 12:38 PM, Mark Brown wrote:
> On Thu, Jul 18, 2024 at 11:46:13AM +0800, AlvinZhou wrote:
>> From: AlvinZhou <alvinzhou@mxic.com.tw>
>>
>> Some SPI-NOR flash swap the bytes on a 16-bit boundary when
>> configured in Octal DTR mode. It means data format D0 D1 D2 D3
>> would be swapped to D1 D0 D3 D2. So that whether controller
>> support swapping bytes should be checked before enable Octal
>> DTR mode. Add swap byte support on a 16-bit boundary when
>> configured in Octal DTR mode for Macronix xSPI host controller
>> dirver.
> 
> driver

I can amend that.

> 
> Acked-by: Mark Brown <broonie@kernel.org>

I'm fine with the SPI bits as well. Shall I take the SPI/SPIMEM patches
through mtd and provide you an immutable tag? I can do that after -rc1
is out.

Or you can take them directly through spi/, but I'll need an immutable tag.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
