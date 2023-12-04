Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC62C10DC1
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Dec 2023 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5grxKMYN3i7rnp0+dkuR4CH24O5AfyWoNRiWNfwj5dg=; b=c9YMtWOWBmOBSc
	G9k7qot2b75jIXpCaXtWJFw3ix+DvidysSWya5aQ1MiuaC7x8G3smDt8pZnL2DKiNN434Dj2xPfWH
	knNvXXzIXEyiCkx6DQzmwYCe6jjwi4EGEMMUSnrNhYVqvqh68ZonBwabaP60uePneP0zScCL7ZLW7
	+BU6W/3q0Tuf2D4PJ8pQwIxIGKO9g2JT78YGmnqNu+EYbWQcwr13K4LKx7unI+U0Hc5n9DAhx5knj
	ANlGeLG2OKPeykelmKXvVfflVedynLDe8e8Mqu3ok/rF99gP+J4O0pGleL78355IPcVMuMJGTrfpX
	G5C7g3Y51eyeza1CQdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3UT-003A1f-09;
	Mon, 04 Dec 2023 07:35:41 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3UO-003A0W-2v
	for linux-mtd@lists.infradead.org;
	Mon, 04 Dec 2023 07:35:38 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c9fe0b5b28so9943061fa.1
        for <linux-mtd@lists.infradead.org>; Sun, 03 Dec 2023 23:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701675331; x=1702280131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1fUjLJmh2Dt0fZbnU8dCjpU5MsAgRcMH7PutAZxzOsg=;
        b=yK8MzPhLNTnkBceQD5TUXCwGppuIe+/mxyI0p9Kb+RG3MNDQVkh4TF1CD5tU4p7A1a
         IpdGGNHbZp/iVH8wddRmEgmwYfTsUD8/vKTO1OL0a2vPgpmv28FBNPfG0d3tfNMrd7ZE
         M4Rq/N9RqwWCltNLL8xbEOLGVhU/lY5nqkuLkExXtrvM3Y80dIfBSbPLCWShL9AVmKcf
         ZGD0hudnK3qpx/ajQLmW7MUegekRgxvRayqkeY0wlj3OSe74pLwd+W/tXIsQEkA457ma
         AVZmqcVZhUdyzURFFMJLXLYIASRgf8fzVRgHFxgE5zecvHWlL7zX0NMjTipiRu0QRlHz
         8UQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701675331; x=1702280131;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fUjLJmh2Dt0fZbnU8dCjpU5MsAgRcMH7PutAZxzOsg=;
        b=pUBNwkflJ7MAIknDmjeHTruKYzw7aSnrRu0X4DF8mwUkNmXwliifDCz3CbN/ij2TEL
         Wzqisj9EEky8qwLhW8RNAZcbVxz1z962HMQfPD+gT5aymr0JSkCqApeCHpeZFmD9lHX3
         RJu8UfZxAPuVuvws+MqSvK0teUTmJPN5Rf7BzVBInrQiGqDa+P4B840Dmr2jfs1fVogM
         uYQsx+z1QFx/VVyh7DdAj8dh0rPvVJtgxiKYW1m8Z2MmWqH4+tVs/U13BCmlHkonaAfz
         YqxdCEuwW9VDAK5/Bqf78cC9qfHXyJEbKN/hSWqUPVee1gMksiBklPs8s7zvdS6tVmOJ
         Rp4A==
X-Gm-Message-State: AOJu0YxcT+udSQ8BeMhm+Xqnc6eKpyiWrPPLSr4mGa26/KGV2BIu0iYo
	+VnA09xcjinIoT9v5jV5yqqc7w==
X-Google-Smtp-Source: AGHT+IH7ISEZqFsqY3dW9HeSP9LLIYIUBm63rjd+pMoEkZJYFiMGmNxd73fDHbeRNs3GZ7Y04OTbLw==
X-Received: by 2002:a2e:b60e:0:b0:2c9:eae0:3e09 with SMTP id r14-20020a2eb60e000000b002c9eae03e09mr1455445ljn.19.1701675330441;
        Sun, 03 Dec 2023 23:35:30 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d680c000000b003333e09990dsm5021695wru.8.2023.12.03.23.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 23:35:30 -0800 (PST)
Message-ID: <d32f9632-7d03-4a78-9bf9-622de518cb28@linaro.org>
Date: Mon, 4 Dec 2023 07:35:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] spi: mxic: Add support for swapping byte
Content-Language: en-US
To: liao jaime <jaimeliao.tw@gmail.com>, Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
 <20231130083854.55221-6-jaimeliao.tw@gmail.com>
 <eb145cfb0cf10330f5125f0c7d2224eb@walle.cc>
 <CAAQoYRm=5smXRSRJki8MB3yOuh4UeQO4oBYG8JSG29bbyADHGA@mail.gmail.com>
 <d42c102528ac8d4188147b6e23b18612@walle.cc>
 <CAAQoYRnF5zn+RH6LaQfPioOnbRADG8LXBuVpBbQvDGGYqJX1-g@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAQoYRnF5zn+RH6LaQfPioOnbRADG8LXBuVpBbQvDGGYqJX1-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_233537_027883_90C97744 
X-CRM114-Status: GOOD (  25.42  )
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

Hi, Jaime, Michael,

Allow me to try to intermediate this :).

On 12/4/23 06:44, liao jaime wrote:
> Hi Michael
> 
> 
>>
>> Hi Jaime,
>>
>>>>> Some SPI-NOR flash swap the bytes on a 16-bit boundary when
>>>>> configured in Octal DTR mode. It means data format D0 D1 D2 D3
>>>>> would be swapped to D1 D0 D3 D2. So that whether controller
>>>>> support swapping bytes should be checked before enable Octal
>>>>> DTR mode. Add swap byte support on a 16-bit boundary when
>>>>> configured in Octal DTR mode for Macronix xSPI host controller
>>>>> dirver.
>>>>>
>>>>> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
>>>>> ---
>>>>>  drivers/spi/spi-mxic.c | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
>>>>> index 60c9f3048ac9..085c9037d6f5 100644
>>>>> --- a/drivers/spi/spi-mxic.c
>>>>> +++ b/drivers/spi/spi-mxic.c
>>>>> @@ -572,6 +572,7 @@ static const struct spi_controller_mem_ops
>>>>> mxic_spi_mem_ops = {
>>>>>
>>>>>  static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
>>>>>       .dtr = true,
>>>>> +     .dtr_swab16 = true,
>>>>>       .ecc = true,
>>>>>  };
>>>>
>>>> I'm confused. How can this swap the bytes depending on the flashes
>>>> requirements? I.e. the controller should look at the spi-mem operation
>>>> and either swap the bytes or it should leave them as is.
>>> Byte order in 8D-8D-8D mode could get by parsing BFPT 18th Dword 31th
>>> bit.
>>> I think flash driver should notify controller driver and verify whether
>>> the
>>> controller driver support byte swap functionality. If flash requires
>>> byte swap
>>> in octal DTR mode but the controller driver doesn't support it, then
>>> octal DTR
>>> should not be enabled.
>>
>> Correct. But the above means, the controller *supports* swapping the
>> bytes
>> if the flash requires it. But where is the code in the spi-mxic driver
>> which
>> actually controls the swapping depending on the dtr_swab16 property in
>> spi_mem_op?
> I add it additionally because of controller driver should enable swap byte
> feature on special case only.
> I programed data in 1s-1s-1s mode and read back in 8d-8d-8d mode
> with controller swapped byte.
> Then check program data(in 1s-1s-1s) and read data(in 8d-8d-8d).
> In normal case, 8d-8d-8d prgram then 8d-8d-8d read, controller driver
> should disable swapping byte feature.
> So that I don't think controller driver swapping byte feature should depends
> on dtr_swab16.
> 

I assume Michael's concerns are that if we don't have a controller that
actually supports and implements dtr_swab16, then we risk that all the
SPI NOR related code to be removed on a further cleanup, as in kernel we
don't add support that's not used.

Then Michael rightly asks about the details of this patch. Why adding a
dtr_swab16 mem caps in this driver if it's not used? We expect a
register write, specifying the controller to swap bytes. You missed
that. Can this controller swap the bytes? If yes, what needs to be
configured in order to swap the bytes?

Michael,

I know for sure that mchp's sama7g5 xSPI controller can swap the bytes
back on the fly. What I did was to check the dtr_swab16 bool at runtime
in the exec_op() method and if it was true, I had to write a
configuration bit. I can't remember why I haven't posted a v2 on that
series, maybe I'll do it if I find some time or I ever get bored. I have
a board. Anyway, knowing that there's a board out there, sama7g5ek, that
contains a macronix flash that swaps bytes and also have a controller
that can swap them back, would it be acceptable to queue just the SPI
NOR patches for now?

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
