Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbVz1-00078z-KD
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 13:38:53 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [Rebase/PATCHv2] drivers: mtd: m25p80: Add quad read support.
Date: Wed, 30 Oct 2013 14:38:24 +0100
References: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
 <5270DD2E.1010805@ti.com> <5270DE82.9020603@freescale.com>
In-Reply-To: <5270DE82.9020603@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201310301438.24441.marex@denx.de>
Cc: dedekind1@gmail.com, balbi@ti.com, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Sourav Poddar <sourav.poddar@ti.com>,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2013=E5=B9=B410=E6=9C=8830=E6=97=A5 18:19, Sourav Poddar =E5=86=
=99=E9=81=93:
> > This is what we allign initially that its correct to  get this
> > information through flash itself rather than dt.
>=20
> okay. got it.

We certainly need this to operate as such:

=2D The SPI NOR driver knows what the SPI NOR flash can do (if it can do fa=
st=20
read, quad read, ddr read ...)
=2D The SPI bus driver knows what types of transfer it can support

The SPI NOR driver shall then negotiate the best transfer option and use it=
=2E So=20
yes, we need flags to specify what each SPI NOR can do.

Best regards,
Marek Vasut
