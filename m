Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFn0a-00071E-Qv
 for linux-mtd@lists.infradead.org; Sat, 10 Dec 2016 19:08:34 +0000
Received: by mail-wm0-x244.google.com with SMTP id a20so2754378wme.2
 for <linux-mtd@lists.infradead.org>; Sat, 10 Dec 2016 11:08:11 -0800 (PST)
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-2-git-send-email-clg@kaod.org>
 <68aa03be-8195-1824-a9e1-609a5ad74381@gmail.com>
 <f0ad683a-0989-e1ae-b33b-9746260ffa0e@kaod.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <2b51e3b8-5d02-c045-63c6-fcb0c9f8f460@gmail.com>
Date: Sat, 10 Dec 2016 20:08:08 +0100
MIME-Version: 1.0
In-Reply-To: <f0ad683a-0989-e1ae-b33b-9746260ffa0e@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/10/2016 06:34 PM, Cédric Le Goater wrote:
> Hello, 

Hi!

> On 12/10/2016 05:01 AM, Marek Vasut wrote:
>> On 12/09/2016 05:49 PM, Cédric Le Goater wrote:
>>
>> [...]
>>
>>
>>> +static int aspeed_smc_read_from_ahb(void *buf, const void __iomem *src,
>>> +				    size_t len)
>>> +{
>>> +	if (IS_ALIGNED((u32)src, sizeof(u32)) &&
>>> +	    IS_ALIGNED((u32)buf, sizeof(u32)) &&
>>> +	    IS_ALIGNED(len, sizeof(u32))) {
>>
>> Did you try compiling this on any 64bit system ?
> 
> I cross compile the kernel on a 64bit host and then upload on the
> target. What kind of problem are you forseeing ? 

Something about the pointer being clipped to 4 bytes, I'd rather use
uintptr_t cast instead of u32 . I don't think it matters for this check,
but just to be extra precise ...

>>
>>> +		while (len > 3) {
>>> +			*(u32 *)buf = readl(src);


[...]

>>> +/*
>>> + * Segment Address Registers. Start and end addresses are encoded
>>> + * using 8MB units
>>> + */
>>> +#define SEGMENT_ADDR_REG0		0x30
>>> +#define SEGMENT_ADDR_START(_r)		((((_r) >> 16) & 0xFF) << 23)
>>
>> is that ((r) & 0xff0000) << 7 ?
>>
>>> +#define SEGMENT_ADDR_END(_r)		((((_r) >> 24) & 0xFF) << 23)
>>
>> ((r) & 0xff000000) >> 1 ?
> 
> yes. 
> 
> I rather keep the initial macros though, which I found easier to 
> understand.
> 
> The Segment Register uses a 8MB unit to encode the start address
> and the end address of the mapping window of a flash SPI slave :
> 
>         | byte 1 | byte 2 | byte 3 | byte 4 |
>         +--------+--------+--------+--------+
>         |  end   |  start |   0    |   0    |

Then the above should be in the comment , it's a good explanation :)

Thanks!

-- 
Best regards,
Marek Vasut
