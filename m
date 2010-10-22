Received: from aa011msr.fastwebnet.it ([85.18.95.71])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9Llj-00058W-CZ
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 17:51:08 +0000
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [Help] SST39VF6401B Support
Date: Fri, 22 Oct 2010 19:50:56 +0200
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
	<AANLkTinQ=vHZgQ5B2YnsDkKzmCD288JwzTUgTUP-9whV@mail.gmail.com>
	<AANLkTimUVCRZLQma2xRChr51y1Fi5E2p31qFQS=B20Sw@mail.gmail.com>
In-Reply-To: <AANLkTimUVCRZLQma2xRChr51y1Fi5E2p31qFQS=B20Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201010221950.57594.fabio.giovagnini@aurion-tech.com>
Cc: yidong zhang <zhangyd6@gmail.com>, David.Woodhouse@intel.com,
	Wolfram Sang <w.sang@pengutronix.de>, yegorslists@googlemail.com,
	Guillaume LECERF <glecerf@gmail.com>, taliaferro62@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Guys,
As Gullelm remeber for sure, I used the jedec probe for such a flash in a v=
ery=20
old 2.6 kernel.

Now I'm migrating to the newets one kernel.
Do you tell me how the kernel will be updated with the last mtd stuff=20
developed; or in place of it how to patch a standard kernel?

Thanks a  lot and sorry for my question if it is improper


In data venerd=EC 22 ottobre 2010 17:42:39, yidong zhang ha scritto:
: > On Fri, Oct 22, 2010 at 11:36 PM, Guillaume LECERF <glecerf@gmail.com>=
=20
wrote:
> > 2010/10/22 yidong zhang <zhangyd6@gmail.com>:
> >>> Could you try setting cif->cfiq->EraseRegionInfo[0] to 0x02003FF in
> >>> fixup_sst39vf_rev_b() ?
> >>=20
> >> Hi
> >>  how about this attached patch.
> >=20
> > If it works for you, I'll send a patch series for SST 39VF640xB and
> > 38VF640x, because both chips needs 0x50 as erase command.
>=20
> Sorry, i cannot test it right now.  I will sent the result as soon as i
> can.
>=20
> > --
> > Guillaume LECERF
> > GeeXboX developer - www.geexbox.org
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

=2D-=20
Ing. Fabio Giovagnini

Aurion s.r.l.
P.I e C.F.
00885711200
skype: aurion.giovagnini
Tel. +39.051.594.78.24
Cell. +39.335.83.50.919
www.aurion-tech.com
