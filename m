Received: from mail-px0-f200.google.com ([209.85.216.200])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NQetd-0007Dg-H4
	for linux-mtd@lists.infradead.org; Fri, 01 Jan 2010 10:38:21 +0000
Received: by pxi38 with SMTP id 38so3433500pxi.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Jan 2010 02:38:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20100101102848.53C483F6FF@gemini.denx.de>
References: <4B3DC972.1020702@gmail.com>
	<20100101102848.53C483F6FF@gemini.denx.de>
Date: Fri, 1 Jan 2010 18:38:15 +0800
Message-ID: <e68bb3471001010238y4ef21dd8ta6d0c03a030722de@mail.gmail.com>
Subject: Re: [PATCH] ARM: NUC900: rename mtd nand driver name
From: Wan ZongShun <mcuos.com@gmail.com>
To: Wolfgang Denk <wd@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/1/1 Wolfgang Denk <wd@denx.de>:
> Dear Wan ZongShun,
>
> In message <4B3DC972.1020702@gmail.com> you wrote:
>>
>> Dear David,
>>
>> Due to I have renamed the platform_device.name,so this patch changes
>> this nand driver platform_driver name.
>>
>> Signed-off-by: Wan ZongShun <mcuos.com@gmail.com>
>>
>> ---
>> =C2=A0drivers/mtd/nand/w90p910_nand.c | =C2=A0 =C2=A04 ++--
>> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/w90p910_nand.c
>> b/drivers/mtd/nand/w90p910_nand.c
>> index 7680e73..c2e9b68 100644
>> --- a/drivers/mtd/nand/w90p910_nand.c
>> +++ b/drivers/mtd/nand/w90p910_nand.c
>> @@ -358,7 +358,7 @@ static struct platform_driver w90p910_nand_driver =
=3D {
>> =C2=A0 =C2=A0 =C2=A0 .probe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D w90p91=
0_nand_probe,
>> =C2=A0 =C2=A0 =C2=A0 .remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __devexit_p=
(w90p910_nand_remove),
>> =C2=A0 =C2=A0 =C2=A0 .driver =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =3D "w90p910-fm=
i",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =3D "nuc900-fmi=
",
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =C2=A0=3D THIS_M=
ODULE,
>> =C2=A0 =C2=A0 =C2=A0 },
>
> Maybe you also want to rename the file w90p910_nand.c =3D> nuc900_nand.c =
?
>

Thanks, I will make a new patch as you mentioned.

> Best regards,
>
> Wolfgang Denk
>
> --
> DENX Software Engineering GmbH, =C2=A0 =C2=A0 MD: Wolfgang Denk & Detlev =
Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> The universe, they said, depended for its operation on the balance of
> four forces which they identified as charm, =C2=A0persuasion, =C2=A0uncer=
tainty
> and bloody-mindedness. =C2=A0 =C2=A0 =C2=A0-- Terry Pratchett, "The Light=
 Fantastic"
>



--=20
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
