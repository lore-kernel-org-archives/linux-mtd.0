Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A95C30653
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 10:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6966KuU0LWydx79EBF1NLRRMifmoyIhRBQdAZi6992Q=; b=Ocec3lzBY1QRvt
	A2zbEDUC7RRFoLz4V070O3qgsHvTz5kLWFydvH2z+qFdR3448pEshotwKx1cQu5eJb7NzBheBdfuO
	QVh1c7VjcXoFg3IJZdoNzcqy4iFz0vgzQkxqprrl/0QvIZ9a753LVS1HpQZXFeff9fsGGogZE2w6c
	2tiXePGAt89uFFiwoTfsRu6s1k2bIvBz6p+bI/18lLssJP12l8OAsRA7xnQEBiuJnVzeJGsclnC0E
	lUdUvqOSRbaaqWXuRmlIQfVeddS9ZM924fHVyVhFerqxQCsk/TOTtqFBEfhJRxCwF6sRzPIGRvbGG
	mwuUmpT4NtC15n5vqGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOEBo-00000002e7J-054l;
	Mon, 01 Jul 2024 10:23:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOEBk-00000002e4f-3Amo
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 10:23:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso25464685e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2024 03:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719829391; x=1720434191; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=es72ued27T4MScFVaYol2Tr8ps+FK1gW8G/gs4qGvrk=;
        b=vnN7wAfsPkpfTLCF1cRMYqDXAUeLT7pliCwB7LWY7yCsQevCrQC5dtboaSl4wnR3BD
         HhmlpUS45Jg1+SEXeW9ucQH6traUzB6I+6don1bCLXK5hBqkH8ocarnSmWrOUe+AQdoR
         NmjGc+poHo+MDbhaK5UbPFaAIwoC8xyLgnwrxqg/FG5jvDsZ965Z5mcq+EK0VnA0PR9e
         CMm3uyb0vJG1XONRXT68TMEIZ6gRwwmWqgITLdWf97xhHRbBZeHmo87QxzlnbpAlj2D2
         9r1KeBz2biJBgayQzshJrC1aQqcRdffzfweEOcXsYn28HqXM7RFoHqJxlGTsyjqn3KEb
         Zszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719829391; x=1720434191;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=es72ued27T4MScFVaYol2Tr8ps+FK1gW8G/gs4qGvrk=;
        b=QlhBFO+W3qmiJ+cYHYxkC/McT4B9P5W/HiZr66k/CyADx+rjYuW38zxrnfBnT/CS05
         5HtpEGQJQflZiqz1z4Qhb7ry32QA0oD2ztSdE1kcPEvCnoX1PU22m3grdpB5/wFi6Vy1
         q33hHmzq8goTOiXn9jQs8wgjU/U5Z4zo2WhqVzBR1AerH44A2KgLcaXBO1cQs6DSHgdu
         0JqrwBAIYFNr+7756PUwlzDv5cb0m2zE03vWLz1FiiOgmrLu7LlzvT4nu9+yveWCg40w
         4kmBMsT1wxAC43VOyjMxnH3bRXpx7E/4wNk4Z7D9qwFpoh3fEwxNjgCr0eQ2HvbfE7aK
         bn7A==
X-Forwarded-Encrypted: i=1; AJvYcCVg+aFq6oXxo9NoXmQwri1EJInrzpVFB/y+m8TqJXtGTDEO8rxpgv3BDC3hrLY8f6T4Mj1VU1Z/IV2iywNzsn5ImseHVXKw9I0RYCnibg==
X-Gm-Message-State: AOJu0Yw6Fs1TFL/42MSR8vmxiB29R1oYdNelKGW/mZBqXQ7uvNHo6A+D
	2d1xKHsO4OHxG2Lksoay1/pj+mGzArzUJyS28Xzj9mI0ni+6ICOm6WMWvGSZSiPpS31tcdp3vfj
	Q
X-Google-Smtp-Source: AGHT+IFwf8NGDtaFlS7TXsmaKZFBedPeQ9EYRZFjtGYPSpWoAoCiJI6iD0t3kI8k4Et64t0vGIvb7Q==
X-Received: by 2002:a05:600c:4804:b0:425:7784:56e6 with SMTP id 5b1f17b1804b1-4257a007729mr43982445e9.11.1719829391130;
        Mon, 01 Jul 2024 03:23:11 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af557fesm148418925e9.11.2024.07.01.03.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 03:23:10 -0700 (PDT)
Message-ID: <04f5162d-8a95-45ce-a891-3f711b27a469@linaro.org>
Date: Mon, 1 Jul 2024 11:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Erez <erezgeva2@gmail.com>, Esben Haabendal <esben@geanix.com>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20240629103914.161530-1-erezgeva@nwtime.org>
 <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org>
 <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
 <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org>
Content-Language: en-US
In-Reply-To: <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_032312_834295_12649ACB 
X-CRM114-Status: GOOD (  15.04  )
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



On 7/1/24 11:15 AM, Tudor Ambarus wrote:
> 
> 
> On 7/1/24 10:46 AM, Erez wrote:
>> When using mx25l12805d, we do not read SFDP.
>> As it uses the no-SFDP flags.
>> When using mx25l12833f hardware with mx25l12805d driver, it did not
>> try to read the SFDP.
>> Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
>> driver fetch the SFDP.
>>
>> Secondly SFDP does not contain OTP information.
>>
>> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
>> While mx25l12833f has two OTP regions of 512 KiB.
>>
>> How do we handle it?
> 
> You would first try to parse SFDP and initialize the flash based on
> SFDP. If there's no SFDP then you fallback to the flags declared at
> flash declaration. Esben had a try recently, see [1]. I don't know if
> there's any progress in that direction.
> 

And you can then decide which OTP org to use based on whether SFDP is
present or not.

> Also, you haven't mentioned anything about the testing. Do you have the
> flash?
> 
> [1]
> https://lore.kernel.org/linux-mtd/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
