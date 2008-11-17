Received: from mailsmtp.zilog.com ([216.103.121.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L20N1-0007At-OQ
	for linux-mtd@lists.infradead.org; Mon, 17 Nov 2008 09:26:12 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: MTD XIP related issue
Date: Mon, 17 Nov 2008 14:56:02 +0530
Message-ID: <130F820E6D339446BB9EEC7FAF40A06DDEDF4F@mailziel.zilog.org>
In-Reply-To: <491D724D.2030804@teltonika.lt>
From: "Avik Sil" <savik@zilog.com>
To: "Paulius Zaleckas" <paulius.zaleckas@teltonika.lt>
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks a lot. It's working fine now.

-Avik

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Paulius
Zaleckas
Sent: Friday, November 14, 2008 6:13 PM
To: Avik Sil
Cc: Nicolas Pitre; linux-mtd@lists.infradead.org
Subject: Re: MTD XIP related issue

Avik Sil wrote:
> While porting Linux kernel 2.6.26 on an ARM922T based custom board for
> XIP kernel, I came across the following bug report during boot-up:

Had the same problem. See my comments on your config file

[...]

> My kernel configuration is:

[...]

> #
>=20
> # RAM/ROM/Flash chip drivers
>=20
> #
>=20
> CONFIG_MTD_CFI=3Dy
>=20
> # CONFIG_MTD_JEDECPROBE is not set
>=20
> CONFIG_MTD_GEN_PROBE=3Dy
>=20
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
>=20
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
>=20
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
>=20
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy

Select only the supported BANK_WIDTH.
The problem is that if multiple bank widths are selected, then in code
which is placed
in RAM for XIP to work appears reference to __udivsi3(if I remember
correctly) and
this function is on FLASH and FLASH at that moment is inaccessible.
Sometimes it works because this function is already cached by CPU.

Nicolas: I think there should be some way to work around this... If not
maybe we should
add compile #error if multiple bank widths and XIP are selected...
=20
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
>=20
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
>=20
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
>=20
> CONFIG_MTD_CFI_I1=3Dy
>=20
> CONFIG_MTD_CFI_I2=3Dy

Don't remember, but this may have the same effect also.
=20
> # CONFIG_MTD_CFI_I4 is not set
>=20
> # CONFIG_MTD_CFI_I8 is not set
>=20
> # CONFIG_MTD_CFI_INTELEXT is not set
>=20
> CONFIG_MTD_CFI_AMDSTD=3Dy
>=20
> # CONFIG_MTD_CFI_STAA is not set
>=20
> CONFIG_MTD_CFI_UTIL=3Dy
>=20
> # CONFIG_MTD_RAM is not set
>=20
> # CONFIG_MTD_ROM is not set
>=20
> # CONFIG_MTD_ABSENT is not set
>=20
> CONFIG_MTD_XIP=3Dy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
