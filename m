Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5YXL-0003G9-5d
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 08:49:39 +0000
Received: by weyr3 with SMTP id r3so1911820wey.36
 for <linux-mtd@lists.infradead.org>; Sun, 26 Aug 2012 01:49:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJiQ=7Au726TrpXeK=yFiOnaqdDqaEDq+RUmkvcNgkt+8tggNA@mail.gmail.com>
References: <1345920652-11728-1-git-send-email-zajec5@gmail.com>
 <CAJiQ=7Au726TrpXeK=yFiOnaqdDqaEDq+RUmkvcNgkt+8tggNA@mail.gmail.com>
Date: Sun, 26 Aug 2012 10:49:33 +0200
Message-ID: <CACna6rwizW-9pX_2Cs7qMEUOxTpwSasq+EYyLVa9KP70d8bJ2g@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: bcm47part driver for BCM47XX chipsets
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for comments!

2012/8/26 Kevin Cernekee <cernekee@gmail.com>:
> On Sat, Aug 25, 2012 at 11:50 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.c=
om> wrote:
>> +config MTD_BCM47_PARTS
>> +       tristate "BCM47XX partitioning support"
>> +       depends on BCM47XX
>
> You may want to change "bcm47" to "bcm47xx", for consistency with the
> other bcm47xx/bcm63xx references found throughout the tree.

Personally I prefer that "bcm47" over "bcm47xx". 2 minor advantages for me:
1) It's shorted but still unique
2) We have chars after digits in it's name, it's easier to read than
"xxpart" or "xxnflash"

David: AFAIK you're the maintainer of mtd? Could you share your opinion?

I won't argue if you guys prefer "bcm47xx" :)


>> +       u8 *buf;
> [...]
>> +       buf =3D kzalloc(sizeof(*buf) * BCM47PART_BYTES_TO_READ, GFP_KERN=
EL);

> sizeof(u8) probably isn't needed.

I hoped it will make reading the code easier. Multiplying should be
optimized by compiler. But can drop this if you think it's not worth
it.


>> +               /* CFE has small NVRAM at 0x400 */
>> +               fourcc =3D (u32 *)&buf[0x400];
>> +               if (*fourcc =3D=3D NVRAM_HEADER) {
>> +                       parts[curr_part].name =3D "boot";
>> +                       parts[curr_part].mask_flags =3D MTD_WRITEABLE;
>> +                       parts[curr_part].offset =3D offset;
>> +                       curr_part++;
>> +               }
>> +
>> +               /* Standard NVRAM */
>> +               fourcc =3D (u32 *)&buf[0x000];
>> +               if (*fourcc =3D=3D NVRAM_HEADER) {
>> +                       parts[curr_part].name =3D "nvram";
>> +                       parts[curr_part].mask_flags =3D MTD_WRITEABLE;
>> +                       parts[curr_part].offset =3D offset;
>> +                       curr_part++;
>> +               }
>> +
>> +               /* board_data starts with board_id which differs across =
boards,
>> +                * but we can use 'MPFR' (hopefully) magic at 0x100 */
>> +               fourcc =3D (u32 *)&buf[0x100];
>> +               if (*fourcc =3D=3D 0x5246504D) { /* MPFR */
>> +                       parts[curr_part].name =3D "board_data";
>> +                       parts[curr_part].mask_flags =3D MTD_WRITEABLE;
>> +                       parts[curr_part].offset =3D offset;
>> +                       curr_part++;
>> +               }
>> +
>> +               /* POT(TOP) */
>> +               fourcc =3D (u32 *)&buf[0x000];
>> +               fourcc2 =3D (u32 *)&buf[0x004];
>> +               if (*fourcc =3D=3D 0x54544f50 &&             /* POTT */
>> +                   (*fourcc2 & 0xFFFF) =3D=3D 0x504f) {     /* OP */
>> +                       parts[curr_part].name =3D "POT";
>> +                       parts[curr_part].mask_flags =3D MTD_WRITEABLE;
>> +                       parts[curr_part].offset =3D offset;
>> +                       curr_part++;
>> +               }
>> +
>> +               /* ML */
>> +               fourcc =3D (u32 *)&buf[0x010];
>> +               fourcc2 =3D (u32 *)&buf[0x014];
>> +               if (*fourcc =3D=3D 0x39685a42 && *fourcc2 =3D=3D 0x26594=
131) {
>
> I would suggest using symbolic names for the constants, even if it's
> just something like ML_MAGIC1.

Agree.


>> +                       parts[curr_part].name =3D "ML";
>> +                       parts[curr_part].mask_flags =3D MTD_WRITEABLE;
>> +                       parts[curr_part].offset =3D offset;
>> +                       curr_part++;
>> +               }
>
> Are all of these cases mutually exclusive, given that they use the same o=
ffset?

Yes.


> It would be nice to reduce the amount of duplicated code if possible.
> Maybe something as simple as:
>
> char *name =3D NULL;
> if (some_condition)
>     name =3D "POT";
> else if (some_other_condition)
>     name =3D "ML";
> [...]
>
> if (name) {
>     parts[curr_part].name =3D name;
>     parts[curr_part].mask_flags =3D MTD_WRITEABLE;
>     parts[curr_part].offset =3D offset;
>     curr_part++;
> }

Ouch, you just reminded me I've forgotten to drop mask_flags in few
places. Masking MTD_WRITEABLE is needed for only ~half of our cases.
So if we follow your way now, we have to pass two arguments to the
generic partition handler: "name" and "mask_flags". But maybe I can
use some additional function for that? It should de-duplicate some
code and should work even for code inside "trx" parser.


> Can the contents of buf[] be represented in a struct?

Theoretically yes, but I think it doesn't make much sense. It's for
detecting type of partition, so it wouldn't have nice struct. It
usually would have only one valid field per type. So it would be
mostly like
struct partitions_ids {
    union {
        u32 possible_nvram_fourcc;
        u32 possible_pot_fourcc;
        u32 possible_trx_fourcc;
    },
    u32 possible_pot_fourcc2;
    u32 pad[2]
    u32 possible_ml_fourcc;
    u32 possible_ml_fourcc2;
}

I really don't like idea of such a struct.

--=20
Rafa=C5=82
