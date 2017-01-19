Received: from mail-wm0-f67.google.com ([74.125.82.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUKJo-0004Fa-0z
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2017 21:32:30 +0000
Received: by mail-wm0-f67.google.com with SMTP id r144so2054265wme.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2017 13:32:07 -0800 (PST)
Subject: Re: [PATCH V2] mtd: bcm47xxsflash: support reading flash out of
 mapping window
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <20170116220916.2603-1-zajec5@gmail.com>
 <20170117105110.26328-1-zajec5@gmail.com>
 <31ca1f51-887d-fce4-400c-cc0f97353eb8@gmail.com>
 <CACna6rzHtNE-8YCAmydzhCytYQc53Jr9HGo=rdQt-KkD1YW-qA@mail.gmail.com>
 <4e268f6f-42fd-84a8-2b28-6ebb5129d945@gmail.com>
 <CACna6ryfrDeYdMmLbOfeZNoA_EifPNKennXVBj3_bZk078c2Tw@mail.gmail.com>
 <CACna6ryThsBAfQigPhKwLVRiZkH2V45YHSMqhDweBXmDk2sdqw@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c8f8a643-b6d2-4d68-8eb2-ab2f888bb6de@gmail.com>
Date: Thu, 19 Jan 2017 22:31:04 +0100
MIME-Version: 1.0
In-Reply-To: <CACna6ryThsBAfQigPhKwLVRiZkH2V45YHSMqhDweBXmDk2sdqw@mail.gmail.com>
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

On 01/17/2017 01:37 PM, Rafał Miłecki wrote:
> On 17 January 2017 at 13:04, Rafał Miłecki <zajec5@gmail.com> wrote:
>> On 17 January 2017 at 12:49, Marek Vasut <marek.vasut@gmail.com> wrote:
>>> On 01/17/2017 12:08 PM, Rafał Miłecki wrote:
>>>> On 17 January 2017 at 12:00, Marek Vasut <marek.vasut@gmail.com> wrote:
>>>>> On 01/17/2017 11:51 AM, Rafał Miłecki wrote:
>>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>>
>>>>>> For reading flash content we use MMIO but it's possible to read only
>>>>>> first 16 MiB this way. It's simply an arch design/limitation.
>>>>>> To support flash sizes bigger than 16 MiB implement indirect access
>>>>>> using ChipCommon registers.
>>>>>> This has been tested using MX25L25635F.
>>>>>>
>>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>>> ---
>>>>>> V2: Simplify line writing to buf
>>>>>>     Add some trivial comment for OPCODE_ST_READ4B
>>>>>>     Both requested by Marek
>>>>>> ---
>>>>>>  drivers/mtd/devices/bcm47xxsflash.c | 12 +++++++++++-
>>>>>>  drivers/mtd/devices/bcm47xxsflash.h |  3 +++
>>>>>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
>>>>>> index 4decd8c..8d4c1db 100644
>>>>>> --- a/drivers/mtd/devices/bcm47xxsflash.c
>>>>>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>>>>>> @@ -110,7 +110,17 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
>>>>>>       if ((from + len) > mtd->size)
>>>>>>               return -EINVAL;
>>>>>>
>>>>>> -     memcpy_fromio(buf, b47s->window + from, len);
>>>>>> +     if (from + len <= BCM47XXSFLASH_WINDOW_SIZE) {
>>>>>> +             memcpy_fromio(buf, b47s->window + from, len);
>>>>>
>>>>> One last nit, what if the read starts < 16 MiB and ends > 16 MiB ?
>>>>> Shouldn't that use partly the windowed mode and partly the other mode?
>>>>
>>>> You'll lost 10ns*... or not as splitting it into 2 code paths could
>>>> take longer, who knows. Most access are block aligned anyway. I don't
>>>> think such corner case with doubtful gain is much worth considering &
>>>> optimizing.
>>>
>>> So you can also read the first 16 MiB using the new method , right ?
>>
>> I could, but this could be noticeable in performance. Reading 16 MiB
>> using slower method is different from reading what... a few KiB? Are
>> you actually sure mtd does unaligned reads at all?
> 
> I did some quick test:
> if ((from & (b47s->blocksize - 1)) + len > b47s->blocksize)
>         pr_warn("[%s] Block unaligned read from 0x%llx len:0x%zx\n",
>                 __func__, from, len);
> 
> And it seems unaligned reads can happen:
> [  147.338850] [bcm47xxsflash_read] Block unaligned read from 0x4fe1c len:0x200
> [  147.663053] [bcm47xxsflash_read] Block unaligned read from 0x5fe1c len:0x200
> [  147.983868] [bcm47xxsflash_read] Block unaligned read from 0x6fe1c len:0x200
> [  148.304766] [bcm47xxsflash_read] Block unaligned read from 0x7fe1c len:0x200
> [  148.625637] [bcm47xxsflash_read] Block unaligned read from 0x8fe1c len:0x200
> [  148.955133] [bcm47xxsflash_read] Block unaligned read from 0x9fe1c len:0x200
> [  149.275948] [bcm47xxsflash_read] Block unaligned read from 0xafe1c len:0x200
> [  149.596790] [bcm47xxsflash_read] Block unaligned read from 0xbfe1c len:0x200
> [  149.917604] [bcm47xxsflash_read] Block unaligned read from 0xcfe1c len:0x200
> [  150.248641] [bcm47xxsflash_read] Block unaligned read from 0xdfe1c len:0x200
> [  150.569484] [bcm47xxsflash_read] Block unaligned read from 0xefe1c len:0x200
> [  150.890298] [bcm47xxsflash_read] Block unaligned read from 0xffe1c len:0x200
> [  151.211140] [bcm47xxsflash_read] Block unaligned read from 0x10fe1c len:0x200
> [  151.541393] [bcm47xxsflash_read] Block unaligned read from 0x11fe1c len:0x200
> [  151.862292] [bcm47xxsflash_read] Block unaligned read from 0x12fe1c len:0x200
> [  152.183246] [bcm47xxsflash_read] Block unaligned read from 0x13fe1c len:0x200
> [  152.504200] [bcm47xxsflash_read] Block unaligned read from 0x14fe1c len:0x200
> [  152.834957] [bcm47xxsflash_read] Block unaligned read from 0x15fe1c len:0x200
> [  153.155856] [bcm47xxsflash_read] Block unaligned read from 0x16fe1c len:0x200
> [  153.476782] [bcm47xxsflash_read] Block unaligned read from 0x17fe1c len:0x200
> [  153.797681] [bcm47xxsflash_read] Block unaligned read from 0x18fe1c len:0x200
> [  154.126925] [bcm47xxsflash_read] Block unaligned read from 0x19fe1c len:0x200
> [  154.447823] [bcm47xxsflash_read] Block unaligned read from 0x1afe1c len:0x200
> 
> I got these reads of only 0x200 so that doesn't worry me much. Should
> I ever expect bigger reads in my driver callback?

Try using /dev/mtdX for read directly (do not use for write), see my
previous email.

-- 
Best regards,
Marek Vasut
