Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccCsC-0003OP-2W
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 15:12:39 +0000
Received: by mail-wm0-x243.google.com with SMTP id u63so7794039wmu.2
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2017 07:12:11 -0800 (PST)
Subject: Re: [PATCH] mtd: aspeed: fix compile warning in
 aspeed_smc_read_from_ahb()
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <1484817198-22477-1-git-send-email-clg@kaod.org>
 <20170208233728.GN94627@google.com>
 <19aa7cbb-8691-36d3-47a3-7a1029e66ecf@gmail.com>
 <19bcab6c-baf6-d34c-67bb-a5e655241e5e@kaod.org>
 <277b0a51-8384-09f4-6745-7d284a92b3e9@gmail.com>
 <c8e66f0f-9b83-8192-8a1e-11af03beb350@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <26e67f85-be44-b64e-4d12-fb6cd5c03cb5@gmail.com>
Date: Fri, 10 Feb 2017 16:09:13 +0100
MIME-Version: 1.0
In-Reply-To: <c8e66f0f-9b83-8192-8a1e-11af03beb350@kaod.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/10/2017 06:50 AM, Cédric Le Goater wrote:
> On 02/09/2017 04:04 PM, Marek Vasut wrote:
>> On 02/09/2017 10:59 AM, Cédric Le Goater wrote:
>>> On 02/09/2017 10:05 AM, Marek Vasut wrote:
>>>> On 02/09/2017 12:37 AM, Brian Norris wrote:
>>>>> On Thu, Jan 19, 2017 at 10:13:18AM +0100, Cédric Le Goater wrote:
>>>>>> The first argument of ioread32_rep() and ioread8_rep is not
>>>>>> const. Change aspeed_smc_read_from_ahb() prototype to fix compile
>>>>>> warning :
>>>>>>
>>>>>>    drivers/mtd/spi-nor/aspeed-smc.c: In function 'aspeed_smc_read_from_ahb':
>>>>>>    drivers/mtd/spi-nor/aspeed-smc.c:212:16: warning: passing argument 1 of 'ioread32_rep' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>>>>>>       ioread32_rep(src, buf, len >> 2);
>>>>>
>>>>> But why isn't that param constant? Seems like that's a bug in the
>>>>> ioread* APIs. Some of their implementations are const, but some are not.
>>>>>
>>>>> I see for instance that the implementation in lib/iomap.c is not const,
>>>>> where there's zero reason it shouldn't be (if we also fix, e.g., its
>>>>> mmio_insl()).
>>>>
>>>> Maybe it's worth fixing the ioread*_rep then ? Then again, that seems to
>>>> be way far off the scope of this patch.
>>>
>>> Looking closer at where this comes from, the compile warning was 
>>> reported on x86 which pulls a different file for the definitions 
>>> of the ioread routines.
>>
>> Well yes, intel is a special snowflake in the io accessor area.
>>
>>> On x86, arch/x86/include/asm/io.h includes <asm-generic/iomap.h>
>>> which contains prototypes of the ioread routines without 'const'.
>>>
>>> On ARM, arch/arm/include/asm/io.h includes <asm-generic/io.h>
>>> which contains the 'const' definitions.
>>
>> Can you check if any of those arches needs it without const ?
> 
> ok. I have checked over ppc, all defconfigs compile fine. 
> I will send a patch to linuxppc to see how we can merged it 
> in powerpc-next. The other arches would then be checked 
> by the Intel 0-day bot.

Great :)

-- 
Best regards,
Marek Vasut
