Received: from mail-ie0-f176.google.com ([209.85.223.176])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TxIlW-0000yq-UU
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2013 14:54:28 +0000
Received: by mail-ie0-f176.google.com with SMTP id 13so9853777iea.35
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2013 06:54:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <50FD5052.6030704@parrot.com>
References: <1358824265-3425-1-git-send-email-shijie8@gmail.com>
 <50FD5052.6030704@parrot.com>
Date: Mon, 21 Jan 2013 22:54:10 +0800
Message-ID: <CAMiH66HWn5PtjX20=WT7GMMV=J72rg3jx64iACSBiExjoD+X7A@mail.gmail.com>
Subject: Re: [PATCH] mtd: fix the wrong timeo for panic_nand_wait()
From: Huang Shijie <shijie8@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 21, 2013 at 10:27 PM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
> Could you explain why the old code was wrong ?


sorry. this patch has a compiler error.


>
> With HZ=3D100
>
> timeo =3D jiffies + 2 and it should be working.
>

In logic, timeo should only be 2, just like it does in panic_nand_write().



thanks
Huang Shijie

>
> Huang Shijie a =C3=A9crit :
>> In nand_wait(), the timeo for panic_nand_wait() is assigned with
>> wrong value(jiffies + some delay).
>>
>> This patch fixes it, and also uses the msecs_to_jiffies() to make the
>> code more readable.
>>
>> Signed-off-by: Huang Shijie <shijie8@gmail.com>
>> ---
>>  drivers/mtd/nand/nand_base.c |    8 ++------
>>  1 files changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 8323ac9..acdd508 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -825,14 +825,9 @@ static void panic_nand_wait(struct mtd_info *mtd, s=
truct nand_chip *chip,
>>  static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
>>  {
>>
>> -     unsigned long timeo =3D jiffies;
>> +     unsigned long timeo =3D (state =3D=3D FL_ERASING) ? 400 : 20;
>>       int status, state =3D chip->state;
>>
>> -     if (state =3D=3D FL_ERASING)
>> -             timeo +=3D (HZ * 400) / 1000;
>> -     else
>> -             timeo +=3D (HZ * 20) / 1000;
>> -
>>       led_trigger_event(nand_led_trigger, LED_FULL);
>>
>>       /*
>> @@ -849,6 +844,7 @@ static int nand_wait(struct mtd_info *mtd, struct na=
nd_chip *chip)
>>       if (in_interrupt() || oops_in_progress)
>>               panic_nand_wait(mtd, chip, timeo);
>>       else {
>> +             timeo =3D jiffies + msecs_to_jiffies(timeo);
>>               while (time_before(jiffies, timeo)) {
>>                       if (chip->dev_ready) {
>>                               if (chip->dev_ready(mtd))
