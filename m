Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E861AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Zb4IwBBsRZwLm+4wbpuo1NCv7RyK6RrjloTIuzyRi0=; b=uyGkgyeyHsUX1V
	rT6YxCNvh8rR4Ty4wxTW6x55Sy3DKW+259eLagS0aZ+opvbsqEWDLZkdzegDXIGABWV2G9WNSqzeZ
	B0P6bZTIO3CFbVSI7sFem55+ZWuqlMiog8arknNgxJ6DdGLM4biUqdZMMrhhLXBrEK7++dfj/i83C
	xC2H8a5GxRVK9znbACk6a26vzyNycpdqnE8q8NCs+Qs/2ec36I/v7nCSETJhVGNWXa8GYzNn+9EwP
	PYFVMGMlMZq27Ar4M3OMQT7WN7VT/XveAQ9m9wxjPggqdmSkqQBgzrLz2q/N++HVEL1VuEMperoia
	uEfAvQQPfNprPy9gnZmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n03rx-00Am4P-P3; Wed, 22 Dec 2021 15:49:33 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n03ru-00Am3b-Qd
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 15:49:32 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7691F3FFD5
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 15:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1640188159;
 bh=5hgZLopSA5RqgA5GFHhtSYmuF7JejYilzaVDTyDa+yI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=MNZ7qT8MlPQEZ1DmwvoR5wrHvhh5o5dNXaYIqReBfbK2WN5vykz3hNnK+LoIM0ltV
 pi9k2MPyKZBqot1hBUZIEr9K8spi8j2UtstCxb/NqcWKZIhkTR3Tqzab4AZEKAQQFQ
 hOH0BNy2txjDrFCS7g3ClE838r/mTmkNlc+Izr9m3g2tZKRx7Wj0W9tszPFan7I2V7
 icAiDTKaaxbzbIJxrLkNyMM+zco26TKcy2FbOJ8mvPi8ykuvaeoiueJYB+8F1XuwQu
 KUwaeM/jzG9SrTGEJ6UGgRSe2hjSLCVIj3Qc/jI0rjDE9OSmNWc5TTTSftMSniY69b
 MJl5oHxulh6WA==
Received: by mail-lf1-f72.google.com with SMTP id
 p19-20020a19f113000000b00425930cf042so1387082lfh.22
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 07:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5hgZLopSA5RqgA5GFHhtSYmuF7JejYilzaVDTyDa+yI=;
 b=51ev6Y+4p7jMJgYW9vK5ywW4ompX8jlNPjtyCrrVpX1Y1gD8CwqLXqzbdJof7epgXs
 11RwylnUegsha+QzTLMLZbd/Xj0hnG69Myk249cr//Vove13Vej4hgOQmZKyAw543JzR
 mi1/XsaIhLs2X6UmoYa56aLUyR4R9C63+PltOg2y808UnL3ccT/k3pKypwr1GyYNvfW3
 JLkOlnjSn+Tuj/OFOvoNESwuJnZw4wO4y9g0RUPHoPz8Fm5PdS9C/j2SuZ6xKXFXkAAH
 HoWIKCFnxjY8+vmc38UyvBmWo9Lfx7n4eLTCV5EzZLa9bPqXbgUYm24S7LDLrHc7s0AF
 OjEg==
X-Gm-Message-State: AOAM533llnvSbF2xf9hh54scoKO3bAv7LqDZU7Akl4Cb0e8YEc0eKY68
 E9eUs93Srsu6nSg3bHB2Ii9nqljVcdm0WXD5uvQHBJUH3LDbM7DT6mYuEEK//ucbddqcqfsL6Cj
 TLkpsWE5+GKYr87NesyEnCqYpzdYmoLo/aQlABOF4zpA=
X-Received: by 2002:a05:6512:3baa:: with SMTP id
 g42mr2755867lfv.651.1640188158801; 
 Wed, 22 Dec 2021 07:49:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwr7cmepBfwLxRYZ+54oFEjSLqgBl8VM/NyfSsn8HLpTn8R8don1yxBiII9LLz1nQ7T4lVUA==
X-Received: by 2002:a05:6512:3baa:: with SMTP id
 g42mr2755857lfv.651.1640188158623; 
 Wed, 22 Dec 2021 07:49:18 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 c36sm247915lfv.193.2021.12.22.07.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 07:49:17 -0800 (PST)
Message-ID: <a1ef85b2-25a9-dbdf-c6b0-b645d1c1aad6@canonical.com>
Date: Wed, 22 Dec 2021 16:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 3/4] memory: omap-gpmc: Use a compatible match table
 when checking for NAND controller
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Roger Quadros <rogerq@kernel.org>
Cc: tony@atomide.com, robh@kernel.org, kishon@ti.com, nm@ti.com,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20211221131757.2030-1-rogerq@kernel.org>
 <20211221131757.2030-4-rogerq@kernel.org>
 <51b8e895-95e1-0024-1457-ec534985c9f0@kernel.org>
 <20211222151823.77179b74@xps13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211222151823.77179b74@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_074931_037890_5F849543 
X-CRM114-Status: GOOD (  17.53  )
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

On 22/12/2021 15:18, Miquel Raynal wrote:
> Hi Roger,
> 
> rogerq@kernel.org wrote on Tue, 21 Dec 2021 22:01:28 +0200:
> 
>> Hi Miquel,
>>
>> On 21/12/2021 15:17, Roger Quadros wrote:
>>> As more compatibles can be added to the GPMC NAND controller driver
>>> use a compatible match table.
>>>
>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>>> ---
>>>  drivers/memory/omap-gpmc.c                   | 6 +++++-
>>>  drivers/mtd/nand/raw/omap2.c                 | 5 +----  
>>
>> Will need your Ack for this one as well. Thanks :)
>>
>>
>>>  include/linux/platform_data/mtd-nand-omap2.h | 9 ++++++++-
>>>  3 files changed, 14 insertions(+), 6 deletions(-)  
>>
>> cheers,
>> -roger
>>
>>>
>>> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
>>> index 624153048182..d19ffc895e5b 100644
>>> --- a/drivers/memory/omap-gpmc.c
>>> +++ b/drivers/memory/omap-gpmc.c
>>> @@ -2091,6 +2091,7 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>>>  	u32 val;
>>>  	struct gpio_desc *waitpin_desc = NULL;
>>>  	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
>>> +	bool is_nand = false;
>>>  
>>>  	if (of_property_read_u32(child, "reg", &cs) < 0) {
>>>  		dev_err(&pdev->dev, "%pOF has no 'reg' property\n",
>>> @@ -2183,7 +2184,10 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>>>  		}
>>>  	}
>>>  
>>> -	if (of_device_is_compatible(child, "ti,omap2-nand")) {
>>> +	if (of_match_node(omap_nand_ids, child))
>>> +		is_nand = true;
>>> +
>>> +	if (is_nand) {
> 
> nitpick: why this intermediate variable?
> 

Indeed, it looks useless. I think it is left-over from previous version.
I will remove it while applying.


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
