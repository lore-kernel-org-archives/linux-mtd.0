Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C258E77183
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 08:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/02uC0jwLTO1V16anzNPj9QdlCZYvq30V2cY3ZVqzNM=; b=U0LbiYvD7vnDs4
	QXni883pE4DljkPQHmaWisYirN0UY2jXjeev+oG+PnQPDaO0scTvNFKKUS7P2Rna+3XXXpsJcZ4UL
	uhj9owbVEF1lnQragyIc1I1UbJmJPT+J0YIRG21BHwGwMCcRqxgD2YJevQkk1ie2lFgWRc0P0rKve
	bygbecP+Xb6lmJkb5CqenrZ+0DAyEsEapmDRy6x5c13KylNnOXMkmC7PochonE2iRcp7dsH0Yab3t
	oZ8HdKUcRFajFZqRTF6Iyt5Q98bU451riJ9PZ32hWzedk/a/0VzedSaqY5OFtSB2n9HxED0OyXBjj
	aGfO8O62NggjGb+UM6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp6U-0000000FtRU-1gRc;
	Wed, 18 Dec 2024 08:08:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp5d-0000000FtFs-3jWr
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 08:07:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4362f61757fso48499115e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 00:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734509248; x=1735114048; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vUO13Va1s/28T6qIaWM110YfN47cZBFUYRB3INwDCck=;
        b=C38Uv1V7CTK77cvL2Um1PC+0Amh8QoAWXCGDhNrx0+kKLiEywu/4YFqOvSp0V6zuj9
         HqF0mNSId+TgErZ1w20n6y8V/7sE4uVZIJPYJQcSEOMTz0T3hb186OjERJIotumOvY0t
         aJ13wzCf1o98r6p31ib+65kTlBHsypheMGfI8h1w0aX8VyC/AkgbhFDszE+ERDOYgKX7
         TX/fM7SrmVU0EZyLGMjB6jFDbl4bAERxVIkjDnFL1Cv55oWVL6L3o8wecFPSSh1OXKMD
         0WjES+XiK055tBKSpAAhJAbrIQx/2FhJi9GwLvnV0wlgkdulMI1u7Lyef1KWA6qn22iw
         NHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734509248; x=1735114048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUO13Va1s/28T6qIaWM110YfN47cZBFUYRB3INwDCck=;
        b=wn+99sGL13eAXP7KhytLyjwHFtu0tXzWIJL3W6Y+rE2xWnwshgNQpaWwDkzlhiu2UN
         P2WHaMCkp7lyzfvCR446CmhttYh4TuG2y1B1B2cI0ObzvLjtq8wPZU2vAEJQcCfpHHbY
         b5utMqQZGKWaWHI7THyhrPfRebLfROsPPWYHQG0Ai4ibHjFnmTGunFi1YdFL4XXhYZh/
         j0Ba8ZmR4CezaotEiKd5hmOW0IJVZlRKg9D6oRQl+fcUX7zfnGp9QVPU2I1JbvH3py3/
         dTKSxIOLgfOnrKPPDtBNgW4sKSGGRba29ItKlS8JT8b/B13pjsWTzL6ayQ2aHFYM6ED5
         u1pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJwrIiAhue9MbGGtI8TX/33gerBbsmj96RR0eats7JWF3KGfrVJ8UY67O+/p/WuoyrpNW4SsBH0XQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yziz8YnnNdXMNB3KKvaVr+qCDC+DYozzgKxhVyQjKaCV9awDWVq
	qEAJYhZOFymciHcmuLl70ZUhR3CsnLB3ucHphYsmxV6RILlBANS1zo7WlBBw4kk=
X-Gm-Gg: ASbGncu3Xc5xsC29exi6PUz/+PfKEKuElDkhfw3kQlwRxQKCTZYFSecdtEx5FKkXntR
	bXyEzjrGK9PHE2SdN2aIsxhNnkp5o/70toJ/9d0U7EHyYsjfTpp+fk10BHCZsN7stP0xG35v2yK
	+dh9DiICxV6/mInNExO4nKCNx76NrdQ1fQFtVlTzncNbtE7dJ19KYxVkdtIMavw9Xa/FECx8w+e
	BzNf2o526S03tJ+aMDHpCe9C3t8bs/H3dXhnj5dm5hIW8J2dVWlBowGJi4scr1O
X-Google-Smtp-Source: AGHT+IE/VOpr6ya6Vanrk543BWmCOmJzLMi4pEYNjPk21m8gtDLfkvb6JJfIygcCELDi7lmkG+sr+w==
X-Received: by 2002:a05:600c:154c:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-436553e9de5mr10906735e9.23.1734509247721;
        Wed, 18 Dec 2024 00:07:27 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b12399sm12277485e9.20.2024.12.18.00.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 00:07:26 -0800 (PST)
Message-ID: <01f1bddd-7aee-4c90-9fa0-3b94c87eb469@linaro.org>
Date: Wed, 18 Dec 2024 08:07:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] spi: spi-mem: Extend spi-mem operations with a
 per-operation maximum frequency
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
 <20241025161501.485684-2-miquel.raynal@bootlin.com>
 <e76ff30b-342e-4e4c-aa84-40312c3ffc72@linaro.org>
 <87jzc3oo6g.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87jzc3oo6g.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_000729_955217_B41FD11E 
X-CRM114-Status: GOOD (  21.81  )
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



On 12/13/24 10:46 AM, Miquel Raynal wrote:
> Hello Tudor,
> 

Hi!

> On 11/11/2024 at 13:07:09 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 10/25/24 5:14 PM, Miquel Raynal wrote:
>>
>> cut
>>
>>>
>>> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>>> index 17b8baf749e6..ab650ae953bb 100644
>>> --- a/drivers/spi/spi-mem.c
>>> +++ b/drivers/spi/spi-mem.c

cut

>>> +	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
>>> +		((struct spi_mem_op *)op)->max_freq = mem->spi->max_speed_hz;
>>
>> not a big fan of casting the const out. How about introducing a
>> spi_mem_adjust_op_freq()? The upper layers will use that were needed,
>> and you'll still be able to pass a const op to spi_mem_exec_op()
> 
> I know it is not ideal so to follow your idea I drafted the use of
> spi_mem_adjust_op_freq(). In order to avoid the cast, we actually need
> to call this function everywhere in the core and the drivers to make
> sure we never get out of bounds, but here is the problem:
> 
>     $ git grep -w spi_mem_exec_op -- drivers/ | wc -l
>     42
> 
> This approach requires to add a call to spi_mem_adjust_op_freq() before
> *every* spi_mem_exec_op(). Yes I can do that but that means to be very
> attentive to the fact that these two functions are always called
> together. I am not sure it is a good idea.
> 
> What about doing the following once in spi_mem_exec_op() instead?
> 
>     spi_mem_adjust_op_freq(desc->mem, (struct spi_mem_op *)op);
> 
> I know we still have a cast, but it feels more acceptable than the one I
> initially proposed and covers all cases. I would not accept that in a
> driver, but here we are in the core, so that sounds acceptable.
> 
> Another possibility otherwise would be to drop the const from the
> spi_mem_op structure entirely. But I prefer the above function call.

How about introducing a spi_nand_spimem_exec_op() where you call
spi_mem_adjust_op_freq() and spi_mem_exec_op()?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
