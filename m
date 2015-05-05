Received: from moh3-ve1.go2.pl ([193.17.41.30])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ypg4o-0006dX-95
 for linux-mtd@lists.infradead.org; Tue, 05 May 2015 16:52:11 +0000
Subject: =?UTF-8?Q?Re:_File_in_JFFS2_corrupted_after?=
 =?UTF-8?Q?_power_loss_during_removal_of_otherfiles?=
From: =?UTF-8?Q?Marcin_Adamski?= <mass85@tlen.pl>
To: richard@nod.at
In-Reply-To: <5548E560.5090106@nod.at>
References: <553983c4.1e577cd2.5547694c.c00cd@tlen.pl>
 <CAFLxGvx31ey877oxXawEPwnyf+NHFxqzh6LhU09KeJzfRDz_BQ@mail.gmail.com>
 <5b5133fc.589863a5.5548ddf5.c47c7@tlen.pl> <5548E560.5090106@nod.at>
Mime-Version: 1.0
Message-ID: <4fde209.6da1852f.5548f520.48162@tlen.pl>
Date: Tue, 05 May 2015 18:51:44 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dnia=205=20maja=202015=2017:44=20Richard=20Weinberger=20<richard@nod.at>=20=
napisa=C5=82(a):
>=20
>=20>=20Am=2005.05.2015=20um=2017:12=20schrieb=20Marcin=20Adamski:
>=20>=20On=20Mon,=20May=205,=202015=20at=2016:35,=20Richard=20Weinberger=20=
<richard.weinberger@gmail.com>=20wrote:
>=20>>=20I'd=20say=20"it's=20complicated".=20:)
>=20>>
>=20>>=20UBIFS=20was=20created=20to=20deal=20with=20such=20situations.
>=20>>=20If=20you=20want=20to=20be=20on=20the=20safe=20side,=20use=20it.
>=20>>
>=20>=20
>=20>=20I'm=20afraid=20it=20is=20too=20late=20for=20me=20to=20use=20UBIFS=
,=20as=20I=20need=20to=20perform=20upgrade=20of=20my=20devices=20in=20the=
=20field=20and=20migration=20from=20JFFS2=20to=20UBIFS=20seems=20impossib=
le=20(at=20least=20without=20some=20additional=20free=20space=20in=20flas=
h).
>=20>=20
>=20>=20I=20concluded=20that=20JFFS2=20should=20also=20handle=20this=20ki=
nd=20of=20scenarios=20after=20reading=20about=20CRC=20failures=20in=20htt=
p://www.linux-mtd.infradead.org/faq/jffs2.html#L=5Fmessages
>=20
>=20AFAIK=20it=20depends=20on=20the=20corruption.=20But=20JFFS2=20predate=
s=20me.=20:)
>=20Usually=20in=20such=20situations=20I=20inspect=20the=20corrupt=20imag=
e=20by=20hand.
>=20Maybe=20it=20is=20also=20an=20hardware=20issue.=20Is=20this=20NAND=20=
flash?

It=20is=20NAND=20flash.=20I=20think=20I=20will=20give=20up=20on=20inspect=
ing=20image=20by=20hand,=20this=20seems=20too=20hard.

Regards
Marcin=20Adamski
