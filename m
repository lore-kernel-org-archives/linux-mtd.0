Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LlhHb-000561-J4
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 10:21:34 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 23 Mar 2009 11:21:21 +0100
References: <200903230852.02597.jbe@pengutronix.de>
	<022F54DCE6CCCD45A5F9DF0B0B7BFEEB063562407E@EXGMBX01.sasken.com>
In-Reply-To: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB063562407E@EXGMBX01.sasken.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200903231121.21801.jbe@pengutronix.de>
Subject: Re: DOC2000 flash: Do I miss something?
Cc: Ravi Vasarla <ravi.vasarla@sasken.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Montag, 23. M=E4rz 2009, Ravi Vasarla wrote:
> Kindly check the DOC2000 driver which is available under  -> Device
> Drivers-> Memory Technology Devices (MTD)-> Memory Technology Device (MTD)
> support (MTD [=3Dm])-> NAND Flash Device Drivers (Which has recommanded t=
oo).
> The below error message due to the way old doc driver implemented.

Ups. With the new driver it seems to work now. Didn't look into the NAND=20
submenu, yet.

[...]
DiskOnChip found at 0xd8000
DiskOnChip 2000 responds to DWORD access
Detected 1 chips per floor.
NAND device: Manufacturer ID: 0x98, Chip ID: 0x73 (Toshiba NAND 16MiB 3,3V=
=20
8-bit)
ECC error scanning DOC at 0x10000
=46ound DiskOnChip ANAND Media Header at 0x10000
ECC error scanning DOC at 0x14000
=46ound DiskOnChip ANAND Media Header at 0x14000
    DataOrgID        =3D ANAND
    NumEraseUnits    =3D 1020
    FirstPhysicalEUN =3D 4
    FormattedSize    =3D 16334848
    UnitSizeFactor   =3D 255
Bad block table at page 129, version 0x55
Bad block table at page 161, version 0x55
=46ound alias of DOC at 0xd8000 to 0xda000
Possible DiskOnChip at 0xe2000 failed TOGGLE test, dropping.
[...]

Looks better now ;-)

Thank you very much.

Regards,
Juergen
