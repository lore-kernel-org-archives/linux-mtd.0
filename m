Received: from aa011msr.fastwebnet.it ([85.18.95.71])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OyncQ-0000EG-DW
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 15:21:55 +0000
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [Help] SST39VF6401B Support
Date: Thu, 23 Sep 2010 17:21:44 +0200
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
	<20100923120534.GD2994@pengutronix.de>
	<AANLkTikU011z8uK8axjmzqpyepRHNgnyNupZzJSxkWTa@mail.gmail.com>
In-Reply-To: <AANLkTikU011z8uK8axjmzqpyepRHNgnyNupZzJSxkWTa@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201009231721.45459.fabio.giovagnini@aurion-tech.com>
Cc: =?utf-8?q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>,
	Guillaume LECERF <glecerf@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
	Yegor Yefremov <yegorslists@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I solved with Gullielme suggestment on SST39VF6402B.

Cheers

Is the problem solved now?

In data gioved=C3=AC 23 settembre 2010 14:23:27, Guillaume LECERF ha scritt=
o:
: > 2010/9/23 Wolfram Sang <w.sang@pengutronix.de>:
> >>  Thanks for your response. Does this mean this chip isn't CFI
> >> compliant? Like, datasheet says it is, but not really.
> >=20
> > SST? Broken CFI happened to me, too :(
> > http://patchwork.ozlabs.org/patch/51027/
>=20
> This patch [1] (tried to) add support for your chip.
> According to the datasheet [2], it uses addr_unlock1 =3D 0x555 and
> addr_unlock2 =3D 0x2AA, and has no extended query table.
> So this chip must be handled by the fixup_sst39vf_rev_b() fixup function.
>=20
> Could you provide us with a more detailed log, i.e. with
> DEBUG_CFI_FEATURES enabled in cfi_cmdset_0002.c and DEBUG_CFI in
> cfi_probe.c ?
>=20
>=20
> [1] http://patchwork.ozlabs.org/patch/50906/
> [2] http://www.sst.com/dotAsset/40661.pdf

=2D-=20
Ing. Fabio Giovagnini

Aurion s.r.l.
P.I e C.F.
00885711200
skype: aurion.giovagnini
Tel. +39.051.594.78.24
Cell. +39.335.83.50.919
www.aurion-tech.com
