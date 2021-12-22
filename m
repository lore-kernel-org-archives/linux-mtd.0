Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C597DC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 11:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olELCwHRFhaXtVERnKpXQFeVK1ix3PlnTfLXdIce/Bg=; b=z3EAUuK74Rbq8a
	NHgiefzf6Yyedrd1Id8H0/YUDcAbUnTgLgyCYRL/mSbptmJKAnY7W+4tBrFdvYJijurZTOnOtxW2D
	utkzfvjN/SAZBnBidW+CLYSn6+IZsMQaXY4qYWydXnaP8fKZMUcHTX5gEW5A73A/V2VK0vT1VVHPI
	WK5N/O+apAwZHy33OX8c9gCorEWvm0qVK7lkX57TQ8eWpSWxBLecmEs+MPZiUMU0cjxEkGTtok0yy
	QiRGPprVq+/Nl7jTYWi4G/IjRBDH3yI2kUrWI7ABAJ/YMD2Maia3KLiUEDPaEBCKz07aaU23lmfge
	R7iW4XL6q4rAnh7nc/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n008X-00AAqo-RT; Wed, 22 Dec 2021 11:50:25 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n008V-00AAmc-AN
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 11:50:24 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5936D3F1F2
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1640173820;
 bh=IoWj9oNDweMrZAiZnpWJ2M9mqGVrhoH3F2ncAQcZpG8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=LqriuYkJoKTW1URXXG/eUf3KB/2NdA0N8HDriO9q1cAbXd0YdX/qFOBMKt0IA4Qvp
 0DinGl6UUbPg1J2FKhuF9YcsgC8rrsCJsGIUFrTttDdh3ci+iLDs1fSu63+MeGShDd
 0tJuivKYWpDxBjkEKWLQYMjI9KF3CNxoLwp/GIDeu9JW0MAugdpEmjBEHEaVaCVlpb
 KzgDG56MuGt/p00Yf3m08vTRg02Y56c78L5BXfxIwh97mXsEZc9aL90ERfOagAygI/
 au09L22qc9Mtv/pfqF2c6dLtxveFcCWSw77NEDlmksufWGhju24xRfNrlO+Z3ZxG1f
 Eqpg/5mnj3/VA==
Received: by mail-lf1-f70.google.com with SMTP id
 p19-20020a19f113000000b00425930cf042so1101963lfh.22
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 03:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IoWj9oNDweMrZAiZnpWJ2M9mqGVrhoH3F2ncAQcZpG8=;
 b=fBw+abyWI+E1j1ACvZZGD+LhT4U9B971L8Ft5lJcJI3Ipvxc/e5fAhYzSC6TUBPT9k
 L66D7CvX5Oq3VZntYK3JudICM1imH8JfUNUzirpBEwcaIZyeXt3kzILz6sX8hfNGZtmO
 oQWaH7sL+jvERNl4Lbs/c6LJBIxW+BHNejLfIYscWAqQvNv9x351IyzxTSMoZuloELl+
 0Z5zJceKHT5d7g6LBExfYptbVK3IzLp21b7cNge4gs9692NyI0xoVVvp7YEFW8vXkSSf
 h+P6RPmjjMBxXZ2La5KMwrsszzrWIEkyxhgjHD2ZHLz5ZqY7cm4dP5y1G2Fct/u7nXun
 NL7g==
X-Gm-Message-State: AOAM533Q8drrDnmWcay/ITyqvqX+mtQs06EhB9POJj14YXN/+9YNUX8w
 jG/XN4auA7FCAIuHhwVMcHCbkFyUtEUWOdXPjfhinRrWPn0KOLpllun5l5q007iaeQ0XVuw9m6+
 qUQs/erE2Kg1mBnRydbWTV5lRF3at+KacDmespyvyZpg=
X-Received: by 2002:a2e:bb98:: with SMTP id y24mr1834332lje.315.1640173819744; 
 Wed, 22 Dec 2021 03:50:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyA35gJz13lmXvYXfWrxjhinbcGJguqP+W5VI63zqG4S459hkNVbC2c7iwZdwKh71gviVwf8Q==
X-Received: by 2002:a2e:bb98:: with SMTP id y24mr1834322lje.315.1640173819594; 
 Wed, 22 Dec 2021 03:50:19 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 bi29sm191325lfb.234.2021.12.22.03.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 03:50:18 -0800 (PST)
Message-ID: <2b4386a4-0acc-5db1-fc55-b57ad8a84be3@canonical.com>
Date: Wed, 22 Dec 2021 12:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 4/4] mtd: rawnand: omap2: Select GPMC device driver for
 ARCH_K3
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Roger Quadros <rogerq@kernel.org>
Cc: tony@atomide.com, robh@kernel.org, kishon@ti.com, nm@ti.com,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20211221131757.2030-1-rogerq@kernel.org>
 <20211221131757.2030-5-rogerq@kernel.org> <20211221144917.0a5d8f1a@xps13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211221144917.0a5d8f1a@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_035023_531964_1D51ECE9 
X-CRM114-Status: GOOD (  13.83  )
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

On 21/12/2021 14:49, Miquel Raynal wrote:
> Hi Roger,
> 
> rogerq@kernel.org wrote on Tue, 21 Dec 2021 15:17:57 +0200:
> 
>> The GPMC device driver is required for NAND controller
>> to work on K3 Architecture. Select it if required.
>>
>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  drivers/mtd/nand/raw/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
>> index 67b7cb67c030..587f20c6184f 100644
>> --- a/drivers/mtd/nand/raw/Kconfig
>> +++ b/drivers/mtd/nand/raw/Kconfig
>> @@ -42,6 +42,7 @@ config MTD_NAND_OMAP2
>>  	tristate "OMAP2, OMAP3, OMAP4 and Keystone NAND controller"
>>  	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || COMPILE_TEST
>>  	depends on HAS_IOMEM
>> +	select OMAP_GPMC if ARCH_K3
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 

This patch looks actually independent. Miquel, do you want me to take it
via memory controller drivers tree (like three other patches)?


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
