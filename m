Received: from mail.rptsys.com ([192.119.205.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1fL9-0000Ff-Q9
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2018 21:44:13 +0000
Message-ID: <5ABD5E1B.9050500@raptorengineering.com>
Date: Thu, 29 Mar 2018 16:43:55 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
MIME-Version: 1.0
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
CC: linux-mtd@lists.infradead.org, Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: Re: [PATCH] mtd/powernv_flash: Enable partition support
References: <746862757.61253.1522008301855.JavaMail.zimbra@raptorengineeringinc.com>
 <CACna6rwWT1CNkov7PJiCCDYGciEa_assaj0MO3nkJNL2h_sJOA@mail.gmail.com>
In-Reply-To: <CACna6rwWT1CNkov7PJiCCDYGciEa_assaj0MO3nkJNL2h_sJOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Will resend with Signed-off-by.

Before this patch, the driver was not picking up the OF-provided
partition list.  It seemed specifically designed to register only one
large partition covering the entire PNOR; mtd_device_register() does not
run parsing of any type AFAIK.

Example DT:

flash@0 {
	compatible =3D "ibm,opal-flash";
	ibm,flash-block-size =3D <0x10000>;
	ibm,opal-id =3D <0x0>;
	no-erase;
	#address-cells =3D <0x1>;
	#size-cells =3D <0x1>;
	phandle =3D <0x161>;
	reg =3D <0x0 0x4000000>;

	partitions {
		compatible =3D "fixed-partitions";
		#address-cells =3D <0x1>;
		#size-cells =3D <0x1>;
		phandle =3D <0x162>;

		partition@0 {
			label =3D "PNOR";
			phandle =3D <0x168>;
			reg =3D <0x0 0x4000000>;
		};

		partition@3389000 {
			read-only;
			label =3D "IMA_CATALOG";
			phandle =3D <0x165>;
			reg =3D <0x3389000 0x40000>;
		};

		partition@1a21000 {
			read-only;
			label =3D "BOOTKERNEL";
			phandle =3D <0x163>;
			reg =3D <0x1a21000 0x1800000>;
		};

		partition@3388000 {
			read-only;
			label =3D "VERSION";
			phandle =3D <0x166>;
			reg =3D <0x3388000 0x1000>;
		};

		partition@3710000 {
			label =3D "BOOTKERNFW";
			phandle =3D <0x167>;
			reg =3D <0x3710000 0x600000>;
		};

		partition@3344000 {
			read-only;
			label =3D "CAPP";
			phandle =3D <0x164>;
			reg =3D <0x3344000 0x24000>;
		};
	};
};

On 03/29/2018 12:29 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
> Hi Tomthy,
>=20
> On 25 March 2018 at 22:05, Timothy Pearson
> <tpearson@raptorengineering.com> wrote:
>> On certain systems, such as the Talos II, skiboot emits a partition
>> table for the main PNOR MTD device in the generated device tree.
>>
>> Allow this partition table to be parsed and the partitions to be
>> exposed via MTD device partition nodes.
>=20
> Your commit is missing a Signed-off-by
>=20
>=20
>> ---
>>  drivers/mtd/devices/powernv_flash.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices=
/powernv_flash.c
>> index 26f9feaa5d17..f76045f78221 100644
>> --- a/drivers/mtd/devices/powernv_flash.c
>> +++ b/drivers/mtd/devices/powernv_flash.c
>> @@ -2,6 +2,7 @@
>>   * OPAL PNOR flash MTD abstraction
>>   *
>>   * Copyright IBM 2015
>> + * Copyright Raptor Engineering, LLC 2018
>>   *
>>   * This program is free software; you can redistribute it and/or modi=
fy
>>   * it under the terms of the GNU General Public License as published =
by
>> @@ -47,6 +48,8 @@ enum flash_op {
>>         FLASH_OP_ERASE,
>>  };
>>
>> +static char const * const part_probes[] =3D { "ofpart", NULL };
>> +
>>  /*
>>   * Don't return -ERESTARTSYS if we can't get a token, the MTD core
>>   * might have split up the call from userspace and called into the
>> @@ -267,9 +270,14 @@ static int powernv_flash_probe(struct platform_de=
vice *pdev)
>>         /*
>>          * The current flash that skiboot exposes is one contiguous fl=
ash chip
>>          * with an ffs partition at the start, it should prove easier =
for users
>> -        * to deal with partitions or not as they see fit
>> +        * to deal with partitions or not as they see fit.  skitboot p=
laces this
>> +        * on the first MTD partition.
>> +        *
>> +        * Certain partitions may also be exposed to the host, such as=
 the boot
>> +        * kernel firmware partition.
>>          */
>> -       return mtd_device_register(&data->mtd, NULL, 0);
>> +       mtd_set_of_node(&data->mtd, dev->of_node);
>> +       return mtd_device_parse_register(&data->mtd, part_probes, NULL=
, NULL, 0);
>=20
> It seems the only change introduced by this patch is passing a list of
> parsers. That way you override a default list of parsers:
> "cmdlinepart", "ofpart", NULL
> with a custom one:
> "ofpart", NULL
>=20
> I don't see how it really changes anything/much. Can you explain it
> please? It seems that the only purpose of your change is to don't
> probe "cmdlinepart" parser which reads "mtdparts=3D" from the cmd line.
>=20
> Which parser exactly is supposed to detect partitions on your device?
> "fixed-partitions"? "ofoldpart"? Does your DTB contains "compatible"
> property for flash node? Please paste the relevant part of your DTB if
> applicable.
>=20
>=20
>>  }
>>
>>  /**
>=20


--=20
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
