Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51EDC44536
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RX5LSt0h/TkdcwrTUAXZB5BJWb96tR9NibdPomQCM1s=; b=Qcgb0uNobV3CK0
	EXoz4IjpwvpezQSeiR0lt55BUXdbtSScvjCuCanJFNASirYV+dRFkvRS/9ZabU4UdKdfRhcX5a/a4
	ejVhTeL6ud8l//fPHFV0f1/O1kfnJWmbLcejmkS8bZu4+wtjxGX387PcL4frITL9jaOjiin73pv+f
	JcVaz7fIa1RUx6ChLWwl1By2DPOy5Eyz3l6hlrHvK9zmeyL7MNtujWjx6jujSsGL7cxmT/NnPxqmA
	bSSBSmlw9xitINwHBo1891r6Nequa2Uo96xMp/UMFv8TGxp0iiYqZ0ZWEkWPkxcNZ7sXZeRgKaEig
	hueTnb0/IFd2i4/kcIDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXEu-0000000Bvzv-3VZK;
	Wed, 22 Jul 2026 13:44:00 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXEr-0000000BvzA-3RAz
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 13:43:58 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-69c5fda04a8so20712500a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 22 Jul 2026 06:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784727836; x=1785332636; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IWahDCuW6qxjFQuKiHGFEmpuSZgf5V3GqP3/t/rnZY=;
        b=YncO4cIlUr24W5NCHEIKojJNjE9sLk8mLt8gOlqARjIa123TTlolg4AQPyjzads9I7
         1fe7b0P3He1Nw0rZ5ZJDYIv3/iBBwSHh3j5BNw02oZY31se9a6oRpsUMqmKy4sl2mAlO
         ZeuFYNHCIBPv3TbQmGlanOJRlCMzbIjo7Lyofr83GpYh2gDA1HS+gUi/q3FXKi+CkGbe
         SSdsicicmsV0Aq/54y7lb0OHBZwbOlTvBLSUdIlNFhWsj3aKnpa+0b0dDZcbO3bOEvkO
         K29OTo9sybGnf2V9JSHXoRErL2xo48+yaFC3O1Dls2PuPHSWL6YkcROyh5izYc6ZIUoL
         YKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727836; x=1785332636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0IWahDCuW6qxjFQuKiHGFEmpuSZgf5V3GqP3/t/rnZY=;
        b=bqVjXKQH+T+RMv7a1amjuSey4lN3+eU4JII1L8FQVSQAdfUflygoUAxzVDVyxhDk2M
         FvJqs08I+rljk/xyiF3YWpDzULEJPwOEPWk8XDeIGn3WARG82YHJwF0rH7u0OKk+D91C
         pfqAfJgBxqLtvBMnyXJAzuogbpc2R0ypXEe9SFtOCq3FhUHr2S8EuxgAGEIX9d1QrVky
         xRvYe1BjhPObeKzAu6A7D/ohZdBTXxMcKtv+4MF5OjK9sKdcdYsmoE/DuV0RBGqbM6A0
         VcATGcGHgNdg+sUjCdgXAHpnugNLuQoufx9UsdfcjtZ7tIYCfrs0N0Ie7FffmvmFpMad
         BYjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rps6GLoofLziBtzj4PlkPBua7+VRY2+n1M2mOibZdjDiKO/WreR4kk3rxEcR199ctBBPW/li1h1Npk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFbgp4f2wrTLhJofkK6k2DJryqO3E9q7bojdzWoKElJf8cj/Ov
	3S85xnaWn/e1WcHgc1NexM6+GDJdFaAZtRfCoevoP/7IuVATmYPlCqa77De3k8zH
X-Gm-Gg: AR+sD12mEZPHa38FWht6YDQtkYGg7O79qz5B8ZOPjAQMWVws8p07ZFm5YmIpG1jK4L/
	HVym8bavBnIdRqPAsNjZ39YUTGlq8DOegh6twZZ0eOSXdWWA1zZTOJBDu6g23NzNG5gpxMC72vj
	W6z9g0/JXjIKhQJCf97OCHlE5HLYJVYKnTqwnz8JnOecs6IjFw8TOj23rC0Iab+sRw/54LZ0rEH
	/Ug33jUxJ6cj+ihWd+tz//VU6OiAcFCppnJYDsxy4zsyk2iGzMMbigKKyNKFznPKO640UMdSyTc
	VeHXk7/z39qUz/Vdky2DrYMay3jvidpsmZV7Zc3+sYto/ZGMFFclcyuWwsupdp2LHsDxtLaL/g7
	299b6kPKDp9I1M4DAj83D+Q69sfoFqjZe9pkvPLWThYe/AZ0dTeLbgroxxztoHCGY7irlOKl3Kz
	kpXKskHXSL2B2XALLF4AX8sCO7OeoW5iMq9oWiPOzz
X-Received: by 2002:a05:6402:234f:b0:69e:38f0:62c9 with SMTP id 4fb4d7f45d1cf-69e652e0a22mr8681778a12.39.1784727835818;
        Wed, 22 Jul 2026 06:43:55 -0700 (PDT)
Received: from [10.186.94.117] ([92.250.103.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f35024922sm997937a12.22.2026.07.22.06.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:43:55 -0700 (PDT)
Message-ID: <64f0f609-9b24-4830-b0c6-c7ec0a01028a@gmail.com>
Date: Wed, 22 Jul 2026 14:43:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: maps: fix dead select of MTD_CFI_BE_BYTE_SWAP
To: Arnd Bergmann <arnd@arndb.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Sean Young <sean@mess.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
References: <20260722001003.36598-1-julianbraha@gmail.com>
 <73b310a6-e97c-4bcc-ba82-9ed781f4bba6@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <73b310a6-e97c-4bcc-ba82-9ed781f4bba6@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_064357_879295_253871CA 
X-CRM114-Status: GOOD (  14.13  )
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

Hi Arnd,

On 7/22/26 08:42, Arnd Bergmann wrote:
>> 'select' does not work on config options in a 'choice', so currently it is
>> possible to enable MTD_PHYSMAP_IXP4XX without MTD_CFI_BE_BYTE_SWAP.
>>
>> Let's replace the select with 'depends on'.
>>
>> Note that, if we remove the select / dependency, the kernel will compile
>> with MTD_PHYSMAP_IXP4XX=y and MTD_CFI_BE_BYTE_SWAP=n so if it would be
>> better to remove the select, please advise as I do not have the hardware
>> to runtime test this.
>>
>> This dead select was found by kconfirm, a static analysis tool for Kconfig.
> The choice is forced to be MTD_CFI_BE_BYTE_SWAP when building for
> big-endian IXP4XX, which I think means this will currently always
> work correctly:
> 
> config MTD_CFI_NOSWAP
>         depends on !ARCH_IXP4XX || CPU_BIG_ENDIAN
>         bool "NO"
> 
> config MTD_CFI_BE_BYTE_SWAP
>         bool "BIG_ENDIAN_BYTE"
> 
> config MTD_CFI_LE_BYTE_SWAP
>         depends on !ARCH_IXP4XX
>         bool "LITTLE_ENDIAN_BYTE"
> 
> endchoice

Actually it is currently possible to have:
MTD_PHYSMAP_IXP4XX=y
MTD_CFI_BE_BYTE_SWAP=n
CPU_BIG_ENDIAN=y

by not satisfying the dependencies of the choice that
MTD_CFI_BE_BYTE_SWAP is part of,
for example, set:
MTD_CFI_ADV_OPTIONS=n

then, none of the choice options are enabled. This is the
configuration that I had compile-tested (but cannot runtime test).

In any case, should I send a v2 removing the select, and leave the
rest of the little-endian ARCH_IXP4XX changes to you?

- Julian Braha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
