Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A48C7618D
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Apr 2023 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oodwV6sMHkI04iH/xPj+Zt3M0W3Q1Iwzw47nngRAME0=; b=KrecK1MMfZqK2j
	tyGS/WdVRhyshv6Ih0nDXjl8T/2wqSIjuQYs9Z2oYRg/k8ghccbgdKxwiFZd9w6FpJbhbVuKhfVX4
	OegQK/hHDTVHIoWQzRaUKVIm7t5Oo2Aegn7xG8tMpjeXDjAA+hHCJA8EcWlHgFbddzb8MW2/tA7+c
	UuTbbn/ecQVrgAd9I6wA5/TlWeT/zbzhrNs/ikJK7x3nLfVhGiQw8CPHPApUbrUnfCUjUsaUhoiQE
	G7Tmj/guo0xMQ8K/L3frH8iMYgKuNhQUkonJcr0IzQYhBdwcxfD3/DgBmlZbYtLFiegAsrWJbAvAm
	gSgyVskdTtBACHD6XahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjbRV-000Mfw-2H;
	Tue, 04 Apr 2023 07:51:04 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjbQd-000MZ1-1A
	for linux-mtd@lists.infradead.org;
	Tue, 04 Apr 2023 07:50:13 +0000
Received: by mail-ed1-x531.google.com with SMTP id r11so126944919edd.5
        for <linux-mtd@lists.infradead.org>; Tue, 04 Apr 2023 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680594603;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kezhv9d6QR0moLZQZLP59cWk9hdbDvemawNvVPcvO0o=;
        b=ONPiOtXvw1WnROZZyuU6NhflgQtZrMnPFIM1ATOgixvqvJVKrbT/s/29p3XJN4lfpP
         dyRBaSA5Zbs4YtQAD0nn8d0J+RrnuBW+fbZuz/U4eLJ5R/ZOhAhfU4V3DUyg6GRpoY4W
         37OnZQYEYAmju68Blguz33UsbghEA4XFvZJC7BGLN46F784iuAo/qdxaskoYm4u4ocCv
         cLyulkzzaFLEC/Gv90MK/tlA5FRVkH2ohjEkVTJ2gaWMUCj4VJG0jhv279ebGUb1j2oB
         LviWeTa8lofl2+S9argZR2KgW/St6himvqr6BNmgLV3EvJhiFwU0fhxQVNT0RoPD/XE9
         Bq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680594603;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kezhv9d6QR0moLZQZLP59cWk9hdbDvemawNvVPcvO0o=;
        b=CjrSYDbkzg+e8WjSihxy1deCQ00hLHrFtUSWEkyBq2kDl7ON6DtOvEsgZK+kgR7uQj
         Mc4X4Gn1wyqrB6mGkH0UVFkENXATxCa+t9ONakpFKh/tL+9uw3fLCjo/HwaD2aVjlchm
         ybra+oVWPpr5z94jxWAtzQFpuaQEtpHUB6k8jjwwUwfU+Od1zrkFUUmR5uF/IOqEHIZ0
         fuP4ifZCb0R+81tMx6+1/Gp1ieby+jLXERjgB503H8ClHqXTBzyMHRebT2cP9fryio4f
         9Tiwv73X8cFagAA3/R+W7P8ARDh45zI96/hY1Rilv+NN13EO3OgveNt7i/YFdpWgI7Bg
         XQ8w==
X-Gm-Message-State: AAQBX9ezVOHQ7KEEKYEBXTTErjtiVEvskvVWo4p5+TZGNKsJl5D//4Ff
	XU+6IExKOuVs+0KqoHSWqMWpLw==
X-Google-Smtp-Source: AKy350ZBpn2yyLhTTc5gkoowZegpKLha1L/WSbCfyVM+Z0Ucu2CGAHQQ0RBLDa22iUcU9yCTpWqYSQ==
X-Received: by 2002:a17:907:1622:b0:930:18f5:d016 with SMTP id hb34-20020a170907162200b0093018f5d016mr1718523ejc.15.1680594603729;
        Tue, 04 Apr 2023 00:50:03 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id r3-20020a170906350300b00930876176e2sm5541252eja.29.2023.04.04.00.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 00:50:03 -0700 (PDT)
Message-ID: <6460dd2a-2aed-99a0-0e42-d65d26b39d36@linaro.org>
Date: Tue, 4 Apr 2023 10:50:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] mtd: spi-nor: spansion: Enable JFFS2 write buffer for
 Infineon SEMPER flash
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, stable@vger.kernel.org
References: <20230404071715.27147-1-Takahiro.Kuwano@infineon.com>
 <86b0ce12-0933-1fd7-d9c6-6e18ad7a9c56@linaro.org>
In-Reply-To: <86b0ce12-0933-1fd7-d9c6-6e18ad7a9c56@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_005012_057129_A476F7AD 
X-CRM114-Status: GOOD (  13.61  )
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



On 04.04.2023 10:45, Tudor Ambarus wrote:
> 
> 
> On 04.04.2023 10:17, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> Infineon(Cypress) SEMPER NOR flash family has on-die ECC and its program
>> granularity is 16-byte ECC data unit size. JFFS2 supports write buffer
>> mode for ECC'd NOR flash. To activate it, MTD_BIT_WRITEABLE needs to be
>> unset in mtd->flags.
>>
>> A new SNOR_F_ECC flag is introduced to determine if the part has on-die
>> ECC and if it has, MTD_BIT_WRITEABLE is unset.
>>
>> In vendor specific driver, a common cypress_nor_ecc_init() helper is
>> added. This helper takes care for ECC related initialization for SEMPER
>> flash family by setting up params->writesize and SNOR_F_ECC.
>>
>> Fixes: 6afcc84080c4 ("mtd: spi-nor: spansion: Add support for Infineon S25FS256T")
>> Fixes: b6b23833fc42 ("mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups")
>> Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
> 
> Would you please split this in 3 patches, first fixing c3266af101f2,
> then b6b23833fc42 and then 6afcc84080c4? It will help stable team
> backport each for each flash affected.
> 
> Looks good otherwise.

Here's how you can specify patch prerequisites:
https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

'''
Additionally, some patches submitted via Option 1 may have additional
patch prerequisites which can be cherry-picked. This can be specified in
the following format in the sign-off area:

Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
Cc: <stable@vger.kernel.org> # 3.3.x
Signed-off-by: Ingo Molnar <mingo@elte.hu>
'''

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
