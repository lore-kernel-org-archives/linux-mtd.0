Received: from mail-qa0-x236.google.com ([2607:f8b0:400d:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrjUn-0003M9-Nq
 for linux-mtd@lists.infradead.org; Tue, 03 Jun 2014 07:50:59 +0000
Received: by mail-qa0-f54.google.com with SMTP id j15so4366220qaq.27
 for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2014 00:50:34 -0700 (PDT)
MIME-Version: 1.0
Sender: christian.riesch@gmail.com
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315D0EDB@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315D03AC@NTXXIAMBX02.xacn.micron.com>
 <1400474715.883919171@f423.i.mail.ru>
 <A765B125120D1346A63912DDE6D8B6315D07F7@NTXXIAMBX02.xacn.micron.com>
 <CABkLOboJfc7=TyyxPGdvLgMQVH+g7FX+-ackrky-00WnaQkN_g@mail.gmail.com>
 <A765B125120D1346A63912DDE6D8B6315D0EDB@NTXXIAMBX02.xacn.micron.com>
Date: Tue, 3 Jun 2014 09:50:34 +0200
Message-ID: <CABkLObpo0PPzHSRVVdJ5X3DtZv1QkfE-j3A6iEQ26R5GxZ2wEA@mail.gmail.com>
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
Please do not top post.

On Tue, Jun 3, 2014 at 8:26 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanh=
uo)
<beanhuo@micron.com> wrote:
> Hi,Christian
>
> 1=E3=80=81MT28EW512ABA is Micron's parallel Norflash that use the cfi_cmd=
set_0002.c driver.

Is it a new device? I can't find it on the Micron web site. If it is
already there, could you please provide a link to the data sheet?

>
> 2=E3=80=81yes,I am setting several parameters here(word_write_time_max=E3=
=80=81buffer_write_time_max=E3=80=81erase_time_max).For this patch,I only u=
sed buffer_write_time_max parameter.Because this patch is mainly focus on f=
ix do_write_buffer() timeout error. If this patch is accepted, I will submi=
t another patch that for fix single word program timeout error and erase ti=
meout error.thanks.
>

Ok. IMHO you should only set the parameters that you are actually
using (and add word_write_time_max, erase_time_max etc later with the
patches that actually use them). Otherwise we could end with lots of
unused code if your later patches are not accepted. But I guess that's
up to the maintainer to decide.

> 3=E3=80=81The time unit of uWriteTimeout is ms. In order to achieve large=
 rather than small timeout ,so using following conversion,
>
>> +       unsigned long uWriteTimeout =3D (chip->buffer_write_time_max % 1=
000) ?
>> +                       (chip->buffer_write_time_max / 1000 + 1) :
>> +                       (chip->buffer_write_time_max / 1000);

But I think the result of usecs_to_jiffies would be the same, or am I wrong=
?

If I understood the code of usecs_to_jiffies correctly, it returns at
least one jiffy if the specified time is less than a jiffy.

>
> 4=E3=80=81For the following code,I now have some ideas,but having not tes=
t and verify now.If it test Ok later,I will submit it.
>   timeo =3D jiffies+ (HZ / 2); This line has a big /* FIXME */

Ok, thanks.
Christian

>
> -----Original Message-----
> From: christian.riesch@gmail.com [mailto:christian.riesch@gmail.com] On B=
ehalf Of Christian Riesch
> Sent: Monday, June 02, 2014 6:26 PM
> To: Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo)
> Cc: David Woodhouse; Brian Norris; Alexander Shiyan; Paul Gortmaker; Jing=
oo Han; linux-mtd@lists.infradead.org; Kees Cook
> Subject: Re: [PATCH 1/1] mtd:nor:timeout:fix do_write_buffer() timeout er=
ror
>
> Hi,
> When you send an updated version of a patch, please put version numbers i=
nto the subject, e.g. [PATCH v2], [PATCH v3]..., and include a changelog. A=
nd I think you shouldn't send the new versions as a reply to an earlier mai=
l, send them as a new post instead.
>
> On Mon, May 26, 2014 at 3:01 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (be=
anhuo) <beanhuo@micron.com> wrote:
>> The size of the buffer program has been increased from 256 to 512 , 2ms =
maximum timeout can not adapt to all the different vendor's norflash, There=
 maximum timeout information in the CFI area,so the best way is to choose t=
he result calculated according to timeout field of struct cfi_ident that pr=
obed from norflash's CFI aera.This is also a standard defined by CFI.
>>
>> Without this change, if the size of buffer program is 512 or bigger than=
 256, due to timeout is the shorter than that the chip required,do_write_bu=
ffer sometimes fails.
>>
>> Tested with Micron JS28F512M29EWx and Micron MT28EW512ABA flash devices.
>
> What kind of device is the MT28EW512ABA? Aren't MT28 devices StrataFlashe=
s that use the cfi_cmdset_0001.c driver?
>
>>
>> Signed-off-by: bean huo <beanhuo@micron.com>
>> ---
>>  drivers/mtd/chips/cfi_cmdset_0002.c |   49 ++++++++++++++++++++++++++++=
++++---
>>  1 file changed, 45 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
>> b/drivers/mtd/chips/cfi_cmdset_0002.
>> index e21fde9..87d446a 100644
>> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
>> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
>> @@ -628,10 +628,42 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *=
map, int primary)
>>                 cfi->chips[i].word_write_time =3D 1<<cfi->cfiq->WordWrit=
eTimeoutTyp;
>>                 cfi->chips[i].buffer_write_time =3D 1<<cfi->cfiq->BufWri=
teTimeoutTyp;
>>                 cfi->chips[i].erase_time =3D
>> 1<<cfi->cfiq->BlockEraseTimeoutTyp;
>> +               /*
>> +                * We first calculate the timeout max according to timeo=
ut
>> +                * field of struct cfi_ident that probed from chip's CFI
>> +                * aera,If haven't probed this information,we will speci=
fy
>> +                * a default value,and the time unit is us.
>> +                */
>> +               if (cfi->cfiq->WordWriteTimeoutTyp &&
>> +                       cfi->cfiq->WordWriteTimeoutMax){
>> +                       cfi->chips[i].word_write_time_max =3D
>> +                               1<<(cfi->cfiq->WordWriteTimeoutTyp +
>> +                                       cfi->cfiq->WordWriteTimeoutMax);
>> +                       } else {
>> +               /* specify maximum timeout for byte/word program 2000us =
*/
>> +                               cfi->chips[i].word_write_time_max =3D 20=
00;
>> +                               }
>> +               if (cfi->cfiq->BufWriteTimeoutTyp &&
>> +                       cfi->cfiq->BufWriteTimeoutMax){
>> +                       cfi->chips[i].buffer_write_time_max =3D
>> +                               1<<(cfi->cfiq->BufWriteTimeoutTyp +
>> +                                       cfi->cfiq->BufWriteTimeoutMax);
>> +                       } else {
>> +               /* specify maximum timeout for buffer program 2000us */
>> +                               cfi->chips[i].buffer_write_time_max =3D =
2000;
>> +                               }
>> +               if (cfi->cfiq->BlockEraseTimeoutTyp &&
>> +                       cfi->cfiq->BlockEraseTimeoutMax){
>> +                       cfi->chips[i].erase_time_max =3D
>> +                               1<<(cfi->cfiq->BlockEraseTimeoutTyp +
>> +                                       cfi->cfiq->BlockEraseTimeoutMax)=
;
>> +                       } else {
>> +       /* specify maximum timeout per individual block erase 3000000us =
*/
>> +                               cfi->chips[i].erase_time_max =3D 3000000=
;
>> +                               }
>
> You are setting several parameters here, but you only use buffer_write_ti=
me_max. Why?
>
>>                 cfi->chips[i].ref_point_counter =3D 0;
>>                 init_waitqueue_head(&(cfi->chips[i].wq));
>>         }
>> -
>>         map->fldrv =3D &cfi_amdstd_chipdrv;
>>
>>         return cfi_amdstd_setup(mtd);
>> @@ -1462,8 +1494,16 @@ static int __xipram do_write_buffer(struct map_in=
fo *map, struct flchip *chip,  {
>>         struct cfi_private *cfi =3D map->fldrv_priv;
>>         unsigned long timeo =3D jiffies + HZ;
>> -       /* see comments in do_write_oneword() regarding uWriteTimeo. */
>> -       unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
>> +       /* The size of the buffer program has been increased from 256 to=
 512,
>> +        * 2ms maximum timeout can not adapt to all the different vendor=
's
>> +        * norflash.There maximum timeout information in the CFI area,so=
 the
>> +        * best way is to choose the result calculated according to time=
out
>> +        * field of struct cfi_ident that probed from norflash's CFI aer=
a,see
>> +        * comments in cfi_cmdset_0002().The time unit of uWriteTimeout =
is ms.
>> +        */
>> +       unsigned long uWriteTimeout =3D (chip->buffer_write_time_max % 1=
000) ?
>> +                       (chip->buffer_write_time_max / 1000 + 1) :
>> +                       (chip->buffer_write_time_max / 1000);
>
> How about using usecs_to_jiffies below? Then you wouldn't need this conve=
rsion, right?
>
>>         int ret =3D -EIO;
>>         unsigned long cmd_adr;
>>         int z, words;
>> @@ -1520,7 +1560,8 @@ static int __xipram do_write_buffer(struct map_inf=
o *map, struct flchip *chip,
>>                                 adr, map_bankwidth(map),
>>                                 chip->word_write_time);
>>
>> -       timeo =3D jiffies + uWriteTimeout;
>> +       /*Maximum timeout must be converted into jiffies */
>> +       timeo =3D jiffies + msecs_to_jiffies(uWriteTimeout);
>>
>
> A few lines below in the loop timeo is modified again, timeo =3D jiffies
> + (HZ / 2); This line has a big /* FIXME */ comment. Any ideas what
> should be fixed here?
>
> Best regards,
> Christian
>
>>         for (;;) {
>>                 if (chip->state !=3D FL_WRITING) {
>> --
>> 1.7.9.5
>>
>>
>>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
