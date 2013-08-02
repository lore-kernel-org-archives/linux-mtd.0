Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5DvI-0000F1-Ol
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 11:53:33 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: =?iso-8859-1?Q?An=EDbal_Almeida_Pinto?= <anibal.pinto@efacec.com>
Subject: RE: JFFS2 impact when don't have sub page access
Date: Fri, 2 Aug 2013 11:52:47 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9F028B@DBDE04.ent.ti.com>
References: <51F91E08.7030409@efacec.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F0091@DBDE04.ent.ti.com>
 <51FB43F3.7020909@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F00EA@DBDE04.ent.ti.com>
 <51FB8E49.9010305@efacec.com>
In-Reply-To: <51FB8E49.9010305@efacec.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Fernando Gomes <fernando.gomes@efacec.com>,
 "davinci-linux-open-source@linux.davincidsp.com"
 <Davinci-linux-open-source@linux.davincidsp.com>, "Nori,
 Sekhar" <nsekhar@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> >
> >> Also, the subject talks about JFFS2. There is no known affect of absen=
ce
> >> of subpage support on JFFS2, right?
> >>
> > There should not be any problem in using either UBIFS or JFFS2.
>=20
> Please, clarify me with the last statement.
>=20
> There should be no problem using JFFS2 or UBIFS with the patch that you
> mention applied or even without the patch ?
>=20

For UBIFS to work,=20
(1) please check following options passed for mkfs.ubifs
- with this patch
mkfs.ubifs -s 512  -m 2048

- without this patch
mkfs.ubifs -s 2048  -m 2048

(2) Also please check for  'chip->options & NAND_NO_SUBPAGE_WRITE'.
This flag is used for explicitely _disabling_ sub-pages in NAND driver.


> With OMAP L138 are some complains about using the ubifs and subpage
> access, even on uboot [1] so it don't appear to be only a linux [2] probl=
em.
>=20
> And if the problems appear on ubifs it should affect the jffs2.
>=20
> [1] - http://lists.denx.de/pipermail/u-boot/2011-April/090072.html
Yes, there is no subpage support in U-Boot.
Also I hope you are using 'ubiformat' to format the NAND partition with
UBI.img in kernel ? If that isn't the case, then I'm not sure what can be t=
he
problem here.
I have tested omap2-nand with subpage enabled and=20
using ubiformat. And it works fine.


> [2] - http://comments.gmane.org/gmane.linux.davinci/23836
>
Also from [2] last post, there seemed to be an issue with mis-match in=20
ECC scheme used between U-Boot and ECC-scheme used in Kernel.
(But this has nothing todo with sub-pages)..
Your logs also show ECC errors, so I suggest please make sure you are
using same ECC scheme in kernel, as the one with which you flashed=20
the image.
----------------------------------------
>> [  128.344667] UBI error: ubi_io_read: error -74 (ECC error) while=20
>> reading 512 bytes from PEB 2:512, read 512 bytes
>> [  128.883945] UBI error: ubi_io_read: error -74 (ECC error) while=20
>> reading 512 bytes from PEB 1766:512, read 512 bytes
>> [  128.884072] UBI: run torture test for PEB 1766
----------------------------------------


with regards, pekon
