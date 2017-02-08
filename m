Received: from mail-ot0-f196.google.com ([74.125.82.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbb8i-0007DC-Hs
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 22:55:06 +0000
Received: by mail-ot0-f196.google.com with SMTP id 73so19666466otj.1
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 14:54:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170208193500.GB94627@google.com>
References: <20170123115154.3364-1-zajec5@gmail.com>
 <20170208193500.GB94627@google.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Wed, 8 Feb 2017 23:53:42 +0100
Message-ID: <CACna6rz5kkQAdZXWnKUE3ziNHDrR9xnCb3+uAqwAUqdKUER1-g@mail.gmail.com>
Subject: Re: [PATCH V3] mtd: bcm47xxsflash: support reading flash out of
 mapping window
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
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

On 8 February 2017 at 20:35, Brian Norris <computersforpeace@gmail.com> wro=
te:
> On Mon, Jan 23, 2017 at 12:51:54PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> For reading flash content we use MMIO but it's possible to read only
>> first 16 MiB this way. It's simply an arch design/limitation.
>> To support flash sizes bigger than 16 MiB implement indirect access
>> using ChipCommon registers.
>> This has been tested using MX25L25635F.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>> ---
>> V2: Simplify line writing to buf
>>     Add some trivial comment for OPCODE_ST_READ4B
>>     Both requested by Marek
>> V3: Use as much as possible MMIO access for read crossing boundary (perf=
ormance)
>> ---
>>  drivers/mtd/devices/bcm47xxsflash.c | 23 ++++++++++++++++++++---
>>  drivers/mtd/devices/bcm47xxsflash.h |  3 +++
>>  2 files changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/b=
cm47xxsflash.c
>> index 4decd8c0360a..138689619ab4 100644
>> --- a/drivers/mtd/devices/bcm47xxsflash.c
>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>> @@ -105,15 +105,32 @@ static int bcm47xxsflash_read(struct mtd_info *mtd=
, loff_t from, size_t len,
>>                             size_t *retlen, u_char *buf)
>>  {
>>       struct bcm47xxsflash *b47s =3D mtd->priv;
>> +     size_t orig_len =3D len;
>>
>>       /* Check address range */
>>       if ((from + len) > mtd->size)
>>               return -EINVAL;
>>
>> -     memcpy_fromio(buf, b47s->window + from, len);
>> -     *retlen =3D len;
>> +     /* Read as much as possible using fast MMIO window */
>> +     if (from < BCM47XXSFLASH_WINDOW_SZ) {
>> +             size_t memcpy_len;
>>
>> -     return len;
>> +             memcpy_len =3D min(len, (size_t)(BCM47XXSFLASH_WINDOW_SZ -=
 from));
>> +             memcpy_fromio(buf, b47s->window + from, memcpy_len);
>> +             from +=3D memcpy_len;
>> +             len -=3D memcpy_len;
>
> Am I crazy, or should you either be doing 'buf +=3D memcpy_len'?
> Otherwise, you'll be copying over the first few elements of 'buf' below,
> instead of finishing off the tail end.

Excellent catch, thank you!

--=20
Rafa=C5=82
