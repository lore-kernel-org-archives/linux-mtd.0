Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1cPW-00080A-GU
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 12:09:19 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: kill MTD_NAND_VERIFY_WRITE
Date: Wed, 15 Aug 2012 14:09:12 +0200
References: <1344998325-3279-1-git-send-email-shijie8@gmail.com>
 <20120815100655.479e2c39@pixies.home.jungo.com>
 <502B63AD.4000604@freescale.com>
In-Reply-To: <502B63AD.4000604@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201208151409.12390.marex@denx.de>
Cc: dedekind1@gmail.com, Huang Shijie <shijie8@gmail.com>,
 linux-kernel@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2012=E5=B9=B408=E6=9C=8815=E6=97=A5 15:06, Shmulik Ladkani =E5=
=86=99=E9=81=93:
> > Hi Huang,
> >=20
> > On Tue, 14 Aug 2012 22:38:45 -0400 Huang Shijie<shijie8@gmail.com>  wro=
te:
> >> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> >> index 588e989..0ca7257 100644
> >> --- a/drivers/mtd/nand/Kconfig
> >> +++ b/drivers/mtd/nand/Kconfig
> >> @@ -22,15 +22,6 @@ menuconfig MTD_NAND
> >>=20
> >>   if MTD_NAND
> >>=20
> >> -config MTD_NAND_VERIFY_WRITE
> >> -	bool "Verify NAND page writes"
> >> -	help
> >> -	  This adds an extra check when data is written to the flash. The
> >> -	  NAND flash device internally checks only bits transitioning
> >> -	  from 1 to 0. There is a rare possibility that even though the
> >> -	  device thinks the write was successful, a bit could have been
> >> -	  flipped accidentally due to device wear or something else.
> >> -
> >=20
> > There are some defconfig files which set CONFIG_MTD_NAND_VERIFY_WRITE.
> >=20
> > I guess you should submit an accompanying patch that removes
> > CONFIG_MTD_NAND_VERIFY_WRITE from all defconfig files.
>=20
> thanks a lot.
>=20
> I will send out a separate patch to fix it.

I'd still prefer for this to be rather fixed. It seems to be able to find s=
ome=20
obvious mistakes etc.

[...]

Best regards,
Marek Vasut
