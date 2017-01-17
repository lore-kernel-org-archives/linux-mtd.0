Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTRKO-0000Am-7u
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 10:49:26 +0000
Received: by mail-lf0-x243.google.com with SMTP id h65so15629175lfi.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2017 02:49:03 -0800 (PST)
Subject: Re: [PATCH] mtd: bcm47xxsflash: support reading flash out of mapping
 window
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <20170116220916.2603-1-zajec5@gmail.com>
 <41e65a7a-e413-9e00-f629-98636ed76212@gmail.com>
 <CACna6ryLLwO54FBfqUekxrKVK0PNVQiHrwOPdnJToseKWw8POA@mail.gmail.com>
 <353656d9-d2a4-92b6-ce6c-9a3f1d69409f@gmail.com>
 <CACna6rwoQruoQfRMD9sV3Q-o2SM-HtXjZpPqOaEgJ+WCW6mQGQ@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c559873c-626b-995b-a453-c79d4198271f@gmail.com>
Date: Tue, 17 Jan 2017 11:49:00 +0100
MIME-Version: 1.0
In-Reply-To: <CACna6rwoQruoQfRMD9sV3Q-o2SM-HtXjZpPqOaEgJ+WCW6mQGQ@mail.gmail.com>
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

On 01/17/2017 11:39 AM, Rafał Miłecki wrote:
> On 17 January 2017 at 10:49, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 01/17/2017 07:58 AM, Rafał Miłecki wrote:
>>> On 17 January 2017 at 04:18, Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> On 01/16/2017 11:09 PM, Rafał Miłecki wrote:
>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>
>>>>> For reading flash content we use MMIO but it's possible to read only
>>>>> first 16 MiB this way. It's simply an arch design/limitation.
>>>>> To support flash sizes bigger than 16 MiB implement indirect access
>>>>> using ChipCommon registers.
>>>>> This has been tested using MX25L25635F.
>>>>>
>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>> ---
>>>>>  drivers/mtd/devices/bcm47xxsflash.c | 12 +++++++++++-
>>>>>  drivers/mtd/devices/bcm47xxsflash.h |  3 +++
>>>>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
>>>>> index 4decd8c..5d57119 100644
>>>>> --- a/drivers/mtd/devices/bcm47xxsflash.c
>>>>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>>>>> @@ -110,7 +110,17 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
>>>>>       if ((from + len) > mtd->size)
>>>>>               return -EINVAL;
>>>>>
>>>>> -     memcpy_fromio(buf, b47s->window + from, len);
>>>>> +     if (from + len <= BCM47XXSFLASH_WINDOW_SIZE) {
>>>>> +             memcpy_fromio(buf, b47s->window + from, len);
>>>>> +     } else {
>>>>> +             size_t i;
>>>>> +
>>>>> +             for (i = 0; i < len; i++) {
>>>>> +                     b47s->cc_write(b47s, BCMA_CC_FLASHADDR, from++);
>>>>> +                     bcm47xxsflash_cmd(b47s, OPCODE_ST_READ4B);
>>>>> +                     *(buf++) = b47s->cc_read(b47s, BCMA_CC_FLASHDATA) & 0xff;
>>>>
>>>> Do you really need to send command on every write into the FLASHADDR
>>>> register ? Doesn't this hardware support some sort of seqeuntial reading?
>>>
>>> Yes, I need to. If there is some other way it's undocumented and not
>>> used by Broadcom. As a quick check I tried not writing to FLASHADDR
>>> every time, but it didn't work.
>>
>> Oh well, that's a bit sad. Thanks for checking.
>>
>>>> Are you sure this has no side-effects when you mix this with reading
>>>> from the flash window ?
>>>
>>> No side effects. I also tried reading whole flash content using this
>>> indirect access and it worked as well.
>>
>> Well, if you read the whole flash, you will trigger the first windowed
>> read and then the new code, in sequence. Try doing some read pattern
>> where you read from the beginning and mix it with reads from the end.
>> That will alternate between these two bits of code.
> 
> I really can't follow your possible-fail scenario. With my patch first
> 16 MiB are read using windowed access, another 16 MiB using indirect
> access. I scanned whole flash this way, it worked. I got a working
> system. It just works...
> 
Well if you scanned the whole flash, you triggered the memcpy_fromio()
first and then the b47s->cc_write(..) stuff , in that order. So does it
work if you read the first 16 MiB after you read the region past 16 MiB?

-- 
Best regards,
Marek Vasut
