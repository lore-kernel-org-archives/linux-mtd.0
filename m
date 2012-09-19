Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEKwP-0006Ni-R6
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2012 14:07:50 +0000
Received: by weyr3 with SMTP id r3so610303wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2012 07:07:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5059CC77.5060505@pengutronix.de>
References: <1348056494-30019-1-git-send-email-zajec5@gmail.com>
 <5059CC77.5060505@pengutronix.de>
Date: Wed, 19 Sep 2012 16:07:47 +0200
Message-ID: <CACna6rzsF1gVCiGuhprfD3NPLd1N0bwi0eSuLCMrV23O8JvUWA@mail.gmail.com>
Subject: Re: [PATCH RFC] bcm47xxsflash: just use memcpy for reading
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Jonas Gorski <jonas.gorski@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/19 Marc Kleine-Budde <mkl@pengutronix.de>:
> On 09/19/2012 02:08 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> ---
>> Still have to check it with aiaiai
>> ---
>>  drivers/mtd/devices/bcm47xxsflash.c |   31 ++--------------------------=
---
>>  1 files changed, 2 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/b=
cm47xxsflash.c
>> index a328872..2f8dfd4 100644
>> --- a/drivers/mtd/devices/bcm47xxsflash.c
>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>> @@ -14,41 +14,14 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, =
loff_t from, size_t len,
>>                             size_t *retlen, u_char *buf)
>>  {
>>       struct bcma_sflash *sflash =3D mtd->priv;
>> -     size_t bytes_read =3D 0;
>> -     __iomem u8 *src =3D (__iomem u8 *)KSEG0ADDR(sflash->window + from)=
;
>> -     int i;
>> -     size_t unaligned_before, unaligned_after;
>>
>>       /* Check address range */
>>       if ((from + len) > mtd->size)
>>               return -EINVAL;
>>
>> -     unaligned_before =3D from & 0x3;
>> -     unaligned_after =3D (from + len) & 0x3;
>> +     memcpy(buf, (void *)KSEG0ADDR(sflash->window + from), len);
>
> You should not access iomem with memcpy, there is a memcpy_fromio(), but
> it's an unoptimized readb loop on arm.

Sure, I can replace that with _fromio, which AFAIK is the same for mips.

I'm afraid access to the serial flash can't be really optimal. Saving
is actually even worse, it requires some operations on BCMA core,
polling for ready, etc.

--=20
Rafa=C5=82
