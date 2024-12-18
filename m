Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F14E77183
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ba7/xf9IvQCyVZqihEUbFfVuK2IN9NTEQfep/6YB/VU=; b=fbptPDWFeadfXw
	RAvQ+mKM51jy12E0OE3+5SGsEx1jGUjwdxV3PWiJwMgBxX9uAUeLTlpxZzVzhp0pB5lH1O5TF47nr
	dU3EKs8pyP8RqGF53T/SrS0sJRFdFMFK+7f6UVEGIsyfdnBh/d1a4bRCzWpVJS143Ru8IThT54Lql
	Bnuv014g0W/ZqOY8Fnjs4qJlp4Nkik6CBMxhoO0AwV20u4C7U5MCRyvBujlHrYi6DcWe0ZSqAq3Ab
	y+NtkypnCWurpO2UJBkuh3q90r3jXqM8zY+6NXUbHqnygoxFq6+J16Mj4SYmZkmIyvviCtPvvwNyI
	2wPXvavLSem6oCePjlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp8Z-0000000Fu2T-2rfx;
	Wed, 18 Dec 2024 08:10:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp8W-0000000Fu1b-45bX
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 08:10:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361a50e337so42810655e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 00:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734509427; x=1735114227; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReRS6j5G98M0X/vFFlnySn5FW2QTeseYmxkguIVGI1c=;
        b=qVEQPuGjKytrlAcWHLtbOXfTcV/G2uRirJvFW0z+0T4wphPHuaqEUP3xBRp2/YB6D5
         59XRB4jE+boI6of7bKXFsuKoVfY/dQisiByPdQofvzW/1gsUc3xxOfQhnBlWyO6Rvtba
         +/Px4sqFehDz/KMfO9GrlLIa7Zr9yb0mHmWZKN/4FKP6mLt2GaHAL6WKg7FVIDS1wEp8
         hGSxAV96IZG3Rjjt+JZpewqx9M8mByFhy8mT8ai61Qt4mm6k7Es5YlTZ8p9J5wQwb75L
         UdA6no608dBGYfVUVkHJWNI5zlXu1HQ+nRM69AqF0Rs5uph8V6dVuWgkb+p/lS/z9N+G
         MElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734509427; x=1735114227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReRS6j5G98M0X/vFFlnySn5FW2QTeseYmxkguIVGI1c=;
        b=MDQ4c23SbOsOUIrl/PaR6BI4ZX1M0zI3w4LYFwSBhVlgc+FDpNnddnGC+JWGVjHU35
         WWB8XSqC2+VXMtCJ7m/rkXa1/ZnUt0q7/6OLETMPhXJDo6YBNefmTQrzz8rr4VD9mVfF
         6G1YXZ/ODn34fzqdDsJmr5jdcP2pNgEIXEhYSDM+IZe0qLcfiud1x8tga9DhzHE+DVyg
         CtdWOnQhbhcMfgQRqAI0Li48JAX61EUEkIKWCK+uYVLv5pdowceik5/yNHAlWdNA5MZn
         hVQJfqEnx8qbrJKGtWkuIMPogxyrV9k3U1o1TH4RFZWxZBleBR5pBj+vwzdX79iwblwY
         F5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUq9ec2b5BUePxPyz+LTlvLZAZ0WDfPmsokZawGPPUoJ8J9NCHJUkS+Oph+m+5Wfmj+xCSfN50b/b4=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn3rRhV0YI8KGGrCAoVyljzJ9CM7nOsBTq9tKIR5x/G7zpHsop
	wfmGLAgnM72KxxZYXVlLzaqDQI+uM8OT6BIindEJbmSMleqAsry3B9O6q4/9DyE=
X-Gm-Gg: ASbGncvRmSDvDJFeh5aDDeGw32lH9X7I51gy7SjPI/M+mLIrblq0RlPot9eBCXx5Af6
	4HSQqjXoYMhgLXKmFKBJl8Nke/mm+yTFcCgcwWMQTzJYRy/S7vKze9RL7zZ9ZJ20npMqQ7V7H/s
	C1BBAsDFL0GD/9xxB4JKPnDOb/HgPwo/6hDXwG11hhJNQO1DI1+dfAqwk+wmAHkZV5+A35+OC3O
	x9AIw4VzHcHY8pcgsPbnhZyG5yWJaJTngychq0ikW2/pmV4+IKNZfioacfYKZmA
X-Google-Smtp-Source: AGHT+IHW84IFMyteDGhzkZH0GrN3c/a3NXNaK9vu1e0nBtdfhB4NZmQJ8kHa4BkJv6X+V3GmJqPNWA==
X-Received: by 2002:a05:600c:1390:b0:436:346a:fa9b with SMTP id 5b1f17b1804b1-436553f35e7mr11377415e9.20.1734509427176;
        Wed, 18 Dec 2024 00:10:27 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b1e8sm12181355e9.30.2024.12.18.00.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 00:10:26 -0800 (PST)
Message-ID: <a31de602-9af1-4576-872c-6fbe1a622a30@linaro.org>
Date: Wed, 18 Dec 2024 08:10:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] mtd: spinand: Add support for read DTR operations
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-23-miquel.raynal@bootlin.com>
 <589d95d3-9153-475b-86f7-886ec41cd4f4@linaro.org>
 <87ed2blr8y.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87ed2blr8y.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_001029_034459_6F4CED72 
X-CRM114-Status: GOOD (  10.36  )
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



On 12/13/24 12:08 PM, Miquel Raynal wrote:
> Hi Tudor,
> 
> On 11/11/2024 at 14:35:23 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 10/25/24 5:14 PM, Miquel Raynal wrote:
>>> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0d, 1),	
>>
>> do we want some names to these hex values?
> 
> I honestly don't think we do because it would be totally redundant with
> the macro name, ie.

I agree. Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
