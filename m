Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEHnL-0004CJ-C1
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2012 10:46:16 +0000
Received: by weyr3 with SMTP id r3so505714wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2012 03:46:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOiHx==SFr7EUAm0vdrAbs8Ze7his8Bgx+g-Ri6j6Q-iqGDkXg@mail.gmail.com>
References: <1347875449-19318-1-git-send-email-zajec5@gmail.com>
 <CAOiHx==SFr7EUAm0vdrAbs8Ze7his8Bgx+g-Ri6j6Q-iqGDkXg@mail.gmail.com>
Date: Wed, 19 Sep 2012 12:46:09 +0200
Message-ID: <CACna6rxM9FRQTRmL9QRjciL3ZDkT_nQNwgifh__cK_HwSLf-GA@mail.gmail.com>
Subject: Re: [PATCH V3] mtd: basic (read only) driver for BCMA serial flash
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/18 Jonas Gorski <jonas.gorski@gmail.com>:
> I know I'm a bit late, but ...
>
> On 17 September 2012 11:50, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wr=
ote:
>> (...)
>> diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
>> index a4dd1d8..395733a 100644
>> --- a/drivers/mtd/devices/Makefile
>> +++ b/drivers/mtd/devices/Makefile
>> @@ -19,5 +19,6 @@ obj-$(CONFIG_MTD_DATAFLASH)   +=3D mtd_dataflash.o
>>  obj-$(CONFIG_MTD_M25P80)       +=3D m25p80.o
>>  obj-$(CONFIG_MTD_SPEAR_SMI)    +=3D spear_smi.o
>>  obj-$(CONFIG_MTD_SST25L)       +=3D sst25l.o
>> +obj-$(CONFIG_MTD_BCM47XXSFLASH)        +=3D bcm47xxsflash.o
>>
>>  CFLAGS_docg3.o                 +=3D -I$(src)
>> \ No newline at end of file
>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/b=
cm47xxsflash.c
>> new file mode 100644
>> index 0000000..f711a51
>> --- /dev/null
>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>> @@ -0,0 +1,131 @@
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/bcma/bcma.h>
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Serial flash driver for BCMA bus");
>> +
>> +static const char *probes[] =3D { "bcm47xxpart", NULL };
>> +
>> +static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t=
 len,
>> +                             size_t *retlen, u_char *buf)
>> +{
>> +       struct bcma_sflash *sflash =3D mtd->priv;
>> +       size_t bytes_read =3D 0;
>> +       u8 *src =3D (u8 *)KSEG0ADDR(sflash->window + from);
>> +       int i;
>> +       size_t unaligned_before, unaligned_after;
>> +
>> +       /* Check address range */
>> +       if ((from + len) > mtd->size)
>> +               return -EINVAL;
>> +
>> +       unaligned_before =3D from & 0x3;
>
> I think this should be 4 - (from & 0x3), else you will read too much
> in the unaligned_before loop, also being at an unaligned address then.

Right, that's wrong.


>> +       unaligned_after =3D (from + len) & 0x3;
>> +
>> +       for (i =3D 0; i < unaligned_before; i++) {
>> +               *buf =3D readb(src);
>> +               buf++;
>> +               src++;
>> +               bytes_read++;
>> +       }
>> +       for (i =3D from - unaligned_before; i < from + len - unaligned_a=
fter;
>
> This one looks suspicious, aren't you assuming you have read
> unaligned_before bytes, so shouldn't i be from /+/ unaligned_before?

Right again. I could probably drom "from" too.


>> +            i +=3D 4) {
>> +               *(u32 *)buf =3D readl((u32 *)src);
>> +               buf +=3D 4;
>> +               src +=3D 4;
>> +               bytes_read +=3D 4;
>> +       }
>> +       for (i =3D 0; i < unaligned_after; i++) {
>> +               *buf =3D readb(src);
>> +               buf++;
>> +               src++;
>> +               bytes_read++;
>> +       }
>
> It will also fail for unaligned reads within the same 4 byte block -
> they will be read twice, once in _before, once in _after.

Hm, I don't understand that yet. It looks fine for me :| But I'll do
some test and it should become obvious to me then :)


> Also in the before and after loops, you are reading with native
> endianess (since you don't swab the addresses), but in the aligned
> case you are assuming little endianess. If you intend to do native
> endianess reads (we only support little endian bcm47xx), you should be
> fine by just replacing this whole logic with a memcpy(_fromio?), if
> not you should probably swab the addresses when reading the unaligned
> parts when big endian. Unfortunately I don't have any big endian
> bcm47xx devices at hand to test ;-) (but I do know they exist - AFAICT
> from netgear's gpl sources the bcm53xxx switch chips are big endian
> bcm47xx).

Whoops, I didn't know readl is LE access :| I though readb/readw/readl
are native endianess. Sorry for that.


I'm not sure about that endianess, what exactly we should implement. I
wanted to get some tip from simple map (see map_funcs.c and map.h) and
it seems it is using "inline_map_copy_from" indeed.

--=20
Rafa=C5=82
