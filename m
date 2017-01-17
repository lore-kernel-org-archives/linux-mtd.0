Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTNjL-00053A-Sv
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 06:58:57 +0000
Received: by mail-oi0-x241.google.com with SMTP id w144so9860663oiw.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 22:58:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <41e65a7a-e413-9e00-f629-98636ed76212@gmail.com>
References: <20170116220916.2603-1-zajec5@gmail.com>
 <41e65a7a-e413-9e00-f629-98636ed76212@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 17 Jan 2017 07:58:34 +0100
Message-ID: <CACna6ryLLwO54FBfqUekxrKVK0PNVQiHrwOPdnJToseKWw8POA@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: support reading flash out of mapping
 window
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

On 17 January 2017 at 04:18, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 01/16/2017 11:09 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
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
>>  drivers/mtd/devices/bcm47xxsflash.c | 12 +++++++++++-
>>  drivers/mtd/devices/bcm47xxsflash.h |  3 +++
>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/b=
cm47xxsflash.c
>> index 4decd8c..5d57119 100644
>> --- a/drivers/mtd/devices/bcm47xxsflash.c
>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>> @@ -110,7 +110,17 @@ static int bcm47xxsflash_read(struct mtd_info *mtd,=
 loff_t from, size_t len,
>>       if ((from + len) > mtd->size)
>>               return -EINVAL;
>>
>> -     memcpy_fromio(buf, b47s->window + from, len);
>> +     if (from + len <=3D BCM47XXSFLASH_WINDOW_SIZE) {
>> +             memcpy_fromio(buf, b47s->window + from, len);
>> +     } else {
>> +             size_t i;
>> +
>> +             for (i =3D 0; i < len; i++) {
>> +                     b47s->cc_write(b47s, BCMA_CC_FLASHADDR, from++);
>> +                     bcm47xxsflash_cmd(b47s, OPCODE_ST_READ4B);
>> +                     *(buf++) =3D b47s->cc_read(b47s, BCMA_CC_FLASHDATA=
) & 0xff;
>
> Do you really need to send command on every write into the FLASHADDR
> register ? Doesn't this hardware support some sort of seqeuntial reading?

Yes, I need to. If there is some other way it's undocumented and not
used by Broadcom. As a quick check I tried not writing to FLASHADDR
every time, but it didn't work.


> Are you sure this has no side-effects when you mix this with reading
> from the flash window ?

No side effects. I also tried reading whole flash content using this
indirect access and it worked as well.


> Also, the parenthesis around buf++ are not needed and the & 0xff should
> not be needed either.

You're right about buf. I'm not sure about & 0xff though. In theory
you're correct. This is 32b register and we use 32b read function to
access it but I never saw anything set in 0xffffff00. On the other
hand Broadcom /advises/ (does) this & 0xff so I'm wondering if there
can be some hardware with unexpected behavior in the world? What would
happen if we got 32b value with some bits in ~0xff?


>> +             }
>> +     }
>>       *retlen =3D len;
>>
>>       return len;
>> diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/b=
cm47xxsflash.h
>> index 1564b62..d8d1093 100644
>> --- a/drivers/mtd/devices/bcm47xxsflash.h
>> +++ b/drivers/mtd/devices/bcm47xxsflash.h
>> @@ -3,6 +3,8 @@
>>
>>  #include <linux/mtd/mtd.h>
>>
>> +#define BCM47XXSFLASH_WINDOW_SIZE            SZ_16M
>> +
>>  /* Used for ST flashes only. */
>>  #define OPCODE_ST_WREN               0x0006          /* Write Enable */
>>  #define OPCODE_ST_WRDIS              0x0004          /* Write Disable *=
/
>
> These look like standard opcodes, why don't you use standard opcodes in
> this driver and instead redefine them here ?

I guess it's because these are the only 2 opcodes we could share.
Other than them Broadcom uses their magic 16b opcodes so I guess it
doesn't change that much since we need most of them defined locally
anyway.


>> @@ -16,6 +18,7 @@
>>  #define OPCODE_ST_RES                0x03ab          /* Read Electronic=
 Signature */
>>  #define OPCODE_ST_CSA                0x1000          /* Keep chip selec=
t asserted */
>>  #define OPCODE_ST_SSE                0x0220          /* Sub-sector Eras=
e */
>> +#define OPCODE_ST_READ4B     0x6313
>
> Needs a comment to keep this consistent I think.

OK
