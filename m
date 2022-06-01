Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02637C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jun 2022 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28caIzg98kYGxJy9P9WMi6C9GmyN0oEK8ReVsbKs1YY=; b=0jEa/yvVjJ4s/z
	bvd5yIGYAxXBrdG+L5INjWm6Tsx3+TLLmYrjC8bJBYw/OIvvyiNXY13sUCrGoAGrYHUwgj54aey8Y
	mhYui6JsRqiA2VqkJIBzUahHaZWGp5qAtMMK5YjVPiuZlyxjEFhr/zjbAgA2WGA+A1hcVGqnoWi8t
	iQm2Gi+oNZs91eDqiu0Qc9i+yllwJcbgpOQKjIASIv8RzsaRABss49o6fYliTAhg+Z4e1O7G94Wu5
	GfBI4TJWj6PZNCSqouMkXL2p3evwQBJ6JVPceBYZWaDipJ7o+jYahdPabTD9PQnHWnmigYWNR1KS5
	na3OWnQBef0B/V7dibzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwM5n-00FT3f-2U; Wed, 01 Jun 2022 11:00:47 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwM5k-00FT0s-BZ
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2022 11:00:45 +0000
Received: by mail-ed1-x52d.google.com with SMTP id er5so1613025edb.12
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2022 04:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KT/SgWw/Hw0WKZaDwYH8usaKfs0dydPl+6sV5mw9Js0=;
        b=s7ZnjSmHN0XMUgG9VPsibbZ9xhVHFOFc9K5hY8SuQsDI7loybtXxgxS9g2alpFCf8Z
         DnJcUR/gSxk96dAZqDepc3429N3GeHkTGBWo+/71w7fOvOOQJNAcXEIIjnNIjnm7aqOq
         M7Tkh+SIR2e/napBPQg2JX3ijNyDp8kHwNHxjPvAefR1LyWmh2VR/jbDv8li/v13A7b7
         Kkm7xDQur3X964QEjH/lkuPycF6zW4Qp9QS9Kfo81BkKY0FYr5qyoZlsIjWFjOc5gPZ2
         jU14YdhOqdtWpM5GRl4Ge1mlHE4z/DxDJtk7PHjkjgnEWxI+Y2k1TWXOkrBKOxsnBGNo
         dlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KT/SgWw/Hw0WKZaDwYH8usaKfs0dydPl+6sV5mw9Js0=;
        b=1tDg7gYcewCrjZdqRiYTt64nPKdZVJKqVspuVCSreLXpN/11bMNK8abMFs7BbJhayT
         CKrh8G/ajmjzQNH3+fVbA4q8kvh4iUTKpNd9q/MK12oYtbQnitVTbHkij/vMhPUO4nIs
         eiEkkowHS7XcakucpBaLJl3myO9IWsYkb+NMU4MX2jHSa21lgVKX7MB6TsPwvZVZzIia
         +3e1wn65s7fAu2yX+0Z4m2aq+fpGrtGSyQv4Z20iJGQrzHBtuKE+AN1z16o3hq72O0/c
         pw8paegw9HsiQ3VhJ4nBY2sGoYAUZYR4arwGYrjySY8Y3SxVHswSd1DHiHiaYBIfQ+ag
         AGgA==
X-Gm-Message-State: AOAM533Q5IQxqD9T7qr5tO6ZDcBPcpRG/zOo9yTV+Y0jf71JlCRsyxVH
	oEyuhvCUE6jV6qVGp8TWMIoGOg==
X-Google-Smtp-Source: ABdhPJwMjcLypyEXu3G39Ns6ihFcyzx/tRjtuxM/CyNbT1pUVe+YxlIZoqpenLgPwevNGqmGfXgdeA==
X-Received: by 2002:aa7:d9d9:0:b0:42d:f9e4:49e0 with SMTP id v25-20020aa7d9d9000000b0042df9e449e0mr2065854eds.299.1654081240809;
        Wed, 01 Jun 2022 04:00:40 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lc26-20020a170906f91a00b006f3ef214e5asm564503ejb.192.2022.06.01.04.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 04:00:40 -0700 (PDT)
Message-ID: <630b0d13-6778-2508-6a34-9daa0358047d@linaro.org>
Date: Wed, 1 Jun 2022 13:00:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC v2 1/2] clk: hisilicon: add CRG driver Hi3521a SoC
Content-Language: en-US
To: "Marty E. Plummer" <hanetzer@startmail.com>
Cc: arnd@arndb.de, cai.huoqing@linux.dev, christian.koenig@amd.com,
 devicetree@vger.kernel.org, gengdongjiu@huawei.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux@armlinux.org.uk, michael@walle.cc,
 miquel.raynal@bootlin.com, mturquette@baylibre.com, novikov@ispras.ru,
 olof@lixom.net, p.yadav@ti.com, rdunlap@infradead.org, richard@nod.at,
 robh+dt@kernel.org, sboyd@kernel.org, soc@kernel.org,
 sumit.semwal@linaro.org, tudor.ambarus@microchip.com, vigneshr@ti.com,
 xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-2-hanetzer@startmail.com>
 <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
 <20220601105846.7hriawg3stxb657f@proprietary-killer>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601105846.7hriawg3stxb657f@proprietary-killer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_040044_445382_A1B5FAEB 
X-CRM114-Status: GOOD (  11.42  )
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

On 01/06/2022 12:58, Marty E. Plummer wrote:
> On Tue, May 03, 2022 at 01:37:42PM +0200, Krzysztof Kozlowski wrote:
>> On 01/05/2022 19:34, Marty E. Plummer wrote:
>>> Add CRG driver for Hi3521A SoC. CRG (Clock and Reset Generator) module
>>> generates clock and reset signals used by other module blocks on SoC.
>>>
>>> Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
>>> ---
>>>  drivers/clk/hisilicon/Kconfig             |   8 ++
>>>  drivers/clk/hisilicon/Makefile            |   1 +
>>>  drivers/clk/hisilicon/crg-hi3521a.c       | 141 ++++++++++++++++++++++
>>>  include/dt-bindings/clock/hi3521a-clock.h |  34 ++++++
>>
>> Bindings go to separate patch. Your patchset is unmerge'able.
>>
> So, assuming I have the following patches:
> 1: +include/dt-bindings/clock/hi3521a-clock.h
> 2: +drivers/clk/hisilicon/crg-hi3521a.c
> 3: +Documentation/devicetree/bindings/whatever
> 
> In what order should they be applied?

Applied or sent? The maintainer will apply them in proper order, this is
bisectable.


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
