Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464B7EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 06:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZxxgFJEzVbCpfkJ7i9oQfHwnGYwXyJcylxlLFUr+6g=; b=r89KXq655Mi6QQ
	mtYob3DG9dFhnzg3bF/rpiueRJ+Hm/5QmWfubHBQsoemfBtp96VbxYkoqmkptlUikjZv5ujUf9htM
	KhvL5QQUgw21BPqpbEQNNt+SDeeR/rnV5xste6tDwLYWetdF6HlL1NKjrctEjlBaZHH5hp0+1G2hD
	rfs+GifIpraV2etS4rCZGSls6fzz+oppLT30BLB5Sdi4di8oW4CNQOgj+ei6jlJxwb4OCv8cckFxn
	Gg9cDE/nFCd93L8PDBkX0plwpmsYpyaN+XPuArPd2OLcz81HsfB6IOqxW5uPQuyuermefVgJmexuK
	EHq7/Jev4pmtSdDIigww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMjHI-00CzwL-0L;
	Fri, 21 Jul 2023 06:06:12 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMjHF-00CzvP-14
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 06:06:10 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51e28b299adso2176115a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 23:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689919564; x=1690524364;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oeLbJHQPHJsory0G8GdAQcnaceTRpuqb4t2hUd9W0M=;
        b=tPkbVibi9gAA9zTy0NeGUZK9jjXE7OpCmEEJK7A/SnKUcE6peRPSZ6/xHy0eUfg3na
         IbltclfrJbLUXEXLOqBa/X7DgVLj4GbImYIyx4K66G3QXSR29BseA+twrPO5Kyt4ShWW
         qYANRqontkuhFXq6LrLgvv+axP5IyCKQEZ6R43nnYnT1npy9hH8F0OeaXyXq6BYRdkoj
         McSXZzsEY1L7fVqMiSP5TV76psPy4eEGs9GBLgI8QcZuJN1jjJ00dhlvtyZE9YYocdgI
         Q/782AheKRaiXCG5wkpZeEJ/mX+rlgYcDw9khVnH5MdpJ/gm0I+9FqksxsvNiq/ZmxAi
         3rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689919564; x=1690524364;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6oeLbJHQPHJsory0G8GdAQcnaceTRpuqb4t2hUd9W0M=;
        b=U+YaLfqmp4pFIIBsELUaOZEYV2bm5e9QPry3RIoXAiSIlDu1/ib7g4vDV3ru4nIhd3
         k/++3wrPwyb8LO9P7xJY3Gr0m5wUPG/qfQuNLIbXoEkaYurZK/cQPPwMeOm0HiA/q0UP
         z9HXPJGTcMvjSfeV1cWIWSU8KWWYS8Zgwd50V4dEImGgGV6Xy3mwf+3rC2xE093sG16Q
         aFV+ULSccZZgZiotrH3nHX7ipq6LhrxQuxlfIOhGOzPPyTJFwFMPhnpC1MdnGgr4DU0M
         xWOcKKrMNzalEmk/6KMniJjpMYTf4mlbZqbdTZcuIZxQLRgLglx5PYWF2nh7IkztYzpF
         z3Dw==
X-Gm-Message-State: ABy/qLY+twjdK3FbjsrMNv4qksx8v4CbuD4ad315B6x2GL16szIeU6J5
	V9lkQhqTwsXcOnDQGfer/xHbeA==
X-Google-Smtp-Source: APBJJlEOfrxEKij+gBa5+uU7cDdpg8avuRUf+oyQLYh+lri5b0H7HfQ4hQ4KNnF/lTeU70iwGjk15w==
X-Received: by 2002:a05:6402:519:b0:51e:2974:f471 with SMTP id m25-20020a056402051900b0051e2974f471mr675962edv.42.1689919564253;
        Thu, 20 Jul 2023 23:06:04 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id n4-20020aa7d044000000b00521a7864e13sm1636497edo.90.2023.07.20.23.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 23:06:03 -0700 (PDT)
Message-ID: <55d60aec-3b20-d9d3-aeb2-77abbcc47d16@linaro.org>
Date: Fri, 21 Jul 2023 09:06:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V1 1/1] linux: drivers: mtd: spi-nor: gigadevice.c
To: Vlim <vlim@gigadevice.com>, Michael Walle <michael@walle.cc>
Cc: "pratyush@kernel.org" <pratyush@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "akumarma@amd.com" <akumarma@amd.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vikhyat.goyal@amd.com" <vikhyat.goyal@amd.com>
References: <20230720042834.12296-1-vlim@gigadevice.com>
 <62663146a51c2beac4eff48abe1f61f8@walle.cc>
 <TY0PR06MB56580D3FEE55389F41E33398BB3EA@TY0PR06MB5658.apcprd06.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <TY0PR06MB56580D3FEE55389F41E33398BB3EA@TY0PR06MB5658.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_230609_370380_7FB1390B 
X-CRM114-Status: GOOD (  10.86  )
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



On 21.07.2023 00:48, Vlim wrote:
> Hi, Michael,
> 
> Our parts do support SFDP.
> Can you provide the guideline for the part definition?

There's none at the moment, you have to read the code.

> I do see these samples in the gigadevice.c file; but, not sure of the
> purpose of each parameter.

The flags are defined in drivers/mtd/spi-nor/core.h. Start from there.
> 

All the flashes that you proposed, but one probably (gd25lx256e) can be
probed using the generic spi-nor driver, thus you won't need to add
dedicated flash entries. See:
773bbe104497 mtd: spi-nor: add generic flash driver

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
