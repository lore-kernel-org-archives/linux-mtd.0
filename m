Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOS91-0006co-3M
 for linux-mtd@lists.infradead.org; Tue, 24 Sep 2013 12:55:13 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: gpmi-nand driver and jffs2 support
Date: Tue, 24 Sep 2013 14:53:46 +0200
References: <522062B4.4080709@digi.com> <201309241150.09313.marex@denx.de>
 <52416D88.6030906@freescale.com>
In-Reply-To: <52416D88.6030906@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201309241453.47069.marex@denx.de>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Hector Palacios <hector.palacios@digi.com>, linux-mtd@lists.infradead.org,
 dzu@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Huang,

> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8824=E6=97=A5 17:50, Marek Vasut =E5=86=
=99=E9=81=93:
> > Hello Huang,
> >=20
> > Can you please explain what is the exact difference between the NAND
> > layout when using JFFS2 in FSL 2.6.35 and in mainline with your patches
> > ?
>=20
> In FSL 2.6.35, there are some free space in the OOB;
> while in mainline we use all the free space in the OOB.

OK, let me understand this in more detail.

How does the NAND page look when written by FSL 2.6.35 and how does the NAN=
D=20
page look when written by current mainline ? Can you please tell in detail?

> > Is there any way to mount JFFS2 written with FSL 2.6.35 on current
> > mainline? Thus far, neither me nor Hector were able to mount such
> > partition with the same result.
>=20
> The gpmi driver in FSL 2.6.35 is different from the mainline.

I was under the impression the mainline driver is an evolution of the FSL 2=
=2E6.35=20
driver. Is this assumption incorrect?

> The two drivers are not compatible to each other.

OK, like I said, if we cannot produce a drop-in replacement of old FSL 2.6.=
35=20
kernel, this is a problem. People will come and they will be running into t=
his=20
issue. Thus, let us focus on producing a compatible JFFS2 patch.

I do not mind helping with that, but I need to understand the actual differ=
ence=20
first. It would be nice if you could put down a detailed description of the=
=20
problem we face.

Thank you!

Best regards,
Marek Vasut
