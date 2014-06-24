Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzKdz-0000ms-56
 for linux-mtd@lists.infradead.org; Tue, 24 Jun 2014 06:55:51 +0000
Received: by mail-qg0-f44.google.com with SMTP id j107so6966280qga.31
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jun 2014 23:55:29 -0700 (PDT)
MIME-Version: 1.0
Sender: christian.riesch@gmail.com
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315D6F28@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315D6F28@NTXXIAMBX02.xacn.micron.com>
Date: Tue, 24 Jun 2014 08:55:28 +0200
Message-ID: <CABkLObodn=5cs0FDGnWjYd+WY_mDL-YYx7rB74pvVETZwX1koQ@mail.gmail.com>
Subject: Re: [PATCH v3] mtd:nor:timeout:fix do_write_buffer() timeout error
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
sorry, I found something else.

On Tue, Jun 24, 2014 at 4:02 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (bean=
huo)
<beanhuo@micron.com> wrote:
> The size of the buffer program has been increased from 256 to 512 ,
> 2ms maximum timeout for do_write_buffer can not adapt to all the differen=
t
> vendor's norflash.There maximum timeout information in the CFI area,so
> the best way is to choose the result calculated according to timeout fiel=
d
> of struct cfi_ident that probed from norflash's CFI aera.This is also a
> standard defined by CFI.
>
> Without this change, if the size of buffer program is 512 or bigger than =
256,
> due to timeout is the shorter than that the chip required,do_write_buffer
> sometimes fails.
>
> Tested with Micron JS28F512M29EWx and Micron MT28EW512ABA flash devices.
>
> Signed-off-by: bean huo <beanhuo@micron.com>
> ---
> changes
>         v1->v2:Deleted unused parameters in this patch (word_write_time_m=
ax and erase_time_max).
> Using usecs_to_jiffies instead of msecs_to_jiffies for convert timeout va=
lue into jiffies.
>         v2->v3:Removed unnecessary messages form comments and deleted tra=
iling whitespace.
>
>  drivers/mtd/chips/cfi_cmdset_0002.c |   25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index e21fde9..3ee43cf 100644
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

Wrong indentation above. Please fix that.

Christian
