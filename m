Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MwzYt-0006y6-NN
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 14:38:20 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "dedekind@infradead.org" <dedekind@infradead.org>
Date: Sun, 11 Oct 2009 07:38:00 -0700
Subject: RE: UBIFS and hardware ECC of all FF pages of MLC NAND
Message-ID: <B125D8217ABC4B43826503DE00A2D44910D7FCB251@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
	<4ABB7224.8000804@nokia.com> <4ABB921B.8090500@parrot.com>
	<1253862309.3778.25.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910D7F2EA60@SJEXCHCCR01.corp.ad.broadcom.com>
	<1255250357.16942.0.camel@localhost>
In-Reply-To: <1255250357.16942.0.camel@localhost>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=koi8-r
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,=20

Some feedback inline.  Thanks.

> The other reason is more subtle, and specific to NAND flashes=20
> which have
> ECC calculation algorithm which produces ECC code not=20
> equivalent to all
> 0xFF bytes if the NAND page contains only 0xFF bytes. Consider an
> example.
>=20
>       * We erase whole flash, so everything is 0xFF'ed now.
>       * We write an UBI/UBIFS image to flash using nandwrite.
>       * Some eraseblocks in the UBIFS image may contain several empty
>         NAND pages at the end, and UBIFS will write to them when it is
>         run.

I think this is dangerous for UBIFS to assume that FF data =3D FF oob, espe=
cially=20
as hardware ECCs appearing more and more. It would be nice if there
was a standard that all FF data must generate all FF ECC but this isn't the=
 case
(though it would solve some corruption issues). Perhaps we should leave a r=
untime
check in (not paranoid check) for the next year or two that checks the oob =
also=20
if the data is all FF just to catch these issues.

>       * When later UBIFS runs, it writes data to these NAND=20
> pages, which
>         means that a new ECC code is calculated, and written on top of
>         the existing one (unsuccessfully, of course). This may trigger
>         an error straight away, but usually at this point no error is
>         triggered.

When this happens, you often see an XOR operation taking place on the ECC. =
For example, if the
ECC for a 512 byte sector all FF data is=20
"10 ae d1 f6 12 6c 65 3d 68 86 1a db 4a"
and the new intended ECC for a new sector of non FF data is=20
"18 20 f1 91 87 d3 bd 30 a7 4f 3f 23 75"
then I have seen that the resultant ECC (since programming can only change =
1's to 0's) is like an AND operation
"10 20 d1 90 02 40 25 30 20 06 1a 03 40"

Now readback validation if it were turned on would catch that the ECC corre=
ction could not be=20
performed and you could see an error right away in this case. Now an intere=
sting thing
is that I have proven with my 4K page MLC flashes that _other_ blocks can h=
ave their ECCs=20
corrupted when this collision occurs - though this might be a local hardwar=
e issue. That=20
took a while to debug in case anyone is having similar problems.

>       * At some point UBIFS is trying to read from these=20
> pages, and gets
>         and an ECC error (-EBADMSG =3D -74).
>=20
> In fewer words, ubiformat makes sure that every NAND page is written
> once and only once after the erasure. If you use nandwrite, some pages
> are written twice - once by nandwrite, and once by UBIFS.

This may be all the more reason to leave a runtime check in on the oob bein=
g all FF
for a while on all FF data. Good defensive programming to not assume anythi=
ng about=20
what happened earlier with previous flash operations.

>=20
> --=20
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>=20
>=20
>=20
Thanks!

Darwin=
