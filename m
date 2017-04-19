Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0xCf-0001nk-Ja
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 21:31:59 +0000
Received: by mail-wm0-x22f.google.com with SMTP id r190so32908403wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 14:31:36 -0700 (PDT)
Subject: Re: [PATCH v7 1/4] mtd: spi-nor: introduce SPI 1-2-2 and SPI 1-4-4
 protocols
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <cover.1492554665.git.cyrille.pitchen@atmel.com>
 <7cd2bdacb871b25ac90d01a475fd65497793b52d.1492554665.git.cyrille.pitchen@atmel.com>
 <21ef8390-f079-85eb-76cc-0fd62338fb01@gmail.com>
 <776985e2-3954-81ab-0b81-1a2e1a26d826@wedev4u.fr>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, richard@nod.at
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <6ab8ba88-01f3-45a1-4877-3e65c89de917@gmail.com>
Date: Wed, 19 Apr 2017 23:31:33 +0200
MIME-Version: 1.0
In-Reply-To: <776985e2-3954-81ab-0b81-1a2e1a26d826@wedev4u.fr>
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

On 04/19/2017 10:12 PM, Cyrille Pitchen wrote:
> Le 19/04/2017 à 01:02, Marek Vasut a écrit :
>> On 04/19/2017 12:51 AM, Cyrille Pitchen wrote:
>>> This patch changes the prototype of spi_nor_scan(): its 3rd parameter
>>> is replaced by a 'struct spi_nor_hwcaps' pointer, which tells the spi-nor
>>> framework about the actual hardware capabilities supported by the SPI
>>> controller and its driver.
>>>
>>> Besides, this patch also introduces a new 'struct spi_nor_flash_parameter'
>>> telling the spi-nor framework about the hardware capabilities supported by
>>> the SPI flash memory and the associated settings required to use those
>>> hardware caps.
>>>
>>> Then, to improve the readability of spi_nor_scan(), the discovery of the
>>> memory settings and the memory initialization are now split into two
>>> dedicated functions.
>>>
>>> 1 - spi_nor_init_params()
>>>
>>> The spi_nor_init_params() function is responsible for initializing the
>>> 'struct spi_nor_flash_parameter'. Currently this structure is filled with
>>> legacy values but further patches will allow to override some parameter
>>> values dynamically, for instance by reading the JESD216 Serial Flash
>>> Discoverable Parameter (SFDP) tables from the SPI memory.
>>> The spi_nor_init_params() function only deals with the hardware
>>> capabilities of the SPI flash memory: especially it doesn't care about
>>> the hardware capabilities supported by the SPI controller.
>>>
>>> 2 - spi_nor_setup()
>>>
>>> The second function is called once the 'struct spi_nor_flash_parameter'
>>> has been initialized by spi_nor_init_params().
>>> With both 'struct spi_nor_flash_parameter' and 'struct spi_nor_hwcaps',
>>> the new argument of spi_nor_scan(), spi_nor_setup() computes the best
>>> match between hardware caps supported by both the (Q)SPI memory and
>>> controller hence selecting the relevant settings for (Fast) Read and Page
>>> Program operations.
>>>
>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>
>> [...]
>>
>>> --- a/include/linux/mtd/spi-nor.h
>>> +++ b/include/linux/mtd/spi-nor.h
>>> @@ -119,13 +119,57 @@
>>>  /* Configuration Register bits. */
>>>  #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
>>>  
>>> -enum read_mode {
>>> -	SPI_NOR_NORMAL = 0,
>>> -	SPI_NOR_FAST,
>>> -	SPI_NOR_DUAL,
>>> -	SPI_NOR_QUAD,
>>> +/* Supported SPI protocols */
>>> +#define SNOR_PROTO_INST_MASK	GENMASK(23, 16)
>>> +#define SNOR_PROTO_INST_SHIFT	16
>>> +#define SNOR_PROTO_INST(_nbits)	\
>>> +	((((u32)(_nbits)) << SNOR_PROTO_INST_SHIFT) & SNOR_PROTO_INST_MASK)
>>
>> Is the u32 cast needed ?
>>
>>> +#define SNOR_PROTO_ADDR_MASK	GENMASK(15, 8)
>>> +#define SNOR_PROTO_ADDR_SHIFT	8
>>> +#define SNOR_PROTO_ADDR(_nbits)	\
>>> +	((((u32)(_nbits)) << SNOR_PROTO_ADDR_SHIFT) & SNOR_PROTO_ADDR_MASK)
>>> +
>>> +#define SNOR_PROTO_DATA_MASK	GENMASK(7, 0)
>>> +#define SNOR_PROTO_DATA_SHIFT	0
>>> +#define SNOR_PROTO_DATA(_nbits)	\
>>> +	((((u32)(_nbits)) << SNOR_PROTO_DATA_SHIFT) & SNOR_PROTO_DATA_MASK)
>>
>> [...]
>>
>>> +static inline u8 spi_nor_get_protocol_inst_nbits(enum spi_nor_protocol proto)
>>> +{
>>> +	return ((u32)(proto & SNOR_PROTO_INST_MASK)) >> SNOR_PROTO_INST_SHIFT;
>>
>> DTTO, is the cast needed ?
>>
> 
> # Short answer:
> 
> not necessary in this very particular case but always a good practice.
> 
> 
> 
> # Comprehensive comparison with macro definitions:
> 
> This cast is as needed as adding parentheses around the parameters
> inside the definition of some function-like macro. Most of the time, you
> can perfectly live without them but in some specific usages unexpected
> patterns of behavior occur then you struggle debugging to fix the issue:
> 
> #define MULT(a, b)	(a * b) /* instead of ((a) * (b)) */
> 
> int a;
> 
> a = MULT(2, 3); /* OK */
> a = MULT(2 * 4, 8); /* OK */
> a = MULT(2 + 4, 8); /* What result do you expect ? */

I think this is really completely irrelevant to my question. Besides,
this is quite distracting and it took me quite a while to figure out
what message you're trying to convey is.

> So it's always a good habit to cast into some unsigned integer type when
> working with bitmasks/bitfields as it's always a good habit to add
> parentheses around macro parameters: it's safer and it avoids falling
> into some nasty traps!
>
> Please have a look at the definitions of GENMASK() and BIT() macros in
> include/linux/bitops.h: they are defined using unsigned integers and
> there are technical reasons behind that.

Yes, I had a look. They use the UL suffix for constants , which means
the result is unsigned long, which according to C99 spec is at least
32bit datatype.

In your case, you use datatype which is explicitly 32bit only, so there
is difference.

If you're adamant about the casts, unsigned long is probably what you
want here .

> # Technical explanation:
> 
> First thing to care about: the enum
> 
> An enum is guaranteed to be represented by an integer, but the actual
> type (and its signedness) is implementation-dependent.

So the conclusion about enum is ... ?

> Second thing to know: the >> operator
> 
> The >> operator is perfectly defined when applied on an unsigned integer
> whereas its output depends on the implementation with a signed integer
> operand.
> In practice, in most cases, the >> on signed integer performs an
> arithmetic right shift and not a logical right shift as most people expect.
> 
> signed int v1 = 0x80000000;

Isn't such overflow undefined anyway ?

> (v1 >>  1) == 0xC0000000
> (v1 >> 31) == 0xFFFFFFFF
> 
> 
> unsigned int v2 = 0x80000000U;
> 
> (v2 >>  1) == 0x40000000U
> (v2 >> 31) == 0x00000001U
> 
> 
> Then, if you define some bitmask/bitfield including the 31st bit:
> 
> #define FIELD_SHIFT	30
> #define FIELD_MASK	GENMASK(31, 30)
> #define FIELD_VAL0	(0x0U << FIELD_SHIFT)
> #define FIELD_VAL1	(0x1U << FIELD_SHIFT)
> #define FIELD_VAL2	(0x2U << FIELD_SHIFT)
> #define FIELD_VAL3	(0x3U << FIELD_SHIFT)
> 
> 
> enum spi_nor_protocol {
> 	PROTO0 = [...],
> 
> 	PROTO42 = FIELD_VAL2 | [...],
> };
> 
> enum spi_nor_protocol proto = PROTO42
> u8 val;
> 
> val = (proto & FIELD_MASK) >> FIELD_SHIFT;
> if (val == 0x2U) {
> 	/*
> 	 * We may not reach this point as expected because val
> 	 * may be equal to 0xFEU depending on the implementation.
> 	 */
> }

And if you first shift and then mask ? Then you have no problem , yes?

-- 
Best regards,
Marek Vasut
