Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH 1/2] Update ts72xx to use generic platform nand driver
Date: Wed, 7 Oct 2009 13:09:10 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901DB7A8D@mi8nycmail19.Mi8.com>
In-Reply-To: <jbvtp6-i58.ln1@chipmunk.wormnet.eu>
References: <BD79186B4FD85F4B8E60E381CAEE190901DB7967@mi8nycmail19.Mi8.com>
	<jbvtp6-i58.ln1@chipmunk.wormnet.eu>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: "Alexander Clouter" <alex@digriz.org.uk>,
	<linux-arm-kernel@lists.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, October 07, 2009 1:16 AM, Alexander Clouter wrote:
> Hi,

[snip]

> These struct's are almost identical so could you not...

[snip]

> -----------
> static struct mtd_partition ts72xx_part_info[] =3D {
> 	{
> 		/* gut feeling for *Joe Public* is to go MTD_WRITABLE */
> 		.name		=3D "TS-BOOTROM",
> 		.offset		=3D 0,
> 		.size		=3D TS72XX_BOOTROM_PART_SIZE,
> 	}, {
> 		.name		=3D "Linux",
> 		.offset		=3D MTDPART_OFS_APPEND,
> 		/* to be filled in later */
> 		.size		=3D 0,
> 	}, {
> 		/* mask MTD_WRITABLE here too? */
> 		.name		=3D "Redboot",
> 		.offset		=3D MTDPART_OFS_APPEND,
> 		.size		=3D MTDPART_SIZ_FULL,
> 	}
> };
>=20
> static void ts72xx_nand_set_parts(....)
> {
> 	....
>=20
> 	/* or I guess you could just bailout... */
> 	if (size !=3D SZ_32M && size !=3D SZ_128M)
> 		pr_warning("ts72xx: Unknown nand disk size:%lluMB\n", size >> 20);
>=20
> 	chip->partitions =3D ts72xx_part_info;
> 	chip->nr_partitions =3D ARRAY_SIZE(ts72xx_part_info);
>=20
> 	ts72xx_part_info[1].size =3D size - TS72XX_REDBOOT_PART_SIZE;
> }

Thanks for pointing that out.  I like your change and will modify the =
patch.

I didn't think about making the "TS-BOOTROM" and "RedBoot" partitions =
read-only.
Probably a good idea, I'll add that also.

Updated patch coming soon.

Regards,
Hartley
