Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGsv1-00036w-4q
 for linux-mtd@lists.infradead.org; Tue, 03 Sep 2013 15:53:28 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: gpmi-nand driver and jffs2 support
Date: Tue, 3 Sep 2013 13:53:18 +0200
References: <522062B4.4080709@digi.com> <201309021332.34063.marex@denx.de>
 <52254432.7080502@freescale.com>
In-Reply-To: <52254432.7080502@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201309031353.18964.marex@denx.de>
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

> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8802=E6=97=A5 19:32, Marek Vasut =E5=86=
=99=E9=81=93:
> > This makes not much sense to me. If what you claim is true, than JFFS2 =
in
> > U-Boot and Linux would be incompatible for all MTD drivers. This would
> > also mean that
>=20
> The jffs2 in uboot and linux is compatible now. But the mtd base code,
> such as nand_base.c /nand_bbt.c
> has changed.

Ok, based on this claim AND U-Boot being last synced with Linux 3.7, the ob=
vious=20
questions comes to mind. Is JFFS2 support in Linux 3.7 not compatible with =
JFFS2=20
in Linux -next? Is this true? Can I not mount JFFS2 partition under Linux-n=
ext=20
that I could mount with Linux 3.7 and earlier?

> And the gpmi for kernel has be changed too.
> All these changes are not sync with the uboot yet.

Best regards,
Marek Vasut
