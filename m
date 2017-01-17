Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTQdw-0002wM-DC
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 10:05:34 +0000
Received: by mail-lf0-x244.google.com with SMTP id h65so15460203lfi.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2017 02:05:11 -0800 (PST)
Subject: Re: [PATCH] mtd: bcm47xxsflash: support reading flash out of mapping
 window
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <20170116220916.2603-1-zajec5@gmail.com>
 <41e65a7a-e413-9e00-f629-98636ed76212@gmail.com>
 <CACna6ryLLwO54FBfqUekxrKVK0PNVQiHrwOPdnJToseKWw8POA@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <353656d9-d2a4-92b6-ce6c-9a3f1d69409f@gmail.com>
Date: Tue, 17 Jan 2017 10:49:23 +0100
MIME-Version: 1.0
In-Reply-To: <CACna6ryLLwO54FBfqUekxrKVK0PNVQiHrwOPdnJToseKWw8POA@mail.gmail.com>
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

On 01/17/2017 07:58 AM, Rafał Miłecki wrote:
> On 17 January 2017 at 04:18, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 01/16/2017 11:09 PM, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> For reading flash content we use MMIO but it's possible to read only
>>> first 16 MiB this way. It's simply an arch design/limitation.
>>> To support flash sizes bigger than 16 MiB implement indirect access
>>> using ChipCommon registers.
>>> This has been tested using MX25L25635F.
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>>  drivers/mtd/devices/bcm47xxsflash.c | 12 +++++++++++-
>>>  drivers/mtd/devices/bcm47xxsflash.h |  3 +++
>>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
>>> index 4decd8c..5d57119 100644
>>> --- a/drivers/mtd/devices/bcm47xxsflash.c
>>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>>> @@ -110,7 +110,17 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
>>>       if ((from + len) > mtd->size)
>>>               return -EINVAL;
>>>
>>> -     memcpy_fromio(buf, b47s->window + from, len);
>>> +     if (from + len <= BCM47XXSFLASH_WINDOW_SIZE) {
>>> +             memcpy_fromio(buf, b47s->window + from, len);
>>> +     } else {
>>> +             size_t i;
>>> +
>>> +             for (i = 0; i < len; i++) {
>>> +                     b47s->cc_write(b47s, BCMA_CC_FLASHADDR, from++);
>>> +                     bcm47xxsflash_cmd(b47s, OPCODE_ST_READ4B);
>>> +                     *(buf++) = b47s->cc_read(b47s, BCMA_CC_FLASHDATA) & 0xff;
>>
>> Do you really need to send command on every write into the FLASHADDR
>> register ? Doesn't this hardware support some sort of seqeuntial reading?
> 
> Yes, I need to. If there is some other way it's undocumented and not
> used by Broadcom. As a quick check I tried not writing to FLASHADDR
> every time, but it didn't work.

Oh well, that's a bit sad. Thanks for checking.

>> Are you sure this has no side-effects when you mix this with reading
>> from the flash window ?
> 
> No side effects. I also tried reading whole flash content using this
> indirect access and it worked as well.

Well, if you read the whole flash, you will trigger the first windowed
read and then the new code, in sequence. Try doing some read pattern
where you read from the beginning and mix it with reads from the end.
That will alternate between these two bits of code.

>> Also, the parenthesis around buf++ are not needed and the & 0xff should
>> not be needed either.
> 
> You're right about buf. I'm not sure about & 0xff though. In theory
> you're correct. This is 32b register and we use 32b read function to
> access it but I never saw anything set in 0xffffff00. On the other
> hand Broadcom /advises/ (does) this & 0xff so I'm wondering if there
> can be some hardware with unexpected behavior in the world? What would
> happen if we got 32b value with some bits in ~0xff?

Well you're storing unsigned 32bit to unsigned 8bit, right ?

>>> +             }
>>> +     }
>>>       *retlen = len;
>>>
>>>       return len;
>>> diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
>>> index 1564b62..d8d1093 100644
>>> --- a/drivers/mtd/devices/bcm47xxsflash.h
>>> +++ b/drivers/mtd/devices/bcm47xxsflash.h
>>> @@ -3,6 +3,8 @@
>>>
>>>  #include <linux/mtd/mtd.h>
>>>
>>> +#define BCM47XXSFLASH_WINDOW_SIZE            SZ_16M
>>> +
>>>  /* Used for ST flashes only. */
>>>  #define OPCODE_ST_WREN               0x0006          /* Write Enable */
>>>  #define OPCODE_ST_WRDIS              0x0004          /* Write Disable */
>>
>> These look like standard opcodes, why don't you use standard opcodes in
>> this driver and instead redefine them here ?
> 
> I guess it's because these are the only 2 opcodes we could share.
> Other than them Broadcom uses their magic 16b opcodes so I guess it
> doesn't change that much since we need most of them defined locally
> anyway.

I see.

>>> @@ -16,6 +18,7 @@
>>>  #define OPCODE_ST_RES                0x03ab          /* Read Electronic Signature */
>>>  #define OPCODE_ST_CSA                0x1000          /* Keep chip select asserted */
>>>  #define OPCODE_ST_SSE                0x0220          /* Sub-sector Erase */
>>> +#define OPCODE_ST_READ4B     0x6313
>>
>> Needs a comment to keep this consistent I think.
> 
> OK
> 


-- 
Best regards,
Marek Vasut
