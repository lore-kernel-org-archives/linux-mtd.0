Received: from mail-qg0-x22b.google.com ([2607:f8b0:400d:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz0SQ-0003LN-1E
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 09:22:37 +0000
Received: by mail-qg0-f43.google.com with SMTP id z60so5640030qgd.2
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jun 2014 02:22:11 -0700 (PDT)
MIME-Version: 1.0
Sender: christian.riesch@gmail.com
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315D6E23@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315D6E23@NTXXIAMBX02.xacn.micron.com>
Date: Mon, 23 Jun 2014 11:22:10 +0200
Message-ID: <CABkLObpG0+Z6ostWZ2czieQDBkW1AD_Q5Qru6oZuao=enM9O0A@mail.gmail.com>
Subject: Re: [PATCH V2] mtd:nor:timeout:fix do_write_buffer() timeout error
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
I tried to test this version of your patch, but cannot apply it. On
which kernel version does it apply?

On Mon, Jun 23, 2014 at 4:50 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (bean=
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
>
> Signed-off-by: bean huo <beanhuo@micron.com>
> ---
> changes v1->v2:Deleted unused parameters in this patch (word_write_time_m=
ax and erase_time_max).
> Using usecs_to_jiffies instead of msecs_to_jiffies for convert timeout va=
lue into jiffies.
>
>  drivers/mtd/chips/cfi_cmdset_0002.c |   27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index e21fde9..22e0b93 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -628,10 +628,24 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *m=
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
>                 cfi->chips[i].ref_point_counter =3D 0;
>                 init_waitqueue_head(&(cfi->chips[i].wq));
>         }
> -
>         map->fldrv =3D &cfi_amdstd_chipdrv;
>
>         return cfi_amdstd_setup(mtd);
> @@ -1462,8 +1476,15 @@ static int __xipram do_write_buffer(struct map_inf=
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
> +        * comments in cfi_cmdset_0002().uWriteTimeout is used for timeou=
t step,
> +        * it must be concerted into jiffies.

I think the reference to the old 2ms timeout only confuses readers,
since they don't know the old code. Putting this into the commit
message is sufficient. I think you could delete this comment here.

> +        */
> +       unsigned long uWriteTimeout =3D

Trailing whitespace, please remove that. Please run your patch through
scripts/checkpatch.pl to detect such errors.

Christian

> +       usecs_to_jiffies(chip->buffer_write_time_max);
>         int ret =3D -EIO;
>         unsigned long cmd_adr;
>         int z, words;
> --
> 1.7.9.5
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
