Received: from exprod6og112.obsmtp.com ([64.18.1.29])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQRCH-0004Wo-UZ
	for linux-mtd@lists.infradead.org; Tue, 05 Aug 2008 18:23:51 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: flash_info and MEMGETREGIONCOUNT
Date: Tue, 5 Aug 2008 14:22:38 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190960DD5A@mi8nycmail19.Mi8.com>
In-Reply-To: <48986C4E.4060901@cetrtapot.si>
References: <48986C4E.4060901@cetrtapot.si>
From: "hartleys" <hartleys@visionengravers.com>
To: "Hinko Kocevar" <hinko.kocevar@cetrtapot.si>,
	<linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, August 05, 2008 8:06 AM, Hinko Kocevar wrote:
> Hi,
>=20
> I would like to know some info about the flash chip present
> on the board. I found flash_info utility and can't seem to
> get information about the region count with MEMGETREGIONCOUNT.
> # /flash_info /dev/mtd0
> Device /dev/mtd0 has 0 erase regions
> # /flash_info /dev/mtd1
> Device /dev/mtd1 has 0 erase regions
> # /flash_info /dev/mtd2
> Device /dev/mtd2 has 0 erase regions

I get the same results on my system. I'm not sure what "flash_info" is
actually meant for.

Try the mtd_debug utility instead and see if that information is more
helpful. Here's a sample output from one of my mtd partitions:

/ # mtd_debug info /dev/mtd0
mtd.type =3D MTD_NORFLASH
mtd.flags =3D MTD_WRITEABLE | MTD_BIT_WRITEABLE
mtd.size =3D 262144 (256K)
mtd.erasesize =3D 131072 (128K)
mtd.writesize =3D 1
mtd.oobsize =3D 0
regions =3D 0

BTW, the regions =3D 0 is why the flash_info utility reports 0 erase
regions.

Hartley
