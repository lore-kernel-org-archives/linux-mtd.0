Received: from moh3-ve3.go2.pl ([193.17.41.87])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpeX5-0001YP-Kx
 for linux-mtd@lists.infradead.org; Tue, 05 May 2015 15:13:16 +0000
Subject: =?UTF-8?Q?Re:_File_in_JFFS2_corrupted_after?=
 =?UTF-8?Q?_power_loss_during_removal_of_other_files?=
From: =?UTF-8?Q?Marcin_Adamski?= <mass85@tlen.pl>
To: richard.weinberger@gmail.com
In-Reply-To: <CAFLxGvx31ey877oxXawEPwnyf+NHFxqzh6LhU09KeJzfRDz_BQ@mail.gmail.com>
References: <553983c4.1e577cd2.5547694c.c00cd@tlen.pl>
 <CAFLxGvx31ey877oxXawEPwnyf+NHFxqzh6LhU09KeJzfRDz_BQ@mail.gmail.com>
Mime-Version: 1.0
Message-ID: <5b5133fc.589863a5.5548ddf5.c47c7@tlen.pl>
Date: Tue, 05 May 2015 17:12:53 +0200
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

On=20Mon,=20May=205,=202015=20at=2016:35,=20=20Richard=20Weinberger=20<ri=
chard.weinberger@gmail.com>=20wrote:
>=20I'd=20say=20"it's=20complicated".=20:)
>
>=20UBIFS=20was=20created=20to=20deal=20with=20such=20situations.
>=20If=20you=20want=20to=20be=20on=20the=20safe=20side,=20use=20it.
>

I'm=20afraid=20it=20is=20too=20late=20for=20me=20to=20use=20UBIFS,=20as=20=
I=20need=20to=20perform=20upgrade=20of=20my=20devices=20in=20the=20field=20=
and=20migration=20from=20JFFS2=20to=20UBIFS=20seems=20impossible=20(at=20=
least=20without=20some=20additional=20free=20space=20in=20flash).

I=20concluded=20that=20JFFS2=20should=20also=20handle=20this=20kind=20of=20=
scenarios=20after=20reading=20about=20CRC=20failures=20in=20http://www.li=
nux-mtd.infradead.org/faq/jffs2.html#L=5Fmessages

Regards
Marcin=20Adamski
