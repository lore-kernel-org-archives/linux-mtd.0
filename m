Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0xGL-0003cP-3i
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 21:35:46 +0000
Received: by mail-wr0-x229.google.com with SMTP id c55so23832557wrc.3
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 14:35:24 -0700 (PDT)
Subject: Re: [PATCH v7 3/4] mtd: spi-nor: introduce Double Transfer Rate (DTR)
 SPI protocols
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <cover.1492554665.git.cyrille.pitchen@atmel.com>
 <be585167c61f5c057041b2079d477e0106e9be64.1492554665.git.cyrille.pitchen@atmel.com>
 <73d701a3-cd56-70b2-cf15-ec16e6734481@gmail.com>
 <69db61ee-5de3-6518-6d44-fd4988d18bb6@wedev4u.fr>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, richard@nod.at
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b91c82c8-7ba1-919e-9f3b-673a1240ee8d@gmail.com>
Date: Wed, 19 Apr 2017 23:35:21 +0200
MIME-Version: 1.0
In-Reply-To: <69db61ee-5de3-6518-6d44-fd4988d18bb6@wedev4u.fr>
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

On 04/19/2017 10:20 PM, Cyrille Pitchen wrote:
> Hi Marek,
> 
> Le 19/04/2017 à 01:05, Marek Vasut a écrit :
>> On 04/19/2017 12:51 AM, Cyrille Pitchen wrote:
>>> This patch introduces support to Double Transfer Rate (DTR) SPI protocols.
>>> DTR is used only for Fast Read operations.
>>>
>>> According to manufacturer datasheets, whatever the number of I/O lines
>>> used during instruction (x) and address/mode/dummy (y) clock cycles, DTR
>>> is used only during data (z) clock cycles of SPI x-y-z protocols.
>>>
>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>
>> [...]
>>
>>> @@ -282,19 +305,22 @@ struct spi_nor_hwcaps {
>>>   * As a matter of performances, it is relevant to use Quad SPI protocols first,
>>>   * then Dual SPI protocols before Fast Read and lastly (Slow) Read.
>>>   */
>>> -#define SNOR_HWCAPS_READ_MASK		GENMASK(7, 0)
>>> +#define SNOR_HWCAPS_READ_MASK		GENMASK(10, 0)
>>>  #define SNOR_HWCAPS_READ		BIT(0)
>>>  #define SNOR_HWCAPS_READ_FAST		BIT(1)
>>> -
>>> -#define SNOR_HWCAPS_READ_DUAL		GENMASK(4, 2)
>>> -#define SNOR_HWCAPS_READ_1_1_2		BIT(2)
>>> -#define SNOR_HWCAPS_READ_1_2_2		BIT(3)
>>> -#define SNOR_HWCAPS_READ_2_2_2		BIT(4)
>>> -
>>> -#define SNOR_HWCAPS_READ_QUAD		GENMASK(7, 5)
>>> -#define SNOR_HWCAPS_READ_1_1_4		BIT(5)
>>> -#define SNOR_HWCAPS_READ_1_4_4		BIT(6)
>>> -#define SNOR_HWCAPS_READ_4_4_4		BIT(7)
>>> +#define SNOR_HWCAPS_READ_1_1_1_DTR	BIT(2)
>>> +
>>> +#define SNOR_HWCAPS_READ_DUAL		GENMASK(6, 3)
>>> +#define SNOR_HWCAPS_READ_1_1_2		BIT(3)
>>> +#define SNOR_HWCAPS_READ_1_2_2		BIT(4)
>>> +#define SNOR_HWCAPS_READ_2_2_2		BIT(5)
>>> +#define SNOR_HWCAPS_READ_1_2_2_DTR	BIT(6)
>>> +
>>> +#define SNOR_HWCAPS_READ_QUAD		GENMASK(10, 7)
>>> +#define SNOR_HWCAPS_READ_1_1_4		BIT(7)
>>> +#define SNOR_HWCAPS_READ_1_4_4		BIT(8)
>>> +#define SNOR_HWCAPS_READ_4_4_4		BIT(9)
>>> +#define SNOR_HWCAPS_READ_1_4_4_DTR	BIT(10)
>>
>> I can't say I'm a big fan on this re-numeration when you add a new
>> entry. But unless you have a better idea, we'll have to live with this ...
>>
> 
> Well, the other solution would be to reserve unused bit position in
> patch 1 but would look odd too, wouldn't it?

Yeah, that's not super either ... I was pondering if there might be some
less error-prone way to autogenerate this maybe.

> As explained in the comments just above those definitions, the order of
> the bits *does* matter. So maybe in the future, those bits would have to
> be reordered again depending on the new features we would add then.
> 
> Thanks for your review!
> 
> Best regards,
> 
> Cyrille
> 


-- 
Best regards,
Marek Vasut
