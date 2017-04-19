Received: from 17.mo3.mail-out.ovh.net ([87.98.178.58])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0w6L-00076J-TL
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 20:21:23 +0000
Received: from player771.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id CD64EC9DB7
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 22:20:57 +0200 (CEST)
Subject: Re: [PATCH v7 3/4] mtd: spi-nor: introduce Double Transfer Rate (DTR)
 SPI protocols
To: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <cover.1492554665.git.cyrille.pitchen@atmel.com>
 <be585167c61f5c057041b2079d477e0106e9be64.1492554665.git.cyrille.pitchen@atmel.com>
 <73d701a3-cd56-70b2-cf15-ec16e6734481@gmail.com>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, richard@nod.at
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <69db61ee-5de3-6518-6d44-fd4988d18bb6@wedev4u.fr>
Date: Wed, 19 Apr 2017 22:20:48 +0200
MIME-Version: 1.0
In-Reply-To: <73d701a3-cd56-70b2-cf15-ec16e6734481@gmail.com>
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

Hi Marek,

Le 19/04/2017 à 01:05, Marek Vasut a écrit :
> On 04/19/2017 12:51 AM, Cyrille Pitchen wrote:
>> This patch introduces support to Double Transfer Rate (DTR) SPI protocols.
>> DTR is used only for Fast Read operations.
>>
>> According to manufacturer datasheets, whatever the number of I/O lines
>> used during instruction (x) and address/mode/dummy (y) clock cycles, DTR
>> is used only during data (z) clock cycles of SPI x-y-z protocols.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> 
> [...]
> 
>> @@ -282,19 +305,22 @@ struct spi_nor_hwcaps {
>>   * As a matter of performances, it is relevant to use Quad SPI protocols first,
>>   * then Dual SPI protocols before Fast Read and lastly (Slow) Read.
>>   */
>> -#define SNOR_HWCAPS_READ_MASK		GENMASK(7, 0)
>> +#define SNOR_HWCAPS_READ_MASK		GENMASK(10, 0)
>>  #define SNOR_HWCAPS_READ		BIT(0)
>>  #define SNOR_HWCAPS_READ_FAST		BIT(1)
>> -
>> -#define SNOR_HWCAPS_READ_DUAL		GENMASK(4, 2)
>> -#define SNOR_HWCAPS_READ_1_1_2		BIT(2)
>> -#define SNOR_HWCAPS_READ_1_2_2		BIT(3)
>> -#define SNOR_HWCAPS_READ_2_2_2		BIT(4)
>> -
>> -#define SNOR_HWCAPS_READ_QUAD		GENMASK(7, 5)
>> -#define SNOR_HWCAPS_READ_1_1_4		BIT(5)
>> -#define SNOR_HWCAPS_READ_1_4_4		BIT(6)
>> -#define SNOR_HWCAPS_READ_4_4_4		BIT(7)
>> +#define SNOR_HWCAPS_READ_1_1_1_DTR	BIT(2)
>> +
>> +#define SNOR_HWCAPS_READ_DUAL		GENMASK(6, 3)
>> +#define SNOR_HWCAPS_READ_1_1_2		BIT(3)
>> +#define SNOR_HWCAPS_READ_1_2_2		BIT(4)
>> +#define SNOR_HWCAPS_READ_2_2_2		BIT(5)
>> +#define SNOR_HWCAPS_READ_1_2_2_DTR	BIT(6)
>> +
>> +#define SNOR_HWCAPS_READ_QUAD		GENMASK(10, 7)
>> +#define SNOR_HWCAPS_READ_1_1_4		BIT(7)
>> +#define SNOR_HWCAPS_READ_1_4_4		BIT(8)
>> +#define SNOR_HWCAPS_READ_4_4_4		BIT(9)
>> +#define SNOR_HWCAPS_READ_1_4_4_DTR	BIT(10)
> 
> I can't say I'm a big fan on this re-numeration when you add a new
> entry. But unless you have a better idea, we'll have to live with this ...
> 

Well, the other solution would be to reserve unused bit position in
patch 1 but would look odd too, wouldn't it?

As explained in the comments just above those definitions, the order of
the bits *does* matter. So maybe in the future, those bits would have to
be reordered again depending on the new features we would add then.

Thanks for your review!

Best regards,

Cyrille
