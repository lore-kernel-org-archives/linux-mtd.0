Received: from mail-co1nam04olkn0806.outbound.protection.outlook.com
 ([2a01:111:f400:fe4d::806]
 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1epBlF-0006EL-Hh
 for linux-mtd@lists.infradead.org; Fri, 23 Feb 2018 11:43:40 +0000
From: Bean Huo <beanhuo@outlook.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, beanhuo <beanhuo@micron.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v1 3/3] drivers: mtd: chips: add support for the dual die
 stacked PNOR
Date: Fri, 23 Feb 2018 11:43:21 +0000
Message-ID: <DM2PR12MB001437E51CB54D86406D2550A6CC0@DM2PR12MB0014.namprd12.prod.outlook.com>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
 <DM2PR12MB00143807EEF9602098FF0D4BA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>,
 <20180222143357.4ec680b6@bbrezillon>
In-Reply-To: <20180222143357.4ec680b6@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,=0A=
>>=0A=
>> +/*=0A=
>> + * The dual die stacked device comprises two identical dies which conne=
cted=0A=
>                                                                   ^are=0A=
fixed in next patch.=0A=
=0A=
>> + * in parallel.But there is only one die being selected each time accor=
ding=0A=
=0A=
   >               ^ missing space after the period=0A=
fixed in next patch.=0A=
=0A=
>> + * to maximum address line A[max]. When A[max] =3D=3D 0, the lower die =
is selected,=0A=
>> + * when A[max] =3D=3D 1, the upper die is selected. This function will =
reture the=0A=
>=0A=
 >                                                               ^return=0A=
>> + * CFI unlock-command base address according to accessing address.=0A=
>Is it really just about unlock commands?=0A=
=0A=
Except unlock commands, other commands also need but don't need to add=0A=
0x555/0x2AA. And current parallel nor driver already does this way.=0A=
so we don't need to change.=0A=
=0A=
>> + */=0A=
>> +static loff_t get_cmd_base_address(struct map_info *map, struct flchip =
*chip,=0A=
>> +             loff_t offset)=0A=
>> +{=0A=
>> +     struct cfi_private *cfi =3D map->fldrv_priv;=0A=
>>=0A=
>>+     unsigned long cmd_base_addr =3D chip->start;=0A=
>>+=0A=
>> +     if (cfi->device_stack =3D=3D CFI_DEVICESTACK_2DIE) {=0A=
>>+             if (offset >=3D (1 << (cfi->cfiq->DevSize - 1)))=0A=
>>+                     cmd_base_addr +=3D (1 << (cfi->cfiq->DevSize - 1));=
=0A=
>> +     }=0A=
=0A=
>Could be done in a more generic way:=0A=
=0A=
 >    unsigned long die =3D offset >> (cfi->cfiq->DevSize - 1);=0A=
=0A=
>        if (cfi->device_stack =3D=3D 1) {=0A=
 >               WARN_ON(die);=0A=
  >              return cmd_base_addr;=0A=
  >      }=0A=
=0A=
   >     cmd_base_addr +=3D die << (cfi->cfiq->DevSize - 1);=0A=
=0A=
it will be included in next patch, thanks.=0A=
=0A=
...=0A=
>> -     cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,=
=0A=
>> +     /* For the dual die device, rebase the command base address accord=
ing=0A=
=0A=
>Please do not use net-style comments.=0A=
=0A=
To be honest, I don't know what is net-style comments.=0A=
=0A=
>--=0A=
>Boris Brezillon, Bootlin (formerly Free Electrons)=0A=
>Embedded Linux and Kernel engineering=0A=
>https://bootlin.com=0A=
