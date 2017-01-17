Received: from mail-wj0-x241.google.com ([2a00:1450:400c:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTSH3-0005UK-NO
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 11:50:04 +0000
Received: by mail-wj0-x241.google.com with SMTP id i7so1051567wjf.2
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2017 03:49:40 -0800 (PST)
Subject: Re: [PATCH V2] mtd: bcm47xxsflash: support reading flash out of
 mapping window
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <20170116220916.2603-1-zajec5@gmail.com>
 <20170117105110.26328-1-zajec5@gmail.com>
 <31ca1f51-887d-fce4-400c-cc0f97353eb8@gmail.com>
 <CACna6rzHtNE-8YCAmydzhCytYQc53Jr9HGo=rdQt-KkD1YW-qA@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4e268f6f-42fd-84a8-2b28-6ebb5129d945@gmail.com>
Date: Tue, 17 Jan 2017 12:49:37 +0100
MIME-Version: 1.0
In-Reply-To: <CACna6rzHtNE-8YCAmydzhCytYQc53Jr9HGo=rdQt-KkD1YW-qA@mail.gmail.com>
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

On 01/17/2017 12:08 PM, Rafał Miłecki wrote:
> On 17 January 2017 at 12:00, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 01/17/2017 11:51 AM, Rafał Miłecki wrote:
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
>>> V2: Simplify line writing to buf
>>>     Add some trivial comment for OPCODE_ST_READ4B
>>>     Both requested by Marek
>>> ---
>>>  drivers/mtd/devices/bcm47xxsflash.c | 12 +++++++++++-
>>>  drivers/mtd/devices/bcm47xxsflash.h |  3 +++
>>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
>>> index 4decd8c..8d4c1db 100644
>>> --- a/drivers/mtd/devices/bcm47xxsflash.c
>>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>>> @@ -110,7 +110,17 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
>>>       if ((from + len) > mtd->size)
>>>               return -EINVAL;
>>>
>>> -     memcpy_fromio(buf, b47s->window + from, len);
>>> +     if (from + len <= BCM47XXSFLASH_WINDOW_SIZE) {
>>> +             memcpy_fromio(buf, b47s->window + from, len);
>>
>> One last nit, what if the read starts < 16 MiB and ends > 16 MiB ?
>> Shouldn't that use partly the windowed mode and partly the other mode?
> 
> You'll lost 10ns*... or not as splitting it into 2 code paths could
> take longer, who knows. Most access are block aligned anyway. I don't
> think such corner case with doubtful gain is much worth considering &
> optimizing.

So you can also read the first 16 MiB using the new method , right ?

> * Statistic from my mind
> 


-- 
Best regards,
Marek Vasut
