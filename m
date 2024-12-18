Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D505E77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxlTlqwJst2jdyL0+3L+n7uETMVvT19igHSI0glVRoo=; b=whQ8b+hulzJ9ko
	HRl8RoFHDMmkwkx0dsuPLh05rnD53jhpNR+2FWWb2E062Rd6yS3SQW7efFYzC2kfJIMKhm1VVRDQk
	QLNqG+9LDnFNUUDv5xmMkSssLHFYnFCS/j4cxoJWj4VavWbhsTJHDcw9naSV5V6Z0hXsrHFb9iOB7
	YEBzMbyNKqtURkQOOXYKmqgTjymHZYEhD9pJMd2pa7JekSWvrvP36YK+qiz8PxS1D+hp+qpkjdGgR
	xf8qbsfSCcZipefM4F2Ox94tW8W2QksuoeKzgbKYKn2G6PiUq56cKrHJZ0NQEK1jviaSWDmgoN9Qz
	VbdOoCEeXm6Eaa6VIWaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNr4R-0000000GDW5-3f1e;
	Wed, 18 Dec 2024 10:14:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNr3n-0000000GDRm-3XCf
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 10:13:45 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3863703258fso361110f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 02:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734516822; x=1735121622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EA1xX6cgrhop91VdIdUzvo0xa1Ga6IZLwxed7ZgRuGI=;
        b=Nzu4yp9nPNNbYe6MyNMg9LyzpHO8wJ3nBmMqOWgzbcpalGaQHJsBFhxD6q8Ur54x7e
         LyX3tP203/tDLV2vA/Wg2YkpKGTjIZxloAoOuJgDw/v2vIlZyrD7S3ICuGurI2xupiQn
         ep0pqc1c1y0hG1O+uXp+MsgsUNKDDC1WrzQbDlSq6cuI+7zmGiv2a9QFpbDeUia+SG90
         Oa3P9zQt9xc2ca2KiLRdUTul2bKM62lJ6YTVxQuQW3s1zjbA5o08Lt8rOmPFdKEzGo7Z
         J7AKE4GotoQA4/9FnKjhJCMjT865Xz2oSHO5XscVtKJTWTZ+pnQ0YRQWTTeMcPl/LIUr
         X+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734516822; x=1735121622;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EA1xX6cgrhop91VdIdUzvo0xa1Ga6IZLwxed7ZgRuGI=;
        b=HSKSJ45HmP6SPHouTs1Ur0rSEGlzzc3wSWAdZab1chd7/vKcK+fu+5YV6IJLO5dfa3
         3Q2QPadd3LcvwpIrZauy5SANvVRWdpGDAlnjse0mZLIsrM9YjI94ZpW6hoj68CkUJKbu
         eszjV2d3qJFPypHqEx0gEAsFBQt/sIRCJlhv0al7XKeZH90GR6A785mIzjYQSpt9ibR6
         3q1Nf8bgTD3oY4fT8BlHd6BNcWGNVlsfSrES7JWV3IJSKL8h4GGtJV9aT8xQ2dGKQFLo
         3rRfVRLmnWp9SjjCc3KpgzotazPyaz+gzRvwWq2bFSPcjvnBk7v9sbIr1uJzZtiYpVZl
         DjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF7BxDwh/jIDk2AmeW9DMSmCa3JzWQnF/z+3mvsktA9ejb2QXm1uR8zXEbjmcwiXiwGbAuFIKK27Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3U0SeTvlIbr5PFWkLf/diTvnkxUby9r8K1a/+XGqftNnBUlR+
	QWKZla+Qj+6Rl7IQTOVoi7+lIn3p5e0E/DsYPX+V0MlNF5Kq37iFryb5aF5fOsjABZLh1jhqlZ9
	s
X-Gm-Gg: ASbGncuTqdghZVtTp5nkkoKQXWcJzh/+cvMGACH7E6jxl/wkq1aJj8W90DA/UeTzEN1
	sPMS7hdeFSGJ/112NqSxvEDZCUNMYgvq0FhrrULC3ec8uRMXuKv1qQon92oRgGYD2kKLeyLD1c9
	nlEXombdKkGjJxBsdzS/vO8z26nThNenXSBgeopz8PeOHjp/4fQcY5IarmnearBS8Cz6rrRHBKr
	JeFXOskSDvJ4dqjIrpSkrBSc2+VQJTqAc5TQ23r4NmaVnGmGzwynHr9SPIXk2n/
X-Google-Smtp-Source: AGHT+IGlRq284CuS7uoaLeloaLt5eflG4sksdjOOEUhLk3CPJGbxo8PFGszZT7dZb0Hrr/bKuI1PhA==
X-Received: by 2002:a5d:6481:0:b0:386:37f8:450b with SMTP id ffacd0b85a97d-388db22a3d5mr5484500f8f.5.1734516822024;
        Wed, 18 Dec 2024 02:13:42 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016678sm13587517f8f.27.2024.12.18.02.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 02:13:41 -0800 (PST)
Message-ID: <8738dbbc-e2a9-49dc-9234-65de6435bc45@linaro.org>
Date: Wed, 18 Dec 2024 10:13:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] spi: spi-mem: Extend spi-mem operations with a
 per-operation maximum frequency
From: Tudor Ambarus <tudor.ambarus@linaro.org>
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
 <01f1bddd-7aee-4c90-9fa0-3b94c87eb469@linaro.org>
 <878qsde3i4.fsf@bootlin.com>
 <d12cc014-1e59-455e-8ee4-202997ddf846@linaro.org>
Content-Language: en-US
In-Reply-To: <d12cc014-1e59-455e-8ee4-202997ddf846@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_021343_900384_666C341D 
X-CRM114-Status: GOOD (  22.22  )
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



On 12/18/24 10:03 AM, Tudor Ambarus wrote:
> 
> 
> On 12/18/24 9:37 AM, Miquel Raynal wrote:
>> On 18/12/2024 at 08:07:24 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>>> On 12/13/24 10:46 AM, Miquel Raynal wrote:
>>>> Hello Tudor,
>>>>
>>>
>>> Hi!
>>>
>>>> On 11/11/2024 at 13:07:09 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>>
>>>>> On 10/25/24 5:14 PM, Miquel Raynal wrote:
>>>>>
>>>>> cut
>>>>>
>>>>>>
>>>>>> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>>>>>> index 17b8baf749e6..ab650ae953bb 100644
>>>>>> --- a/drivers/spi/spi-mem.c
>>>>>> +++ b/drivers/spi/spi-mem.c
>>>
>>> cut
>>>
>>>>>> +	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
>>>>>> +		((struct spi_mem_op *)op)->max_freq = mem->spi->max_speed_hz;
>>>>>
>>>>> not a big fan of casting the const out. How about introducing a
>>>>> spi_mem_adjust_op_freq()? The upper layers will use that were needed,
>>>>> and you'll still be able to pass a const op to spi_mem_exec_op()
>>>>
>>>> I know it is not ideal so to follow your idea I drafted the use of
>>>> spi_mem_adjust_op_freq(). In order to avoid the cast, we actually need
>>>> to call this function everywhere in the core and the drivers to make
>>>> sure we never get out of bounds, but here is the problem:
>>>>
>>>>     $ git grep -w spi_mem_exec_op -- drivers/ | wc -l
>>>>     42
>>>>
>>>> This approach requires to add a call to spi_mem_adjust_op_freq() before
>>>> *every* spi_mem_exec_op(). Yes I can do that but that means to be very
>>>> attentive to the fact that these two functions are always called
>>>> together. I am not sure it is a good idea.
>>>>
>>>> What about doing the following once in spi_mem_exec_op() instead?
>>>>
>>>>     spi_mem_adjust_op_freq(desc->mem, (struct spi_mem_op *)op);
>>>>
>>>> I know we still have a cast, but it feels more acceptable than the one I
>>>> initially proposed and covers all cases. I would not accept that in a
>>>> driver, but here we are in the core, so that sounds acceptable.
>>>>
>>>> Another possibility otherwise would be to drop the const from the
>>>> spi_mem_op structure entirely. But I prefer the above function call.
>>>
>>> How about introducing a spi_nand_spimem_exec_op() where you call
>>> spi_mem_adjust_op_freq() and spi_mem_exec_op()?
>>
>> That would work to make the cast disappear but TBH would not be totally
>> relevant as adjusting the frequency is typically something that would
>> benefit to spi-nor as well (maybe in the future) and therefore would
> 
> Right, SPI NOR will benefit of this too.
> 
>> fully apply to spi memories as a whole, not just spi-nand. We can think
>> about another naming maybe, but I find like spi_mem_exec_op() is the
>> right location to do this.
>>
> 
> It's not the first time that we adjust spi_mem_op parameters, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/drivers/mtd/spi-nor/core.c?h=spi-nor/next#n153
> 
> Does SPI NAND need to call spi_mem_adjust_op_size as well? I see it
> calls it when using dirmap, but not with a plain spi_mem_exec_op().
> 

I ask because I'm thinking of adding in the SPIMEM core a prepare()
method, and maybe rename exec_op() to exec(). And then introduce a
prepare_exec() method that the upper layers would call? Similar to
clk_prepare_enable.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
