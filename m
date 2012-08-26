Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5RAm-0002oW-K6
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 00:57:53 +0000
Received: by eekc13 with SMTP id c13so976165eek.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 17:57:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345920652-11728-1-git-send-email-zajec5@gmail.com>
References: <1345920652-11728-1-git-send-email-zajec5@gmail.com>
Date: Sat, 25 Aug 2012 17:57:49 -0700
Message-ID: <CAJiQ=7Au726TrpXeK=yFiOnaqdDqaEDq+RUmkvcNgkt+8tggNA@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: bcm47part driver for BCM47XX chipsets
From: Kevin Cernekee <cernekee@gmail.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
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

On Sat, Aug 25, 2012 at 11:50 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com=
> wrote:
> +config MTD_BCM47_PARTS
> +       tristate "BCM47XX partitioning support"
> +       depends on BCM47XX

You may want to change "bcm47" to "bcm47xx", for consistency with the
other bcm47xx/bcm63xx references found throughout the tree.

> +       u8 *buf;
[...]
> +       buf =3D kzalloc(sizeof(*buf) * BCM47PART_BYTES_TO_READ, GFP_KERNE=
L);

sizeof(u8) probably isn't needed.

> +               /* CFE has small NVRAM at 0x400 */
> +               fourcc =3D (u32 *)&buf[0x400];
> +               if (*fourcc =3D=3D NVRAM_HEADER) {
> +                       parts[curr_part].name =3D "boot";
> +                       parts[curr_part].mask_flags =3D MTD_WRITEABLE;
> +                       parts[curr_part].offset =3D offset;
> +                       curr_part++;
> +               }
> +
> +               /* Standard NVRAM */
> +               fourcc =3D (u32 *)&buf[0x000];
> +               if (*fourcc =3D=3D NVRAM_HEADER) {
> +                       parts[curr_part].name =3D "nvram";
> +                       parts[curr_part].mask_flags =3D MTD_WRITEABLE;
> +                       parts[curr_part].offset =3D offset;
> +                       curr_part++;
> +               }
> +
> +               /* board_data starts with board_id which differs across b=
oards,
> +                * but we can use 'MPFR' (hopefully) magic at 0x100 */
> +               fourcc =3D (u32 *)&buf[0x100];
> +               if (*fourcc =3D=3D 0x5246504D) { /* MPFR */
> +                       parts[curr_part].name =3D "board_data";
> +                       parts[curr_part].mask_flags =3D MTD_WRITEABLE;
> +                       parts[curr_part].offset =3D offset;
> +                       curr_part++;
> +               }
> +
> +               /* POT(TOP) */
> +               fourcc =3D (u32 *)&buf[0x000];
> +               fourcc2 =3D (u32 *)&buf[0x004];
> +               if (*fourcc =3D=3D 0x54544f50 &&             /* POTT */
> +                   (*fourcc2 & 0xFFFF) =3D=3D 0x504f) {     /* OP */
> +                       parts[curr_part].name =3D "POT";
> +                       parts[curr_part].mask_flags =3D MTD_WRITEABLE;
> +                       parts[curr_part].offset =3D offset;
> +                       curr_part++;
> +               }
> +
> +               /* ML */
> +               fourcc =3D (u32 *)&buf[0x010];
> +               fourcc2 =3D (u32 *)&buf[0x014];
> +               if (*fourcc =3D=3D 0x39685a42 && *fourcc2 =3D=3D 0x265941=
31) {

I would suggest using symbolic names for the constants, even if it's
just something like ML_MAGIC1.

> +                       parts[curr_part].name =3D "ML";
> +                       parts[curr_part].mask_flags =3D MTD_WRITEABLE;
> +                       parts[curr_part].offset =3D offset;
> +                       curr_part++;
> +               }

Are all of these cases mutually exclusive, given that they use the same off=
set?

It would be nice to reduce the amount of duplicated code if possible.
Maybe something as simple as:

char *name =3D NULL;
if (some_condition)
    name =3D "POT";
else if (some_other_condition)
    name =3D "ML";
[...]

if (name) {
    parts[curr_part].name =3D name;
    parts[curr_part].mask_flags =3D MTD_WRITEABLE;
    parts[curr_part].offset =3D offset;
    curr_part++;
}


Can the contents of buf[] be represented in a struct?
