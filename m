Received: from mail-by2nam01olkn082c.outbound.protection.outlook.com
 ([2a01:111:f400:fe42::82c]
 helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1epBJl-0002UF-Rt
 for linux-mtd@lists.infradead.org; Fri, 23 Feb 2018 11:15:11 +0000
From: Bean Huo <beanhuo@outlook.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, beanhuo <beanhuo@micron.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v1 2/3] mtd: probe: probe dual die entry from devicetree
 binding
Date: Fri, 23 Feb 2018 11:14:57 +0000
Message-ID: <DM2PR12MB0014A0DCB95D52F22D1DF41BA6CC0@DM2PR12MB0014.namprd12.prod.outlook.com>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
 <DM2PR12MB001471EC3E5B6841C61ED9FEA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>,
 <20180222140253.1773d3ce@bbrezillon>
In-Reply-To: <20180222140253.1773d3ce@bbrezillon>
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

=0A=
Below suggested points will be involved in next patch. Thanks Boris.=0A=
=0A=
>>       int addr_unlock1 =3D 0x555, addr_unlock2 =3D 0x2AA;=0A=
>> +     struct device_node __maybe_unused *np =3D map->device_node;=0A=
=0A=
>You can drop this variable...=0A=
=0A=
>>=0A=
>>       xip_enable(base, map, cfi);=0A=
>>  #ifdef DEBUG_CFI=0A=
>> @@ -177,6 +179,11 @@ static int __xipram cfi_chip_setup(struct map_info =
*map,=0A=
>>=0A=
>>       cfi->sector_erase_cmd =3D CMD(0x30);=0A=
>>=0A=
>> +     cfi->device_stack =3D CFI_DEVICESTACK_1DIE;=0A=
>> +#ifdef CONFIG_OF=0A=
>> +     if (np && of_property_read_bool(np, "dual-die-stack"))=0A=
>> +             cfi->device_stack =3D CFI_DEVICESTACK_2DIE;=0A=
>> +#endif=0A=
>and simply do:=0A=
=0A=
>      if (of_property_read_bool(map->device_node, "dual-die-stack"))=0A=
>             cfi->device_stack =3D CFI_DEVICESTACK_2DIE;=0A=
=0A=
>>       /* Read the CFI info structure */=0A=
>>       xip_disable_qry(base, map, cfi);=0A=
>>       for (i=3D0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); =
i++)=0A=
>> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h=0A=
>> index 9b57a9b..bda37a4 100644=0A=
>> --- a/include/linux/mtd/cfi.h=0A=
>> +++ b/include/linux/mtd/cfi.h=0A=
>> @@ -277,11 +277,19 @@ struct cfi_bri_query {=0A=
>>  #define CFI_MODE_CFI 1=0A=
>>  #define CFI_MODE_JEDEC       0=0A=
>>=0A=
>> +/* These values represent the die count of chip stack.=0A=
>> + * So far, there only exists two type of stack device,=0A=
>> + * single or dual die.=0A=
>> + */=0A=
>> +#define CFI_DEVICESTACK_1DIE 1=0A=
>> +#define CFI_DEVICESTACK_2DIE 2=0A=
=0A=
>Why are these macros needed?=0A=
=0A=
>> +=0A=
>>  struct cfi_private {=0A=
>>       uint16_t cmdset;=0A=
>>       void *cmdset_priv;=0A=
>>       int interleave;=0A=
>>       int device_type;=0A=
>> +     int device_stack;       /* Device stack type, single die or dual d=
ie. */=0A=
=0A=
>Why not simply:=0A=
=0A=
>       int num_dies;=0A=
=0A=
>which would contain the number of dies.=0A=
=0A=
>>       int cfi_mode;           /* Are we a JEDEC device pretending to be =
CFI? */=0A=
>>       int addr_unlock1;=0A=
>>       int addr_unlock2;=0A=
