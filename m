Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTSVW-0006CO-JN
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 12:05:03 +0000
Received: by mail-ot0-x241.google.com with SMTP id 65so8979772otq.2
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2017 04:04:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4e268f6f-42fd-84a8-2b28-6ebb5129d945@gmail.com>
References: <20170116220916.2603-1-zajec5@gmail.com>
 <20170117105110.26328-1-zajec5@gmail.com>
 <31ca1f51-887d-fce4-400c-cc0f97353eb8@gmail.com>
 <CACna6rzHtNE-8YCAmydzhCytYQc53Jr9HGo=rdQt-KkD1YW-qA@mail.gmail.com>
 <4e268f6f-42fd-84a8-2b28-6ebb5129d945@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 17 Jan 2017 13:04:37 +0100
Message-ID: <CACna6ryfrDeYdMmLbOfeZNoA_EifPNKennXVBj3_bZk078c2Tw@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: bcm47xxsflash: support reading flash out of
 mapping window
To: Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 January 2017 at 12:49, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 01/17/2017 12:08 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 17 January 2017 at 12:00, Marek Vasut <marek.vasut@gmail.com> wrote:
>>> On 01/17/2017 11:51 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>>>
>>>> For reading flash content we use MMIO but it's possible to read only
>>>> first 16 MiB this way. It's simply an arch design/limitation.
>>>> To support flash sizes bigger than 16 MiB implement indirect access
>>>> using ChipCommon registers.
>>>> This has been tested using MX25L25635F.
>>>>
>>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>>> ---
>>>> V2: Simplify line writing to buf
>>>>     Add some trivial comment for OPCODE_ST_READ4B
>>>>     Both requested by Marek
>>>> ---
>>>>  drivers/mtd/devices/bcm47xxsflash.c | 12 +++++++++++-
>>>>  drivers/mtd/devices/bcm47xxsflash.h |  3 +++
>>>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices=
/bcm47xxsflash.c
>>>> index 4decd8c..8d4c1db 100644
>>>> --- a/drivers/mtd/devices/bcm47xxsflash.c
>>>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>>>> @@ -110,7 +110,17 @@ static int bcm47xxsflash_read(struct mtd_info *mt=
d, loff_t from, size_t len,
>>>>       if ((from + len) > mtd->size)
>>>>               return -EINVAL;
>>>>
>>>> -     memcpy_fromio(buf, b47s->window + from, len);
>>>> +     if (from + len <=3D BCM47XXSFLASH_WINDOW_SIZE) {
>>>> +             memcpy_fromio(buf, b47s->window + from, len);
>>>
>>> One last nit, what if the read starts < 16 MiB and ends > 16 MiB ?
>>> Shouldn't that use partly the windowed mode and partly the other mode?
>>
>> You'll lost 10ns*... or not as splitting it into 2 code paths could
>> take longer, who knows. Most access are block aligned anyway. I don't
>> think such corner case with doubtful gain is much worth considering &
>> optimizing.
>
> So you can also read the first 16 MiB using the new method , right ?

I could, but this could be noticeable in performance. Reading 16 MiB
using slower method is different from reading what... a few KiB? Are
you actually sure mtd does unaligned reads at all?

Please let's argue about real problems and not few % performance in
some corner case on some obsolete hardware with poor design.

--=20
Rafa=C5=82
