Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26819C4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gu0ab09L9GobwR97U7s2m7Qy7xWBfRNHXcd8ph3KO64=; b=pU/bqWW+Mmd2fy
	sYUjERZICiKB2eTYYWYTgOQGtgPxnYjwh4D4/ToKeATaWN6dAn0iqYiJPFLAZTyziqO2rcN8qGY8N
	DADp/NmnO8rljSvF7EvkN7CeJV7hrQELjmU0yQTBVE5u9wpQHgk0REfOwCqe5LQNjGUi6tudatIpM
	GmsAJLeNqTCTcMdHEUe+Z0XYd2NoFKCIoO+JWGO7iXVYFW99mtJB9g/Jb1eCUoT1MNUGCC1CotOZA
	9oynK9nlX5lfYRt3heJt66/K/LIb/Z7tp7mYNsaP8WGMOi3xgaX+Jc+owyQTFt83O76oH/mMfL6B0
	qFkNIaXCs4h3A2iLAG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ugi-004mQP-0u;
	Tue, 28 Nov 2023 09:47:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ugf-004mQ4-2E
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 09:47:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-332ddd8e0bdso2822212f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 28 Nov 2023 01:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701164844; x=1701769644; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17OVECw9ZyIvNd7UnMV0T6pf2VqgLZybeLe5F+y1r5M=;
        b=hgGuacsWkhAz6Qvf0fdG9q/sQj/5nRIZao459MmbCDfTjRQ3Dp8cw4jkYTSwWOJ7KR
         1PtDNX9bie9pvwRPAr0UplLJkH8WwmFddtrm3iIoKbb9/EOCBvFJ/kReZyx2DTY5qu5K
         m5CP/PByJx4dUJtWMiPo4JLH648EERJTA74r+WRXSaQjBjPtq55wk2dmzbND/nzbkJ3Q
         7NJfdgtYiNd0bIVkpZr7seNVHPIu8Yf0KImQlYNzuJ4s0gSv/IbENpu+PDLRhtQjvAXO
         Yv4VK0E1vn++OJDN9Df2iAto73sNMQxm78Am88Gm7ru0+S2n+iiLTaJuZDrWDbWbtVZj
         BVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701164844; x=1701769644;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17OVECw9ZyIvNd7UnMV0T6pf2VqgLZybeLe5F+y1r5M=;
        b=YQXhunhcX517Hkfa9aa+8pd6DNdDB65QyXiXL4wHS81bLGJ9/tSz+eikREcv0QJEpq
         xYkFZzvOA9fznEsdq+bATgZyIWu6hxwIMMcIGw8tBuAYf9dLx310od3mXVSQkDQuwwnS
         grDxyP3uStGYASUEnfp1EbVdbN7q1mzPhfhvhsObVtkemFcMA5IX2wznYKEgiIBhiJs4
         7aS4zNvLkQmgN0UNWWjLXk+SwlPKxWvwJpYjDLHejb7WPC7Ij5DLq30rQQAweTk16291
         PrBEehhVMZsk+YNEToxCckJV/JoQaZB9SvziRwee0ViT5bXv9ipRNPTRvHbQiyOS9q6Z
         hLuQ==
X-Gm-Message-State: AOJu0Ywp61IW1Xhdd5AhVfPVybaysgMu8FbfHNi7/FQjtECdjHKR7iUs
	5Vg5mEFKNtQX4CY4xNXdea1enPrBXZ4TPnBqMSwFsA==
X-Google-Smtp-Source: AGHT+IGGg08aCxfIPrzMMes/KxlsIWnf3kFNAcSKvy9WP3mscT+KwjnNLKMzqvCYrq32Thf9LIWDPA==
X-Received: by 2002:a5d:4e8c:0:b0:332:e75c:a3ae with SMTP id e12-20020a5d4e8c000000b00332e75ca3aemr13004949wru.13.1701164844114;
        Tue, 28 Nov 2023 01:47:24 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id s16-20020a5d69d0000000b00332cddd7468sm14399160wrw.40.2023.11.28.01.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:47:23 -0800 (PST)
Message-ID: <756aa94a-3237-4689-885a-1e17504e72b6@linaro.org>
Date: Tue, 28 Nov 2023 09:47:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: stop printing superfluous debug info
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: liao jaime <jaimeliao.tw@gmail.com>, Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, jaimeliao@mxic.com.tw,
 pratyush@kernel.org, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
 <42c96d63d1ea4f7e8f16a3c8eb0a4cf1@walle.cc> <20231128100313.3c990f69@xps-13>
 <18ba4126dbd9e49846344b517ad2fbdd@walle.cc>
 <CAAQoYR=ZAEVeoCwkRmky2CHVeKGX55JijM8Q6D5msz_5iW+jtw@mail.gmail.com>
 <d7bb4580-00b9-4206-bbfc-bd203c21a877@linaro.org>
In-Reply-To: <d7bb4580-00b9-4206-bbfc-bd203c21a877@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_014725_739502_EE566AEE 
X-CRM114-Status: GOOD (  12.42  )
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



On 11/28/23 09:39, Tudor Ambarus wrote:
> 
> cut
> 
>>>> Maybe we don't need this at all, as long as one message remains about
>>>> the JEDEC ID, but keep in mind that spi-nors are commonly storing the
>>>> rootfs and if your spi-nor does not boot you don't have a userspace yet
>>>> and all the debugfs entries are purely useless.
>>>
>>> Good point.
>>>
>>> Just curious, do you know any boards which has the rootfs writable on
>>> the spi-nor flash?
>> I am also interested.
>>
> 
> Having the rootfs stored on SPI NOR is a poor design decision as you're
> better of with a NAND, which is cheaper and faster on writes. I tried in
> the past a ubifs on top of a large (64 and 128MB) SPI NOR flash. But
> they were plug-able flashes, not something that is always tied to the
> board. Microchip's sama7g5ek comes with a 128MB macronix SPI NOR flash
> populated. But there are other vendors that provide large SPI NORs if
> really needed.
> 

pressed sent too soon :). What I wanted to say is that it's not uncommon
for vendors to populate large SPI NOR flashes, there are others as well,
thus Miquel's concerns are valid. There may be people out there having
rootfs on top of SPI NORs.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
