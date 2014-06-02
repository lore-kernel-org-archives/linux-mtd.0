Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrPRc-00051S-3R
 for linux-mtd@lists.infradead.org; Mon, 02 Jun 2014 10:26:21 +0000
Received: by mail-qg0-f41.google.com with SMTP id j5so10447268qga.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2014 03:25:58 -0700 (PDT)
MIME-Version: 1.0
Sender: christian.riesch@gmail.com
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315D07F7@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315D03AC@NTXXIAMBX02.xacn.micron.com>
 <1400474715.883919171@f423.i.mail.ru>
 <A765B125120D1346A63912DDE6D8B6315D07F7@NTXXIAMBX02.xacn.micron.com>
Date: Mon, 2 Jun 2014 12:25:58 +0200
Message-ID: <CABkLOboJfc7=TyyxPGdvLgMQVH+g7FX+-ackrky-00WnaQkN_g@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd:nor:timeout:fix do_write_buffer() timeout error
From: Christian Riesch <christian.riesch@omicron.at>
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Kees Cook <keescook@chromium.org>, Alexander Shiyan <shc_work@mail.ru>,
 Jingoo Han <jg1.han@samsung.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
When you send an updated version of a patch, please put version
numbers into the subject, e.g. [PATCH v2], [PATCH v3]..., and include
a changelog. And I think you shouldn't send the new versions as a
reply to an earlier mail, send them as a new post instead.

On Mon, May 26, 2014 at 3:01 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (bean=
huo)
<beanhuo@micron.com> wrote:
> The size of the buffer program has been increased from 256 to 512 , 2ms m=
aximum timeout can not adapt to all the different vendor's norflash, There =
maximum timeout information in the CFI area,so the best way is to choose th=
e result calculated according to timeout field of struct cfi_ident that pro=
bed from norflash's CFI aera.This is also a standard defined by CFI.
>
> Without this change, if the size of buffer program is 512 or bigger than =
256, due to timeout is the shorter than that the chip required,do_write_buf=
fer sometimes fails.
>
> Tested with Micron JS28F512M29EWx and Micron MT28EW512ABA flash devices.

What kind of device is the MT28EW512ABA? Aren't MT28 devices
StrataFlashes that use the cfi_cmdset_0001.c driver?

>
> Signed-off-by: bean huo <beanhuo@micron.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   49 +++++++++++++++++++++++++++++=
+++---
>  1 file changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index e21fde9..87d446a 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -628,10 +628,42 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *m=
ap, int primary)
>                 cfi->chips[i].word_write_time =3D 1<<cfi->cfiq->WordWrite=
TimeoutTyp;
>                 cfi->chips[i].buffer_write_time =3D 1<<cfi->cfiq->BufWrit=
eTimeoutTyp;
>                 cfi->chips[i].erase_time =3D 1<<cfi->cfiq->BlockEraseTime=
outTyp;
> +               /*
> +                * We first calculate the timeout max according to timeou=
t
> +                * field of struct cfi_ident that probed from chip's CFI
> +                * aera,If haven't probed this information,we will specif=
y
> +                * a default value,and the time unit is us.
> +                */
> +               if (cfi->cfiq->WordWriteTimeoutTyp &&
> +                       cfi->cfiq->WordWriteTimeoutMax){
> +                       cfi->chips[i].word_write_time_max =3D
> +                               1<<(cfi->cfiq->WordWriteTimeoutTyp +
> +                                       cfi->cfiq->WordWriteTimeoutMax);
> +                       } else {
> +               /* specify maximum timeout for byte/word program 2000us *=
/
> +                               cfi->chips[i].word_write_time_max =3D 200=
0;
> +                               }
> +               if (cfi->cfiq->BufWriteTimeoutTyp &&
> +                       cfi->cfiq->BufWriteTimeoutMax){
> +                       cfi->chips[i].buffer_write_time_max =3D
> +                               1<<(cfi->cfiq->BufWriteTimeoutTyp +
> +                                       cfi->cfiq->BufWriteTimeoutMax);
> +                       } else {
> +               /* specify maximum timeout for buffer program 2000us */
> +                               cfi->chips[i].buffer_write_time_max =3D 2=
000;
> +                               }
> +               if (cfi->cfiq->BlockEraseTimeoutTyp &&
> +                       cfi->cfiq->BlockEraseTimeoutMax){
> +                       cfi->chips[i].erase_time_max =3D
> +                               1<<(cfi->cfiq->BlockEraseTimeoutTyp +
> +                                       cfi->cfiq->BlockEraseTimeoutMax);
> +                       } else {
> +       /* specify maximum timeout per individual block erase 3000000us *=
/
> +                               cfi->chips[i].erase_time_max =3D 3000000;
> +                               }

You are setting several parameters here, but you only use
buffer_write_time_max. Why?

>                 cfi->chips[i].ref_point_counter =3D 0;
>                 init_waitqueue_head(&(cfi->chips[i].wq));
>         }
> -
>         map->fldrv =3D &cfi_amdstd_chipdrv;
>
>         return cfi_amdstd_setup(mtd);
> @@ -1462,8 +1494,16 @@ static int __xipram do_write_buffer(struct map_inf=
o *map, struct flchip *chip,  {
>         struct cfi_private *cfi =3D map->fldrv_priv;
>         unsigned long timeo =3D jiffies + HZ;
> -       /* see comments in do_write_oneword() regarding uWriteTimeo. */
> -       unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
> +       /* The size of the buffer program has been increased from 256 to =
512,
> +        * 2ms maximum timeout can not adapt to all the different vendor'=
s
> +        * norflash.There maximum timeout information in the CFI area,so =
the
> +        * best way is to choose the result calculated according to timeo=
ut
> +        * field of struct cfi_ident that probed from norflash's CFI aera=
,see
> +        * comments in cfi_cmdset_0002().The time unit of uWriteTimeout i=
s ms.
> +        */
> +       unsigned long uWriteTimeout =3D (chip->buffer_write_time_max % 10=
00) ?
> +                       (chip->buffer_write_time_max / 1000 + 1) :
> +                       (chip->buffer_write_time_max / 1000);

How about using usecs_to_jiffies below? Then you wouldn't need this
conversion, right?

>         int ret =3D -EIO;
>         unsigned long cmd_adr;
>         int z, words;
> @@ -1520,7 +1560,8 @@ static int __xipram do_write_buffer(struct map_info=
 *map, struct flchip *chip,
>                                 adr, map_bankwidth(map),
>                                 chip->word_write_time);
>
> -       timeo =3D jiffies + uWriteTimeout;
> +       /*Maximum timeout must be converted into jiffies */
> +       timeo =3D jiffies + msecs_to_jiffies(uWriteTimeout);
>

A few lines below in the loop timeo is modified again, timeo =3D jiffies
+ (HZ / 2); This line has a big /* FIXME */ comment. Any ideas what
should be fixed here?

Best regards,
Christian

>         for (;;) {
>                 if (chip->state !=3D FL_WRITING) {
> --
> 1.7.9.5
>
>
>
