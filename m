Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHDdl-0005k1-Ie
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 14:01:02 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: gpmi-nand driver and jffs2 support
Date: Wed, 4 Sep 2013 16:00:36 +0200
References: <522062B4.4080709@digi.com> <201309031353.18964.marex@denx.de>
 <52269A56.4030808@freescale.com>
In-Reply-To: <52269A56.4030808@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201309041600.37107.marex@denx.de>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Hector Palacios <hector.palacios@digi.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 scottwood@freescale.com, Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8803=E6=97=A5 19:53, Marek Vasut =E5=86=
=99=E9=81=93:
> > questions comes to mind. Is JFFS2 support in Linux 3.7 not compatible
> > with JFFS2 in Linux -next? Is this true? Can I not mount JFFS2 partition
> > under Linux-next
>=20
> The jffs2 does not changed since the linux 3.7.
> All the changes happened in the drivers and mtd code.

OK, JFFS2 aside then, let's focus on MTD core code.

> The gpmi does not support the jffs2 all the time. Only apply the slc/mlc
> patch set,
> the gpmi can support the jffs2.

How come hector was then able to write his JFFS2 partition ?

> So the jffs2 support is compatiable all the time.

Is the old Freescale 2.6.35 GPMI NAND format compatible with the one after=
=20
applying this patchset?

> > that I could mount with Linux 3.7 and earlier?
>=20
> I think the mount can be succeeded.

Ok, does that mean that we need this patchset in U-Boot in order to properl=
y=20
write JFFS2 onto GPMI NAND there? Is that the message you wanted to relay t=
o us?

Best regards,
Marek Vasut
