Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUIhE-00048O-1A
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 13:21:21 +0000
Received: by vxd2 with SMTP id 2so420428vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 06:21:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1307530994.31223.46.camel@localhost>
References: <20110608015625.GA27537@july> <1307530994.31223.46.camel@localhost>
Date: Wed, 8 Jun 2011 22:21:17 +0900
Message-ID: <BANLkTinOBRUiaAGrbPcxve-EzZN3YdS__g@mail.gmail.com>
Subject: Re: [PATCH] mtd: OneNAND: Detect the correct NOP when 4KiB pagesize
From: Kyungmin Park <kmpark@infradead.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	roman.tereshonkov@nokia.com, m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 8, 2011 at 8:03 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Wed, 2011-06-08 at 10:56 +0900, Kyungmin Park wrote:
>> From: Kyungmin Park <kyungmin.park@samsung.com>
>>
>> There are two different 4KiB pagesize chips
>> KFM4G16Q4M series have NOP 4 with version ID 0x0131
>> But KFM4G16Q5M has NOP 1 with versoin ID 0x013e
>>
>> Note that Q5M means that it has NOP 1.
>>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/on=
enand_base.c
>> index ac9e959..2adca63 100644
>> --- a/drivers/mtd/onenand/onenand_base.c
>> +++ b/drivers/mtd/onenand/onenand_base.c
>> @@ -3429,6 +3429,13 @@ static void onenand_check_features(struct mtd_inf=
o *mtd)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (numbufs =3D=3D=
 1) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 this->options |=3D ONENAND_HAS_4KB_PAGE;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 this->options |=3D ONENAND_HAS_CACHE_PROGRAM;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* There are two different 4KiB pagesize chips
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* KFM4G16Q4M has NOP 4 with version ID 0x0131
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* KFM4G16Q5M has NOP 1 with versoin ID 0x013e
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*/
>
> If you confirm that it is impossible to detect NOP and distinguish
> between KFM4G16Q4M and KFM4G16Q5M, then can we take the following steps:
>
> 1. Add a comment that this is a hacky quirk to work around HW
> =C2=A0 identification flaw, to make it clear for the people who read the
> =C2=A0 code.

For the record, chip maker (memory) made different chips for each
vendor (Samsung Mobile, and Nokia)
with the design flaw, it made a workaround, not hacky quirk.

> 2. Make sure the default is NOP4 (you already do).
> 3. Compare _both_ device ID and version ID. This means that we'll end up
> =C2=A0 with NOP1 only for your device, all the other will be NOP4. If the=
n
> =C2=A0 someone has issues, they'll have to reporte about them and add the=
ir
> =C2=A0 device ID to this hack.

Okay no problem to compare the device ID.

Thank you,
Kyungmin Park
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
